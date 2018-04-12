class Model
  @@db_info = Hash.new()
  @@db =  SQLite3::Database.new('db/db.sqlite')

  def self.table_name
    self.to_s.downcase + 's'
  end
  def self.table(name)
    @properties ||= { table: table_name }
  end
  def self.column_property(column_name, column_type, unique: false)
    property = Struct.new(:column_name, :column_type, :unique)
    @properties[column_name] = property.new(column_name, column_type, unique)
  end

  def self.put_properties
    pp @properties
    puts "unique: #{@properties['username'].unique}"
  end



  def self.get_all()
    db_result = @@db.execute("SELECT * FROM #{@properties[:table]}")

    temp_list_of_users = []
    db_result.each do |user|
      temp_list_of_users << self.new(user)
    end

    return temp_list_of_users
  end

  def self.get_by(column, query)
    if(!@properties[column])
      return "Failed to parse query"
    else
      puts "Username query:\nSELECT * FROM #{@properties[:table]} WHERE #{column} LIKE ?, #{query}"
      db_result = @@db.execute("SELECT * FROM #{@properties[:table]} WHERE #{column} LIKE ?", query)
      return db_result[0]
    end
  end



  def self.method_missing(method, *args)
    token = ""
    column = ""
    getby = false
    method.to_s.each_char do |char|
      if getby
        column += char
      else
        token += char

        if token == "get_by"
          getby = true
          token = ""
        end
      end
    end

    if getby
      self.get_by(column, args[0])
    end
  end
end
