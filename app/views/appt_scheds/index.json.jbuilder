json.array!(@appt_scheds) do |appt_sched|
  json.extract! appt_sched, :id, :start_time, :end_time, :first_name, :last_name, :comments
  json.url appt_sched_url(appt_sched, format: :json)
end
