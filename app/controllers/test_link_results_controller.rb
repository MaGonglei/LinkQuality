class TestLinkResultsController < ApplicationController
  rescue_from ActiveRecord::ActiveRecordError , :with => :show_sql_errors

  def index
    @test_links = TestLinks.find_by_test_task_id(params[:test_task_id])

    #TODO:Ajax get data
    #TODO:Order by column by click the column
    @test_link_results = @test_links.test_link_results.select("url,code,depth,referer,content_type,response_time,title,headers,from_link_text,from_link_line_number,out_links_number").where(params[:where]).order(params[:order_by])

    unless @test_link_results.exists?
      show_sql_errors(Exception.new("Not found test_link_results with Where=#{params[:where]} and Order by=#{params[:order_by]}"))
    else

      @test_link_results_perpage = @test_link_results.page(params[:page]).per params[:per_page_number]

      respond_to do |format|
        format.html # index.html.erb
      end
    end

  end

  private

  def show_sql_errors(exception)
    flash[:sql_errors] = exception.to_s
    redirect_to :back
  end
end
