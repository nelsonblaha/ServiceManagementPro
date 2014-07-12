class TicketsController < ApplicationController
  before_action :set_ticket, except: [:index, :new, :create] 

  # GET /tickets
  # GET /tickets.json
  def index
    @user = User.new unless current_user
    @tickets = Ticket.paginate(page: params[:page])
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

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to edit_ticket_path(@ticket), notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to edit_ticket_path(@ticket), notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  #DRYer than the old way! 
  def task_action
    action = params[:task_action]
    @task.update status: action 
    respond_to do |format|
      format.html { redirect_to edit_ticket_path(@ticket), notice: "Task #{action}." }
      format.json { head :no_content }
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
      @task = Task.find(params[:task_id]) if params[:task_id]
      @task ||= Task.new
      @tasks = @ticket.tasks
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit( :customernetid, :customermavid, :customername, :customerphone, :customeremail, :problem, :category, :resolution, :notes, :user, :page, :description, :task_id)
    end
end
