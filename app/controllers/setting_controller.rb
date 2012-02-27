class SettingController < ApplicationController

  def new
    @task = Task.find(params[:task_id])
    @setting = @task.build_setting
  end

  def create
    @task = Task.find(params[:task_id])

    @setting = @task.build_setting(params[:setting])


    if @setting.save
      flash[:notice] = "#{@setting.inspect} saved successfully."
      redirect_to(:action => :edit)
    else
      flash[:notice] = "#{@setting.inspect} not saved."
      redirect_to(:action => :new)
    end
  end

  def edit
    @task = Task.find(params[:task_id])
    @setting = @task.setting
    if @setting.nil?
      redirect_to(:action => :new)
    end
  end

  def update
    @task = Task.find(params[:task_id])
    @setting = @task.setting

    if @setting.update_attributes(params[:setting])
      flash[:notice] = "#{@setting.inspect} updated successfully."
    else
      flash[:notice] = "#{@setting.inspect} not updated."
    end
    redirect_to(:action => :edit)
  end

end
