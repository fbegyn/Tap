class BarcodesController < ApplicationController
  load_and_authorize_resource :barcode, shallow: true

  def create
    @barcode.save
    redirect_to barcode_products_path, notice: "Barcode successfully linked!"
  end

  def show
    render json: @barcode.product
  end

  private

  def barcode_params
    params.require(:barcode).permit(:code)
  end
end