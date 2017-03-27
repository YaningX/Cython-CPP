from distutils.core import setup, Extension
from Cython.Build import cythonize


ext = Extension(
    name="ctime",
    sources=["ctime.pyx"],
    language="c++",
    include_dirs=[],
    # Link to my libtime.so in ./cpp directory.
    libraries=["time"],
    library_dirs=["cpp"],
    runtime_library_dirs=[],
    extra_compile_args=[],
    extra_link_args=[]
)

compiler_directives = {
    "show_version": True,
    "language_level": 3,
}

setup(
    ext_modules=cythonize([ext], compiler_directives=compiler_directives)
)
