require "base64ize_image_tag/version"
require "mime/types"
require "open-uri"

module Base64izeImageTag
  class Railtie < Rails::Railtie
    initializer "base64ize_image_tag.initialize" do
      Base64izeImageTag.patch
    end
  end

  def self.patch
    ActionView::Helpers::AssetTagHelper.class_eval do
      def base64ize_image_tag(source, options = {})
        options.symbolize_keys!
        source = to_data_scheme(extract_path(source))
        image_tag(source, options )
      end

      private
       def extract_path(path)
         if path =~ /^http/
            path
         elsif path =~ /^\//
            File.join(Rails.root ,"/public/", path)
         else
            File.join(Rails.root ,"/app/assets/images/", path)
         end
        end

        def to_data_scheme(path)
          mime = MIME::Types.type_for(path).first
          image_binary = open(path, "r:ASCII-8BIT"){ |f| f.read(nil) }
          base64 = Base64.encode64(image_binary).gsub(/\s/,'')
          "data:#{mime.to_s};base64,#{base64}"
        end
    end
  end
end
