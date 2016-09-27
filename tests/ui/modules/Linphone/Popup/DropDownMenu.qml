import QtQuick 2.7

import Linphone.Styles 1.0

// ===================================================================
// Low component to display a list/menu in a popup.
// ===================================================================

Rectangle {
  default property alias content: content.data
  property int entryHeight
  property int maxMenuHeight

  // Ugly. Just ugly.
  // `model` is a reference on a unknown component!
  // See usage with SearchBox.
  implicitHeight: {
    var height = model.count * entryHeight
    return height > maxMenuHeight ? maxMenuHeight : height
  }
  visible: false

  function show () {
    visible = true
  }

  function hide () {
    visible = false
  }

  Rectangle {
    id: content

    anchors.fill: parent
    color: PopupStyle.backgroundColor
    layer.enabled: true
    layer.effect: PopupShadow { }
  }
}
