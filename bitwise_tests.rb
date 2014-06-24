require "prawn"
require "csv"
require "./questions_and_answers.rb"

difficulty = ARGV[0]
count = ARGV[1].to_i
puts "Difficulty: " + (difficulty == '0' ? "easy" : "hard") + "\n"
puts "Number of tests: #{count}\n"

count.times do |i|

	q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12 = ""

	Prawn::Document.generate("test" + (difficulty == '0' ? "_easy" : "_hard") + "_#{i+1}.pdf") do
		text "Bitwise Operations Test ", :style => :bold, :align => :center
		move_down 20
		
		q1 = question_type_1(difficulty)
		q2 = question_type_1(difficulty)
		q3 = question_type_2(difficulty)
		q4 = question_type_2(difficulty)
		q5 = question_type_4(difficulty)
		q6 = question_type_4(difficulty)
		q7 = question_type_5(difficulty)
		q8 = question_type_5(difficulty)	
		q9 = question_type_3(difficulty)
		q10 = question_type_6(difficulty)
		q11 = question_type_7(difficulty,0)
		q12 = question_type_7(difficulty,1)

		table([ [q1[0],q2[0]], [q3[0],q4[0]], [q5[0],q6[0]], [q7[0],q8[0]], [q9[0],q10[0]], [q11[0],q12[0]] ])
	end

	Prawn::Document.generate("test" + (difficulty == '0' ? "_easy" : "_hard") + "_#{i+1}_answers.pdf") do
	 	text "Bitwise Operations Test - Answers ", :style => :bold, :align => :center
	 	move_down 20

		q1 = get_answers_type_1(q1)
		q2 = get_answers_type_1(q2)
		q3 = get_answers_type_2(q3)
		q4 = get_answers_type_2(q4)
		q5 = get_answers_type_4(q5)
		q6 = get_answers_type_4(q6)
		q7 = get_answers_type_5(q7)
		q8 = get_answers_type_5(q8)	
		q9 = get_answers_type_3(q9)
		q10 = get_answers_type_6(q10)
		q11 = get_answers_type_7_0(q11)
		q12 = get_answers_type_7_1(q12)
	
		table([ [q1,q2], [q3,q4], [q5,q6], [q7,q8], [q9,q10], [q11,q12] ])
	end

end

system("rm c.cpp c")

#puts 0xF0F0.to_s(16)

#a = 'F0F0'
#puts a
#puts a.to_i(16).to_s(10)

#c = Array.new(10,1)
#if c.inject {|sum, n| sum + n } == 10 then puts "\nbreak\n" end

#a = 0xF0F0
#b = 0x0D0D << 36
#a = a ^ b
#as = a.to_s(16)
#s = ""
#if as.size > 8 
#	as.reverse 
#end
#i = 0
#while as.size > 8 do
#	#s << as[(8-as.size).abs + i]
#	i++
#end
#puts s 

