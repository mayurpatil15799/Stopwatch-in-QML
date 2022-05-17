import QtQuick
import QtQuick.Controls 6.2

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property int i:0;
    property int j:0;
    property int count:0;
    property int a:0;
    property int b:0;
    property int c:0;
    property int d:0;
    property int e:0;
    property int f:0;
    property int flag: 0;
    property int x:0;
    property int y:0;
    property int z:0;
    property int m:2;
    property int n:0;

    Image {
        id: name
        x: 0
        y: 0
        source: "qrc:/stopwatch.png"
        height: parent.height
        width: parent.width

        Text {
            id: text1
            x: 216
            y: 93
            width: 180
            height: 58
            text: qsTr("Stopwatch")
            font.pixelSize: 35
        }

        Rectangle {
            anchors.centerIn: parent
            id: rectangle
            x: 220
            y: 272
            width:11
            height:0

            anchors.verticalCenterOffset: 1
            anchors.horizontalCenterOffset: 1

            Timer{
                id: timer1
                interval: 1000
                repeat: true
                running: false
                onTriggered: {
                    i++;
                    if(i%60==0)
                    {
                        count++;
                        i=0;
                    }
                }
            }
            Row{
                width: 188
                height: 69
                anchors.centerIn: parent
                spacing: 4
                anchors.left: parent.left
                anchors.leftMargin: 241
                anchors.top: parent.top
                anchors.verticalCenterOffset: -75
                anchors.horizontalCenterOffset: 7
                anchors.topMargin:  -7
                Label{
                    id: minute
                    font.pixelSize: 45
                    font.bold: true
                    text:count
                }
                Text {
                    id: colon
                    text: qsTr(":")
                    font.bold : true
                    font.pixelSize: 40
                }
                Label {
                    id: label
                    font.pixelSize: 45
                    font.bold: true
                    text: i
                }
                Text {
                    id: dot
                    text: qsTr(".")
                    font.bold : true
                    font.pixelSize: 40
                }
                Label {
                    id: label2
                    text: j
                    font.pixelSize: 45
                    font.bold: true
                }
            }
            Timer{
                id: timer2
                interval: 1
                repeat: true
                running: false

                onTriggered: {
                    j++;
                    if(j%100==0)
                    {
                        j=0;
                    }
                }
            }
            Row {

                id: row
                x: -7
                y: -47
                width: 114
                height: 39
                Button {
                    id: button1
                    width: 58
                    height: 24
                    Text {
                        anchors.centerIn: parent
                        id: rst
                        text: "Test"
                    }
                    anchors.verticalCenter: button.verticalCenter
                    anchors.top: button.top
                    anchors.bottom: button.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {

                        color: parent.down ? "yellow" :
                                             (parent.hovered ?  "red":"yellow" )

                    }
                    onClicked: {
                        onClicked: {
                            if(rst.text === "Reset")
                            {
                                if(i!=0 || j!=0 || count!=0)
                                {
                                    count=0;
                                    i=0;
                                    j=0;
                                    nameModel.clear()
                                    nameModel2.clear()
                                }
                            }
                            else if(rst.text === "Count")
                            {
                                nameModel.append({"minutes":count,"seconds":i,"micro":j})
                                if(flag===0)
                                {
                                    a=count;
                                    b=i;
                                    c=j;
                                    nameModel2.append({"minutes2":a,"seconds2":b,"micro2":c})
                                    flag=1;
                                }
                                else if(flag===1)
                                {
                                    d=count;
                                    e=i;
                                    f=j;
                                    nameModel2.append({"minutes2":d-a,"seconds2":e-b,"micro2":f-c})
                                    flag++;
                                }
                                else if(flag>1)
                                {
                                    if(m===flag)
                                    {
                                        n=m-1;
                                        a=count;
                                        b=i;
                                        c=j;
                                        m++;
                                    }
                                    if(flag===n)
                                    {
                                        d=count;
                                        e=i;
                                        f=j;

                                    }
                                    nameModel2.append({"minutes2":d-a,"seconds2":e-b,"micro2":f-c})

                                 }


                                }

                            }
                        }
                    }
                }
                Button {
                    id: button
                    x: -62
                    y: -47
                    background: Rectangle {
                        color: parent.down ? "yellow" :
                                             (parent.hovered ?  "red":"yellow" )
                    }
                    width: 57
                    height: 24
                    text: "start"
                    anchors.bottom: button1.bottom
                    onClicked: {
                        if(text === "start")
                        {
                            timer1.start()
                            timer2.start()
                            text = "stop"
                            rst.text = "Count"
                        }
                        else
                        {
                            timer1.stop()
                            timer2.stop()
                            text="start"
                            if(rst.text === "Count")
                            {
                                rst.text="Reset"
                            }
                        }
                    }
                }
            }
        }



    Rectangle{
        id: lapdisplay
        x: 216
        y: 230
        width: 100; height: 88; color: "white"
        Image {
            id: im
            source: "qrc:/blue.png"
            height: parent.height
            width: parent.width
        }

        ListModel{
            id: nameModel
        }
        Component{
            id: nameDelegate
            Text {
                text:model.minutes+":"+ model.seconds+"."+model.micro
                font.pixelSize: 15
            }
        }
        ListView{
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            model: nameModel
            delegate: nameDelegate

        }
    }
    Rectangle{
        id: durationdisplay
        x: 315
        y: 230
        width: 100; height: 88; color: "white"
        Image {
            id: im2
            source: "qrc:/blue.png"
            height: parent.height
            width: parent.width
        }

        ListModel{
            id: nameModel2
        }
        Component{
            id: nameDelegate2
            Text {
                text:model.minutes2+":"+ model.seconds2+"."+model.micro2
                font.pixelSize: 15
            }
        }
        ListView{
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            model: nameModel2
            delegate: nameDelegate2
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}D{i:2}D{i:4}D{i:6}D{i:7}D{i:8}D{i:9}D{i:10}D{i:5}D{i:11}
D{i:14}D{i:13}D{i:12}D{i:16}D{i:3}D{i:1}D{i:19}D{i:20}D{i:21}D{i:23}D{i:18}D{i:25}
D{i:26}D{i:27}D{i:29}D{i:24}
}
##^##*/

