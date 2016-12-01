class Url < ActiveRecord::Base
   #Comando que especifica la relacion con la clase user
   belongs_to :user
   validates :original, presence: true
      before_create :create_short_url
   
  #metodo que crea la secuencia de caracteres para la direccion corta
  def create_short_url
    self.short_url = "#{('a'..'z').to_a.shuffle[0,8].join}"
  end
   
end
