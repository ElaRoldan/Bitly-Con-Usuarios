class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      #comando que asocia la tabala url con la tabla users  mas info en http://guides.rubyonrails.org/association_basics.html
      t.belongs_to :user, index: true 
      t.string :original
      t.string :short_url
      t.integer :click_count, default: 0
      t.timestamps 
    end 
  end
end
