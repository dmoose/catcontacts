require_dependency "catcontacts/application_controller"

module Catcontacts
  class AddressesController < ApplicationController
    before_action :set_address, only: [:show, :edit, :update, :destroy, :geocode]

    # GET /addresses
    def index
      @addresses = Address.all
    end

    # GET /addresses/1
    def show
    end

    # GET /addresses/new
    def new
      @address = Address.new
    end

    # GET /addresses/1/edit
    def edit
    end

    # POST /addresses
    def create
      @address = Address.new(address_params)

      if @address.save
        redirect_to @address, notice: 'Address was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /addresses/1
    def update
      if @address.update(address_params)
        redirect_to @address, notice: 'Address was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /addresses/1
    def destroy
      @address.destroy
      redirect_to addresses_url, notice: 'Address was successfully destroyed.'
    end

    def geocode
      @address.geocode
      if @address.save
        redirect_to @address, notice: 'Address was geocoded'
      else
        redirect_to @address, notice: 'Address did not geocode'
      end
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_address
        @address = Address.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def address_params
        params.require(:address).permit(:aline1, :aline2, :aline2, :city, :region, :postal, :county, :country)
      end
  end
end
