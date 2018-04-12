class User < Model
  table 'Users'
  column_property 'username', String, unique: true
  column_property 'password', String
  column_property 'role', Integer

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
