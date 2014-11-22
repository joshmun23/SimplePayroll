class PaychecksController < ApplicationController
  before_action :set_paycheck, only: [:show, :edit, :update, :destroy]

  # GET /paychecks
  # GET /paychecks.json
  def index
    @paychecks = Paycheck.all
  end

  # GET /paychecks/1
  # GET /paychecks/1.json
  def show
  end

  # GET /paychecks/new
  def new
    @paycheck = Paycheck.new
  end

  # GET /paychecks/1/edit
  def edit
  end

  # POST /paychecks
  # POST /paychecks.json
  def create
    @paycheck = Paycheck.new(paycheck_params)

    respond_to do |format|
      if @paycheck.save
        format.html { redirect_to @paycheck, notice: 'Paycheck was successfully created.' }
        format.json { render :show, status: :created, location: @paycheck }
      else
        format.html { render :new }
        format.json { render json: @paycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paychecks/1
  # PATCH/PUT /paychecks/1.json
  def update
    respond_to do |format|
      if @paycheck.update(paycheck_params)
        format.html { redirect_to @paycheck, notice: 'Paycheck was successfully updated.' }
        format.json { render :show, status: :ok, location: @paycheck }
      else
        format.html { render :edit }
        format.json { render json: @paycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paychecks/1
  # DELETE /paychecks/1.json
  def destroy
    @paycheck.destroy
    respond_to do |format|
      format.html { redirect_to paychecks_url, notice: 'Paycheck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paycheck
      @paycheck = Paycheck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paycheck_params
      params.require(:paycheck).permit(:employee_id, :name, :start_date, :end_date, :total_hours_worked, :gross_wages, :total_deductions, :net_wages)
    end
end
