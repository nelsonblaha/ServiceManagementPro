json.array!(@tasks) do |task|
  json.extract! task, :id, :user_id, :ticket_id, :status, :assignee, :notification
  json.url task_url(task, format: :json)
end
