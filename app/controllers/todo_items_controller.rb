class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]

    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        if @todo_item.save
            flash[:success] = "Todo List item created"
        else
            flash[:error] = "Todo List item could not be created"
        end
        redirect_to @todo_list

    end

    def destroy
        if @todo_item.destroy
            flash[:success] = "Todo List item deleted"
        else
            flash[:error] = "Todo List item could not be deleted"
        end
        redirect_to @todo_list

    end

    def complete
        @todo_item.update_attribute(:completed_at, Time.now)
        redirect_to @todo_list, notice: "Todo item completed"
    end

    private
    #Pour ne pas avoir à appeler ces objets à chaque def on crée une methode private et un before action
    #Pour create
    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
    end
    #Pour destroy et complete
    def set_todo_item
        @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def todo_item_params
        params[:todo_item].permit(:content)
    end

end
