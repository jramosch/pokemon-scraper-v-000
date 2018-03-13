class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize (pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @hp = pokemon[:hp]
    @db = pokemon[:db]
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
    pokemon = pokemon.flatten
    new_pokemon = {}
    new_pokemon = {id: pokemon[0], name: pokemon[1], type: pokemon[2], db: "#{db}"}
    self.new(new_pokemon)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end
  
end
