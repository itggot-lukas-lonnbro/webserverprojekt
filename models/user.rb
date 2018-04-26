class User < Model
  #Has to be declared in the order of columns appearing in
  table 'Users'
  column_property 'username', String, unique: true
  column_property 'password', String
  column_property 'role', Integer, default: 0

  def initialize(params = nil)
    @username = params[0]
    @password = params[1]
    @role = params[2]
  end

  def self.modify_params(params)
    params['password'] = BCrypt::Password.create(params['password'])
  end
end
