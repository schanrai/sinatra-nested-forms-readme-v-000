require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :new
  end

  post '/student' do
    @student = Student.new(params[:student])      #first create a new Student using the info stored in params[:student],
                                                  #which contains the student's name, grade, and courses
    params[:student][:courses].each do |details|  #we iterate over params[:student][:courses], an array containing a series of hashes 
                                                  #that each store individual course information:
      Course.new(details)                         #Use course values passed into the .each block to create instances of our Course class.
    end
      @courses = Course.all                        #store the instantiated courses in the instance variable @courses
    erb :student                                  #controller action loads the erb file student.erb, displays newly-created student and course
  end

end
