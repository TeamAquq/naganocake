class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end
end
