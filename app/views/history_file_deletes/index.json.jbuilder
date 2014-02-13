json.array!(@history_file_deletes) do |history_file_delete|
  json.extract! history_file_delete, :estimation_id
  json.url history_file_delete_url(history_file_delete, format: :json)
end
