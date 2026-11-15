class CreateDomain < ActiveRecord::Migration[8.1]
 def change
create_table(:redirect_entries){|t|t.string :slug,null:false,limit:64;t.string :destination,null:false,limit:2048;t.bigint :lookups,null:false,default:0}
add_index :redirect_entries,:slug,unique:true
add_check_constraint :redirect_entries,'lookups>=0',name:'lookup_count_nonnegative'
 end
end
