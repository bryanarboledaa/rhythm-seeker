class UploadController < ApplicationController

  def index
  end

  def upload_track
    file = params[:track_file]

    if file
      upload_to_s3(file)
      @track = Track.new(track_attributes)

      @track.save!
      redirect_to upload_path, flash: { notice: 'Track successfully uploaded' }
    end
  end

  def upload_to_s3(file)
    bucket_name = 'bryan-test-ftp'
    @filename = file.original_filename
    @key = "tracks/#{current_user.display_name}/#{@filename}"
    obj = create_aws_obj(@key, bucket_name)
    obj.upload_file(file)
  end

  def create_aws_obj(key, bucket_name)
    s3 = Aws::S3::Resource.new(access_key_id: 'AKIATINIPJ427TNA4QPB',
                               secret_access_key: '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',
                               region: 'us-west-2')
    s3.bucket(bucket_name).object(key)
  end

  def track_attributes
    {
      track_name: @filename,
      time: 4.00,
      user_id: current_user.id,
      track_url: @key
    }
  end
end
