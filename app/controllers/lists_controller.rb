class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new()
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def create
    @list = List.create(list_params)
    @list.save

    redirect_to lists_path
  end

   def destroy
    @list = List.find(params[:id])
    @list.destroy
   redirect_to list_path(@list)
   end


  private

  def list_params
    params.require(:list).permit(:name)
  end

end
