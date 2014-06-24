fileHtml = File.new("teo.html", "w+")
fileHtml.puts "<!DOCTYPE html>

<html>

    <head lang='en'>
        <meta charset='UTF-8'></meta>
        <title></title>
                <link rel='stylesheet' type='text/css' href='style.css'>
    </head>
    <body>
        <div id='container'>
            <table>
                <tbody>
                    <tr>
                        <th colspan='4'>
                            <strong>
                               Test 1
                            </strong>
                            <tr>
                            <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
                            <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
							<td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
                            <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
	                        </tr>
	                        <tr>
	                        <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
	                        <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
                            <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>

	                            

	                        </td><td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
                            </tr>
                            <tr>
                            <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
                            <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
                            <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
                            <td>

							int orig = <br>
							int insert = <br>
							int a = orig  insert<br>
							a = ............................
	                            <br></br>
	                            <br></br>

	                            

	                            <br></br>

	                            

	                            <br></br>
	                        </td>
                            </tr>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>

</html>"
fileHtml.close()
system("start teo.html")

File.open("style.css", "w") do |file|
			file.write("
		div#container {
        	width: 100%;
        	height: 100%;
        	margin: auto;
        	position: absolute;
        	top: 0;
        	left: 0;
        	bottom: 0;
        	right: 0;
        }
    
        div#container table, th, td {
            border: 2px solid black;
            border-collapse: collapse;
        }
    
        div#container table {
            width: inherit;
            height: inherit;
        }	
		
    ")
end
