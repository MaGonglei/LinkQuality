#coding:utf-8
require 'prawn'

class TestTasksController < ApplicationController

  # GET /test_tasks
  # GET /test_tasks.json
  def index
    @test_tasks = TestTask.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_tasks }
      format.rss { render xml:  @test_tasks.all}
    end
  end

  # GET /test_tasks/1
  # GET /test_tasks/1.json
  def show
    @test_task = TestTask.find(params[:id])


    respond_to do |format|
      format.html
      format.json { render json: @test_task }
      format.pdf { render pdf:  generate_pdf(@test_task) }
    end
  end

  # GET /test_tasks/new
  # GET /test_tasks/new.json
  def new
    @test_task = TestTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_task }
    end
  end

  # GET /test_tasks/1/edit
  def edit
    @test_task = TestTask.find(params[:id])
  end

  # POST /test_tasks
  # POST /test_tasks.json
  def create
    @test_task = TestTask.new(params[:test_task])

    respond_to do |format|
      if @test_task.save
        format.html { redirect_to @test_task, notice: 'Test task was successfully created.' }
        format.json { render json: @test_task, status: :created, location: @test_task }
      else
        format.html { render action: "new" }
        format.json { render json: @test_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_tasks/1
  # PUT /test_tasks/1.json
  def update
    @test_task = TestTask.find(params[:id])

    respond_to do |format|
      if @test_task.update_attributes(params[:test_task])
        format.html { redirect_to @test_task, notice: 'Test task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_tasks/1
  # DELETE /test_tasks/1.json
  def destroy
    @test_task = TestTask.find(params[:id])
    @test_task.destroy

    respond_to do |format|
      format.html { redirect_to test_tasks_url }
      format.json { head :ok }
    end
  end

  def check
    @test_task = TestTask.find(params[:id])

    @test_task.test_links.check_url

    respond_to do |format|
      result_count = @test_task.test_links.test_link_results.size
      if result_count != 0
        flash[:notice] = "Test Over,All test links result number = #{result_count}"
        @test_task.result = "通过"
      else
        flash[:notice] = "Test Wrong"
        @test_task.result = "错误"
      end
      @test_task.save
      format.html {redirect_to @test_task}
    end

  end

  def search
    @test_task = TestTask.find params[:q]
    redirect_to @test_task

  rescue ActiveRecord::RecordNotFound => e
    flash[:notice] = e.message
    redirect_to :action => :index

  end

  private

  def generate_pdf(client)
    Prawn::Document.new do
      text client.person, :align => :center
      text "checktime: #{client.checktime}"
      text "person: #{client.person}"
    end.render
  end
end
