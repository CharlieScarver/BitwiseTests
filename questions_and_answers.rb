require "csv"

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
			shift = rand(32)
		end while shift == 0 || shift % 4 == 0
	end

	r = rand(3)
	op = case r 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end


	q = "a = ?\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig #{op} (insert << #{shift});"
	
	return [q,[orig,insert,shift,op]]
	
end


def get_answers_type_1 params = Array.new

	if params[0].nil? then return nil; end

	#puts params

	orig = params[1][0]
	insert = params[1][1]
	shift = params[1][2]
	op = params[1][3]

	File.open("c.cpp","w") do |file|

		file.print("#include <iostream>\nusing namespace std;\nint main() {\n\n")
		file.print("int a = 0;\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\na = orig #{op} (insert << #{shift});\n")
		file.print("cout << hex << a;\n")
		file.print("\n\nreturn 0;\n}\n")

	end

	system("g++ c.cpp -o c")
	ans = `./c`
	
	q = "a = ?\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig #{op} (insert << #{shift});\n---------\na = 0x#{ans.upcase}\n"
		
end

# ----------------------------

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
			shift1 = rand(32)
		end while shift1 == 0 || shift1 % 4 == 0

		begin
			shift2 = rand(32)
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
	
	q = "#{name} = ?\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig | (insert << #{shift1});\nint b = orig | (insert << #{shift2});\nint #{name} = a #{op} b;\n"

	return [q,[orig,insert,shift1,shift2,op,name]]

end


def get_answers_type_2 params = Array.new

	if params[0].nil? then return nil; end

	#puts params

	orig = params[1][0]
	insert = params[1][1]
	shift1 = params[1][2]
	shift2 = params[1][3]
	op = params[1][4]
	name = params[1][5]


	File.open("c.cpp","w") do |file|

		file.print("#include <iostream>\nusing namespace std;\nint main() {\n\n")
		file.print("int orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig | (insert << #{shift1});\nint b = orig | (insert << #{shift2});\nint res = a #{op} b;\n")
		file.print("cout << hex << res;\n")
		file.print("\n\nreturn 0;\n}\n")

	end

	system("g++ c.cpp -o c")
	ans = `./c`
	
	q = "#{name} = ?\n\nint orig = 0x#{orig};\nint insert = 0x#{insert};\nint a = orig | (insert << #{shift1})\nint b = orig | (insert << #{shift2})\nint #{name} = a #{op} b;\n---------\n#{name} = 0x#{ans.upcase}\n"
		
end

# ------------------------------

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
			shift = rand(32)
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

	q = "#{name} = ?\n\nint i = 0x#{i};\nint #{name} = i #{op} (1 << #{shift});\n"

	return [q,[name,i,op,shift]]

end


def get_answers_type_3 params = Array.new

	if params[0].nil? then return nil; end

	#puts params

	name = params[1][0]
	i = params[1][1]
	op = params[1][2]
	shift = params[1][3]

	File.open("c.cpp","w") do |file|

		file.print("#include <iostream>\nusing namespace std;\nint main() {\n\n")
		file.print("int i = 0x#{i};\nint res = i #{op} (1 << #{shift});\n")
		file.print("cout << hex << res;\n")
		file.print("\n\nreturn 0;\n}\n")

	end

	system("g++ c.cpp -o c")
	ans = `./c`
	
	q = "#{name} = ?\n\nint i = 0x#{i};\nint #{name} = i #{op} (1 << #{shift});\n---------\n#{name} = 0x#{ans.upcase}\n"
		
end

# ---------------------------

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
			shift1 = rand(32)
		end while shift1 == 0 || shift1 % 4 == 0

		begin
			shift2 = rand(32)
		end while shift2 == 0 || shift2 % 4 == 0 || shift2 == shift1
	end

	op = case rand(3) 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	q = "result = ?\n\nlong value1 = 0x#{value1};\nlong value2 = 0x#{value2};\nint result = (value1 << #{shift1}) ^ (value2 >> #{shift2});\n"

	return [q,[value1,value2,shift1,shift2,op]]

end


def get_answers_type_4 params = Array.new

	if params[0].nil? then return nil; end

	#puts params

	value1 = params[1][0]
	value2 = params[1][1]
	shift1 = params[1][2]
	shift2 = params[1][3]
	op = params[1][4]

	File.open("c.cpp","w") do |file|

		file.print("#include <iostream>\nusing namespace std;\nint main() {\n\n")
		file.print("long value1 = 0x#{value1};\nlong value2 = 0x#{value2};\nint res = (value1 << #{shift1}) #{op} (value2 >> #{shift2});\n")
		file.print("cout << hex << res;\n")
		file.print("\n\nreturn 0;\n}\n")

	end

	system("g++ c.cpp -o c")
	ans = `./c`
	
	q = "result = ?\n\nlong value1 = 0x#{value1};\nlong value2 = 0x#{value2};\nint result = (value1 << #{shift1}) #{op} (value2 >> #{shift2});\n---------\nresult = 0x#{ans.upcase}\n"
		
end

# -------------------------

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
			shift1 = rand(32)
		end while shift1 == 0 || shift1 % 4 == 0

		begin
			shift2 = rand(32)
		end while shift2 == 0 || shift2 % 4 == 0 || shift2 == shift1
	end

	op = case rand(3) 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	q = "result = ?\n\nlong value1 = #{value1};\nlong value2 = #{value2};\nint result = (value1 << #{shift1}) #{op} (value2 >> #{shift2});\n"

	return [q,[value1,value2,shift1,shift2,op]]

end


def get_answers_type_5 params = Array.new

	if params[0].nil? then return nil; end

	#puts params

	value1 = params[1][0]
	value2 = params[1][1]
	shift1 = params[1][2]
	shift2 = params[1][3]
	op = params[1][4]

	File.open("c.cpp","w") do |file|

		file.print("#include <iostream>\nusing namespace std;\nint main() {\n\n")
		file.print("long value1 = 0x#{value1.to_s(16)};\nlong value2 = 0x#{value2.to_s(16)};\nint res = (value1 << #{shift1}) #{op} (value2 >> #{shift2});\n")
		file.print("cout << hex << res;\n")
		file.print("\n\nreturn 0;\n}\n")

	end

	system("g++ c.cpp -o c")
	ans = `./c`
	
	q = "result = ?\n\nlong value1 = #{value1};\nlong value2 = #{value2};\nint result = (value1 << #{shift1}) #{op} (value2 >> #{shift2});\n---------\nresult = 0x#{ans.upcase}\n"
		
end

# -------------------------

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
			shift = rand(32)
		end while shift == 0 || shift % 4 == 0

	end

	op = case rand(3) 
		when 0 then "&"
		when 1 then "|"
		when 2 then "^"
	end

	q = "a = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif (testValue & (1 << #{shift}))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n"

	return [q,[value,shift]]

end


def get_answers_type_6 params = Array.new

	if params[0].nil? then return nil; end

	#puts params

	value = params[1][0]
	shift = params[1][1]


	File.open("c.cpp","w") do |file|

		file.print("#include <iostream>\nusing namespace std;\nint main() {\n\n")
		file.print("long testValue = 0x#{value};\nint a = 0;\nif (testValue & (1 << #{shift})) {\n\ta = 1;\n}\nelse {\n\ta = 2;\n}\n")
		file.print("cout << a;\n")
		file.print("\n\nreturn 0;\n}\n")

	end

	system("g++ c.cpp -o c")
	ans = `./c`
	
	q = "a = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif (testValue & (1 << #{shift}))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n---------\na = #{ans}\n"
		
end

# --------------------------

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
			shift = rand(32)
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

	#q = case type
	#	when 0 then "a = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif (testValue #{op1} testValue #{op2} (1 << #{shift}))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n"
	#	when 1 then "a = ?, result = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif ((result = testValue #{op1} testValue #{op2} testValue\n #{op3} (1 << #{shift})))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n"
	#end

	if type == 0 

		q = "a = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif (testValue #{op1} testValue #{op2} (1 << #{shift}))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n"
		return [q,[value,op1,op2,shift]]

	elsif type == 1

		q = "a = ?, result = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif ((result = testValue #{op1} testValue #{op2} testValue\n #{op3} (1 << #{shift})))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n"
		return [q,[value,op1,op2,op3,shift]]

	end

end


def get_answers_type_7_0 params = Array.new

	if params[0].nil? then return nil; end

	#puts params

	value = params[1][0]
	op1 = params[1][1]
	op2 = params[1][2]
	shift = params[1][3]

	File.open("c.cpp","w") do |file|

		file.print("#include <iostream>\nusing namespace std;\nint main() {\n\n")
		file.print("long testValue = 0x#{value};\nint a = 0;\nif (testValue #{op1} testValue #{op2} (1 << #{shift})) {\n\ta = 1;\n} else {\n\ta = 2;\n}\n")
		file.print("cout << a;\n")
		file.print("\n\nreturn 0;\n}\n")

	end

	system("g++ c.cpp -o c")
	ans = `./c`
	
	q = "a = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif (testValue #{op1} testValue #{op2} (1 << #{shift}))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n---------\na = #{ans}\n"
		
end


def get_answers_type_7_1 params = Array.new

	if params[0].nil? then return nil; end

	#puts params

	value = params[1][0]
	op1 = params[1][1]
	op2 = params[1][2]
	op3 = params[1][3]
	shift = params[1][4]

	File.open("c.cpp","w") do |file|

		file.print("#include <iostream>\nusing namespace std;\nint main() {\n\n")
		file.print("long testValue = 0x#{value};\nint a = 0;\nint result = testValue #{op1} testValue #{op2} testValue #{op3} (1 << #{shift});\nif (result) {\n\ta = 1;\n}\nelse {\n\ta = 2;\n}\n")
		file.print("cout << a << \";\" << result;\n")
		file.print("\n\nreturn 0;\n}\n")

	end

	system("g++ c.cpp -o c")
	ans = `./c`.split(";")[0..1]
	
	q = "a = ?, result = ?\n\nlong testValue = 0x#{value};\nint a = 0;\nif ((result = testValue #{op1} testValue #{op2} testValue\n #{op3} (1 << #{shift})))\n{\n\ta = 1;\n}\nelse\n{\n\ta = 2;\n}\n---------\na = #{ans[0]}, result = 0x#{ans[1].to_i(10).to_s(16).upcase}\n"
		
end