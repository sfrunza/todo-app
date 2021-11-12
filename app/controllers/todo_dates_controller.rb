class TodoDatesController < ApplicationController
  before_action :set_todo_date, only: %i[ show edit update destroy ]

  def index
    @todo_dates = TodoDate.all
  end

  def show
  end

  def new
    @todo_date = TodoDate.new
  end

  def edit
  end

  def create
    @todo_date = TodoDate.new(todo_date_params)

    respond_to do |format|
      if @todo_date.save
        format.html { redirect_to @todo_date, notice: "Todo date was successfully created." }
        format.json { render :show, status: :created, location: @todo_date }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_date.update(todo_date_params)
        format.html { redirect_to @todo_date, notice: "Todo date was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_date }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_date.destroy
    respond_to do |format|
      format.html { redirect_to todo_dates_url, notice: "Todo date was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_todo_date
      @todo_date = TodoDate.find(params[:id])
    end

    def todo_date_params
      params.require(:todo_date).permit(:day)
    end
end
