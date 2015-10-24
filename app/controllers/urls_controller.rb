class UrlsController < ApplicationController
  def new
  end

  def create
    begin
      if !params[:url].blank?
        client = Bitly.client
        @url = client.shorten(params[:url])
      else
        flash[:error] = "Enter Url"
        redirect_to root_url
      end
    rescue Exception => e
      flash[:error] = "Enter Valid Format URL"
      redirect_to root_url
    end
  end
end
