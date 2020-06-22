//////אקורדיון////////////////////


$(document).ready(function () {
    var acc = document.getElementsByClassName("accordion");
    var i;
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            console.log("test");
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    };

    $(".dordor").click(function () {
        $("#theimg").attr('src', this.src);
        $("#blackwithimg").css("display", "block")

    });

    $("#blackwithimg").click(function () {
        $("#blackwithimg").css("display", "none")
    });

});

var acc = document.getElementsByClassName("accordion");
function expand() {
    for (i = 0; i < acc.length; i++) {
        acc[i].classList.add("active");
        var panel = acc[i].nextElementSibling;
        panel.style.display = "block";
    }
}

function Shrink() {
    for (i = 0; i < acc.length; i++) {
        acc[i].classList.remove("active");
        var panel = acc[i].nextElementSibling;
        panel.style.display = "none";
    }
}



////////////בדיקה כפולה של מחיקה//////////////

// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function showmodel(event) {
    event.parentElement.children[1].style.display = 'block';
}

function hidemodel(event) {
    event.parentElement.parentElement.parentElement.parentElement.style.display = "none";
}



//פעולה שמתרחשת בלחיצה על התמונה הראשונה ופותחת את חלון בחירת התמונה הראשונה
function openFileUploader1() {
    $('#FileUpload1').click();
}
function openFileUploader2() {
    $('#FileUpload2').click();
}
function openFileUploader3() {
    $('#FileUpload3').click();
}
function openFileUploader4() {
    $('#FileUpload4').click();
}
function openFileUploader5() {
    $('#FileUpload5').click();
}
function openFileUploader6() {
    $('#FileUpload6').click();
}
function openFileUploader7() {
    $('#FileUpload7').click();
}
function openFileUploader8() {
    $('#FileUpload8').click();
}


$(document).ready(function () {

    //לאחר שלחצנו על התמונה שרצינו לבחור - תמונה מספר אחד
    $("#FileUpload1").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#ImageforUpload1').attr('src', e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        }
        document.getElementById('IButton1').style.display = "inline-block"
    });




    //לאחר שלחצנו על התמונה שרצינו לבחור - תמונה מספר שתיים
    $("#FileUpload2").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#ImageforUpload2').attr('src', e.target.result);
            }

            reader.readAsDataURL(this.files[0]);
        }
        document.getElementById("ATextBox1").disabled = true;
        document.getElementById('IButton2').style.display = "inline-block"
    });

    $("#FileUpload3").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#ImageforUpload3').attr('src', e.target.result);
            }

            reader.readAsDataURL(this.files[0]);
        }
        document.getElementById("ATextBox2").disabled = true;
        document.getElementById('IButton3').style.display = "inline-block"


    });


    $("#FileUpload4").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#ImageforUpload4').attr('src', e.target.result);
            }

            reader.readAsDataURL(this.files[0]);
        }
        document.getElementById("ATextBox3").disabled = true;
        document.getElementById('IButton4').style.display = "inline-block"
    });


    $("#FileUpload5").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#ImageforUpload5').attr('src', e.target.result);
            }

            reader.readAsDataURL(this.files[0]);
        }
        document.getElementById("ATextBox4").disabled = true;
        document.getElementById('IButton5').style.display = "inline-block"


    });

    $("#FileUpload6").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#ImageforUpload6').attr('src', e.target.result);
            }

            reader.readAsDataURL(this.files[0]);
        }
        document.getElementById("ATextBox5").disabled = true;
        document.getElementById('IButton6').style.display = "inline-block"

    });


    $("#FileUpload7").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#ImageforUpload7').attr('src', e.target.result);
            }

            reader.readAsDataURL(this.files[0]);
        }
        document.getElementById("ATextBox6").disabled = true;
        document.getElementById('IButton7').style.display = "inline-block"

    });

    $("#FileUpload8").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#ImageforUpload8').attr('src', e.target.result);
            }

            reader.readAsDataURL(this.files[0]);
        }
        document.getElementById("ATextBox7").disabled = true;
        document.getElementById('IButton8').style.display = "inline-block"

    });

});

//function deletephoto7() {
//    $('#IButton7').css("display", "none");
//    $('#FileUpload7').val('');
//    $('#ImageforUpload7').attr('src', '/Images/ImagePlaceholder.png');
//    document.getElementById("ATextBox6").disabled = false
//    var hdnfldVariable = document.getElementById('hdnfldVariable7');
//    hdnfldVariable.value = false;
//}



$(document).ready(function () {

    $(".del").click(function () {
        var curr = this.id;
        var curNum = parseInt(curr.substring(7, 8));
        var curNum1 = curNum - 1;
        document.getElementById('ImageforUpload' + curNum).src = '/Images/ImagePlaceholder.png';
        document.getElementById('ATextBox' + curNum1).disabled = false
        document.getElementById('IButton' + curNum).style.display = "none"
        var hdnfldVariable = document.getElementById('hdnfldVariable' + curNum);
        hdnfldVariable.value = false;

        $('#FileUpload' + curNum).val('');
    });

    $(".notdel").click(function () {
        document.getElementById('ImageforUpload1').src = '/Images/ImagePlaceholder.png';
        document.getElementById('IButton1').style.display = "none"
        var hdnfldVariable = document.getElementById('hdnfldVariable1');
        hdnfldVariable.value = false;

        $('#FileUpload1').val('');
    });


    $(".del").show(function () {
        var curr = this.id;
        var curNum = parseInt(curr.substring(7, 8));
        var sssrc = document.getElementById('ImageforUpload' + curNum).src
        if (sssrc.includes("ImagePlaceholder.png")) {
        document.getElementById('IButton' + curNum).style.display = "none"
        }
    });

    $(".notdel").show(function () {
        var sssrc = document.getElementById('ImageforUpload1').src
        if (sssrc.includes("ImagePlaceholder.png")) {
        document.getElementById('IButton1').style.display = "none"
        }
    });


    $("#ATextBox1").focusout(function () {
        if ($("#ATextBox1").val().length !=0) {
        $("#ImageforUpload2").prop("disabled", true);
        $("#ImageforUpload2").css("opacity", "0.5")
        $("#ImageforUpload2").CssClass = "ImageButtongrid";
        } else {
            $("#ImageforUpload2").prop("disabled", false);
            $("#ImageforUpload2").css("opacity", "1");
        }
    });
    $("#ATextBox2").focusout(function () {
        if ($("#ATextBox2").val().length != 0) {
            $("#ImageforUpload3").prop("disabled", true);
            $("#ImageforUpload3").css("opacity", "0.5");
            $("#ImageforUpload3").CssClass = "ImageButtongrid";
        }
        else {
            $("#ImageforUpload3").prop("disabled", false);
            $("#ImageforUpload3").css("opacity", "1");
        }
    }); $("#ATextBox3").focusout(function () {
        if ($("#ATextBox3").val().length != 0) {
            $("#ImageforUpload4").prop("disabled", true);
            $("#ImageforUpload4").css("opacity", "0.5")
            $("#ImageforUpload4").CssClass = "ImageButtongrid";
        } else {
            $("#ImageforUpload4").prop("disabled", false);
            $("#ImageforUpload4").css("opacity", "1");
        }
    }); $("#ATextBox4").focusout(function () {
        if ($("#ATextBox4").val().length != 0) {
            $("#ImageforUpload5").prop("disabled", true);
            $("#ImageforUpload5").css("opacity", "0.5")
            $("#ImageforUpload5").CssClass = "ImageButtongrid";
        } else {
            $("#ImageforUpload5").prop("disabled", false);
            $("#ImageforUpload5").css("opacity", "1");
        }
    }); $("#ATextBox5").focusout(function () {
        if ($("#ATextBox5").val().length != 0) {
            $("#ImageforUpload6").prop("disabled", true);
            $("#ImageforUpload6").css("opacity", "0.5")
            $("#ImageforUpload6").CssClass = "ImageButtongrid";
        } else {
            $("#ImageforUpload6").prop("disabled", false);
            $("#ImageforUpload6").css("opacity", "1");
        }
    }); $("#ATextBox6").focusout(function () {
        if ($("#ATextBox6").val().length !=0) {
            $("#ImageforUpload7").prop("disabled", true);
            $("#ImageforUpload7").css("opacity", "0.5")
            $("#ImageforUpload7").CssClass = "ImageButtongrid";
        } else {
            $("#ImageforUpload7").prop("disabled", false);
            $("#ImageforUpload7").css("opacity", "1");
        }
    }); $("#ATextBox7").focusout(function () {
        if ($("#ATextBox7").val().length != 0) {
            $("#ImageforUpload8").prop("disabled", true);
            $("#ImageforUpload8").css("opacity", "0.5")
            $("#ImageforUpload8").CssClass = "ImageButtongrid";
        } else {
            $("#ImageforUpload8").prop("disabled", false);
            $("#ImageforUpload8").css("opacity", "1");
        }
    });
});
