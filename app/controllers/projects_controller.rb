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
  
  def edit
    @project = Project.find(params[:id])
  end # edit
  
  def update
    set_project
    
    if @project.update(project_params)
      redirect_to @project, notice: "Project has been updated."
    else
      flash.now[:alert] = "Project has not been updated."
      render "edit"
    end # if
  end #update
  
  def destroy
    set_project

    @project.destroy
    redirect_to projects_path, notice: "Project has been deleted."
  end # destroy
  
private
  
  def set_project
      @project = Project.find(params[:id])
  end # set_project
  
  def project_params
    params.require(:project).permit(:name, :description)
  end # project_params
end # ProjectsController class
