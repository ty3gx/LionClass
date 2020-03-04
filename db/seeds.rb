# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = [{:call => 10020, :title => "INTRO-COMPUT SCI/PROGRAM-", :number => "COMS 1004", :sec => 001, :instructor => "Adam Cannon", :day => "Tu Th", :time => "1:00pm-4:10pm", :location => "BTBA RTBA", :period => "05/26/2020 - 07/02/2020", :status => "Restricted"},
    	   {:call => 10319, :title => "INTRO-COMPUT SCI/PROGRAM-", :number => "COMS 1004", :sec => 002, :instructor => "Paul Blaer", :day => "Mo We", :time => "5:30pm-8:40pm", :location => "BTBA RTBA", :period => "07/06/2020 - 08/14/2020", :status => "Restricted"},
    	   {:call => 10021, :title => "DATA STRUCTURES IN JAVA", :number => "COMS 3134", :sec => 001, :instructor => "Paul Blaer", :day => "Mo We", :time => "5:30pm-8:40pm", :location => "BTBA RTBA", :period => "05/26/2020 - 07/02/2020", :status => "Restricted"},
    	   {:call => 10025, :title => "Natural Language Processing", :number => "COMS 4705", :sec => 001, :instructor => "Daniel Bauer", :day => "Mo We", :time => "5:30pm-8:40pm", :location => "BTBA RTBA", :period => "05/26/2020 - 07/02/2020", :status => "Restricted"}
  	 ]

courses.each do |course|
  Course.create!(course)
end