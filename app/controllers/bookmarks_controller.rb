class BookmarksController < ApplicationController

  def show
    @bookmark = Bookmark.find(params[:id])
  end
def new
  @list = List.find(params[:list_id])
  @bookmark = Bookmark.new()
end

def create
  @list = List.find(params[:list_id])
  @bookmark = Bookmark.new(bookmark_params)
  @bookmark.list = @list
  if @bookmark.save
    # good
    redirect_to list_path(@list)
  else
    # wrong
    render :new, status: :unprocessable_entity
  end
end

 def destroy
  @bookmark = Bookmark.find(params[:id])
  @list = @bookmark.list
  @bookmark.destroy
  redirect_to list_path(@list)
 end

 private

 def bookmark_params
  params.require(:bookmark).permit(:movie_id, :comment)
 end


end
