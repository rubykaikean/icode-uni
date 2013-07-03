json.array!(@product_lists) do |product_list|
  json.extract! product_list, :estimation_no, :description, :qty, :batch_no, :issue_by, :issue_date, :remark, :client_id
  json.url product_list_url(product_list, format: :json)
end