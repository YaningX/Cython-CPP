#include <string>
#include "time.h"
#include "date.h"

using namespace Yong;

Time::Time()
    : m_time("00:00:00")
{
}

std::string Time::GetTime()
{
    return m_time;
}

void Time::SetTime(const std::string &time)
{
    m_time = time;
}

std::string Time::GetDate()
{
    return std::to_string(m_date.GetLongDate());
}

void Time::SetDate(const std::string &date)
{
    long longdate = std::stol(date);
    m_date.SetLongDate(longdate);
}