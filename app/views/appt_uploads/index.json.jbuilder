json.array!(@appt_uploads) do |appt_upload|
  json.extract! appt_upload, :id, :process_start_time, :process_end_time, :content
  json.url appt_upload_url(appt_upload, format: :json)
end
