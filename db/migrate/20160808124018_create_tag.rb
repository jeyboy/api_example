class CreateTag < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.text :body
    end
  end
end