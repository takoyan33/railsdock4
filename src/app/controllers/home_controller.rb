class HomeController < ApplicationController
  def index 
    @boards_count = Board.all.count
    @today_count = Board.created_today.count
    @lastmonth_count = Board.created_last_month.count
    @month_count = Board.created_month.count

    @data = [['2ヶ月前の投稿数',@today_count],['先月の投稿数', @lastmonth_count],['今月の投稿数',@today_count]]
  end
end
