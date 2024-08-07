import QtQuick

Item {
    Item {
        focus: true
        Keys.onPressed: (event)=> {
            console.log("Loaded item captured:", event.text);
            event.accepted = true;
        }
    }
}
