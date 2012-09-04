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
