class TestSettingController < ApplicationController

  def new
    @test_task = TestTask.find(params[:test_task_id])
    @test_setting = @test_task.build_test_setting
  end

  def create
    @test_task = TestTask.find(params[:test_task_id])

    #@test_settings = TestSettings.new(params[:test_settings])
    @test_setting = @test_task.build_test_setting(params[:test_setting])


    if @test_setting.save
      flash[:notice] = "#{@test_setting.inspect} saved successfully."
      redirect_to(:action => :edit)
    else
      flash[:notice] = "#{@test_setting.inspect} not saved."
      redirect_to(:action => :new)
    end
  end

  def edit
    @test_task = TestTask.find(params[:test_task_id])
    @test_setting = @test_task.test_setting
    if @test_setting.nil?
      redirect_to(:action => :new)
    end
  end

  def update
    @test_task = TestTask.find(params[:test_task_id])
    @test_setting = @test_task.test_setting

    if @test_setting.update_attributes(params[:test_setting])
      flash[:notice] = "#{@test_setting.inspect} updated successfully."
    else
      flash[:notice] = "#{@test_setting.inspect} not updated."
    end
    redirect_to(:action => :edit)
  end

end
