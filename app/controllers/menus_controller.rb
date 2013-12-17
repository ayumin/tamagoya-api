class MenusController < ApplicationController
  def today
    menu ={}
    if !(menu = Menu.where(date:Date.today).first)
      menu = {status:"NO DATA"}
    else
      menu = make_menu(menu)
    end
    render :json => menu
  end

  def date
    date_string = params[:date]
    year, month, day = date_string.split('-')
    menu = {}
    if !Date.valid_date?(year.to_i,month.to_i,day.to_i)
      menu = {status:"DATE FORMAT ERROR"}
    elsif !(menu = Menu.where(date:date_string).first)
      menu = {status:"NO DATA"}
    else
      menu = make_menu(menu)
    end
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

  def make_menu(menu)
    menu = menu.attributes
    menu[:status] = "OK"
    menu.delete('id')
    menu.delete('created_at')
    menu.delete('updated_at')
    menu
  end

  private :make_menu
end
