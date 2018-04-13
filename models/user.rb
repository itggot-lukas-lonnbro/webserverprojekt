class User < Model
  #Has to be declared in the order of columns appearing in
  table 'Users'
  column_property 'username', String, unique: true
  column_property 'password', String
  column_property 'role', Integer, default: 0

  def initialize(params = nil)
    @password = params[1]
    @username = params[0]
    @role = params[2]
  end

  def self.get_by(column, query)
    user = super(column, query)
    if user
      puts
    end
  end
end
