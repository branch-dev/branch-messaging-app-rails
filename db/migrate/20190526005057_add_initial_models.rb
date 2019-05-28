class AddInitialModels < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :agents do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :messages do |t|
      t.string :body, null: false
      t.bigint :customer_id, null: false
      t.bigint :agent_id
      t.timestamps
    end

    add_foreign_key :messages, :customers
    add_foreign_key :messages, :agents
  end

  def down
    remove_foreign_key :messages, :customers
    remove_foreign_key :messages, :agents
    drop_table :messages
    drop_table :agents
    drop_table :customers
  end
end
