class Admin::ProjectsController < Admin::ApplicationController

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
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project has been deleted."
  end # destroy

private

  def project_params
    params.require(:project).permit(:name, :description)
  end # project_params
 
end # Admin::ProjectsController
