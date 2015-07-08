class TaskManagerApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  # Create
  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  # Read
  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  # Optional usage
  # get '/tasks/:id' do
  #   @task = TaskManager.find(params[:id].to_i)
  #   erb :show
  # end

  # Update
  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end

  # Delete
  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  # Errors
  not_found do
    erb :error
  end
end
