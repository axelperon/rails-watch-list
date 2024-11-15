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
    @list = List.new(list_params)
    @list.save!
    redirect_to lists_path
  end

   def destroy
    @list = List.find(params[:id])
    @list.destroy
   redirect_to list_path(@list)
   end

   def search
    @list = List.find_by(name: params[:query][:name])

    if @list
    redirect_to list_path(@list)
    else
      redirect_to lists_path
    end
   end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
