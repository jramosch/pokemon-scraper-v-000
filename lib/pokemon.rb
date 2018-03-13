class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize (pokemon,hp=nil)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @hp = hp
    #pokemon[:hp]
    @db = pokemon[:db]
    # remember to also update the initialize method to accept an argument of hp that defaults to nil if not set (so it still passes the non-bonus tests)
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
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, @name)
    self.hp = hp
  end
  
end
