

Given /^Navigate to home page/ do
  @driver.get "http://localhost:3000"
end



When /^Add new task with (.*),(.*),(.*),(.*),(.*)$/ do |person,threads,depth_limit,subdomains,urls|
  @driver[:xpath => "html/body/a"].click
  @driver["task_person"].send_keys person
  @driver["task_threads"].send_keys threads
  @driver["task_depth_limit"].send_keys depth_limit
  @driver["task_subdomains"].click unless (subdomains == "ture")
  @driver["task_urls"].send_keys urls

end

Then /^Create task/ do
  @driver[:xpath => ".//*[@id='new_task']/div[5]/input"].click
  @driver["notice"].text.should == "Task was successfully created."
end
