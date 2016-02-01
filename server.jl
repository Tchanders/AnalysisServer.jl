# Server for aiding multiple custom analyses of a dataset

using HttpServer

# Load the data into memory
include("data.jl")

# Import the analysis functions
include("analyses.jl")

function doAnalysis(res)
	# Format the parameters in the querystring
	urlParams = HttpServer.parsequerystring(split(res, '?')[2])
	
	println(string("Doing analysis: ", urlParams["analysis"]))

	# Pick the specified analysis function
	analysis = ANALYSES[urlParams["analysis"]]

	# Pass in the parameters as an array
	analysis(DATA, urlParams)
end

http = HttpHandler() do req::Request, res::Response
	if ismatch(r"^/analysis",req.resource)
		Response(string(doAnalysis(req.resource)))
	else
		Response(404)
	end
end

server = Server( http )
run( server, 8001 )
