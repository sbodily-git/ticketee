class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end # new
 
  def create
    @ticket = @project.tickets.build(ticket_params)
    
    if @ticket.save
      redirect_to [@project, @ticket], notice: "Ticket has been created."
    else
      flash.now[:alert] = "Ticket has not been created."
      render "new"
    end # if
  end # create
  
  def show
  end # show
  
private

  def set_project
    @project = Project.find(params[:project_id])
  end # set_project
  
  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end # set_ticket
  
  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end # ticket_params
  
end # TicketsController
