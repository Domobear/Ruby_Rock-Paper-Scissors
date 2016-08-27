#Module
module ShowTip
	def ShowJoined(iName)
		puts "#{@name} is joined."
	end
end

#Class
class AI
	include ShowTip
	def initialize(iName)
		@name = iName
		ShowJoined(@name)
	end

	def Play
		rand(0..2)
	end
end

class Player < AI
	def initialize(iName)
		@askInputText = "Please choose one of the following:\n(R)ock / (P)aper / (S)cissors\n"
		super(iName)
	end

	def ConverInputToInt(playerInput)
		case playerInput
		when "R"
			intInput = 0
		when "P"
			intInput = 1
		when "S"
			intInput = 2
		else
			puts "There are something wrong..."
			intInput = 0
		end
		return intInput
	end

	def Play
		begin
			puts "#{@askInputText}"
			playerInput = gets.chomp.upcase
		end while !["R", "P", "S"].include?(playerInput)

		selection = ConverInputToInt(playerInput)
		return selection
	end
end

#Member
titleText = "Welcome to Rock-paper-scissors"

titleBarText = ""
while(titleBarText.length < titleText.length)
	titleBarText += "="
end

selectionText = ["Rock", "Paper", "Scissors"]
playerChooseText = "You choose:"
aiChooseText = "AI choose:"
resultText = ["Draw!!", "You win!!", "You lose!!"]

endQuestText = "\nPlay Again?\nY / N"
endGreetingText = "Good Bye! Thanks for playing!"

#Function
def CheckResult(playerIntInput, aiIntInput)
	result = playerIntInput - aiIntInput
	if result == -2
		result = 1
	elsif result == -1
		result = 2
	elsif result > 2 || result < -2
		puts "There are something wrong..."
		result = 0
	end
	return result
end

#Main
puts "#{titleBarText}"
puts "#{titleText}"
puts "#{titleBarText}"

player = Player.new("Player 1")
ai = AI.new("Computer 1")

begin
	playerSelection = player.Play
	aiInput = ai.Play

	puts "#{playerChooseText}", "#{selectionText[playerSelection]}"
	puts "#{aiChooseText}", "#{selectionText[aiInput]}"

	result = CheckResult(playerSelection, aiInput)
	puts "#{resultText[result]}"

	#End
	begin
		puts "#{endQuestText}"
		isContinue = gets.chomp.upcase
	end while !["Y", "N"].include?(isContinue)
	puts isContinue
end while isContinue == "Y"

puts "#{endGreetingText}"