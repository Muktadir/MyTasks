json.array!(@personal_infos) do |personal_info|
  json.extract! personal_info, :id, :first_name, :last_name, :date_of_birth, :gender, :user_id
  json.url personal_info_url(personal_info, format: :json)
end
