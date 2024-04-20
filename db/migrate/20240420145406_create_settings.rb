class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :name, null: false, comment: "Название настройки"
      t.string :value, null: false, comment: "Значение настройки"
      t.string :instructions, comment: "Инструкция к заполнению настройки"

      t.timestamps
    end
  end
end
