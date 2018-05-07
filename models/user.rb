class User < Model
  #Has to be declared in the order which columns appear
  table 'Users'
  column_property 'username', String, unique: true #UniqueConstraint class for platform independency.
  column_property 'password', String
  column_property 'role', Integer, default: 0

  def initialize(params = nil)
    @username = params[0]
    @password ||= BCrypt::Password.new(params[1])
    @role = params[2]
  end

  def self.modify_params(params)
    params['password'] = BCrypt::Password.create(params['password'])
  end

  def authenticate(in_password)
    return @password == in_password
  end
end
