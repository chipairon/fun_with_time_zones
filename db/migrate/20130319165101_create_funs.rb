class CreateFuns < ActiveRecord::Migration
  def change
    create_table :funs do |t|
      t.datetime :crazy_time

      t.timestamps
    end
  end
end
