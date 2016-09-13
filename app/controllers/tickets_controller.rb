class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
    authorize @ticket, :create?
  end # new
 
  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.author = current_user
    authorize @ticket, :create?
    
    if @ticket.save
      redirect_to [@project, @ticket], notice: "Ticket has been created."
    else
      flash.now[:alert] = "Ticket has not been created."
      render "new"
    end # if
  end # create
  
  def show
    authorize @ticket, :show?
  end # show
  
  def edit
  end # edit
  
  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = "Ticket has not been updated."
      render "edit"
    end # if
  end # update
  
  def destroy
    @ticket.destroy
    redirect_to @project, notice: "Ticket has been deleted."
  end # destroy
  
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
