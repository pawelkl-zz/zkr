# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Static pages" do

  subject { page }

  let(:homepage_h1) { "Wkrótce otwarcie!" }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: homepage_h1) }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end

  describe "About page" do
    before { visit about_path }
    let(:title) { "O nas" }
    it { should have_selector('h1', text: title) }
    it { should have_selector('title', text: full_title(title)) }
  end

  describe "Parent Site" do
    before { visit strefarodzica_path }

  end

  describe "Dayplan" do
  end

  describe "Pricelist page" do
    before { visit oplaty_path }
    let(:title) { "Opłaty" }
    it { should have_selector('h1', text: title) }
    it { should have_selector('title', text: full_title(title)) }
  end

  describe "Photo gallery" do
    before { visit galeria_path }
    let(:title) { "Galeria Zdjęć" }
    it { should have_selector('h1', text: '') }
    it { should have_selector('title', text: full_title('')) }
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:title) { "Kontakt" }
    it { should have_selector('h1', text: title) }
    it { should have_selector('title', text: full_title(title)) }

    it { should have_selector 'p', text: '881 589 599' }
    it { should have_selector 'p', text: '505 106 699' }
    it { should have_link "biuro@zlobekkubusiowyraj.pl",href: 'mailto:biuro@zlobekkubusiowyraj.pl' }
    it { should have_selector 'p', text: '13 1950 0001 2006 0279 0756 0002' }
      #'13 19500 00120 06027 90756 0002' }
    it { should have_selector 'iframe' }
    # it { should have_selector 'p', text: '' }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Sign in"
    page.should have_selector 'title', text: full_title('Sign in')
    click_link "O nas"
    page.should have_selector 'title', text: full_title('O nas')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Kontakt"
    page.should have_selector 'title', text: full_title('Kontakt')
    click_link "Opłaty"
    page.should have_selector 'title', text: full_title('Opłaty')
    click_link "Galeria Zdjęć"
    page.should have_selector 'title', text: full_title('Galeria Zdjęć')
    # click_link "Opłaty"
    # page.should have_selector 'title', text: full_title('Opłaty')
    click_link "Strona Główna"
    click_link "Zarejestruj się!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "Żłobek Kubusiowy Raj"
    page.should have_selector 'h1', text: homepage_h1
  end
end
