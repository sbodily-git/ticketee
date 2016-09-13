class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  
  def index
    @projects = policy_scope(Project)
    # Pundit calls the resolve method of the ProjectPolicy Scope class
  end # index
  
  def show
    authorize @project, :show?
  end # show
  
  def edit
    authorize @project, :update?
  end # edit
  
  def update 
    authorize @project, :update?
    if @project.update(project_params)
      redirect_to @project, notice: "Project has been updated."
    else
      flash.now[:alert] = "Project has not been updated."
      render "edit"
    end # if
  end #update
  
private
  
  def set_project
    @project = Project.find(params[:id])
    
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for could not be found."
    redirect_to projects_path
  end # set_project
  
  def project_params
    params.require(:project).permit(:name, :description)
  end # project_params
  
end # ProjectsController class
