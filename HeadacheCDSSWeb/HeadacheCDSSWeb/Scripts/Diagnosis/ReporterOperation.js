 $(function () {  
        var OCX = document.getElementById('Reporter2');
        try {
            OCX.OpenReport("D:\\CDSSOCX");
        }
        catch (err) {
            var b = confirm("是否下载显示控件");
            if (b) {
                var strOCXURL;
            strOCXURL= "http://"+location.host+"/LNCDCDSS/CDSSOCX.exe";
            
            window.location.href = strOCXURL;
            }
        }
        OCX.ShowReport();
        OCX.ShowThisPage("基本情况");
       })