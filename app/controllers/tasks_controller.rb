#coding:utf-8
class TasksController < ApplicationController

  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  def edit
    @task = Task.find(params[:id])
    #TODO: Refresh the chetime
  end

  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to edit_task_path(@task), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to edit_task_path(@task), notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end

  def check
    @task = Task.find(params[:id])

    @task.check_url

    respond_to do |format|
      result_count = @task.results.count
      if result_count != 0
        flash[:notice] = "Test Over,All test links result number = #{result_count}"
        @task.result = "通过"
      else
        flash[:notice] = "Test Wrong"
        @task.result = "错误"
      end
      @task.save

      format.html {redirect_to task_results_path(@task)}
    end

  end

  def search
    @task = Task.find params[:q]
    redirect_to @task

  rescue ActiveRecord::RecordNotFound => e
    flash[:notice] = e.message
    redirect_to :action => :index

  end

end
