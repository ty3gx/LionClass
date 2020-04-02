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

  def search
    call = params[:call]
    title = params[:title]
    prof = params[:prof]
    
    if call == nil
      call = ""
    end
    
    if title == nil
      title = ""
    end

    if prof == nil
      prof = ""
    end

    # Rails.logger.warn "#{call}"
    # Rails.logger.warn "#{title}"
    # Rails.logger.warn "#{prof}"
    if call == "" && title == "" && prof == ""
      @courses = Course.all
    elsif title == "" && prof == ""
      @courses = Course.where("call = " + call)
    elsif call == "" && title == "" 
      @courses = Course.where("UPPER(instructor) LIKE UPPER(?)", '%' + prof + '%')
    elsif call == "" && prof == "" 
      @courses = Course.where("UPPER(title) LIKE UPPER(?) OR UPPER(number) LIKE UPPER(?)", '%' + title + '%', '%' + title + '%')
    elsif call == ""
      @courses = Course.where("(UPPER(title) LIKE UPPER(?) OR UPPER(number) LIKE UPPER(?)) AND UPPER(instructor) LIKE UPPER(?)" , '%' + title + '%', '%' + title + '%', '%' + prof + '%')
    elsif title == ""
      @courses = Course.where("call = ? AND UPPER(instructor) LIKE UPPER(?)" , call.to_i, '%' + prof + '%')
    elsif prof == ""
      @courses = Course.where("call = ? AND (UPPER(title) LIKE UPPER(?) OR UPPER(number) LIKE UPPER(?))" , call.to_i, '%' + title + '%', '%' + title + '%')
    else
      @courses = Course.where("call = ? AND (UPPER(title) LIKE UPPER(?) OR UPPER(number) LIKE UPPER(?)) AND UPPER(instructor) LIKE UPPER(?)" , call.to_i, '%' + title + '%', '%' + title + '%', '%' + prof + '%')
        
    end
    
  end

  def course_info
  end

  
  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    redirect_to controller: 'courses', action: 'search', call: course_params[:call], title: course_params[:title], prof: course_params[:prof]
  end


    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:call, :title, :prof)
    end

end
