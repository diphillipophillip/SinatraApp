class LogsController < ApplicationController 


    get '/logs' do 
        @logs = current_user.logs 
        erb :'logs/index.html'  
        #displaying the users workout types and dates 
        #provide a link to view and individual log
    end 

    post '/logs' do 
        @log = current_user.logs.create(log_params) 
        if @log.valid? 
            redirect '/logs' 
        else 
            erb :'logs/new.html'
        end 
           
    end 

    get '/logs/new' do 
        if !logged_in?
            redirect 'login' 
        else 
            erb :'logs/new.html' 
        end 
    end 

    get '/logs/:id' do 
        if @log = Log.find_by(id: params[:id]) 
            erb :"logs/show.html" 
        else 
            flash[:error] = "Couldnt find that post" 
            redirect '/logs' 
        end 
    end 

    get '/logs/:id/edit' do 
        @log = Log.find_by(id: params[:id]) 
        if !logged_in? 
            redirect '/login' 
        else
            erb :"logs/edit.html"
        end 
    end

    patch '/logs/:id' do 
        @log = Log.find_by(id: params[:id])
        @log.workout_type = params[:workout_type]
        @log.date = params[:date]
        @log.reps = params[:reps] 
        @log.sets = params[:sets] 
        @log.weight = params[:weight] 
        @log.time = params[:time]
        @log.distance = params[:distance]
        @log.notes = params[:notes]
        @log.save
        redirect to "/logs/#{@log.id}"
    end 

    delete '/logs/:id' do 
        @log = Log.find_by(id: params[:id]) 
        @log.delete 
        redirect '/logs' 
    end 


    def log_params 
        params.select do |k, v| 
            ["workout_type", "reps", "sets", "weight", "time", "distance", "notes", "date"].include?(k) 
        end 
    end 




end 
