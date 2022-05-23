class ComicsController < ApplicationController
  before_action :set_comic, only: %i[ show ]
  Faraday.default_adapter = :net_http

  # GET /comics or /comics.json
  def index
    @api_url = XkcdComics::Application::URL_XKCD

    if params[:search_by_number] && params[:search_by_number] != ""
      @peticion = Faraday.get("#{@api_url}#{params[:search_by_number]}/info.0.json")
    else
      @peticion = Faraday.get("#{@api_url}info.0.json")
    end

    @comic = JSON.parse(@peticion.body)
    Rails.logger.info "="*150
    Rails.logger.info @comic

    @max_number = @comic['num']
    Rails.logger.info "*"*150
    Rails.logger.info @max_number
  end

  def preview
    @max_number = @max_number - 1
    @peticion_anterior = Faraday.get("#{@api_url}#{@max_number}/info.0.json")

    @comic = JSON.parse(@peticion_anterior.body)
    Rails.logger.info "="*150
    Rails.logger.info @max_number
    Rails.logger.info @comic
  end

  def next
  end

  # GET /comics/1 or /comics/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comic_params
      params.require(:comic).permit(:month, :num, :link, :year, :news, :safe_title, :transcript, :alt, :img, :title, :day)
    end
end
