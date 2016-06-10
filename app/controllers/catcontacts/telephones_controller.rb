require_dependency "catcontacts/application_controller"

module Catcontacts
  class TelephonesController < ApplicationController
    before_action :set_telephone, only: [:show, :edit, :update, :destroy]

    # GET /telephones
    def index
      @telephones = Telephone.all
    end

    # GET /telephones/1
    def show
    end

    # GET /telephones/new
    def new
      @telephone = Telephone.new
    end

    # GET /telephones/1/edit
    def edit
    end

    # POST /telephones
    def create
      @telephone = Telephone.new(telephone_params)

      if @telephone.save
        redirect_to @telephone, notice: 'Telephone was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /telephones/1
    def update
      if @telephone.update(telephone_params)
        redirect_to @telephone, notice: 'Telephone was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /telephones/1
    def destroy
      @telephone.destroy
      redirect_to telephones_url, notice: 'Telephone was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_telephone
        @telephone = Telephone.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def telephone_params
        params.require(:telephone).permit(:number, :description, :textable, :contact_id)
      end
  end
end
