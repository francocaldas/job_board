class AddIndexJobToComments < ActiveRecord::Migration
  def change
    add_index  :comments, :job_id
  end
end
