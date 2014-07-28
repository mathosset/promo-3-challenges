class CreatePosts < ActiveRecord::Migration
  def change
    # TODO: your code here to create the posts table
    create_table :posts do |p|
      p.string :name
      p.string :source_url
      p.datetime :created_at
    end
  end
end
