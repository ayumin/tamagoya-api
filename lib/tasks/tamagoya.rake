require 'pp'

require 'open-uri'
require 'nokogiri'
require 'json'
require 'date_helper'

namespace :tamagoya do
  desc "玉子屋からメニューを取得"
  task :get => :environment do
    uri = ENV['TAMAGOYA_URL']
    doc = Nokogiri::HTML(open(uri),nil,"utf-8")
    menues = []
    doc.css('.menu_list').each_with_index do |item,ix|
      menu = {}
      date_str = doc.css('.menu_title')[ix].text
      mon = date_str.month.to_i
      day = date_str.day.to_i
      mon = "%02d" % mon
      day = "%02d" % day
      day = "10" if day == "00"
      menu[:date] = "2013-#{mon}-#{day}"
      menu[:calorie] = doc.css('.menu_calorie')[ix].text
      menu[:maindish] = ''
      menu[:okazu] = []
      item.css('ul').css('li').each_with_index do |okazu|
        if okazu.attributes['class'].value == 'menu_maindish'
          menu[:maindish] = okazu.text
        else
          menu[:okazu] << okazu.text
        end
      end
      menues << menu
    end

    menues.each do |attributes|
      menu = Menu.find_or_create_by(:date => attributes[:date]) 
      menu.attributes = attributes
      menu.save
    end

  end
end
