document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("button").addEventListener("click", submit);
    const canvas = document.querySelector('canvas')
    canvas.addEventListener('click', function (e) {
        handleCanvasClick(canvas, e)
    })
});

let submit = function (e) {
    let y = document.getElementById("Y_field").value.trim();

    if (y.length >= 12)
        y = y.substr(0, 12);

    let x = document.getElementById("X_field").value;

    if (x != null) {
        if (x.length >= 12)
            x = x.substr(0, 12);
    }

    let r = null;
    let radios = document.querySelectorAll('input[name="R_field"]');

    for (let radio of radios) {
        if (radio.checked)
            r = radio.value.trim();
    }

    if (r != null && r.length >= 12)
        r = r.substr(0, 12);

    if (!check(x, y, r))
        e.preventDefault();
}

function check(x, y, r) {
    if (x == null || x.length === 0) {
        alert("Вы не выбрали X");
        return false;
    }

    if (r == null) {
        alert("Вы не выбрали R");
        return false;
    }

    let names = new Map()
    names.set(x, "X")
    names.set(y, "Y")
    names.set(r, "R")
    for (let it of names.keys()) {
        let name = names.get(it)
        if (it.trim() === "") {
            displayError(`You must select the ${name}!`);
            return false;
        }
        if (!isFinite(it.replace(',', '.'))) {
            displayError(`${name} must be a number!`);
            return false;
        }
    }

    if (y.toString().replace(',', '.') > 3 || y.toString().replace(',', '.') < -5) {
        displayError("Y must be in range [-5; 3]");
        return false;
    }
    if (x.toString().replace(',', '.') >= 3 || x.toString().replace(',', '.') <= -3) {
        displayError("X must be in range (-3; 3)");
        return false;
    }
    if (r.toString().replace(',', '.') > 5 || r.toString().replace(',', '.') < 1) {
        displayError("R must be in range [1; 5]");
        return false;
    }
    return true
}

function displayError(msg) {
    let err = document.getElementById("err_msg")
    err.innerText = msg
    err.hidden = false
    setTimeout(() => {
        err.hidden = true
    }, 3000)
}