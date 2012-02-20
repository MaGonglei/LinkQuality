class TestLinkResultsController < ApplicationController

  def index
    @test_links = TestLinks.find_by_test_task_id(params[:test_task_id])

    #TODO:Exception handler for SQL error
    @test_link_results = @test_links.test_link_results.select("url,code,depth,referer,content_type,response_time,title,headers,from_link_text,from_link_line_number,out_links_number").where(params[:where])

    #TODO:inde.html.erb div#colum_setting hide option
    @test_link_results_perpage = @test_link_results.page(params[:page]).per params[:per_page_numbers]

    respond_to do |format|
      format.html # index.html.erb
    end
  end



end
