class Model
  @@db_info = Hash.new()
  @@db =  SQLite3::Database.open('db/db.sqlite')

  def self.put_properties
    pp @properties
  end

  def self.table(name)
    if !@properties
      @properties = Hash.new()
      @properties[:table] = ""
    end
    @properties[:table] = name
  end
  def self.column_property(column_name, column_type)
    property = Struct.new(:column_name, :column_type)

    if !@properties
      @properties = Hash.new()
      @properties[:table] = ""
    end

    @properties[column_name] = property.new(column_name, column_type)
  end


  def self.get_all()
    db_result = @@db.execute("SELECT * FROM #{@properties[:table]}")

    if(!db_result[0])
      return ["No active users."]
    end

    temp_list_of_users = []
    db_result[0].each do |user|
      temp_list_of_users << self.new(user)
    end
  end
end
