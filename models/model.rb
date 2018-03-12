class Model
  @@db_info = Hash.new()

  def self.get_by(table_param, to_match)
    @db =  SQLite3::Database.open('db/db.sqlite')
    db_result = @db.execute("SELECT * FROM #{@@db_info[:table]} WHERE ? LIKE ?", table_param, to_match)
    return self.new(db_result[0])
  end

  def self.column_property(column_name, column_type)
    property = Struct.new(:column_name, :column_type)
    
    if !@properties
      @properties = []
    end

    @properties << property.new(column_name, column_type)
  end

  def self.put_properties
    pp @properties
  end
end
