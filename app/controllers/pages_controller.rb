class PagesController < ApplicationController

  layout false

  def index
    @pages = Page.all.order('pages.position ASC')
  end

  def show
    @page = Page.find_by_id(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page saved successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @page = Page.find_by_id(params[:id])
  end

  def update
    @page = Page.find_by_id(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page update successfully."
      redirect_to(:action => 'show', :id => @page.id)
    else
      flash[:notice] = "Error! try again."
      render('edit')
    end
  end

  def delete
    @page = Page.find_by_id(params[:id])
  end

  def destroy
    page = Page.find_by_id(params[:id])
    if page.destroy
      flash[:notice] = "Page #{page.name} deleted successfully."
      redirect_to(:action => 'index')
    else
      render('delete')
    end
  end


  private

    def page_params
      params.require(:page).permit(:name, :permalink, :position, :visible)
    end

end
