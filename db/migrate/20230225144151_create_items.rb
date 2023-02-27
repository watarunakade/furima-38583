class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,    presence: true, default: ""
      t.text       :item_text,    presence: true
      t.integer    :category_id,  presence: true
      t.integer    :condition_id, presence: true
      t.integer    :area_id,      presence: true
      t.integer    :postage_id,   presence: true
      t.integer    :send_day_id,  presence: true
      t.integer    :price,        presence: true
      t.references :user,         presence: true, foreign_key: true
      t.timestamps
    end
  end
end
