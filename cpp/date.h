#ifndef DATE_H
#define DATE_H

class Date
{
public:
    Date()
        : m_longdate(19000101)
    {}

    Date(long longdate)
        : m_longdate(longdate)
    {}

    long GetLongDate();
    void SetLongDate(long date);

private:
    long m_longdate;
};

#endif
