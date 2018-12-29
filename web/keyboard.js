const keyboardDidShow = new CustomEvent('keyboardDidShow', {detail: {keyboardHeight: 666}});
const keyboardDidHide = new Event('keyboardDidHide');
const keyboardWillHide = new Event('keyboardWillHide');
const keyboardWillShow = new Event('keyboardWillShow');

window.Keyboard = {
  isVisible: false,
  hideFormAccessoryBar: (hide, callback) => {
    callback(hide);
  },
  hide: ()=> {
    window.dispatchEvent(keyboardWillHide);
    this.isVisible = false;
    setTimeout(() => {
      window.dispatchEvent(keyboardDidHide);
    }, 250);
  },
  show: ()=> {
    window.dispatchEvent(keyboardWillShow);
    this.isVisible = true;
    setTimeout(() => {
      window.dispatchEvent(keyboardDidShow);
    }, 250);
  }
}