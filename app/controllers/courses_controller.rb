class CoursesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @courses = Course.all
  end


  def course_info
  end

  
  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    call = course_params[:call]
    title = course_params[:title]
    prof = course_params[:prof]
    if call == "" && title == "" && prof == ""
      @courses = Course.all
    elsif title == "" && prof == ""
      @courses = Course.where("call = " + call)
    elsif call == "" && title == "" 
      @courses = Course.where("instructor LIKE ?", '%' + prof + '%')
    elsif call == "" && prof == "" 
      @courses = Course.where("title LIKE ? OR number LIKE ?", '%' + title + '%', '%' + title + '%')
    elsif call == ""
      @courses = Course.where("(title LIKE ? OR number LIKE ?) AND instructor LIKE ?" , '%' + title + '%', '%' + title + '%', '%' + prof + '%')
    elsif title == ""
      @courses = Course.where("call = ? AND instructor LIKE ?" , call.to_i, '%' + prof + '%')
    elsif prof == ""
      @courses = Course.where("call = ? AND (title LIKE ? OR number LIKE ?)" , call.to_i, '%' + title + '%', '%' + title + '%')
    else
      @courses = Course.where("call = ? AND (title LIKE ? OR number LIKE ?) AND instructor LIKE ?" , call.to_i, '%' + title + '%', '%' + title + '%', '%' + prof + '%')
        
    end
    
    render action: "search"
  end


    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:call, :title, :prof)
    end

end
