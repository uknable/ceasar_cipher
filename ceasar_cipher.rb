require 'sinatra'

get '/' do
	result = ""
	shift = params["shift"].to_i
	sentence = params["sentence"]

	if shift == 0
		result = sentence
	else
		shift = shift % 26
		sentence.bytes.each do |x|
			if x == 32 || !(x.between?(65, 90) || x.between?(97, 122))
				result << x.chr
			elsif x.between?(65, 90) && (x+int).between?(65, 90)
				result << (x+int).chr
			elsif x.between?(97, 122) && (x+int).between?(97, 122)
				result << (x+int).chr
			else
				result << ((x+int)-26).chr
			end
		end
	end
	
	erb :index, :locals => {:result => result}
end