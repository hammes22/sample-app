class ApplicationController < ActionController::Base
    def hello
    render html: "ola mundo " 
    end
end
