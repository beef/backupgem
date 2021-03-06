require 'rubygems'
require 'runt'
require 'date'
require 'backup/configuration'
require 'backup/extensions'
require 'backup/ssh_helpers'
require 'backup/date_parser'
require 'backup/state_recorder'

begin
  require 'aws/s3'
  require 'backup/s3_helpers'
rescue LoadError
  # If AWS::S3 is not installed, no worries, we just
  # wont have access to s3 methods. It's worth noting
  # at least version 1.8.4 of ruby is required for s3.
end

begin
  require 'madeleine'
rescue LoadError
  # If you don't have madeleine then you just cant use numeric rotation mode
  ::NO_NUMERIC_ROTATION = true
end
