class User < Model
  column_property 'username', String
  column_property 'password', String
  column_property 'role', Integer

  def initalize(params = nil, username = nil, password = nil, role = nil)
    if params
      @username = params[0]
      @password = params[1]
      @role = params[2]
    else
      @username = username
      @password = password
      @role = role
    end
  end
end
