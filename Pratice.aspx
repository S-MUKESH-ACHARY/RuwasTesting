<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pratice.aspx.cs" Inherits="RUWAS.Pratice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
     <style>
        div a{
             
            color:gray;
            
        }
        
      .card-body{
          border-end-end-radius:5px 5px; border-end-start-radius:5px 5px
      }
      
        div a:hover{
         color:#336699;
         text-decoration:none;
         font-weight:700;
         cursor:pointer;
        }

        
        
        label,th,td{
            font-size:14px;
            
        }
   
        
    </style>
</head>
<body>
        <section class="container-fluid">
            <div class="container p-5" id="dataEntry">
                <div class=" justify-content-center">

                    <div class="row">
                        <div class="col-lg-3 col-2"></div>
                        <div class="col-lg-3 col-2" onclick="location.href='ProgressReportDWSCG.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS Assets/ProgressReportDWSCG.png" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 12px;">Progress Report DWSCG</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-2" onclick="location.href='ProgressReportDSHCG.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS Assets/ProgressReportDSHCG.jpeg" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 12px;">Progress Report DSHCG</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-2" onclick="location.href='QuarterlyAttachments.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS Assets/quarterlyAttachments.jpeg" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 12px;">Quarterly Attachments</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-2" onclick="location.href='AnnualAttachments.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS Assets/annualAttachments.jpeg" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 12px;">Annual Attachments</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-2" onclick="location.href='Contracts.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS Assets/contracts.png" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 12px;">Contracts</div>
                            </div>

                        </div>
                    </div>

                    <div class="row pt-2">
                         <div class=" col-lg-3 col-2"></div>
                        <div class="col-lg-3 col-2" onclick="location.href='SanitationAnnualWorkPlanDSHCG.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS%20Assets/sanitationWorkPlan.png" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-2 text-light text-center" style="background-color: #0059b3; font-size: 8px;">Sanitation Annual Work Plan DSHCG</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-2" onclick="location.href='AnnualWorkplanDWSCG.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS%20Assets/annualWorkplan.png" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 12px;">Annual Workplan DWSCG</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-2 " onclick="location.href='ApplyForVariations.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS%20Assets/applyForVariations.png" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-1 text-light text-center" style="background-color: #0059b3; font-size: 12px;">Apply for Variations</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-2" onclick="location.href='DistrictPerformanceReportsDSHCG.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS%20Assets/districtPerformanceDSHCG.jpg" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-2 text-light text-center" style="background-color: #0059b3; font-size: 8px;">District Performance Reports DSHCG</div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-2" onclick="location.href='DistrictPerformanceReportsDWSCG.aspx'">

                            <div class="card">
                                <div class="card-header text-center p-2">
                                    <img src="RUWAS%20Assets/districtPerformanceDWSCG.jpg" style="width: 7rem; height: 5rem;" />
                                </div>
                                <div class="card-body p-2 text-light text-center" style="background-color: #0059b3; font-size: 8px;">District Performance Reports DWSCG</div>
                            </div>

                        </div>
                    </div>



                </div>

            </div>
       
    </section>
</body>
</html>
