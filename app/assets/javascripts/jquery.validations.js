//this is the javascript code written for validations.
//in the form, give a class name required to the elements which can t be blank.

var submit = true;
var presence_message = "<span class='help-inline'>This field cannot be blank</span>";
var either_required_message = "<span class='help-inline either'>One of us have to be filled in !</span>";
var text_validation = true;
var text_validation_optional = true;
var select_validation = true;
var either_status = false;
var required_count = parseInt($(this).find(".content .row-fluid").find(".required_either").length);



function toggleSubmit() {

//    alert("Text== "+text_validation);
//    alert("optionsla== "+text_validation_optional);
//    alert("select== "+select_validation);

    if (text_validation && select_validation && text_validation_optional) {
        $("input[type='submit']").show();
    }
    else {
        $("input[type='submit']").hide();
    }

}


function validate_page(page) {


    $(page).find(".content .row-fluid").find(".required_either").each(function (idx, element) {

        if (element.value == "") {
            text_validation_optional=false;

            required_count = required_count - 1;

            $(element).after(either_required_message);
        }



    });


    $(page).find(".required").each(function (idx, element) {
        if (element.value == "") {


            submit = false;
            if ($(element).is("select")) {


                $(element).next().after(presence_message);
                select_validation = false;

            }
            else {
            $(element).after(presence_message);
            text_validation = false;
           // select_validation = false;

               }

        }


    });


    if (submit == false || required_count == 0) {
        $("input[type='submit']").hide();

    }
    else {
        $("input[type='submit']").show();
    }

    toggleSubmit();
}

$(function () {

    $('select').chosen();

    $(".help-inline").remove();


    $(".modal").find(".required").addClass("required-hidden");
    $(".modal").find(".required_either").addClass("required-either-hidden");
    $(".modal").find(".required").removeClass("required");
    $(".modal").find(".required_either").removeClass("required_either");

    validate_page(this);

    $(".required").live('focusout', function () {

        if (this.value.length == 0) {

            if ($(this).next().attr("class") != "help-inline") {
                $(this).after(presence_message);
                text_validation = false;
            }

        }
        else {
            $(this).next().remove();
            text_validation = true;


        }
        toggleSubmit();

    });


    $(".required_either").live('focusout', function () {

        if (this.value.length == 0) {

            if ($(this).next().attr("class") != "help-inline") {
                $(".required_either").after(presence_message);
                text_validation_optional = false;
            }

        }
        else {
            $(".required_either").next().remove();
            text_validation_optional = true;


        }
        toggleSubmit();

    });



    $("select").live('change', function () {

        if (this.value < 1) {

            if ($(this).next().last().attr("class") != "help-inline") {
                $(this).next().append(presence_message);
                select_validation = false;
            }

        }
        else {
            $(this).next().next(".help-inline").remove();
            select_validation = true;

        }
        toggleSubmit();

    });


    $(".modal").on('show', function () {

        select_validation = true;
        text_validation = true;
        text_validation_optional= true;
        $(".required").addClass("required-hidden");
        $(".required").removeClass("required");

        $(this).find(".required-hidden").addClass("required");
        $(this).find(".required-hidden").removeClass("required-hidden");

        $(this).find(".required-either-hidden").addClass("required_either");
        $(this).find(".required-either-hidden").removeClass("required-either-hidden");
        validate_page(this);


    });


    $(".modal").on('hide', function () {
        $(".required-hidden").addClass("required");
        $(".required-hidden").removeClass("required-hidden");
        select_validation = true;
        text_validation = true;
        text_validation_optional= true;

        $(this).find(".required").addClass("required-hidden");
        $(this).find(".required").removeClass("required");


    });



});


















