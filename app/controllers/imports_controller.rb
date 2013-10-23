class ImportsController < ApplicationController
  def new
    @import = Import.new
  end

  def create
    @import = Import.new(params[:import])
    if @import.save
      redirect_to root_url, notice: "Imported successfully."
    else
      render :new
    end
  end
end
