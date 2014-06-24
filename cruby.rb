# Ruby > C
# http://askubuntu.com/questions/43264/how-to-open-a-pdf-file-from-terminal


File.open("c.cpp","w") do |file|

	file.print("#include <iostream>\n#include <fstream>\nusing namespace std;\nint main() {\n")
	file.print("/*int a = 0;\n\nint orig = 0xD0D0;\nint insert = 0x000B;\na = orig ^ (insert << 20);\n*/")
	file.print("int a = 0xf;\na = a << 31;")
	file.print("cout << endl << \"c: \" << hex << a << endl;\n")
	file.print("ofstream ofs;\nofs.open (\"answers.csv\", ofstream::out | ofstream::app);\nofs << hex << a;\nofs << \",\";\nofs.close();")
	file.print("\n\nreturn 0;\n}\n")

end

system("g++ c.cpp -o c")
system("./c")

puts "-------------"

#a = 0xD0D0
b = 0xF << 31
puts "ruby: #{b.to_s(16)}"
#puts (a ^ b).to_s(16)

