class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
        t.integer :call
	  	t.string :title
	  	t.string :number
	  	t.integer :sec
	  	t.string :instructor
	  	t.string :day
	  	t.string :time
	  	t.string :location
	  	t.string :period
	  	t.string :status
        t.timestamps
    end
  end
end
