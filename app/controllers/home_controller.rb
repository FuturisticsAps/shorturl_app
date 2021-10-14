class HomeController < ApplicationController
  def index
    @shorthand_urls = ShorthandUrl.all
  end

  def save_url
    url_detail = params[:shorthand_url]
    if url_detail.present?
      unless %w[https:// http://].include?(url_detail[:url])
        url_detail[:url] = "https://#{url_detail[:url]}"
      end

      ShorthandUrl.create!(title: url_detail[:title], actual_url: url_detail[:url])
      flash[:success] = 'It worked!'
    else
      flash[:warning] = 'Something went wrong.'
    end

    redirect_to root_path
  end

  def redirect_url
    @shorthand_url = nil
    url_code = params[:slug]
    if url_code.present?
      @shorthand_url = ShorthandUrl.find_by(short_url: url_code)
    end
  end

end
