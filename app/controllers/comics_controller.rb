class ComicsController < ApplicationController
  # before_action :set_comic, only: %i[ show ]
  # before_action :validate_number, only: %i[ index ]
  Faraday.default_adapter = :net_http

  # GET /comics or /comics.json
  def index
    @api_url = XkcdComics::Application::URL_XKCD
    @comic_index = make_request(@api_url, nil)
    @last = last_comic(@api_url)

    if @comic_index
      @comic = @comic_index
      @max = @comic['num']
    end

    if @max == @last
      @disabled = true
    end

    if params[:search_by_number] && params[:search_by_number] != ""
      @comic = make_request(@api_url, params[:search_by_number])
      @disabled = false
    end

    if params[:comic_id] && params[:comic_id] != ""
      @comic = make_request(@api_url, params[:comic_id])
      @disabled = false
    end

    @max_number = @comic['num']

    Rails.logger.info ">"*150
    Rails.logger.info @max_number
    Rails.logger.info @comic.to_json
  end

  # GET /comics/1 or /comics/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    def make_request(request, comic_number=0)
      if comic_number && comic_number != 0
        req = Faraday.get("#{request}#{comic_number}/info.0.json")
      else
        req = Faraday.get("#{request}info.0.json")
      end

      if req.status == 404 && @max != @last
        make_request(request, comic_number.to_i + 1)
      end

      Rails.logger.debug "="*150
      Rails.logger.debug JSON.parse(req.to_json)
      comic = JSON.parse(req.body)
    end

    def last_comic request
      req = Faraday.get("#{request}info.0.json")
      comic = JSON.parse(req.body)
      last = comic['num']
    end

    def validate_number
      unless params[:comic_id].scan(/\D/).empty?
        flash.now[:alert] = "Error: El numero del cómic debe ser mayor a 0."
      end
    end

    # Only allow a list of trusted parameters through.
    def comic_params
      params.require(:comic).permit(:month, :num, :link, :year, :news, :safe_title, :transcript, :alt, :img, :title, :day)
    end
end
