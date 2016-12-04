require 'sinatra'
require 'sinatra/reloader'

result = ""

get '/' do	
	shift = params["shift"].to_i
	sentence = params["sentence"]

	if shift == 0
		result = sentence
	else
		shift = shift % 26
		sentence.bytes.each do |x|
			if x == 32 || !(x.between?(65, 90) || x.between?(97, 122))
				result << x.chr
			elsif x.between?(65, 90) && (x+shift).between?(65, 90)
				result << (x+shift).chr
			elsif x.between?(97, 122) && (x+shift).between?(97, 122)
				result << (x+shift).chr
			else
				result << ((x+shift)-26).chr
			end
		end
	end

	erb :index, :locals => {:result => result}
end