class Greeter
	attr_accessor :names
	def initialize(names = "World")
		@names = names
	end

	def say_hi
		if @names.nil?
			puts "Its nil!!!.."
		elsif @names.respond_to?("each")

			for name in @names
				puts "#{name} hi good morning"
			end

		else  
			 puts "hi #{@names},good morning"
		end
	end 

	def say_bye
		if @names.nil?
			puts "Its nil"
		elsif @names.respond_to?("join")
			puts "#{@names.join(",")},Have a good day"
		else
			puts "Hi #{@names} Have a good day"
		end
	end

end

a = Greeter.new
a.say_hi
a.say_bye

a.names = "jack"
a.say_hi
a.say_bye

a.names=["jack","jill","tom","zom"]
a.say_hi
a.say_bye

a.names = nil
a.say_hi
a.say_bye