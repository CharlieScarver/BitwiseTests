require "prawn"
require "csv"

def question_type_1 diff, write_answers

	ins = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];

	if diff == '0'
		begin
			a = ins.sample
		end while a == '0'
		orig = a + '0' + a + '0'

		begin
			a = ins.sample
		end while a == '0'
		insert = '000' + a

		begin
			shift = rand(16)
		end while shift == 0 || shift % 4 != 0

	else
		orig = ins.sample + ins.sample + ins.sample + ins.sample

		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'
		insert = '00' + a + b

		begin
			shift = rand(16)
		end while shift == 0 || shift % 4 == 0
	end

	r = rand(3)
	op = case r 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	if write_answers == 1 
		
		File.open("c.cpp","w") do |file|

			file.print("#include <iostream>\nusing namespace std;\nint main() {\n")
			file.print("int a = 0;\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\na = orig #{op} (insert << #{shift});\n")
			file.print("cout << hex << a;\n")
			file.print("\n\nreturn 0;\n}\n")

		end

		system("g++ c.cpp -o c")
		ans = `./c`
		
		q1 = "a = ?\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig #{op} (insert << #{shift});\n---------\na = 0x#{ans.upcase}\n"
		
	else
		q1 = "a = ?\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig #{op} (insert << #{shift});"
	end
	
	return q1
	
end

def question_type_2 diff

	ins = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];

	if diff == '0'
		begin
			a = ins.sample
		end while a == '0'
		orig = a + '0' + a + '0'

		begin
			a = ins.sample
		end while a == '0'
		insert = '000' + a

		begin
			shift1 = rand(16)
		end while shift1 == 0 || shift1 % 4 != 0

		begin
			shift2 = rand(16)
		end while shift2 == 0 || shift2 % 4 != 0 || shift2 == shift1

	else
		orig = ins.sample + ins.sample + ins.sample + ins.sample

		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'
		insert = '00' + a + b
	
		begin
			shift1 = rand(16)
		end while shift1 == 0 || shift1 % 4 == 0

		begin
			shift2 = rand(16)
		end while shift2 == 0 || shift2 % 4 == 0 || shift2 == shift1

	end

	op = case rand(3) 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	name = case rand(3) 
		when 0 then "AND"
		when 1 then "OR"
		when 2 then "XOR"
	end
	
	q2 = "#{name} = ?\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig | (insert << #{shift1})\nint b = orig | (insert << #{shift2})\nint #{name} = a #{op} b;\n"

end

def question_type_3 diff

	ins = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];

	if diff == '0'
		begin
			a = ins.sample
		end while a == '0'
		i = a + '0' + a + '0'

		begin
			a = ins.sample
		end while a == '0'
		insert = '000' + a

		begin
			shift = rand(16)
		end while shift == 0 || shift % 4 != 0

	else
		i = ins.sample + ins.sample + ins.sample + ins.sample

		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'
		insert = '00' + a + b

		begin
			shift = rand(16)
		end while shift == 0 || shift % 4 == 0
	end

	op = case rand(3) 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	name = case rand(3) 
		when 0 then "left"
		when 1 then "right"
		when 2 then "cupcake"
	end

	q3 = "#{name} = ?\n\nint i = 0x#{i};\nint #{name} = i #{op} (1 << #{shift});\n"

end

def question_type_4 diff

	ins = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];

	if diff == '0'
		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'

		fr = rand(3)
		value1 = case fr
			when 0 then a + '0' + a + '0' + b + '0' + b + '0' 
			when 1 then a + '0' + '0' + a + b + '0' + '0' + b
			when 2 then a + a + '0' + '0' + b + b + '0' + '0'
		end

		begin sr = rand(3) end while sr == fr

		value2 = case sr
			when 0 then a + '0' + a + '0' + b + '0' + b + '0' 
			when 1 then a + '0' + '0' + a + b + '0' + '0' + b
			when 2 then a + a + '0' + '0' + b + b + '0' + '0'
		end

		begin a = ins.sample end while a == '0'
		insert = '000' + a

		begin
			shift1 = rand(16)
		end while shift1 == 0 || shift1 % 4 != 0

		begin
			shift2 = rand(16)
		end while shift2 == 0 || shift2 % 4 != 0 || shift2 == shift1

	else
		value1 = ins.sample + ins.sample + ins.sample + ins.sample + ins.sample + ins.sample + ins.sample + ins.sample
		value2 = ins.sample + ins.sample + ins.sample + ins.sample + ins.sample + ins.sample + ins.sample + ins.sample

		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'
		insert = '00' + a + b

		begin
			shift1 = rand(16)
		end while shift1 == 0 || shift1 % 4 == 0

		begin
			shift2 = rand(16)
		end while shift2 == 0 || shift2 % 4 == 0 || shift2 == shift1
	end

	op = case rand(3) 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	q4 = "result = ?\n\nlong value1 = 0x#{value1};\nlong value2 = 0x#{value2};\nint result = (value1 << #{shift1}) ^ (value2 >> #{shift2});\n"

end

def question_type_5 diff

	ins = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];

	if diff == '0'
		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'

		value1 = rand(1025) 
		begin
			value2 = rand(1025)
		end while value2 == value1 || (value1 - value2).abs <= 100

		begin
			a = ins.sample
		end while a == '0'
		insert = '000' + a

		begin
			shift1 = rand(16)
		end while shift1 == 0 || shift1 % 4 != 0

		begin
			shift2 = rand(16)
		end while shift2 == 0 || shift2 % 4 != 0 || shift2 == shift1

	else
		value1 = rand(16385) 
		begin
			value2 = rand(16385)
		end while value2 == value1 || (value1 - value2).abs <= 100

		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'
		insert = '00' + a + b

		begin
			shift1 = rand(16)
		end while shift1 == 0 || shift1 % 4 == 0

		begin
			shift2 = rand(16)
		end while shift2 == 0 || shift2 % 4 == 0 || shift2 == shift1
	end

	op = case rand(3) 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	q5 = "result = ?\n\nlong value1 = #{value1};\nlong value2 = #{value2};\nint result = (value1 << #{shift1}) ^ (value2 >> #{shift2});\n"

end

def question_type_6 diff

	ins = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];

	if diff == '0'
		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'

		value = case rand(3)
			when 0 then a + '0' + a + '0' + b + '0' + b + '0' 
			when 1 then a + '0' + '0' + a + b + '0' + '0' + b
			when 2 then a + a + '0' + '0' + b + b + '0' + '0'
		end

		begin
			shift = rand(16)
		end while shift == 0 || shift % 4 != 0

	else
		value = case rand(3)
			when 0 then ins.sample + '0' + ins.sample + '0' + ins.sample + '0' + ins.sample + '0' 
			when 1 then ins.sample + '0' + '0' + ins.sample + ins.sample + '0' + '0' + ins.sample
			when 2 then ins.sample + ins.sample + '0' + '0' + ins.sample + ins.sample + '0' + '0'
		end

		begin
			shift = rand(16)
		end while shift == 0 || shift % 4 == 0

	end

	op = case rand(3) 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	q6 = "a = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif (testValue & (1 << #{shift}))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n"

end

def question_type_7 diff, type

	ins = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];

	if diff == '0'
		begin
			a = ins.sample
		end while a == '0'

		begin
			b = ins.sample
		end while b == '0'

		value = case rand(3)
			when 0 then a + '0' + a + '0' + b + '0' + b + '0' 
			when 1 then a + '0' + '0' + a + b + '0' + '0' + b
			when 2 then a + a + '0' + '0' + b + b + '0' + '0'
		end

		begin
			shift = rand(16)
		end while shift == 0 || shift % 4 != 0

	else
		value = case rand(3)
			when 0 then ins.sample + '0' + ins.sample + '0' + ins.sample + '0' + ins.sample + '0' 
			when 1 then ins.sample + '0' + '0' + ins.sample + ins.sample + '0' + '0' + ins.sample
			when 2 then ins.sample + ins.sample + '0' + '0' + ins.sample + ins.sample + '0' + '0'
		end

		begin
			shift = rand(16)
		end while shift == 0 || shift % 4 == 0

	end

	fr = rand(3)
	op1 = case fr 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	begin sr = rand(3) end while sr == fr

	op2 = case sr 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	begin tr = rand(3) end while tr == sr || tr == fr

	op3 = case tr 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	q7 = case type
		when 0 then "a = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif (testValue #{op1} testValue #{op2} (1 << #{shift}))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n"
		when 1 then "a = ?, result = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif ((result = testValue #{op1} testValue #{op2} testValue\n #{op3} (1 << #{shift})))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n"
	end

end


difficulty = ARGV[0]
count = ARGV[1].to_i
puts "Difficulty: " + (difficulty == '0' ? "easy" : "hard") + "\n"
puts "Number of tests: #{count}\n"

count.times do |i|

#	counter = Array.new(7, 0)
#	ques = Array.new(12,"")
#
#	while true do
#		r = rand(7)
#		if counter[r] < 2
#			ques << case r + 1
#				when 1 then question_type_1(difficulty)
#				when 2 then question_type_2(difficulty)
#				when 3 then question_type_3(difficulty)
#				when 4 then question_type_4(difficulty)
#				when 5 then question_type_5(difficulty)
#				when 6 then question_type_6(difficulty)
#				when 7 then question_type_7(difficulty)
#			end
#			counter[r] += 1
#		end
#		
#		if counter.inject {|sum, n| sum + n } == 12 then break end
#
#	end

	Prawn::Document.generate("test" + (difficulty == '0' ? "_easy" : "_hard") + "_#{i+1}.pdf") do
	  text "Bitwise Operations Test ", :style => :bold, :align => :center
	  move_down 20

	  table([ [question_type_1(difficulty,0),question_type_1(difficulty,0)],  [question_type_2(difficulty),question_type_2(difficulty)], [question_type_4(difficulty),question_type_4(difficulty)], [question_type_5(difficulty),question_type_5(difficulty)], [question_type_3(difficulty),question_type_6(difficulty)],  [question_type_7(difficulty,0),question_type_7(difficulty,1)] ])
	end

	Prawn::Document.generate("test" + (difficulty == '0' ? "_easy" : "_hard") + "_#{i+1}_answers.pdf") do
	  text "Bitwise Operations Test - Answers ", :style => :bold, :align => :center
	  move_down 20

	  table([ [question_type_1(difficulty,1),question_type_1(difficulty,1)],  [question_type_2(difficulty),question_type_2(difficulty)], [question_type_4(difficulty),question_type_4(difficulty)], [question_type_5(difficulty),question_type_5(difficulty)], [question_type_3(difficulty),question_type_6(difficulty)],  [question_type_7(difficulty,0),question_type_7(difficulty,1)] ])
	end

end


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

