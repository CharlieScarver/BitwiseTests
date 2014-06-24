require "prawn"

def question_type_1 diff

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

	op = case rand(3) 
		when 0 then op = "&"
		when 1 then op = "|"
		when 2 then op = "^"
	end
	
	q1 = "a = ?\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig #{op} (insert << #{shift});"

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
		when 0 then op = "&"
		when 1 then op = "|"
		when 2 then op = "^"
	end

	name = case rand(3) 
		when 0 then name = "AND"
		when 1 then name = "OR"
		when 2 then name = "XOR"
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
		when 0 then op = "&"
		when 1 then op = "|"
		when 2 then op = "^"
	end

	name = case rand(3) 
		when 0 then name = "left"
		when 1 then name = "right"
		when 2 then name = "cupcake"
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

		value1 = a + '0' + a + '0' + b + '0' + b + '0' 
		value2 = a + '0' + '0' + a + b + '0' + '0' + b

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
		when 0 then op = "&"
		when 1 then op = "|"
		when 2 then op = "^"
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
		when 0 then op = "&"
		when 1 then op = "|"
		when 2 then op = "^"
	end

	q5 = "result = ?\n\nlong value1 = #{value1};\nlong value2 = #{value2};\nint result = (value1 << #{shift1}) ^ (value2 >> #{shift2});\n"

end

def question_type_6 diff


end


#q = ;

=begin

=end

difficulty = ARGV[0]
count = ARGV[1].to_i
puts "Difficulty: " + (difficulty == '0' ? "easy" : "hard") + "\n"
puts "Number of tests: #{count}\n"

count.times do |i|

	Prawn::Document.generate("test" + (difficulty == '0' ? "_easy" : "_hard") + "_#{i}.pdf") do
	  text "Bitwise Operations Test ", :style => :bold, :align => :center
	  move_down 20

	  table([[question_type_1(difficulty),question_type_1(difficulty)],[question_type_2(difficulty),question_type_2(difficulty)],[question_type_2(difficulty),question_type_3(difficulty)],[question_type_4(difficulty),question_type_5(difficulty)],[question_type_5(difficulty),question_type_5(difficulty)]])
	end

end
#puts 0xF0F0.to_s(16)
#a = 'F0F0'
#puts a
#puts a.to_i(16).to_s(10)


