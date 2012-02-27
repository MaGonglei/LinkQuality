class ResultsController < ApplicationController
  rescue_from ActiveRecord::ActiveRecordError , :with => :show_sql_errors

  def index
    @task = Task.find(params[:task_id])

    #TODO:Ajax get data
    #TODO:Order by column by click the column
    @results = @task.results.select("url,code,depth,referer,content_type,response_time,title,headers,from_link_text,from_link_line_number,out_links_number").where(params[:where]).order(params[:order_by])

    unless @results.exists?
      show_sql_errors(Exception.new("Not found results with Where=#{params[:where]} and Order by=#{params[:order_by]}"))
    else

      @results_perpage = @results.page(params[:page]).per params[:per_page_number]

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
