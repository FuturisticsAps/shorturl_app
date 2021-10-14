class CreateShorthandUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shorthand_urls do |t|
      t.string :title
      t.string :actual_url
      t.string :short_url

      t.timestamps
    end
    add_index :shorthand_urls, :short_url, unique: true
  end
end
