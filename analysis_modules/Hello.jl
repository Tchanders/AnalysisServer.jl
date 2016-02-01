module Hello

export hello

function hello(data, params)
	if haskey(params, "name")
		str = params["name"]
	else
		str = ""
	end
	return "Hello $str\n"
end

end
