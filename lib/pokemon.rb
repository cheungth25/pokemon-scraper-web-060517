class Pokemon

  attr_reader :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db, hp=nil)
    # binding.pry
    query = "INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');"
    db.execute(query)
  end

  def self.find(id, db)
    query = "SELECT * FROM pokemon WHERE id = '#{id}'"
    return_value = db.execute(query).first
    pokemon = self.new(id: return_value[0], name: return_value[1], type: return_value[2], db: db, hp: return_value[3])
  end

  def alter_hp (hp, db)
    query = "UPDATE pokemon SET hp = #{hp} WHERE name = '#{self.name}';"
    db.execute(query)
  end
end
