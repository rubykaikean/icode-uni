json.array!(@clients) do |client|
  json.extract! client, :name , :contact_person_one , :contact_person_two , :contact_person_three , :email , :address 
  json.url client_url(client, format: :json)
end