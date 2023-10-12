class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :username, :admin, :email, :created_at
end
