class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views' 
        enable :sessions 
        set :session_secret, "sinatra"
    end 

    helpers do 

        def logged_in? 
            !!current_user
        end 

        def current_user
            @current_user ||= User.find_by(:id => session[:id]) if session[:id]
        end 

        def login(email, password)
            user = User.find_by(:email => email) 
            if user && user.authenticate(password)
                session[:id] = user.id
            else 
                redirect '/login' 
            end 
        end 

        def ensure_logged_in 
            unless logged_in? 
                flash[:error] = "You must be logged in to view this page." 
                redirect "/login" 
            end 
        end 

        def logout! 
            session.clear  
        end 


    end

    get '/' do 
        erb :'sessions/login.html'
    end 

end 