class Model
  @@db_info = Hash.new()
  @@db =  SQLite3::Database.new('db/db.sqlite')

  def self.table_name
    self.to_s.downcase + 's'
  end
  def self.table(name)
    @table ||= table_name
    @properties ||= Hash.new()
    @property ||= Struct.new(:column_name, :column_type, :unique, :default)
  end

  def self.column_property(column_name, column_type, unique: false, default: nil)
    @properties[column_name] = @property.new(column_name, column_type, unique, default)
  end

  def self.put_properties
    pp @properties
  end



  def self.get_all()
    db_result = @@db.execute("SELECT * FROM #{@table}")

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
      db_result = @@db.execute("SELECT * FROM #{@table} WHERE #{column} LIKE ?", query)
      return db_result[0]
    end
  end



  def validate_properties(in_params)
    @properties.keys.each do |key|
      if(!in_params[key])
        if(@properties[key].default)
          in_params[key] = @properties[key].default
        else
          puts "Raised error: Error parsing properties"
        end
      end
    end

    return in_params
  end
  def self.add(params)
    in_params = params.dup

    in_params = Model.validate_properties(in_params)

    place_holders = ""
    in_params.values.each do |_|
      place_holders += "?, "
    end
    2.times do
      place_holders[-1] = ""
    end

    @@db.execute("INSERT INTO #{@table} VALUES (#{place_holders})", in_params.values)
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

        if token == "get_by_"
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
