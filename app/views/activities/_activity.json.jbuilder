json.extract! activity, :id, :content, :user_id, :type, :type_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)