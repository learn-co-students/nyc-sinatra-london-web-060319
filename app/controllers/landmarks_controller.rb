class LandmarksController < ApplicationController
  # add controller methods

  # index
  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :"landmarks/index"
  end

  # new
  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  # create
  post '/landmarks' do
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect "/landmarks"
  end

  # show
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  # edit
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  # edit
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end


end
