class DemoController < ApplicationController

    layout false

  def index
  end

  def hello
    @array = ['bruno', 'eu', 'tu']
    @id = params[:id].to_i
    @page = params[:page].to_i
  end
end
