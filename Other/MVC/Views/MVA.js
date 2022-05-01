// class Model, which is the Application's Model component
class Model {
  constructor(text) {
    this.text = text
  }
  // update data in model as text processed by adapter
  setText(text) {
    this.text = text
  }
  // get data from adapter
  getText() {
    return this.text
  }
}

// class View, which is the Application's View component
class View {
  constructor() {
    this.adapter = null
  }

  registerWith(adapter) {
    this.adapter = adapter
  }

  // display text entered by user in upper case
  changeText(text) {
    this.adapter.changeText(text)
  }

  capitalizeText(text) {
    this.adapter.capitalizeText(text)
  }

  // display upper case text entered by user
  displayMessage(text) {
    console.log('The text is: ' + text)
  }
}

// class Adapter, which is the Application's Adapter component.
// We have two adapters, one which changes the text and the other that capitalizes text
class Adapter {
  constructor(view) {
    this.view = view
    this.model = null
  }
  //set value in the model to new text entered by user
  setModel(model) {
    this.model = model
  }
  //get value entered by user
  getView() {
    return this.view
  }
  //change text entered by user to lower case
  changeText(text) {
    let lower = text.toLowerCase()
    this.model.setText(lower)
    this.view.displayMessage(this.model.getText())
  }
  //change text entered by user to upper case
  capitalizeText(text) {
    let upper = text.toUpperCase()
    this.model.setText(upper)
    this.view.displayMessage(this.model.getText())
  }
}

var model = new Model('Hello world!')
var view = new View()
var adapter = new Adapter(view)
adapter.setModel(model)
view.registerWith(adapter)
adapter.getView().changeText('unoo')
adapter.getView().capitalizeText('HELLO')
