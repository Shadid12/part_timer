class AddUserIdToListings < ActiveRecord::Migration[5.0]
  def change
    add_reference :listings, :user, index: true, foreign_key: true
  end
end
