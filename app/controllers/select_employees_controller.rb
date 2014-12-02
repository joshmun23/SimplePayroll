class SelectEmployeesController < ApplicationController
  before_action :set_select_employee, only: [:show, :edit, :update, :destroy]

  # GET /select_employees
  # GET /select_employees.json
  def index
    @select_employees = SelectEmployee.all
  end

  # GET /select_employees/1
  # GET /select_employees/1.json
  def show
  end

  # GET /select_employees/new
  def new
    @employees = Employee.all
    @select_employee = SelectEmployee.new
  end

  # GET /select_employees/1/edit
  def edit
  end

  # POST /select_employees
  # POST /select_employees.json
  def create
    @select_employee = SelectEmployee.new(select_employee_params)

    respond_to do |format|
      if @select_employee.save
        format.html { redirect_to @select_employee, notice: 'Select employee was successfully created.' }
        format.json { render :show, status: :created, location: @select_employee }
      else
        format.html { render :new }
        format.json { render json: @select_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /select_employees/1
  # PATCH/PUT /select_employees/1.json
  def update
    respond_to do |format|
      if @select_employee.update(select_employee_params)
        format.html { redirect_to @select_employee, notice: 'Select employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @select_employee }
      else
        format.html { render :edit }
        format.json { render json: @select_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /select_employees/1
  # DELETE /select_employees/1.json
  def destroy
    @select_employee.destroy
    respond_to do |format|
      format.html { redirect_to select_employees_url, notice: 'Select employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_select_employee
      @select_employee = SelectEmployee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def select_employee_params
      params[:select_employee].permit(:employee_ids)
    end
end
