class SectionsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @sections = Section.all.order("sections.position ASC")
  end

  def show
    @section = Section.find_by_id(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    section = Section.new(section_params)
    if section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @section = Section.find_by_id(params[:id])
  end

  def update
    @section = Section.find_by_id(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'index')
    else
      render('edit')
    end

  end

  def delete
    @section = Section.find_by_id(params[:id])
  end

  def destroy
    section = Section.find_by_id(params[:id])
    if section.destroy
      flash[:notice] = "Section #{section.name} successfully."
      redirect_to(:action => 'index')
    else
      render('delete')
    end
  end

  private

    def section_params
      params.require(:section).permit(:name, :position, :visible, :content, :content_type)
    end

end
