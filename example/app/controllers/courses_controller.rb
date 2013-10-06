class CoursesController < Saral::Controller
  def create
    render :create, :txt => "This is a new course (created from a view)."
  end
end
