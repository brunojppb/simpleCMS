class PagesController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in
  before_action :find_subject

  def index
    #@pages = Page.all.order('pages.position ASC')
    @pages = @subject.pages.order('pages.position ASC')
  end

  def show
    @page = Page.find_by_id(params[:id])
  end

  def new
    @page = Page.new({:subject_id => @subject.id, :name => "Default"})
    @subjects = Subject.all.order('position ASC')
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page saved successfully."
      redirect_to(:action => 'index', :subject_id => @subject.id)
    else
      @subjects = Subject.all.order('position ASC')
      @page_count = Page.count
      render('new')
    end
  end

  def edit
    @page = Page.find_by_id(params[:id])
    @subjects = Subject.all.order('position ASC')
    @page_count = Page.count
  end

  def update
    @page = Page.find_by_id(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page update successfully."
      redirect_to(:action => 'show', :id => @page.id, :subject_id => @subject.id)
    else
      flash[:notice] = "Error! try again."
      @subjects = Subject.all.order('position ASC')
      @page_count = Page.count
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
      redirect_to(:action => 'index', :subject_id => @subject.id)
    else
      render('delete')
    end
  end


  private

    def page_params
      params.require(:page).permit(:name, :permalink, :position, :visible, :subject_id)
    end

    def find_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
      end
    end

end









