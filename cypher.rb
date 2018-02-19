require 'sinatra'
require 'sinatra/reloader' #Comment out before deployment

get '/' do
  string = params["word"] unless params.nil?
  shift = params["shift"] unless params.nil?
  result = caesar_cypher(string,shift)
  erb :index, locals: {result: result}
end


def caesar_cypher(string, shift)
  low_case = ('a'..'z').to_a
  up_case = ('A'..'Z').to_a
  string = string.to_s
  shift = shift.to_i
  string = string.split('')
  result = []
  string.each do |letter|
    if low_case.include?(letter)
      new_index = low_case.index(letter) + shift
      if(new_index>25)
        new_index -= 26

      end
      result.push(low_case[new_index])
    else if up_case.include?(letter)
           new_index = up_case.index(letter) + shift
           if(new_index>25)
             new_index -= 26

           end

           result.push(up_case[new_index])
         else
           result.push(letter)

         end
    end
  end
  result.join('')
end
