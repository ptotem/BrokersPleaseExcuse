//this is the javascript code written for validations.
//in the form, give a class name required to the elements which can t be blank.


$(function () {

    $(".modal").children(".required").addClass("required-hidden");
    $(".modal").children(".required").removeClass("required");


    var submit = true;
    var presence_message = "<span class='help-inline'>This field cannot be blank</span>";
    var either_required_message = "<span class='help-inline'>One of us have to be filled in !</span>";


        $(".help-inline").remove();

        var either_status = false;
        var required_count = parseInt($(this).find(".content .row-fluid").find(".required_either").length);
        if (required_count == 0) {
            either_status = true;
        }



        $(this).find(".content .row-fluid").find(".required_either").each(function (idx, element) {

            if (element.value == "") {
                required_count = required_count - 1;

                $(element).after(either_required_message);
            }


        });




        $(this).find(".required").each(function (idx, element) {
            if (element.value == "") {

                $(element).removeClass("error");

                submit = false;
                if ($(element).attr("class") == "required chzn-done") {

                    $(element).next().append(presence_message);
                }
                else {
                    $(element).after(presence_message);

                }
                $(element).addClass("error");

            }


        });


        if (submit == false || required_count == 0) {
            alert("validation failed");

        }
        else {
            alert("validation passed");
        }
    });



    $(".modal").on('show', function () {

        $(".required").addClass("required-hidden");
        $(".required").removeClass("required");

        $(this).find(".required-hidden").addClass("required");
        $(this).find(".required-hidden").removeClass("required-hidden");


    });


    $(".modal").on('hide', function () {
        $(".required-hidden").addClass("required");
        $(".required-hidden").removeClass("required-hidden");

        $(this).find(".required").addClass("required-hidden");
        $(this).find(".required").removeClass("required");


    });














