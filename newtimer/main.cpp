#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "timer.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Timer t1;

    engine.rootContext()->setContextProperty("testing",&t1);

    const QUrl url(u"qrc:/newtimer/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
