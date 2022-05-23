class ComicsController < ApplicationController
  before_action :set_comic, only: %i[ show ]
  Faraday.default_adapter = :net_http

  # GET /comics or /comics.json
  def index
    @api_url = XkcdComics::Application::URL_XKCD
    Rails.logger.info "<"*150
    Rails.logger.info params[:comic_id]

    if params[:search_by_number] && params[:search_by_number] != ""
      @peticion = Faraday.get("#{@api_url}#{params[:search_by_number]}/info.0.json")
    else
      if params[:comic_id] && params[:comic_id] != ""
        @peticion = Faraday.get("#{@api_url}#{params[:comic_id]}/info.0.json")
      else
        @peticion = Faraday.get("#{@api_url}info.0.json")
      end
    end

    @comic = JSON.parse(@peticion.body)

    @max_number = @comic['num']
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
