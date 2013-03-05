# encoding: utf-8

# -*- encoding : utf-8 -*-
class Time
  def before? input_time
    (self <=> input_time) == -1
  end
end

class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @wpisowe = Time.now.before? Date.new(Time.now.year,4,30)
    @dzienotwarty = Time.now.before? Date.new(Time.now.year,3,23)
  end

  def about
  end

  def authorprogram
  end

  def pedagogika
    @folder = "../docs-monte"
    @files = Array.new
    @files << [ "Chlonny_umysl_2010_2011.pdf", "Chłonny umysł" ]
    @files << [ "Faza_wrazliwa_dla_porzadku.pdf", "Faza wrazliwa dla porządku" ]
    @files << [ "f_sensytywn_na_ruch.pdf", "Faza sensytywna na ruch" ]
    @files << [ "Normalizacja.pdf", "Normalizacja" ]
    @files << [ "obserwacja_w_przygotowanym_otoczeniu_Krakow.pdf", "Obserwacja w przygotowanym otoczeniu" ]
    @files << [ "PIM-Fazy_senytywne_Warszawa_2010.pdf", "Fazy sensytywne" ]
    @files << [ "Przygotowane_otoczenie.pdf", "Przygotowane otoczenie" ]
    @files << [ "Rola_nauczyciela_montessorianskiego.pdf", "Rola nauczyciela montessorianskiego" ]
    # @files << [ "Trzygodzinna_praca_wlasna_DW.pdf", "Trzygodzinna praca własna" ]
    @files << [ "CASA_DEI_BAMBINI.pdf", "Casa dei Bambini" ]
  end

  def kadra
  end

  def adaptacja
  end

  def parentsite
    @folder = "docs"
    @files = Array.new
    @files << [ "Statut Żłobka Kubusiowy Raj w Bobrowcu.doc", "Statut Żłobka" ]
    @files << [ "Procedura-przyprowadzania-i-odbierania-dzieci.docx", "Procedura przyprowadzania i odbierania dzieci"]
    @files << [ "Umowa-o-przyjęcie-dziecka.docx", "Umowa o przyjęcie dziecka" ]
    @files << ["Upoważnienie-do-odbioru-dziecka.rtf", "Upoważnienie do odbioru dziecka"]
    @files << ["Regulamin.pdf", "Regulamin" ]
    @files << ["karta informacyjna dziecka.docx", "Karta informacyjna dziecka" ]
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