#Member
titleText = "Welcome to Rock-paper-scissors"

count = 0
titleBarText = ""
while(count < titleText.length)
	count += 1
	titleBarText += "="
end

greetingText = "Please choose one of the following:\n(R)ock / (P)aper / (S)cissors\n\n"

selectionText = ["Rock", "Paper", "Scissors"]
playerChooseText = "You choose:"
aiChooseText = "AI choose:"
resultText = ["Draw!!", "You win!!", "You lose!!"]

endQuestText = "\nPlay Again?\nY / N"
endGreetingText = "Good Bye! Thanks for playing!"

#Function
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

begin
	#Start
	begin
		puts "#{greetingText}"
		playerInput = gets.chomp.upcase
	end while !["R", "P", "S"].include?(playerInput)

	#Core
	playerIntInput = ConverInputToInt(playerInput)
	aiInput = rand(0..2)

	puts "#{playerChooseText}", "#{selectionText[playerIntInput]}"
	puts "#{aiChooseText}", "#{selectionText[aiInput]}"

	result = CheckResult(intInput, aiInput)
	puts "#{resultText[result]}"

	#End
	begin
		puts "#{endQuestText}"
		isContinue = gets.chomp.upcase
	end while !["Y", "N"].include?(isContinue)
	puts isContinue
end while isContinue == "Y"

puts "#{endGreetingText}"