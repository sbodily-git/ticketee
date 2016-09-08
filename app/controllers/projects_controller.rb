class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end # index
  
  def new
    @project = Project.new
  end # new

  def create
    @project = Project.new(project_params)
    
    if @project.save
      #flash[:notice] = "Project has been created."
      redirect_to @project, notice: "Project has been created."
    else
      flash.now[:alert] = "Project has not been created."
      render "new"
    end # if
  end # create
  
  def show
    @project = Project.find(params[:id])
  end # show
  
  private
  
  def project_params
    params.require(:project).permit(:name, :description)
  end # project_params
end # ProjectsController class
