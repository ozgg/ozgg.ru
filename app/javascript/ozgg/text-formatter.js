const TextFormatter = {
    selector: ".js-text-formatter",
    buttons: [],
    init: function () {
        document.querySelectorAll(this.selector).forEach(this.apply);
    },
    apply: function (button) {
        const component = TextFormatter;
        component.buttons.push(button);
        button.addEventListener("click", component.handleClick);
    },
    handleClick: function (event) {
        const button = event.target;
        const textarea = button.parentNode.querySelector("textarea");
        let newValue = "";
        textarea.value.trim().split(/\r?\n/).forEach(function (line) {
            if (line[0] === "<") {
                newValue += `${line}\n`;
            } else {
                newValue += `<p>${line}</p>\n`;
            }
        });
        textarea.value = newValue;
    }
}

export default TextFormatter;
