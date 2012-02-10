class TestLinkResultsController < ApplicationController

  def index
    @test_links = TestLinks.find_by_test_task_id(params[:test_task_id])

    @test_link_results = @test_links.test_link_results

    @test_links_results_perpage = @test_link_results.page(params[:page]).per 5

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
