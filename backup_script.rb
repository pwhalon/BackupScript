#!/usr/bin/ruby

require 'aws-sdk-s3'
require 'time'

FILE_PATH = '/home/patrick/Documents/important.backup'
BUCKET_NAME = 'pwhalon-backup'

puts 'Getting credentials from the file.'

creds = Aws::SharedCredentials.new(path: '/home/patrick/Documents/projects/backupScript/BackupScript/aws_credentials')

s3_client = Aws::S3::Client.new(
  region: 'us-west-2',
  credentials: creds
)

puts 'Finished getting creds.'

puts 'Beginning important folder compression.'

`tar -zcf /home/patrick/Documents/important.backup --directory=/home/patrick/Documents/important .`

puts 'Finished folder compression.'

puts 'Beginning compressed folder upload.'

s3_client.put_object({
  body: File.open(FILE_PATH),
  bucket: BUCKET_NAME,
  key: "Backup-#{DateTime.now.to_date.to_s}.backup",
  server_side_encryption: 'AES256',
  storage_class: 'STANDARD_IA'
})

puts 'Finished compressed folder upload.'