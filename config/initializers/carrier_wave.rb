# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.fog_credentials = {
#       # Configuration for Amazon S3
#       :provider              => 'AWS',
#       :aws_access_key_id     => ENV['abc'],
#       :aws_secret_access_key => ENV['def']
#     }
#     config.fog_directory     =  ENV['sample-app012345']
#   end
# end