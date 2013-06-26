﻿$(function () {
    var OCX = document.getElementById('Reporter2');
    try {
        OCX.OpenReport("D:\\CDSSOCX");
    }
    catch (err) {
        var b = confirm("是否下载显示控件");
        if (b) {
            var strOCXURL;
            strOCXURL = "http://" + location.host + "/LNCDCDSS/CDSSOCX.exe";

            window.location.href = strOCXURL;
        }
    }




    OCX.ShowReport();
    OCX.ShowThisPage("基本筛查");

    $("#btn2").hide();
    $("#btn2").click(function () {
        $(".selected").last().removeClass("selected");
        var name = $(".selected").last().attr("id");
        $(".active").prev().addClass("active");
        $(".active").last().removeClass("active");
        OCX.ShowReport();

        if (name == "头痛问诊") {
            name == "头痛概述";
            $("#direct").hide();
            $("#Reporter2").css("height", "500");
            $(".on").removeClass("on");
            $(".nav-tabs li:lt(1) ").addClass("on");
            $("#submenu").show();
        }
        if (name == "基本筛查") {
            $("#btn2").hide();
            $("#submenu").hide();
            $("#Reporter2").css("height", "540");
            $("#direct").show();
        }
        if (name == "医嘱处置") {
            $("#btn1").html("下一步");
            deleteprint();
        }
        OCX.ShowThisPage(name);
    });


});