#include "timer.h"

Timer::Timer(QObject *parent)
    : QObject{parent}
{

    connect(&m_timer,&QTimer::timeout,this,&Timer::timeout);

 //   connect(&i,&QTimer::timeout,this,&Timer::timeout);

    m_timer.setInterval(1000);

}

void Timer::timeout()
{
    m_display = QDateTime::currentDateTime().toString();
    //qInfo()<<m_display;

}
void Timer::timeout2(){

}

void Timer::start()
{
    m_timer.start();

}

void Timer::stop()
{

    m_timer.stop();

}



