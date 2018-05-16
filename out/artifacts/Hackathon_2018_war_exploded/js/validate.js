function validateRollNumber(elem) {
    var alertRollNumber = elem.parentElement.querySelector("div");
    var rollNumber = elem.value;
    var re = /[0-9]{5}/;
    if (!rollNumber || 0 === rollNumber.length) {
        alertRollNumber.innerHTML = "Không  được để trống";
        alertRollNumber.className = "text-danger";
        return false;
    } else if (re.test(rollNumber)) {
        alertRollNumber.innerHTML = "Roll Number hợp lệ.";
        alertRollNumber.className = "text-success";
        return true;
    } else if (!re.test(rollNumber)){
        alertRollNumber.innerHTML = "Kí tự đầu tiên phải là chữ VD: D00001";
        alertRollNumber.className = "text-danger";
    }else {
        alertRollNumber.innerHTML = "Roll Number phải là 6 kí tự";
        alertRollNumber.className = "text-danger";
        return false;
    }
}

function validateFullname(elem) {
    var alertFullName = elem.parentElement.querySelector("div");
    var fullname = elem.value;
    var re = /^[a-zA-Z]+$/;
    if (!fullname || 0 === fullname.length) {
        alertFullName.innerHTML = "Tên không được để trống";
        return false;
    } else if (fullname.length < 5) {
        alertFullName.innerHTML = "Họ và Tên phải lớn hơn 5 kí tự.";
        return false;
    } else if (!re.test(fullname)) {
        alertFullName.innerHTML = "Chỉ dùng chữ cái từ A - Z. ";
        return false;
    } else {
        alertFullName.innerHTML = "Họ và tên hợp lệ.";
        return true;
    }
}


function validateEmail(elem) {
    var alertEmail = elem.parentElement.querySelector("div");
    var email = elem.value;
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!email || 0 === email.length) {
        alertEmail.innerHTML = "Địa chỉ email không được để trống";
        return false;
    } else if (re.test(email)) {
        alertEmail.innerHTML = "Email hợp lệ.";
        return true;
    } else {
        alertEmail.innerHTML = "Địa chỉ email không hợp lệ VD: abcxx@example.com";
        return false;
    }
}

function doSubmit(e) {
    e.preventDefault();
    var form = document.forms["register-form"];
    var rollNumber = form['rollNumber'];
    var address = form['address'];
    var phone = form['phone'];
    var fullName = form['fullName'];
    var email = form['email'];
    var birthday = form ['birthday'];
    var gender = form ['gender'];
    var avatar = form ['avatar'];

    if (validateRollNumber(rollNumber) && validateFullname(fullName) && validateEmail(email)){
        var registerData = {
            "data": {
                "type": "Student",
                "attributes": {
                    "birthday": new Date(birthday.value)*1,
                    "address": address.value,
                    "gender": parseInt(gender.value),
                    "phone": phone.value,
                    "rollNumber": rollNumber.value,
                    "name": fullName.value,
                    "email": email.value,
                    "avatar": avatar.value
                }
            }
        };
        var req = new XMLHttpRequest();
        req.open("POST", "https://fai-students-api.appspot.com/api/students");
        req.setRequestHeader("Content-Type", "application/json");
        req.onload = function () {
            console.log(JSON.parse(this.responseText));

        };

        req.onerror = function () {
            console.log(JSON.parse(this.responseText))
        };

        req.send(JSON.stringify(registerData))
    }


}

function doReset() {
    var emtyReset = " ";
    document.getElementById('valiUserName').innerHTML = emtyReset;
    document.getElementById('valiPassword').innerHTML = emtyReset;
    document.getElementById('valiFullname').innerHTML = emtyReset;
    document.getElementById('valiEmail').innerHTML = emtyReset;
    document.getElementById('valiAvatar').innerHTML = emtyReset;

}

var uploadImgUrl;

$(document).ready(function () {
    var url = "https://fai-students-api.appspot.com/api/upload";
    var req = new XMLHttpRequest();
    req.open("GET",url);
    req.onload = function () {
        uploadImgUrl = this.responseText;
    };
    req.onerror = function () {
        console.log(this.responseText);
    };

    req.send();

});

document.getElementById("myImg").onchange = function (ev) {
    var form = new FormData();
    form.append("myImg",ev.target.files[0]);
    var req = new XMLHttpRequest();
    req.open("POST", uploadImgUrl);
    req.onload = function () {
        document.forms["register-form"]["avatar"].value = this.responseText;
    };
    req.onerror = function () {
        console.log(this.responseText);
    };
    req.send(form);
};
