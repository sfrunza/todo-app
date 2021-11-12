class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: %i[ show edit update destroy ]

  def index
    @todo_items = TodoItem.order('due_at ASC')
  end

  def show
  end

  def new
    @todo_item = TodoItem.new
  end

  def edit
  end

  def create

    @gg = todo_item_params["due_at(1i)"] + "-" +todo_item_params["due_at(2i)"] + "-" + todo_item_params["due_at(3i)"]
    @todo_item = TodoItem.new(todo_item_params)
    @due_day = @todo_item.due_at.strftime("%Y-%m-%d")
    
    if TodoDate.exists?(day: @gg)
      @todo_day = TodoDate.find_by(day: @due_day)
      @todo_item.todo_date_id = @todo_day.id
    else 
      @todo_day = TodoDate.new(day: @gg)
        if @todo_day.save
          @todo_item = TodoItem.new(todo_item_params)
          @todo_item.todo_date_id = @todo_day.id
        end  
    end

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_items_url, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to todo_items_url, notice: "Item was successfully updated." }
        format.json { render :index, status: :ok, location: @todo_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to todo_items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

    def todo_item_params
      params.require(:todo_item).permit(:title, :due_at, :todo_date_id)
    end
end
