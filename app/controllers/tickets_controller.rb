class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = current_user.tickets
  end

  def my_tickets
    @ticket = Ticket.new
    @tickets = current_user.my_tickets
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # triggered with remote true from form in index
  # response handled in create.js.erb
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.issuer_user_id = current_user.id
    @ticket.save
    @ticket_saved = @ticket.errors.blank?
    @tickets = current_user.my_tickets
  end

  # PATCH/PUT /tickets/1.json
  # Update trigger by xeditable in front end
  # allow only the parameter you need
  def update
    ticket_update_params = {}
    updating_field = params[:name]
    case updating_field
    when 'change_status'
      ticket_update_params[:status_id] = params[:value]
    when 'change_category'
      ticket_update_params[:category_id] = params[:value]
    when 'assign_to'
      ticket_update_params[:assigned_to_id] = params[:value]
    when 'change_priority'
      ticket_update_params[:priority_id] = params[:value]
    end
    # employee assigining himself
    if params[:assign_self].present?
      params[:assign_self] == 'true' ? @ticket.update(assigned_to_id: current_user.id) : @ticket.update(assigned_to_id: nil)
    else
      # update the current field sent by admin
      if @ticket.update(ticket_update_params)
        render json: { status: 'success' }
      else
        render json: { status: 'error', msg: @ticket.errors }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:title, :description, :issuer_user_id, :assigned_to_id, :category_id, :status_id, :priority_id, :due_date)
  end
end
