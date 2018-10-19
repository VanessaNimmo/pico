class LinkController < ApplicationController
  def index
  end

  def show
    @link = Link.find(params[:id])
    url_extension = @link.id.to_s(36)
    @short_url = "http://localhost:3000/#{url_extension}"
  end

  def create
    @link = Link.new(link_params)
      if @link.save
        redirect_to @link
      else
        redirect_to 'link/index'
      end
  end

  def send_to_url
    id = params[:short_url].to_i(36)
    link = Link.find(id)
    redirect_to link.original_url
  end

  private

  def link_params
      params.require(:link).permit(:original_url)
  end
end
