class AddComedianToSpecials < ActiveRecord::Migration[7.0]
  def change
    add_reference :specials, :comedian, foreign_key: true
  end
end
