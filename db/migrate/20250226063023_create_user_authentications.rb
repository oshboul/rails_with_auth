class CreateUserAuthentications < ActiveRecord::Migration[8.0]
  def change
    create_table :user_authentications do |t|
      t.references :user, null: false
      t.string :provider
      t.string :external_id

      t.index %i[user_id provider], unique: true
      t.index %i[provider external_id], unique: true
    end
  end
end
