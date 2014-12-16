class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :filename
      t.text :content
      t.text :output

      t.timestamps null: false
    end
  end
end
