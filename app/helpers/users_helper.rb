module UsersHelper

  def fetch_track_from_s3(key)
    s3 = Aws::S3::Resource.new(region: 'us-west-2')
    bucket = s3.bucket('bryan-test-ftp')
    object = bucket.object(key)

    object.presigned_url(:get)
  end
end
