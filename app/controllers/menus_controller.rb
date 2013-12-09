class MenusController < ApplicationController
  def today
    menu = Menu.where(date:Date.today).first.attributes
    menu.delete('id')
    menu.delete('created_at')
    menu.delete('updated_at')
    render :json => menu
  end

  def date
    menu = Menu.where(date:params[:date]).first.attributes
    menu.delete('id')
    menu.delete('created_at')
    menu.delete('updated_at')
    render :json => menu
  end

  def all
    menus = []
    Menu.all.each do |m|
      menu = m.attributes
      menu.delete('id')
      menu.delete('created_at')
      menu.delete('updated_at')
      menus << menu
    end
    render :json => menus
  end
end
