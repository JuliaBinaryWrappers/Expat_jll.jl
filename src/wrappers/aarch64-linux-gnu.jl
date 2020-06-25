# Autogenerated wrapper script for Expat_jll for aarch64-linux-gnu
export libexpat, xmlwf

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libexpat`
const libexpat_splitpath = ["lib", "libexpat.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libexpat_path = ""

# libexpat-specific global declaration
# This will be filled out by __init__()
libexpat_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libexpat = "libexpat.so.1"


# Relative path to `xmlwf`
const xmlwf_splitpath = ["bin", "xmlwf"]

# This will be filled out by __init__() for all products, as it must be done at runtime
xmlwf_path = ""

# xmlwf-specific global declaration
function xmlwf(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(xmlwf_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Expat")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libexpat_path = normpath(joinpath(artifact_dir, libexpat_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libexpat_handle = dlopen(libexpat_path)
    push!(LIBPATH_list, dirname(libexpat_path))

    global xmlwf_path = normpath(joinpath(artifact_dir, xmlwf_splitpath...))

    push!(PATH_list, dirname(xmlwf_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

