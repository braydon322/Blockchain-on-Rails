class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.timestamps
    end
  end
end

attr_reader :index
attr_reader :currentTime
attr_reader :data
attr_reader :previousBlock
attr_reader :scrambled
