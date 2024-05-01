# Autogenerated wrapper script for Expat_jll for aarch64-apple-darwin
export libexpat, xmlwf

JLLWrappers.@generate_wrapper_header("Expat")
JLLWrappers.@declare_library_product(libexpat, "@rpath/libexpat.1.dylib")
JLLWrappers.@declare_executable_product(xmlwf)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libexpat,
        "lib/libexpat.1.9.2.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        xmlwf,
        "bin/xmlwf",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
