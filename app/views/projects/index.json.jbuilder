json.array!(@projects) do |project|
  json.extract! project, :name, :staion_id
  json.url project_url(project, format: :json)
end
