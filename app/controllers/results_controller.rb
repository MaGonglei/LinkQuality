class ResultsController < ApplicationController
  rescue_from ActiveRecord::ActiveRecordError , :with => :show_sql_errors

  def index
    @task = Task.find(params[:task_id])

    #TODO:Ajax get data
    #TODO:Order by column by click the column
    #TODO:Table cell width can change
    select_string = "url,code,depth,referer,content_type,response_time,title,headers,date,server,content_length,connection_type,out_links_number"
    @results = @task.results.select(select_string).where(params[:where]).order(params[:order_by])

    if @results.exists?
      @results_perpage = @results.page(params[:page]).per params[:per_page_number]

      respond_to do |format|
        format.html # index.html.erb
      end

    else
      show_sql_errors(Exception.new("Not found results with Where=#{params[:where]} and Order by=#{params[:order_by]}"))
    end

  end

  private

  def show_sql_errors(exception)
    flash[:sql_errors] = exception.to_s
    redirect_to :back
  end
end
