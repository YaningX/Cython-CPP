#ifndef TIME_H
#define TIME_H

#include "date.h"

namespace Yong
{
    class Time
    {
    public:
        Time();
        std::string GetTime();
        void SetTime(const std::string &time);
        std::string GetDate();
        void SetDate(const std::string &date);

    private:
        std::string m_time;
        Date m_date;
    };
}

#endif
