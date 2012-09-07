# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def authorprogram
  end

  def pedagogika
  end

  def kadra
  end

  def adaptacja
  end

  def parentsite
    @folder = "docs"
    @files = Array.new
    @files << [ "Procedura-przyprowadzania-i-odbierania-dzieci.docx", "Procedura przyprowadzania i odbierania dzieci"]
    @files << [ "Umowa-o-przyjęcie-dziecka.docx", "Umowa o przyjęcie dziecka" ]
    @files << ["Upoważnienie-do-odbioru-dziecka.rtf", "Upoważnienie do odbioru dziecka"]
    @files << ["regulamin.doc", "Regulamin" ]
  end

  def dayplan
  end

  def pricelist
  end

  def gallery
  end

  def contact
  end

  def help
  end

end