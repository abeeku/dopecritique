#Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
#Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip.options[:content_type_mappings][:blend] = "application/octet-stream"
# require 'paperclip'

# module Paperclip
#   class MediaTypeSpoofDetector
#     def type_from_file_command
#       begin
#         Paperclip.run("file", "-b --mime :file", :file => @file.path)
#       rescue Cocaine::CommandLineError
#         ""
#       end
#     end
#   end
# end