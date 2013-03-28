class Api::V1::SitesController < ApplicationController

  before_filter :skip_trackable
  before_filter :authenticate_user!

  respond_to :json

  def index
    respond_with Site.all
  end

  def show
    respond_with Site.find(params[:id])
  end

  def create
    @site = Site.create(site_params)
    respond_to do |format|
      format.json { render :json => @site }
    end

  end

  def update
    site = Site.find(params[:id])
    site.update_attributes!(site_params)
    respond_to do |format|
      format.json { render :json => site }
    end
  end


  def destroy
   respond_with Site.destroy(params[:id])
  end


  private
  def site_params
    params.require(:site).permit(:name)
  end


end