# Importing my dumb C++ class Yong::Time. Internally we are going to call it CppTime
# in order to avoid name conflict with our Cython Time class.
from decl cimport Time as CppTime


cdef class Time:
    """
    Cython wrapper class for C++ CppTime class. This class looks and
    feels like a normal Python class to external Python code.
    """

    # ptr to C++ instance.
    cdef CppTime *_thisptr

    # Allocates and initializes C-level data.
    # Called before __init__().
    def __cinit__(Time self):
        self._thisptr = new CppTime()

    def __init__(Time self):
        pass

    # Deallocates C-level resources. Called when gc'd.
    def __dealloc__(Time self):
        if self._thisptr != NULL:
            del self._thisptr

    cdef int _check_alive(Time self) except -1:
        # Because of the Python's context manager protocol, the C++
        # object might die before Time self is reclaimed.
        # We therefore need a small utility to check for the
        # availability of self._thisptr
        if self._thisptr == NULL:
            raise RuntimeError("Time: Wrapped C++ object is deleted")
        else:
            return 0

    def __enter__(Time self):
        self._check_alive()
        return self

    def __exit__(Time self, exc_tp, exc_val, exc_tb):
        if self._thisptr != NULL:
            del self._thisptr
            self._thisptr = NULL
        return False

    def get_time(Time self):
        self._check_alive()
        return bytes.decode(self._thisptr.GetTime().c_str())

    def set_time(Time self, new_time):
        self._check_alive()
        self._thisptr.SetTime(str.encode(new_time))

    def get_date(Time self):
        self._check_alive()
        return bytes.decode(self._thisptr.GetDate().c_str())

    def set_date(Time self, new_date):
        self._check_alive()
        self._thisptr.SetDate(str.encode(new_date))