#ifndef TIMER_H
#define TIMER_H
#include <QTimer>
#include <QDateTime>
#include <QObject>

class Timer : public QObject
{
    Q_OBJECT
public:
    explicit Timer(QObject *parent = nullptr);



signals:
    void currentTime(QVariant data);

private slots:
    void timeout();
    void timeout2();


public slots:
    void start();
    void stop();

private:

    QTimer m_timer;
    QString m_display;



};

#endif // TIMER_H
