class RenameUserIamge < ActiveRecord::Migration
  change_table :users do |t|
    t.rename :iamge, :image
  end
end
