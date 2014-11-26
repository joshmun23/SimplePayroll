class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :fwh_finder]
  before_action :paycheck_calculator, only: [:show]
  
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @paychecks = @employee.paychecks
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def paycheck_calculator
    @employee.paychecks.each_with_index do |paycheck,index|
      if !@employee.paychecks[index].completed
        regular_pay = paycheck.total_hours_worked * @employee.wage
        overtime_pay = (40 * @employee.wage) + ((paycheck.total_hours_worked - 40) * @employee.wage * 1.5)

        @employee.paychecks[index].gross_wages = (paycheck.total_hours_worked > 40) ? overtime_pay : regular_pay
        @employee.paychecks[index].fica_deduction = paycheck.gross_wages * @employee.fica / 100
        @employee.paychecks[index].fwh_deduction  = fwh_finder(@employee.paychecks[index].gross_wages,index)
        @employee.paychecks[index].swh_deduction  = paycheck.gross_wages * @employee.swh / 100
        @employee.paychecks[index].total_deductions = @employee.paychecks[index].fica_deduction + @employee.paychecks[index].fwh_deduction + @employee.paychecks[index].swh_deduction
        @employee.paychecks[index].net_wages        = paycheck.gross_wages - @employee.paychecks[index].total_deductions

        @employee.paychecks[index].update_attributes(gross_wages:    @employee.paychecks[index].gross_wages,
                                                     fica_deduction: @employee.paychecks[index].fica_deduction,
                                                     fwh_deduction:  @employee.paychecks[index].fwh_deduction,
                                                     swh_deduction:  @employee.paychecks[index].swh_deduction,
                                                     net_wages:      @employee.paychecks[index].net_wages,
                                                     completed:       true)
      end
    end
  end

  def fwh_finder(gross_wages,index)
    if @employee.marital_status.downcase == 'single'
      @singles_tax_form = File.readlines('public/singles_tax_form.txt')

      @singles_tax_form.each_with_index do |line,index|
        next if index < 3
        current_line = line.split
        total_claims = @employee.fwh + 2
        at_least = current_line[0].to_f
        but_less_than = current_line[1].to_f
        next unless gross_wages >= at_least && gross_wages < but_less_than

        return current_line[total_claims]
      end
    elsif @employee.marital_status.downcase == 'married'
      @married_tax_form = File.readlines('public/married_tax_form.txt')
        
      @married_tax_form.each_with_index do |line,index|
        next if index < 3
        current_line = line.split
        total_claims = @employee.fwh + 2
        at_least = current_line[0].to_f
        but_less_than = current_line[1].to_f
        next unless (gross_wages >= at_least) && (gross_wages < but_less_than)

        return current_line[total_claims]
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :wage, :marital_status, :fica, :fwh, :swh, :claims)
    end
end
