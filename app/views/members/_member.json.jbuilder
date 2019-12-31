json.extract! member, :id, :name, :email, :lock_version, :created_at, :updated_at
json.url member_url(member, format: :json)