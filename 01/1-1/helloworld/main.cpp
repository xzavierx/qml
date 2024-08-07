#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    const QUrl url(u"qrc:/helloworld/main.qml"_qs);
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);


    // 以上代码可以略写为：
    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/helloworld/main.qml"));

   //如果不想使用资源文件，也可以使用本地相对路径
   //engine.load(QUrl::fromLocalFile("../helloworld/main.qml"));


    return app.exec();
}


