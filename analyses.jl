push!(LOAD_PATH, "./analysis_modules")

importall Hello # For testing
# Add custom analysis modules to import

const ANALYSES = Dict()

ANALYSES["hello"] = hello # For testing
# Add custom analysis functions to ANALYSES
