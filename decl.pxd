"""
Expose Time class from time.h.
This is a C++ class and can only be used by other Cython code. In order to use this class from
normal Python code, we need to wrap it with Cython and compile it to a Python extension module.
Notice that we are not declaring the private member m_time here because we will never
directly reference it from Python. We only need to declare what we will use. Look at it as
a forward declaration in C or C++.
"""

from libcpp.string cimport string as std_string

cdef extern from "cpp/time.h" namespace "Yong":
    cppclass Time:
        std_string GetTime()
        void SetTime(std_string)
        std_string GetDate()
        void SetDate(std_string)