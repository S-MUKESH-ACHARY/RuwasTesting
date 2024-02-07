using Npgsql;
using RUWAS.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services.Description;
using System.Web.SessionState;


public class RuwasHandler : IHttpHandler, IRequiresSessionState
{
    RuwasDB ruwasdb = new RuwasDB();
    public bool IsReusable
    {
        get { return true; }
    }
    class GetJsonData
    {
        public string op { get; set; }
    }
    public static string GetJson(object obj)
    {
        JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
        jsonSerializer.MaxJsonLength = 2147483647;
        return jsonSerializer.Serialize(obj);
    }

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            string operation = context.Request["Op"];
            switch (operation)
            {
                case "SaveNewBudgetType":
                    SaveNewBudgetType(context);
                    break;
                case "FetchUnder":
                    FetchUnder(context);
                    break;
                case "BudgetTypeOfUnder":
                    FetchBudgetTypeOfUnder(context);
                    break;
                case "SaveRWSRC":
                    SaveRWSRC(context);
                    break;
                case "SaveFundingSource":
                    SaveFundingSource(context);
                    break;
                case "SaveFinancialYear":
                    SaveFinancialYear(context);
                    break;
                case "FetchFinancialYear":
                    FetchFinancialYear(context);
                    break;
                case "SaveWorkplanPeriod":
                    SaveWorkplanPeriod(context);
                    break;
                case "SaveTechnology":
                    SaveTechnology(context);
                    break;
                //case "LoadTeachnology":
                //    FetchTeachnology(context);
                //    break;
                case "SaveSubTechnology":
                    SaveSubTechnology(context);
                    break;
                case "ContractTableData":
                    ContractTableData(context);
                    break;
                case "FetchLcTable":
                    FetchLcTable(context);
                    break;
                case "LoadParish":
                    FetchParish(context);
                    break;
                case "FetchLC":
                    FetchLC(context);
                    break;
                case "SaveApplyVariation":
                    SaveApplyVariationMethod(context);
                    break;
                case "ModelActivityTable":
                    ModelActivityTable(context);
                    break;
                case "DistrictsTableData":
                    FetchDistrictsTableData(context);
                    break;
                case "CategoryData":
                    FetchCategoryTable(context);
                    break;
                case "FetchTeachnologyTable":
                    FetchTeachnologyTable(context);
                    break;
                case "FetchSubCountyTableData":
                    FetchSubCountyTableData(context);
                    break;
                case "FetchLCOfRWSRC":
                    FetchLCOfRWSRC(context);
                    break;
                //case "FinancialYrTableData":
                //    FetchFinancialYrTableData(context);
                //    break;
                case "FetchRWSRCTableData":
                    FetchRWSRCTableData(context);
                    break;
                case "FetchFundingSourceTable":
                    FetchFundingSourceTable(context);
                    break;
                case "FetchWorkPlanPeriodTable":
                    FetchWorkPlanPeriodTable(context);
                    break;
                case "FetchEventLogTable":
                    FetchEventLogTable(context);
                    break;
                case "FetchWorkplanAuditTrailTable":
                    FetchWorkplanAuditTrailTable(context);
                    break;
                case "FetchDistrict":
                    FetchDistrict(context);
                    break;
                case "FetchSubCountyOfDistrict":
                    FetchSubCountyOfDistrict(context);
                    break;
                //case "FetchRWSRC":
                //    FetchRWSRC(context);
                //    break;
                case "FetchParishOfSubcounty":
                    FetchParishOfSubcounty(context);
                    break;
                case "SaveLC":
                    SaveLC(context);
                    break;
                case "SaveParish":
                    SaveParish(context);
                    break;
                case "SaveSubCounty":
                    SaveSubCounty(context);
                    break;
                case "SaveDistricts":
                    SaveDistricts(context);
                    break;
                case "SavePlannedFund":
                    SavePlannedFund(context);
                    break;
                case "PlannedFundsPerDistrictsTableData":
                    FetchPlannedFundsPerDistrictsTableData(context);
                    break;
                case "FetchQuarterlyAttachmentData":
                    FetchQuarterlyAttachmentData(context);
                    break;
                case "CategoryOfBudgetType":
                    FetchCategoryOfBudgetType(context);
                    break;
                case "VillageOfParish":
                    FetchVillageOfParish(context);
                    break;
                case "FundingSourceInformation":
                    FetchFundingSourceInformation(context);
                    break;
                case "FetchBudgetTypeTable":
                    FetchBudgetTypeTable(context);
                    break;
                case "PlannedFunds":
                    FetchPlannedFunds(context);
                    break;
                case "UnderOfCategory":
                    FetchUnderOfCategory(context);
                    break;
                //case "FetchModelActivityOfWorkplan":
                //    FetchModelActivityOfWorkplan(context);
                //    break;
                //case "FetchModelActivityOfSanitation":
                //    FetchModelActivityOfSanitation(context);
                //break;
                case "UpdateModelActivity":
                    UpdateModelActivity(context);
                    break;
                case "UpdateCategories":
                    UpdateCategories(context);
                    break;
                case "FetchPReportDWSCG":
                    FetchPReportDWSCG(context);
                    break;
                case "FetchPReportDSHCG":
                    FetchPReportDSHCG(context);
                    break;
                case "UpdateBudgetType":
                    UpdateBudgetType(context);
                    break;
                case "UpdateTeachnology":
                    UpdateTeachnology(context);
                    break;
                case "ModelActivityNumber":
                    ModelActivityNumber(context);
                    break;
                case "GetWorkplanIdOfSanitations":
                    GetWorkplanIdOfSanitations(context);
                    break;
                case "GetWorkplanIdOfWorkplans":
                    GetWorkplanIdOfWorkplans(context);
                    break;
                case "FundsRecivedDWSCG":
                    FundsRecivedDWSCG(context);
                    break;
                case "FundsRecivedDSHCG":
                    FundsRecivedDSHCG(context);
                    break;
                case "UpdateFinancialYr":
                    UpdateFinancialYr(context);
                    break;
                case "UpdateFundingSource":
                    UpdateFundingSource(context);
                    break;
                case "UpdateDistrict":
                    UpdateDistrict(context);
                    break;
                case "FetchCStatus":
                    FetchCStatus(context);
                    break;
                case "UpdateContract":
                    UpdateContract(context);
                    break;
                default:
                    var jsonString = String.Empty;
                    context.Request.InputStream.Position = 0;
                    using (var inputStream = new StreamReader(context.Request.InputStream))
                    {
                        jsonString = HttpUtility.UrlDecode(inputStream.ReadToEnd());
                    }
                    if (jsonString != "")
                    {
                        var js = new JavaScriptSerializer();
                        // var title1 = context.Request.Params[1];
                        GetJsonData obj = js.Deserialize<GetJsonData>(jsonString);
                        switch (obj.op)
                        {
                            case "SaveCategories":
                                SaveCategories(jsonString, context);
                                break;
                            case "SaveContracts":
                                SaveContracts(jsonString, context);
                                break;
                            case "SaveModelActivity":
                                SaveModelActivity(jsonString, context);
                                break;
                            case "SaveAnnualAttachments":
                                SaveAnnualAttachments(jsonString, context);
                                break;
                            case "SaveAnnualWorkplanDWSCG":
                                SaveAnnualWorkplanDWSCG(jsonString, context);
                                break;
                            case "SaveAnnualWorkplanDSHCG":
                                SaveAnnualWorkplanDSHCG(jsonString, context);
                                break;
                            case "UpdateAnnualWorkplanDWSCG":
                                UpdateAnnualWorkplanDWSCG(jsonString, context);
                                break;
                            case "UpdatePRDWSCG":
                                UpdatePRDWSCG(jsonString, context);
                                break;
                            case "UpdatePRDSHCG":
                                UpdatePRDSHCG(jsonString, context);
                                break;
                        }
                    }
                    else
                    {
                        var js = new JavaScriptSerializer();
                        var title1 = context.Request.Params[1];
                        GetJsonData obj = js.Deserialize<GetJsonData>(title1);
                        switch (obj.op)
                        {


                        }
                    }
                    break;
            }
        }
        catch
        {

        }
    }
    public void SaveNewBudgetType(HttpContext context)
    {
        try
        {
            string BudgetType = context.Request["txtBudgetType"].ToString();
            int Under = Convert.ToInt32(context.Request["slctUnder"]);
            NpgsqlCommand cmd = new NpgsqlCommand("Insert into \"budgetTypes\"(\"budgetTypeName\",\"budgetUnderId\") values(@BudgetType,@Under)");
            cmd.Parameters.AddWithValue("@BudgetType", BudgetType);
            cmd.Parameters.AddWithValue("@Under", Under);
            ruwasdb.Insert(cmd);
            string msg = "Saved Successfully";
            string response = GetJson(msg);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string sms = ex.Message;
            string response = GetJson(sms);
            context.Response.Write(response);
        }
    }
    public class FetchUnderClass
    {
        public int budgetId { get; set; }
        public string under { get; set; }
    }


    public void FetchUnder(HttpContext context)
    {
        try
        {
            List<FetchUnderClass> listarr = new List<FetchUnderClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"underId\",\"underName\" from \"unders\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchUnderClass arr = new FetchUnderClass();
                    arr.budgetId = Convert.ToInt32(dr["underId"]);
                    arr.under = dr["underName"].ToString();
                    listarr.Add(arr);
                }
                string response = GetJson(listarr);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }

    }
    public class BudgetTypeOfUnder
    {
        public int BudgetTypeId { get; set; }
        public string BudgetTypeName { get; set; }
    }
    public void FetchBudgetTypeOfUnder(HttpContext context)
    {
        try
        {
            int slctUnder = Convert.ToInt32(context.Request["slctUnder"]);
            List<BudgetTypeOfUnder> listarr = new List<BudgetTypeOfUnder>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"budgetTypeId\",\"budgetTypeName\" from \"budgetTypes\" where \"budgetUnderId\"=@slctUnder");
            cmd.Parameters.AddWithValue("slctUnder", @slctUnder);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    BudgetTypeOfUnder arr = new BudgetTypeOfUnder();
                    arr.BudgetTypeId = Convert.ToInt32(dr["budgetTypeId"]);
                    arr.BudgetTypeName = dr["budgetTypeName"].ToString();
                    listarr.Add(arr);
                }
                string response = GetJson(listarr);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class Categories
    {
        public string slctUnder { get; set; }
        public int slctBudgetType { get; set; }
        public List<SlctCategoryDetail> CategoryDetailList { get; set; }
    }
    public class SlctCategoryDetail
    {
        public int OrderId { get; set; }
        public string CategoryNameId { get; set; }
        public string CategoriesDtlId { get; set; }
    }

    public void SaveCategories(string jsonString, HttpContext context)
    {
        try
        {

            var js = new JavaScriptSerializer();
            Categories obj = js.Deserialize<Categories>(jsonString);
            string slctUnder = obj.slctUnder;
            int slctBudgetType = obj.slctBudgetType;
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"categories\" (\"under\",\"budgetTypeId\") values(@slctUnder,@slctBudgetType) returning \"categoryId\"");
            cmd.Parameters.AddWithValue("@slctUnder", slctUnder);
            cmd.Parameters.AddWithValue("@slctBudgetType", slctBudgetType);
            DataSet ds = ruwasdb.Insert_Return(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int categoryId = Convert.ToInt32(dr["categoryId"]);
                    foreach (SlctCategoryDetail x in obj.CategoryDetailList)
                    {
                        int OrderId = x.OrderId;
                        string CategoryNameId = x.CategoryNameId;
                        string CategoriesDtlId = x.CategoriesDtlId;
                        NpgsqlCommand cmd1 = new NpgsqlCommand("insert into \"categoryDetails\"(\"categoryId\",\"orderNo\",\"categoryName\",\"categoryDescription\") values(@categoryId,@OrderId,@CategoryNameId,@CategoriesDtlId)");
                        cmd1.Parameters.AddWithValue("@categoryId", categoryId);
                        cmd1.Parameters.AddWithValue("@OrderId", OrderId);
                        cmd1.Parameters.AddWithValue("@CategoryNameId", CategoryNameId);
                        cmd1.Parameters.AddWithValue("@CategoriesDtlId", CategoriesDtlId);
                        //DataSet ds = ruwasdb.Insert(cmd1);
                        ruwasdb.Insert(cmd1);
                    }
                }
                string response = GetJson("Saved successfully");
                context.Response.Write(response);
            }
            else
            {
                string response = GetJson("No Data Found.");
                context.Response.Write(response);
            }

        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }


    }
    public void SaveRWSRC(HttpContext context)
    {
        try
        {
            string slctRWSRC = context.Request["slctRWSRC"].ToString();
            NpgsqlCommand cmd = new NpgsqlCommand("Insert into \"rwsrcs\" (\"rwsrcName\") values(@slctRWSRC)");
            cmd.Parameters.AddWithValue("@slctRWSRC", slctRWSRC);
            ruwasdb.Insert(cmd);
            string msg = "Saved Successfully";
            string response = GetJson(msg);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string sms = ex.Message;
            string response = GetJson(sms);
            context.Response.Write(response);
        }

    }
    public void SaveFundingSource(HttpContext context)
    {
        string slctFundingSource = context.Request["slctFundingSource"].ToString();
        NpgsqlCommand cmd = new NpgsqlCommand("insert into \"fundingSources\"(\"fundingSourceName\") values(@slctFundingSource)");
        cmd.Parameters.AddWithValue("@slctFundingSource", slctFundingSource);
        ruwasdb.Insert(cmd);
        string sms = "Successfully Savd";
        string response = GetJson(sms);
        context.Response.Write(response);
    }
    public void SaveFinancialYear(HttpContext context)
    {
        try
        {
            string FinancialYear = context.Request["txtFinancialYear"].ToString();
            int ActiveYear = Convert.ToInt32(context.Request["chkActiveYear"]);
            NpgsqlCommand cmd = new NpgsqlCommand("Insert into \"financialYears\" (\"financialYearName\",\"isActiveYear\") values(@FinancialYear,@ActiveYear)");
            cmd.Parameters.AddWithValue("@FinancialYear", FinancialYear);
            cmd.Parameters.AddWithValue("@ActiveYear", ActiveYear);
            ruwasdb.Insert(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }

    }
    public class FinancialYearClass
    {
        public int FinancialYr { get; set; }
        public string FinancialYrName { get; set; }
        public int IsActive { get; set; }
    }
    public void FetchFinancialYear(HttpContext context)
    {
        try
        {
            List<FinancialYearClass> FinancialYearList = new List<FinancialYearClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"financialYearId\",\"financialYearName\",\"isActiveYear\" from \"financialYears\" order by \"financialYearId\" desc limit 5");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FinancialYearClass arr = new FinancialYearClass();
                    arr.FinancialYr = Convert.ToInt32(dr["financialYearId"]);
                    arr.FinancialYrName = dr["financialYearName"].ToString();
                    arr.IsActive = Convert.ToInt32(dr["isActiveYear"]);
                    FinancialYearList.Add(arr);
                }
                string response = GetJson(FinancialYearList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }

    }
    public void SaveWorkplanPeriod(HttpContext context)
    {
        try
        {
            DateTime EndDate = Convert.ToDateTime(context.Request["slctEndDate"]);
            int FinancialYear = Convert.ToInt32(context.Request["slctFinancialYear"]);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"workPlanPeriods\" (\"endDate\",\"financialYearId\")values(@EndDate,@FinancialYear)");
            cmd.Parameters.AddWithValue("@EndDate", EndDate);
            cmd.Parameters.AddWithValue("@FinancialYear", FinancialYear);
            ruwasdb.SelectQuery(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }

    }
    public void SaveTechnology(HttpContext context)
    {
        try
        {
            string txtTechnology = context.Request["txtTechnology"].ToString();
            int txtPopulationServed = Convert.ToInt32(context.Request["txtPopulationServed"]);
            int chkNoEastingAndNorthing = Convert.ToInt32(context.Request["chkNoEastingAndNorthing"]);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"technologies\" (\"technologyName\",\"populationServed\",\"noEastings\") values(@txtTechnology,@txtPopulationServed,@chkNoEastingAndNorthing)");
            cmd.Parameters.AddWithValue("@txtTechnology", txtTechnology);
            cmd.Parameters.AddWithValue("@txtPopulationServed", txtPopulationServed);
            cmd.Parameters.AddWithValue("@chkNoEastingAndNorthing", chkNoEastingAndNorthing);
            ruwasdb.Insert(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    //public class Teachnology
    //{
    //    public int teachnologyId { get; set; }
    //    public string teachnologyName { get; set; }
    //}
    //public void FetchTeachnology(HttpContext context)
    //{
    //    try
    //    {
    //        List<Teachnology> Listarr = new List<Teachnology>();
    //        NpgsqlCommand cmd = new NpgsqlCommand("select \"technologyId\",\"technologyName\" from \"technologies\"");
    //        DataSet ds = ruwasdb.SelectQuery(cmd);
    //        DataTable dt = ds.Tables[0];
    //        if (dt.Rows.Count > 0)
    //        {
    //            foreach (DataRow dr in dt.Rows)
    //            {
    //                Teachnology arr = new Teachnology();
    //                arr.teachnologyId = Convert.ToInt32(dr["technologyId"]);
    //                arr.teachnologyName = dr["technologyName"].ToString();
    //                Listarr.Add(arr);
    //            }
    //            string response = GetJson(Listarr);
    //            context.Response.Write(response);
    //        }
    //        else
    //        {
    //            string sms = "No ROws Found";
    //            string response = GetJson(sms);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        string response = ex.Message;
    //        context.Response.Write(response);
    //    }
    //}
    public void SaveSubTechnology(HttpContext context)
    {
        try
        {
            string SubTEachnology = context.Request["txtSubTechnologt"].ToString();
            int Teachnology = Convert.ToInt32(context.Request["slctTechnology"]);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"subTechnologies\" (\"subTechnologyName\",\"technologyId\") values(@SubTEachnology,@Teachnology)");
            cmd.Parameters.AddWithValue("@SubTEachnology", SubTEachnology);
            cmd.Parameters.AddWithValue("@Teachnology", Teachnology);
            ruwasdb.Insert(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class ContractTableClass
    {
        public string LocalGovernment { get; set; }
        public string FinancialYear { get; set; }
        public string ContractNumber { get; set; }
        public string NameofContractor { get; set; }
        public string ContractorCountry { get; set; }
        public string DescriptionOfGoods { get; set; }
        public string ContractSum { get; set; }
        public string AnnualPaymentUnderContract { get; set; }
        public string Status { get; set; }
        public int CStatusId { get; set; }
        public int ContractDetlId { get; set; }

    }
    public void ContractTableData(HttpContext context)
    {
        try
        {
            List<ContractTableClass> ContractList = new List<ContractTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT \"districts\".\"districtName\" AS \"Local Government\",\"cstatuses\".\"cstatusId\" AS \"CStatusId\",\"contractDetails\".\"contractDetailId\" AS \"ContractDetlId\",\"financialYears\".\"financialYearName\" AS \"Financial\",\"contractDetails\".\"contractNo\" AS \"Contract No\",\"contractDetails\".\"contractorName\" AS \"Name of Contractor or Consultant/ Company Name\",\"contractDetails\".\"contractorCountry\" AS \"Country of Origin of Contractor or Consultant\",\"contractDetails\".\"descriptionGoods\" AS \"Description of Good, Services or Works Procured\",\"contractDetails\".\"contractSum\" AS \"Contract Sum (Ugx)(000)\",\"contractDetails\".\"annualPaymenttUnderContract\" AS \"Annual Payment Under Contract\",\"cstatuses\".\"contractStatusName\" AS \"Status\" FROM \"districts\" RIGHT OUTER JOIN \"contracts\" ON \"districts\".\"districtId\" = \"contracts\".\"districtId\" LEFT OUTER JOIN \"financialYears\" ON \"contracts\".\"financialYearId\" = \"financialYears\".\"financialYearId\" LEFT OUTER JOIN \"contractDetails\" ON \"contracts\".\"contractId\" = \"contractDetails\".\"contractId\" join \"cstatuses\" on \"contractDetails\".\"cstatusId\"=\"cstatuses\".\"cstatusId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    ContractTableClass arr = new ContractTableClass();
                    arr.LocalGovernment = dr["Local Government"].ToString();
                    arr.FinancialYear = dr["Financial"].ToString();
                    arr.ContractNumber = dr["Contract No"].ToString();
                    arr.NameofContractor = dr["Name of Contractor or Consultant/ Company Name"].ToString();
                    arr.ContractorCountry = dr["Country of Origin of Contractor or Consultant"].ToString();
                    arr.DescriptionOfGoods = dr["Description of Good, Services or Works Procured"].ToString();
                    arr.ContractSum = dr["Contract Sum (Ugx)(000)"].ToString();
                    arr.AnnualPaymentUnderContract = dr["Annual Payment Under Contract"].ToString();
                    arr.Status = dr["Status"].ToString();
                    arr.CStatusId = Convert.ToInt32(dr["CStatusId"]);
                    arr.ContractDetlId = Convert.ToInt32(dr["ContractDetlId"]);
                    ContractList.Add(arr);
                }
                string response = GetJson(ContractList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);

        }
    }
    public class FetchLCTableclass
    {
        public string LocalGovermentName { get; set; }
        public string Parish { get; set; }
        public string SubCounty { get; set; }
        public string District { get; set; }
    }
    public void FetchLcTable(HttpContext context)
    {
        try
        {

            List<FetchLCTableclass> LcList = new List<FetchLCTableclass>();
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT \"public\".\"districts\".\"districtId\"," +
                "\"public\".\"districts\".\"districtName\",\"public\".\"subCounties\".\"subCountyId\"," +
                "\"public\".\"subCounties\".\"subCountyName\",\"public\".\"parishes\".\"parishId\"," +
                "\"public\".\"parishes\".\"parishName\",\"public\".\"localGovernments\".\"localGovernmentId\"," +
                "\"public\".\"localGovernments\".\"localGovernmentName\" FROM \"public\".\"districts\"," +
                "\"public\".\"parishes\",\"public\".\"subCounties\",\"public\".\"localGovernments\" WHERE " +
                "(\"public\".\"localGovernments\".\"parishId\" =\"public\".\"parishes\".\"parishId\") AND " +
                "(\"public\".\"parishes\".\"subCountyId\" = \"public\".\"subCounties\".\"subCountyId\") AND " +
                "(\"public\".\"subCounties\".\"districtId\" = \"public\".\"districts\".\"districtId\" ) AND" +
                "( \"public\".\"districts\".\"isDeleted\" =0  )ORDER BY \"public\".\"districts\".\"districtName\" ASC");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchLCTableclass arr = new FetchLCTableclass();
                    arr.LocalGovermentName = dr["localGovernmentName"].ToString();
                    arr.Parish = dr["parishName"].ToString();
                    arr.SubCounty = dr["subCountyName"].ToString();
                    arr.District = dr["districtName"].ToString();
                    LcList.Add(arr);
                }
                string response = GetJson(LcList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
            }
        }
        catch (Exception ex)
        {

            string response = ex.Message;
            context.Response.Write(response);
        }
    }
    public class FetchParishClass
    {
        public string Parish { get; set; }
        public string SubCounty { get; set; }
        public string District { get; set; }
    }
    public void FetchParish(HttpContext context)
    {
        try
        {
            List<FetchParishClass> ParishList = new List<FetchParishClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"parishName\",\"subCountyName\",\"districtName\"from \"parishes\" left join \"subCounties\" on \"parishes\".\"subCountyId\"=\"subCounties\".\"subCountyId\" left join \"districts\" on \"subCounties\".\"districtId\"=\"districts\".\"districtId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchParishClass arr = new FetchParishClass();
                    arr.Parish = dr["parishName"].ToString();
                    arr.SubCounty = dr["subCountyName"].ToString();
                    arr.District = dr["districtName"].ToString();
                    ParishList.Add(arr);
                }
                string response = GetJson(ParishList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = ex.Message;
            context.Response.Write(response);
        }

    }
    public class FetchLCclass
    {
        public int LCId { get; set; }
        public string LCName { get; set; }
    }
    public void FetchLC(HttpContext context)
    {
        try
        {
            List<FetchLCclass> LcList = new List<FetchLCclass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"districtId\",\"districtName\" from \"districts\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchLCclass arr = new FetchLCclass();
                    arr.LCId = Convert.ToInt32(dr["districtId"]);
                    arr.LCName = dr["districtName"].ToString();
                    LcList.Add(arr);
                }
                string response = GetJson(LcList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
            }
        }
        catch (Exception ex)
        {

            string response = ex.Message;
            context.Response.Write(response);
        }
    }
    public void SaveApplyVariationMethod(HttpContext context)
    {
        try
        {
            int SlctFinancialYear = Convert.ToInt32(context.Request["SlctFinancialYear"]);
            int quarter = Convert.ToInt32(context.Request["quarter"]);
            int slctUnder = Convert.ToInt32(context.Request["slctUnder"]);
            int localGoverment = Convert.ToInt32(context.Request["localGoverment"]);
            string fromId = context.Request["fromId"].ToString();
            string numto = context.Request["numto"].ToString();
            int variationValue = Convert.ToInt32(context.Request["variationValue"]);
            string floatingTextarea = context.Request["floatingTextarea"].ToString();
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"variationApplications\"(\"financialYearId\",\"quarter\",\"under\",\"districtId\",\"fromItem\",\"toItem\",\"value\",\"statusReason\") values(@SlctFinancialYear,@quarter,@slctUnder,@localGoverment,@fromId,@numto,@variationValue,@floatingTextarea)");
            cmd.Parameters.AddWithValue("@SlctFinancialYear", SlctFinancialYear);
            cmd.Parameters.AddWithValue("@quarter", quarter);
            cmd.Parameters.AddWithValue("@slctUnder", slctUnder);
            cmd.Parameters.AddWithValue("@localGoverment", localGoverment);
            cmd.Parameters.AddWithValue("@fromId", fromId);
            cmd.Parameters.AddWithValue("@numto", numto);
            cmd.Parameters.AddWithValue("@variationValue", variationValue);
            cmd.Parameters.AddWithValue("@floatingTextarea", floatingTextarea);
            ruwasdb.Insert(cmd);
            string msg = "Saved Successfully";
            string response = GetJson(msg);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class Contracts
    {
        public int LocalGovernment { get; set; }
        public int FinancialYr { get; set; }
        public List<ContractDetails> CategoryDetailList { get; set; }
    }
    public class ContractDetails
    {
        public int ContractsNumber { get; set; }
        public string ContractorName { get; set; }
        public string ContractorCountry { get; set; }
        public string DescriptionGoods { get; set; }
        public int ContractSum { get; set; }
        public int AnnualPaymenttUnderContract { get; set; }
        public int Status { get; set; }
    }
    public void SaveContracts(string jsonString, HttpContext context)
    {
        try
        {
            var js = new JavaScriptSerializer();
            Contracts obj = js.Deserialize<Contracts>(jsonString);
            int LocalGovernment = obj.LocalGovernment;
            int FinancialYr = obj.FinancialYr;
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"contracts\" (\"districtId\",\"financialYearId\") values(@LocalGovernment,@FinancialYr) returning \"contractId\"");
            cmd.Parameters.AddWithValue("@LocalGovernment", LocalGovernment);
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            DataSet ds = ruwasdb.Insert_Return(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int ContractId = Convert.ToInt32(dr["contractId"]);
                    foreach (ContractDetails x in obj.CategoryDetailList)
                    {
                        int ContractsNumber = x.ContractsNumber;
                        string ContractorName = x.ContractorName;
                        string ContractorCountry = x.ContractorCountry;
                        string DescriptionGoods = x.DescriptionGoods;
                        int ContractSum = x.ContractSum;
                        int AnnualPaymenttUnderContract = x.AnnualPaymenttUnderContract;
                        int Status = x.Status;
                        NpgsqlCommand cmd1 = new NpgsqlCommand("insert into \"contractDetails\" (\"contractId\",\"contractNo\",\"contractorName\",\"contractorCountry\",\"descriptionGoods\",\"contractSum\",\"annualPaymenttUnderContract\",\"cstatusId\") values(@ContractId,@ContractsNumber,@ContractorName,@ContractorCountry,@DescriptionGoods,@ContractSum,@AnnualPaymenttUnderContract,@Status)");
                        cmd1.Parameters.AddWithValue("@ContractId", ContractId);
                        cmd1.Parameters.AddWithValue("@ContractsNumber", ContractsNumber);
                        cmd1.Parameters.AddWithValue("@ContractorName", ContractorName);
                        cmd1.Parameters.AddWithValue("@ContractorCountry", ContractorCountry);
                        cmd1.Parameters.AddWithValue("@DescriptionGoods", DescriptionGoods);
                        cmd1.Parameters.AddWithValue("@ContractSum", ContractSum);
                        cmd1.Parameters.AddWithValue("@AnnualPaymenttUnderContract", AnnualPaymenttUnderContract);
                        cmd1.Parameters.AddWithValue("@Status", Status);
                        ruwasdb.Insert(cmd1);
                    }
                }
                string sms = "Saved Successfully";
                string response = GetJson(sms);
                context.Response.Write(response);

            }
            else
            {
                string sms = "No Data Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class ModelActivityTableClass
    {
        public int ModelActivityDetailId { get; set; }
        public int OrderNo { get; set; }
        public string SlNo { get; set; }
        public string ModelActivityName { get; set; }
        public string ModelActivityDescription { get; set; }
        public string UnitTarget { get; set; }
        public string Under { get; set; }
    }
    public void ModelActivityTable(HttpContext context)
    {
        try
        {
            List<ModelActivityTableClass> MAClass = new List<ModelActivityTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"under\",\"modelActivityDetailId\",\"orderNo\",\"sNo\",\"modelActivityName\",\"modelActivityDescription\",\"unitTarget\" from \"modelActivities\"" +
                "join public.\"modelActivityDetails\"" +
            "on public.\"modelActivities\".\"modelActivityId\"=public.\"modelActivityDetails\".\"modelActivityId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    ModelActivityTableClass arr = new ModelActivityTableClass();
                    arr.ModelActivityDetailId = Convert.ToInt32(dr["modelActivityDetailId"]);
                    arr.OrderNo = Convert.ToInt32(dr["orderNo"]);
                    arr.SlNo = dr["sNo"].ToString();
                    arr.ModelActivityName = dr["modelActivityName"].ToString();
                    arr.ModelActivityDescription = dr["modelActivityDescription"].ToString();
                    arr.UnitTarget = dr["unitTarget"].ToString();
                    arr.Under = dr["under"].ToString();
                    MAClass.Add(arr);
                }
                string response = GetJson(MAClass);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class FetchDistrictsTableDataClass
    {
        public string Vote { get; set; }
        public int DistrictId { get; set; }
        public string District { get; set; }
        public int RWSRCId { get; set; }
        public string RWSRC { get; set; }
        public int IsDeleted { get; set; }
    }
    //inner joins
    public void FetchDistrictsTableData(HttpContext context)
    {
        try
        {
            List<FetchDistrictsTableDataClass> DistrictClass = new List<FetchDistrictsTableDataClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"vote\",\"districtId\",\"districtName\",\"districts\".\"rwsrcId\",\"rwsrcName\",\"isDeleted\" from \"districts\" inner join \"rwsrcs\" on \"districts\".\"rwsrcId\" = \"rwsrcs\".\"rwsrcId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchDistrictsTableDataClass arr = new FetchDistrictsTableDataClass();
                    arr.Vote = dr["vote"].ToString();
                    arr.DistrictId = Convert.ToInt32(dr["districtId"]);
                    arr.District = dr["districtName"].ToString();
                    arr.RWSRCId = Convert.ToInt32(dr["rwsrcId"]);
                    arr.RWSRC = dr["rwsrcName"].ToString();
                    arr.IsDeleted = Convert.ToInt32(dr["isDeleted"]);
                    DistrictClass.Add(arr);
                }
                string response = GetJson(DistrictClass);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class FetchCategoryTableClass
    {
        public string CategoryDetailId { get; set; }
        public string Under { get; set; }
        public string BudgetTypeName { get; set; }
        public int OrderNo { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDescription { get; set; }
    }
    public void FetchCategoryTable(HttpContext context)
    {
        try
        {
            List<FetchCategoryTableClass> CategoryList = new List<FetchCategoryTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"under\",\"budgetTypeName\",\"categoryDetailId\",\"orderNo\",\"categoryName\",\"categoryDescription\" from \"categoryDetails\" left join \"categories\" on \"categoryDetails\".\"categoryId\"=\"categories\".\"categoryId\" left join \"budgetTypes\" on \"categories\".\"budgetTypeId\"=\"budgetTypes\".\"budgetTypeId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchCategoryTableClass arr = new FetchCategoryTableClass();
                    arr.CategoryDetailId = dr["categoryDetailId"].ToString();
                    arr.Under = dr["under"].ToString();
                    arr.BudgetTypeName = dr["budgetTypeName"].ToString();
                    arr.OrderNo = Convert.ToInt32(dr["orderNo"]);
                    arr.CategoryName = dr["categoryName"].ToString();
                    arr.CategoryDescription = dr["categoryDescription"].ToString();
                    CategoryList.Add(arr);
                }
                string response = GetJson(CategoryList);
                context.Response.Write(response);
            }
            else
            {
                string msg = "No Rows Found";
                string response = GetJson(msg);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class FetchTeachnologyTableClass
    {
        public int TechnologyId { get; set; }
        public string TechnologyName { get; set; }
        public string PopulationServed { get; set; }
        public int NoEastings { get; set; }
        public int IsDeleted { get; set; }
    }
    public void FetchTeachnologyTable(HttpContext context)
    {
        try
        {
            List<FetchTeachnologyTableClass> TeachnologyList = new List<FetchTeachnologyTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"technologyId\",\"technologyName\",\"populationServed\",\"noEastings\",\"isDeleted\" from \"technologies\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchTeachnologyTableClass arr = new FetchTeachnologyTableClass();
                    arr.TechnologyId = Convert.ToInt32(dr["technologyId"]);
                    arr.TechnologyName = dr["technologyName"].ToString();
                    arr.PopulationServed = dr["populationServed"].ToString();
                    arr.NoEastings = Convert.ToInt32(dr["noEastings"]);
                    arr.NoEastings = Convert.ToInt32(dr["isDeleted"]);
                    TeachnologyList.Add(arr);
                }
                string response = GetJson(TeachnologyList);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }

    }
    public class SubCountyTableDataClass
    {
        public string SubCounty { get; set; }
        public int SubCountyId { get; set; }
        public string District { get; set; }
        public int DistrictId { get; set; }
        public int Population { get; set; }
        public string FinancialYear { get; set; }
    }
    public void FetchSubCountyTableData(HttpContext context)
    {
        try
        {
            List<SubCountyTableDataClass> SubCountyList = new List<SubCountyTableDataClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"subCountyId\",\"subCountyName\",\"population\",\"subCounties\".\"districtId\",\"districtName\",\"financialYearName\" from \"subCounties\" join \"districts\" on \"subCounties\".\"districtId\"=\"districts\".\"districtId\" join \"financialYears\" on \"subCounties\".\"financialYearId\"=\"financialYears\".\"financialYearId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    SubCountyTableDataClass arr = new SubCountyTableDataClass();
                    arr.SubCountyId = Convert.ToInt32(dr["subCountyId"]);
                    arr.SubCounty = dr["subCountyName"].ToString();
                    arr.DistrictId = Convert.ToInt32(dr["districtId"]);
                    arr.District = dr["districtName"].ToString();
                    arr.Population = Convert.ToInt32(dr["population"]);
                    arr.FinancialYear = dr["financialYearName"].ToString();
                    SubCountyList.Add(arr);
                }
                string response = GetJson(SubCountyList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }

    }
    //public class FinancialYrTableDataClass
    //{
    //    public string FinancialYearName { get; set; }
    //    public int IsActiveYear { get; set; }
    //}
    //public void FetchFinancialYrTableData(HttpContext context)
    //{
    //    List<FinancialYrTableDataClass> FinancialYrList = new List<FinancialYrTableDataClass>();
    //    NpgsqlCommand cmd = new NpgsqlCommand("select \"financialYearName\",\"isActiveYear\" from \"financialYears\"");
    //    DataSet ds = ruwasdb.SelectQuery(cmd);
    //    DataTable dt = ds.Tables[0];
    //    if (dt.Rows.Count > 0)
    //    {
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            FinancialYrTableDataClass arr = new FinancialYrTableDataClass();
    //            arr.FinancialYearName = dr["financialYearName"].ToString();
    //            arr.IsActiveYear = Convert.ToInt32(dr["isActiveYear"]);
    //            FinancialYrList.Add(arr);
    //        }
    //        string response = GetJson(FinancialYrList);
    //        context.Response.Write(response);
    //    }
    //    else
    //    {
    //        string sms = "No Rows Found";
    //        string response = GetJson(sms);
    //        context.Response.Write(response);
    //    }
    //}
    public class RWSRCTableDataClass
    {
        public int RWSRCId { get; set; }
        public string RWSRCName { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
    }
    public void FetchRWSRCTableData(HttpContext context)
    {
        try
        {
            List<RWSRCTableDataClass> RWSRCList = new List<RWSRCTableDataClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"rwsrcId\",\"rwsrcName\",\"createdBy\",\"createdDate\" from \"rwsrcs\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    RWSRCTableDataClass arr = new RWSRCTableDataClass();
                    arr.RWSRCId = Convert.ToInt32(dr["rwsrcId"]);
                    arr.RWSRCName = dr["rwsrcName"].ToString();
                    arr.CreatedBy = dr["createdBy"].ToString();
                    arr.CreatedDate = dr["createdDate"].ToString();
                    RWSRCList.Add(arr);
                }
                string response = GetJson(RWSRCList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class FundingSourceTableClass
    {
        public int FundingSourceId { get; set; }
        public string FundingSourceName { get; set; }
        public int IsDeleted { get; set; }
    }
    public void FetchFundingSourceTable(HttpContext context)
    {
        try
        {
            List<FundingSourceTableClass> FundingSourceList = new List<FundingSourceTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select  \"fundingSourceId\",\"fundingSourceName\",\"isDeleted\" from \"fundingSources\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FundingSourceTableClass arr = new FundingSourceTableClass();
                    arr.FundingSourceId = Convert.ToInt32(dr["fundingSourceId"]);
                    arr.FundingSourceName = dr["fundingSourceName"].ToString();
                    arr.IsDeleted = Convert.ToInt32(dr["isDeleted"]);
                    FundingSourceList.Add(arr);
                }
                string response = GetJson(FundingSourceList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }

    }
    public class WorkPlanPeriodTableClass
    {

        public string CreatedDate_string { get; set; }
        public string EndDate_string { get; set; }
        public DateTime EndDate { get; set; }
        public int FinancialYr { get; set; }
        public string FinancialYrName { get; set; }
        public int IsEnded { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDatee { get; set; }
        public DateTime CreatedDate { get; set; }
    }
    public void FetchWorkPlanPeriodTable(HttpContext context)
    {
        try
        {
            List<WorkPlanPeriodTableClass> WorkPlanPeriodTableDataList = new List<WorkPlanPeriodTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"endDate\",\"workPlanPeriods\".\"financialYearId\",\"financialYearName\",\"isEnded\",\"workPlanPeriods\".\"createdBy\",\"workPlanPeriods\".\"createdDate\" from \"workPlanPeriods\" left join \"financialYears\" on \"workPlanPeriods\".\"financialYearId\"=\"financialYears\".\"financialYearId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    WorkPlanPeriodTableClass arr = new WorkPlanPeriodTableClass();
                    //arr.EndDatee = dr["endDate"].ToString();
                    string EndDatee = dr["endDate"].ToString();
                    if (EndDatee != "")
                    {
                        DateTime EndDate = Convert.ToDateTime(dr["endDate"]);
                        string EndDate_string = EndDate.ToString("yyyy-MM-dd");
                        arr.EndDate_string = EndDate_string;
                    }
                    arr.FinancialYr = Convert.ToInt32(dr["financialYearId"]);
                    arr.FinancialYrName = dr["financialYearName"].ToString();
                    arr.IsEnded = Convert.ToInt32(dr["isEnded"]);
                    arr.CreatedBy = dr["createdBy"].ToString();
                    string CreatedDatee = dr["createdDate"].ToString();
                    if (CreatedDatee != "")
                    {
                        DateTime CreatedDate = Convert.ToDateTime(dr["createdDate"]);
                        string CreatedDate_string = CreatedDate.ToString("yyyy-MM-dd");
                        arr.CreatedDate_string = CreatedDate_string;
                    }
                    WorkPlanPeriodTableDataList.Add(arr);
                }
                string response = GetJson(WorkPlanPeriodTableDataList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class EventLogTableClass
    {
        public string EventDate { get; set; }
        public string UserName { get; set; }
        public string Module { get; set; }
        public string Action { get; set; }
        public string Details { get; set; }
    }
    public void FetchEventLogTable(HttpContext context)
    {
        try
        {
            List<EventLogTableClass> EventLogList = new List<EventLogTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select * from \"eventLogs\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    EventLogTableClass arr = new EventLogTableClass();
                    arr.EventDate = dr["eventDate"].ToString();
                    arr.UserName = dr["username"].ToString();
                    arr.Module = dr["module"].ToString();
                    arr.Action = dr["action"].ToString();
                    arr.Details = dr["details"].ToString();
                    EventLogList.Add(arr);
                }
                string response = GetJson(EventLogList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class WorkplanAuditTrailTableClass
    {
        public string Date { get; set; }
        public string UserName { get; set; }
        public string Activity { get; set; }
        public string Modification { get; set; }
    }
    public void FetchWorkplanAuditTrailTable(HttpContext context)
    {
        try
        {
            List<WorkplanAuditTrailTableClass> WorkplanAuditTrailTableDataList = new List<WorkplanAuditTrailTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"updatedDate\",\"updatedBy\",\"activity\",\"modification\" from \"workPlanAuditTrails\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    WorkplanAuditTrailTableClass arr = new WorkplanAuditTrailTableClass();
                    arr.Date = dr["updatedDate"].ToString();
                    arr.UserName = dr["updatedBy"].ToString();
                    arr.Activity = dr["activity"].ToString();
                    arr.Modification = dr["modification"].ToString();
                    WorkplanAuditTrailTableDataList.Add(arr);
                }
                string response = GetJson(WorkplanAuditTrailTableDataList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class LoadDistrictClass
    {
        public int DistrictId { get; set; }
        public string DistrictName { get; set; }
    }
    public void FetchDistrict(HttpContext context)
    {
        try
        {
            List<LoadDistrictClass> LoadDistrictClass = new List<LoadDistrictClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"districtId\",\"districtName\" from \"districts\" ORDER BY \"public\".\"districts\".\"districtName\" ASC");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    LoadDistrictClass arr = new LoadDistrictClass();
                    arr.DistrictId = Convert.ToInt32(dr["districtId"]);
                    arr.DistrictName = dr["districtName"].ToString();
                    LoadDistrictClass.Add(arr);
                }
                string response = GetJson(LoadDistrictClass);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class LoadSubCountyOfDistrictClass
    {
        public int SubCountyId { get; set; }
        public string SubCountyName { get; set; }
    }
    public void FetchSubCountyOfDistrict(HttpContext context)
    {
        try
        {
            int districtId = Convert.ToInt32(context.Request["districtId"]);
            List<LoadSubCountyOfDistrictClass> LoadSubCountyList = new List<LoadSubCountyOfDistrictClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"subCountyId\",\"subCountyName\" from \"subCounties\" where \"districtId\"=@districtId ");
            cmd.Parameters.AddWithValue("districtId", @districtId);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    LoadSubCountyOfDistrictClass arr = new LoadSubCountyOfDistrictClass();
                    arr.SubCountyId = Convert.ToInt32(dr["subCountyId"]);
                    arr.SubCountyName = dr["subCountyName"].ToString();
                    LoadSubCountyList.Add(arr);
                }
                string response = GetJson(LoadSubCountyList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    //public class RWSRCClass
    //{
    //    public int TsuId { get; set; }
    //    public string TsuName { get; set; }
    //}
    //public void FetchRWSRC(HttpContext context)
    //{
    //    try
    //    {
    //        List<RWSRCClass> LoadRWSRCList = new List<RWSRCClass>();
    //        NpgsqlCommand cmd = new NpgsqlCommand("select \"rwsrcId\",\"rwsrcName\" from \"rwsrcs\"");
    //        DataSet ds = ruwasdb.SelectQuery(cmd);
    //        DataTable dt = ds.Tables[0];
    //        if (dt.Rows.Count > 0)
    //        {
    //            foreach (DataRow dr in dt.Rows)
    //            {
    //                RWSRCClass arr = new RWSRCClass();
    //                arr.TsuId = Convert.ToInt32(dr["rwsrcId"]);
    //                arr.TsuName = dr["rwsrcName"].ToString();
    //                LoadRWSRCList.Add(arr);
    //            }
    //            string response = GetJson(LoadRWSRCList);
    //            context.Response.Write(response);
    //        }

    //        else
    //        {
    //            string sms = "No Rows Found";
    //            string response = GetJson(sms);
    //            context.Response.Write(response);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        string response = GetJson(ex.Message);
    //        context.Response.Write(response);
    //    }
    //}
    public class ParishOfSubcountyClass
    {
        public int ParishId { get; set; }
        public string ParishName { get; set; }
    }
    public void FetchParishOfSubcounty(HttpContext context)
    {
        try
        {
            int SubcountyId = Convert.ToInt32(context.Request["sub_CountyId"]);
            List<ParishOfSubcountyClass> ParishOfSubcountyList = new List<ParishOfSubcountyClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"parishId\",\"parishName\" from \"parishes\" where \"subCountyId\"=@SubcountyId");
            cmd.Parameters.AddWithValue("subCountyId", @SubcountyId);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    ParishOfSubcountyClass arr = new ParishOfSubcountyClass();
                    arr.ParishId = Convert.ToInt32(dr["parishId"]);
                    arr.ParishName = dr["parishName"].ToString();
                    ParishOfSubcountyList.Add(arr);
                }
                string response = GetJson(ParishOfSubcountyList);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public void SaveLC(HttpContext context)
    {
        try
        {
            string LcName = context.Request["txtLcName"].ToString();
            int ParishId = Convert.ToInt32(context.Request["SlctParishId"]);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"localGovernments\"(\"localGovernmentName\",\"parishId\") values(@LcName,@ParishId)");
            cmd.Parameters.AddWithValue("@LcName", LcName);
            cmd.Parameters.AddWithValue("@ParishId", ParishId);
            ruwasdb.SelectQuery(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void SaveParish(HttpContext context)
    {
        try
        {
            string ParishName = context.Request["txtParish"].ToString();
            int SubCountyId = Convert.ToInt32(context.Request["slctSubCounty"]);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"parishes\"(\"parishName\",\"subCountyId\") values(@ParishName,@SubCountyId)");
            cmd.Parameters.AddWithValue("@ParishName", ParishName);
            cmd.Parameters.AddWithValue("@SubCountyId", SubCountyId);
            ruwasdb.SelectQuery(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void SaveSubCounty(HttpContext context)
    {
        try
        {
            string SubCountyName = context.Request["slctSubCounty"].ToString();
            int DistrictId = Convert.ToInt32(context.Request["slctDistrictId"]);
            int Population = Convert.ToInt32(context.Request["txtPopulation"]);
            int FinancialYrId = Convert.ToInt32(context.Request["slctFinancialYear"]);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"subCounties\" (\"subCountyName\",\"districtId\",\"population\",\"financialYearId\") values(@SubCountyName,@DistrictId,@Population,@FinancialYrId)");
            cmd.Parameters.AddWithValue("@SubCountyName", SubCountyName);
            cmd.Parameters.AddWithValue("@DistrictId", DistrictId);
            cmd.Parameters.AddWithValue("@Population", Population);
            cmd.Parameters.AddWithValue("@FinancialYrId", FinancialYrId);
            ruwasdb.Insert(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void SaveDistricts(HttpContext context)
    {
        try
        {
            string Vote = context.Request["txtVote"].ToString();
            string District = context.Request["txtDistrict"].ToString();
            int TSU = Convert.ToInt32(context.Request["slctTSU"]);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"districts\" (\"vote\",\"districtName\",\"rwsrcId\") values(@Vote,@District,@TSU)");
            cmd.Parameters.AddWithValue("@Vote", Vote);
            cmd.Parameters.AddWithValue("@District", District);
            cmd.Parameters.AddWithValue("@TSU", TSU);
            ruwasdb.Insert(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void SavePlannedFund(HttpContext context)
    {
        try
        {
            int DistrictId = Convert.ToInt32(context.Request["slctDiatrict"]);
            int FinancialYrId = Convert.ToInt32(context.Request["slctFinancialYr"]);
            int Recurrent = Convert.ToInt32(context.Request["txtRecurrent"]);
            int Development = Convert.ToInt32(context.Request["txtDevelopment"]);
            int Sanitation = Convert.ToInt32(context.Request["txtSanitation"]);
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"budgetPerDistricts\"" +
                "(\"districtId\",\"financialYearId\",\"recurrent\",\"development\"," +
                "\"sanitation\") values(@DistrictId,@FinancialYrId," +
                "@Recurrent,@Development,@Sanitation)");
            cmd.Parameters.AddWithValue("@DistrictId", DistrictId);
            cmd.Parameters.AddWithValue("@FinancialYrId", FinancialYrId);
            cmd.Parameters.AddWithValue("@Recurrent", Recurrent);
            cmd.Parameters.AddWithValue("@Development", Development);
            cmd.Parameters.AddWithValue("@Sanitation", Sanitation);
            ruwasdb.Insert(cmd);
            string sms = "Saved Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class ModelActivityClass
    {
        public string SlctUnder { get; set; }
        public int SlctBudgetType { get; set; }
        public int SlctCategory { get; set; }
        public List<ModelActivityDtlClass> ModelActivityDtlList { get; set; }
    }
    public class ModelActivityDtlClass
    {
        public int TxtOrder { get; set; }
        public string TxtNo { get; set; }
        public string TxtModelActivityName { get; set; }
        public string TxtModelActivityDescription { get; set; }
        public string TxtunitTarget { get; set; }
    }
    public void SaveModelActivity(string jsonstring, HttpContext context)
    {
        try
        {
            var js = new JavaScriptSerializer();
            ModelActivityClass Obj = js.Deserialize<ModelActivityClass>(jsonstring);
            string SlctUnder = Obj.SlctUnder;
            int SlctBudgetType = Obj.SlctBudgetType;
            int SlctCategory = Obj.SlctCategory;
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"modelActivities\" (\"under\",\"budgetTypeId\",\"categoryDetailId\") values(@SlctUnder,@SlctBudgetType,@SlctCategory) returning \"modelActivityId\"");
            cmd.Parameters.AddWithValue("@SlctUnder", SlctUnder);
            cmd.Parameters.AddWithValue("@SlctBudgetType", SlctBudgetType);
            cmd.Parameters.AddWithValue("@SlctCategory", SlctCategory);
            DataSet ds = ruwasdb.Insert_Return(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int ModelActivityId = Convert.ToInt32(dr["modelActivityId"]);
                    foreach (ModelActivityDtlClass x in Obj.ModelActivityDtlList)
                    {
                        int TxtOrder = x.TxtOrder;
                        string TxtNo = x.TxtNo;
                        string TxtModelActivityName = x.TxtModelActivityName;
                        string TxtModelActivityDescription = x.TxtModelActivityDescription;
                        string TxtunitTarget = x.TxtunitTarget;
                        NpgsqlCommand cmd1 = new NpgsqlCommand("insert into \"modelActivityDetails\" (\"modelActivityId\",\"orderNo\",\"sNo\",\"modelActivityName\",\"modelActivityDescription\",\"unitTarget\") values(@ModelActivityId,@TxtOrder,@TxtNo,@TxtModelActivityName,@TxtModelActivityDescription,@TxtunitTarget)");
                        cmd1.Parameters.AddWithValue("@ModelActivityId", ModelActivityId);
                        cmd1.Parameters.AddWithValue("@TxtOrder", TxtOrder);
                        cmd1.Parameters.AddWithValue("@TxtNo", TxtNo);
                        cmd1.Parameters.AddWithValue("@TxtModelActivityName", TxtModelActivityName);
                        cmd1.Parameters.AddWithValue("@TxtModelActivityDescription", TxtModelActivityDescription);
                        cmd1.Parameters.AddWithValue("@TxtunitTarget", TxtunitTarget);
                        ruwasdb.Insert(cmd1);
                    }
                }
                string response = GetJson("Saved Successfully.");
                context.Response.Write(response);
            }
            else
            {
                string response = GetJson("No Data Found.");
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class PlannedFundsPerDistrictsTableDataClass
    {
        public int BudgetPerDistrictId { get; set; }
        public string Vote { get; set; }
        public string DistrictName { get; set; }
        public int Recurrent { get; set; }
        public int Development { get; set; }
        public int Sanitation { get; set; }
    }
    public void FetchPlannedFundsPerDistrictsTableData(HttpContext context)
    {
        try
        {
            int FinancialYr = Convert.ToInt32(context.Request["FinancialYr"]);
            List<PlannedFundsPerDistrictsTableDataClass> PlannedFundsPerDistrictsTableDataList = new List<PlannedFundsPerDistrictsTableDataClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"budgetPerDistrictId\",\"vote\"," +
                "\"districtName\",\"recurrent\",\"development\",\"sanitation\" from" +
                " \"budgetPerDistricts\" left join \"districts\" on \"budgetPerDistricts\".\"districtId\"=\"districts\".\"districtId\" where \"financialYearId\"=@FinancialYr");
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    PlannedFundsPerDistrictsTableDataClass arr = new PlannedFundsPerDistrictsTableDataClass();
                    arr.BudgetPerDistrictId = Convert.ToInt32(dr["budgetPerDistrictId"]);
                    arr.Vote = dr["vote"].ToString();
                    arr.DistrictName = dr["districtName"].ToString();
                    arr.Recurrent = Convert.ToInt32(dr["recurrent"]);
                    arr.Development = Convert.ToInt32(dr["development"]);
                    arr.Sanitation = Convert.ToInt32(dr["sanitation"]);
                    PlannedFundsPerDistrictsTableDataList.Add(arr);

                }
                string response = GetJson(PlannedFundsPerDistrictsTableDataList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }

    }
    public class AnnualAttachmentsClass
    {
        public int SlctFinancialYear { get; set; }
        public int LocalGovernment { get; set; }
        public List<SitanDetailsClass> SitanDetailsList { get; set; }
    }
    public class SitanDetailsClass
    {
        public int SlctSubCounty { get; set; }
        public int TxtProtectSpringF { get; set; }
        public int TxtProtectSpringNF { get; set; }
        public int TxtShallowWellF { get; set; }
        public int TxtShallowWellNF { get; set; }
        public int TxtDeepBoreHoleNF { get; set; }
        public int TxtDeepBoreHoleF { get; set; }
        public int TxtGravityFlowSCH { get; set; }
        public int TxtGravityFlowF { get; set; }
        public int TxtGravityFlowNF { get; set; }
        public int TxtPumpedPipeSCH { get; set; }
        public int TxtPumpedPipeF { get; set; }
        public int TxtPumpedPipeNF { get; set; }
        public int TxtSmallRainwaterTanksF { get; set; }
        public int TxtSmallRainwaterTanksNF { get; set; }
        public int TxtLargeRainwaterTanksF { get; set; }
        public int TxtLargeRainwaterTanksNF { get; set; }
        public int TxtValleyF { get; set; }
        public int TxtValleyNF { get; set; }
        public int TxtDamsF { get; set; }
        public int TxtDamsNF { get; set; }
        public int TxtCommunityMgtTWPV { get; set; }
        public int TxtCommunityMgtWSC { get; set; }
        public int TxtCommunityMgtWSCWP { get; set; }
        public int TxtWaterQualityTST { get; set; }
        public int TxtWaterQualitySCWG { get; set; }
    }
    public void SaveAnnualAttachments(string jsonstring, HttpContext context)
    {
        try
        {
            var js = new JavaScriptSerializer();
            AnnualAttachmentsClass Obj = js.Deserialize<AnnualAttachmentsClass>(jsonstring);
            int FinancialYr = Obj.SlctFinancialYear;
            int LocalGovernment = Obj.LocalGovernment;
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"sitans\" (\"districtId\",\"finanicalYearId\") values(@FinancialYr,@LocalGovernment) returning \"sitanId\"");
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            cmd.Parameters.AddWithValue("@LocalGovernment", LocalGovernment);
            DataSet ds = ruwasdb.Insert_Return(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int SitanId = Convert.ToInt32(dr["sitanId"]);
                    foreach (SitanDetailsClass x in Obj.SitanDetailsList)
                    {
                        int SlctSubCounty = x.SlctSubCounty;
                        int TxtProtectSpringF = x.TxtProtectSpringF;
                        int TxtProtectSpringNF = x.TxtProtectSpringNF;
                        int TxtShallowWellF = x.TxtShallowWellF;
                        int TxtShallowWellNF = x.TxtShallowWellNF;
                        int TxtDeepBoreHoleNF = x.TxtDeepBoreHoleNF;
                        int TxtDeepBoreHoleF = x.TxtDeepBoreHoleF;
                        int TxtGravityFlowSCH = x.TxtGravityFlowSCH;
                        int TxtGravityFlowF = x.TxtGravityFlowF;
                        int TxtGravityFlowNF = x.TxtGravityFlowNF;
                        int TxtPumpedPipeSCH = x.TxtPumpedPipeSCH;
                        int TxtPumpedPipeF = x.TxtPumpedPipeF;
                        int TxtPumpedPipeNF = x.TxtPumpedPipeNF;
                        int TxtSmallRainwaterTanksF = x.TxtSmallRainwaterTanksF;
                        int TxtSmallRainwaterTanksNF = x.TxtSmallRainwaterTanksNF;
                        int TxtLargeRainwaterTanksF = x.TxtLargeRainwaterTanksF;
                        int TxtLargeRainwaterTanksNF = x.TxtLargeRainwaterTanksNF;
                        int TxtValleyF = x.TxtValleyF;
                        int TxtValleyNF = x.TxtValleyNF;
                        int TxtDamsF = x.TxtDamsF;
                        int TxtDamsNF = x.TxtDamsNF;
                        int TxtCommunityMgtTWPV = x.TxtCommunityMgtTWPV;
                        int TxtCommunityMgtWSC = x.TxtCommunityMgtWSC;
                        int TxtCommunityMgtWSCWP = x.TxtCommunityMgtWSCWP;
                        int TxtWaterQualityTST = x.TxtWaterQualityTST;
                        int TxtWaterQualitySCWG = x.TxtWaterQualitySCWG;
                        NpgsqlCommand cmd1 = new NpgsqlCommand("insert into \"sitanDetails\"(\"sitanId\",\"subCountyId\",\"protectedStringFunc\"," +
                            "\"protectedStringNonFunc\",\"shallowWallsFunc\",\"shallowWallsNonFunc\",\"deepboreholeFunc\"," +
                            "\"deepboreholeNonFunc\",\"gravityFlowSCH\",\"gravityFlowFunc\",\"gravityFlowNonFunc\",\"pumpedPipedSCH\"," +
                            "\"pumpedPipedFunc\",\"pumpedPipedNonFunc\",\"rainWaterBelowTenFunc\",\"rainWaterBelowTenNonFunc\"," +
                            "\"rainWaterAboveTenFunc\",\"rainWaterAboveTenNonFunc\",\"valleyTankFunc\",\"valleyTankNonFunc\"," +
                            "\"damsFunc\",\"damsNonFunc\",\"communityMgtTWPV\",\"communityMgtWSC\",\"communityMgtWSCWP\"," +
                            "\"waterQualityTST\",\"waterQualitySCWG\")" +
                            "values(@SitanId,@SlctSubCounty,@TxtProtectSpringF,@TxtProtectSpringNF,@TxtShallowWellF," +
                            "@TxtShallowWellNF,@TxtDeepBoreHoleF,@TxtDeepBoreHoleNF,@TxtGravityFlowSCH,@TxtGravityFlowF," +
                            "@TxtGravityFlowNF,@TxtPumpedPipeSCH,@TxtPumpedPipeF,@TxtPumpedPipeNF,@TxtSmallRainwaterTanksF," +
                            "@TxtSmallRainwaterTanksNF,@TxtLargeRainwaterTanksF,@TxtLargeRainwaterTanksNF,@TxtValleyF,@TxtValleyNF," +
                            "@TxtDamsF,@TxtDamsNF,@TxtCommunityMgtTWPV,@TxtCommunityMgtWSC,@TxtCommunityMgtWSCWP,@TxtWaterQualityTST," +
                            "@TxtWaterQualitySCWG)");
                        cmd1.Parameters.AddWithValue("@SitanId", SitanId);
                        cmd1.Parameters.AddWithValue("@SlctSubCounty", SlctSubCounty);
                        cmd1.Parameters.AddWithValue("@TxtProtectSpringF", TxtProtectSpringF);
                        cmd1.Parameters.AddWithValue("@TxtProtectSpringNF", TxtProtectSpringNF);
                        cmd1.Parameters.AddWithValue("@TxtShallowWellF", TxtShallowWellF);
                        cmd1.Parameters.AddWithValue("@TxtShallowWellNF", TxtShallowWellNF);
                        cmd1.Parameters.AddWithValue("@TxtDeepBoreHoleNF", TxtDeepBoreHoleNF);
                        cmd1.Parameters.AddWithValue("@TxtDeepBoreHoleF", TxtDeepBoreHoleF);
                        cmd1.Parameters.AddWithValue("@TxtGravityFlowSCH", TxtGravityFlowSCH);
                        cmd1.Parameters.AddWithValue("@TxtGravityFlowF", TxtGravityFlowF);
                        cmd1.Parameters.AddWithValue("@TxtGravityFlowNF", TxtGravityFlowNF);
                        cmd1.Parameters.AddWithValue("@TxtPumpedPipeSCH", TxtPumpedPipeSCH);
                        cmd1.Parameters.AddWithValue("@TxtPumpedPipeF", TxtPumpedPipeF);
                        cmd1.Parameters.AddWithValue("@TxtPumpedPipeNF", TxtPumpedPipeNF);
                        cmd1.Parameters.AddWithValue("@TxtSmallRainwaterTanksF", TxtSmallRainwaterTanksF);
                        cmd1.Parameters.AddWithValue("@TxtSmallRainwaterTanksNF", TxtSmallRainwaterTanksNF);
                        cmd1.Parameters.AddWithValue("@TxtLargeRainwaterTanksF", TxtLargeRainwaterTanksF);
                        cmd1.Parameters.AddWithValue("@TxtLargeRainwaterTanksNF", TxtLargeRainwaterTanksNF);
                        cmd1.Parameters.AddWithValue("@TxtValleyF", TxtValleyF);
                        cmd1.Parameters.AddWithValue("@TxtValleyNF", TxtValleyNF);
                        cmd1.Parameters.AddWithValue("@TxtDamsF", TxtDamsF);
                        cmd1.Parameters.AddWithValue("@TxtDamsNF", TxtDamsNF);
                        cmd1.Parameters.AddWithValue("@TxtCommunityMgtTWPV", TxtCommunityMgtTWPV);
                        cmd1.Parameters.AddWithValue("@TxtCommunityMgtWSC", TxtCommunityMgtWSC);
                        cmd1.Parameters.AddWithValue("@TxtCommunityMgtWSCWP", TxtCommunityMgtWSCWP);
                        cmd1.Parameters.AddWithValue("@TxtWaterQualityTST", TxtWaterQualityTST);
                        cmd1.Parameters.AddWithValue("@TxtWaterQualitySCWG", TxtWaterQualitySCWG);
                        ruwasdb.Insert(cmd1);
                    }
                }
                string response = GetJson("Saved Successfully.");
                context.Response.Write(response);
            }
            else
            {
                string response = GetJson("No Data Found.");
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class QuarterlyAttachmentDataClass
    {
        public string FinancialYr { get; set; }
        public string LC { get; set; }
        public string NewRehabitation { get; set; }
        public int Quarter { get; set; }
        public string Teachnology { get; set; }
        public int TeachnologyId { get; set; }
        public string SubCounty { get; set; }
        public string Parish { get; set; }
        public string Village { get; set; }
        public string SourceNumber { get; set; }
        public string NameOfWaterSource { get; set; }
        public double Easting { get; set; }
        public double Northing { get; set; }
        public int InvestmentCostUgx { get; set; }
        public string SourceOfFunding { get; set; }
    }
    public void FetchQuarterlyAttachmentData(HttpContext context)
    {
        try
        {
            List<QuarterlyAttachmentDataClass> QuarterlyAttachmentDataList = new List<QuarterlyAttachmentDataClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT  \"financialYears\".\"financialYearName\" AS \"Financial Year\"," +
    "\"technologies\".\"technologyName\" AS \"Technology\"," +
    "\"technologies\".\"technologyId\" AS \"TechnologyId\"," +
    "\"quarterlyAttachments\".\"newRehabilitated\" AS \"New / Rehabilitated\"," +
    "\"quarterlyAttachments\".\"quarter\" AS \"Quarter\"," +
    "\"quarterlyAttachments\".\"sourceNo\" AS \"Source Number\"," +
    "\"quarterlyAttachments\".\"waterSourceName\" AS \"Name of Water Source\"," +
    "\"quarterlyAttachments\".\"utmEasting\" AS \"Easting\"," +
    "\"quarterlyAttachments\".\"utmNorthing\" AS \"Northing\"," +
    "\"quarterlyAttachments\".\"investmentValue\" AS \"Investment Cost Ugx(000)\"," +
    "\"quarterlyAttachments\".\"fundingSource\" AS \"Source of Funding\"," +
    "\"quarterlyAttachments\".\"fundingName\" AS \"Name\"," +
    "\"localGovernments\".\"localGovernmentName\" AS \"Village / LC1\"," +
    "\"parishes\".\"parishName\" AS \"Parish\"," +
    "\"subCounties\".\"subCountyName\" AS \"Sub-county\"," +
    "\"districts\".\"districtName\" AS \"Local Government\"," +
    "\"quarterlyAttachments\".\"createdBy\" AS \"Created By\"," +
    "\"quarterlyAttachments\".\"createdDate\" AS \"Save Date\"" +
    " FROM  \"quarterlyAttachments\"" +
    "LEFT OUTER JOIN \"localGovernments\" ON \"quarterlyAttachments\".\"localGovernmentId\" = \"localGovernments\".\"localGovernmentId\"" +
    "LEFT OUTER JOIN \"parishes\" ON \"localGovernments\".\"parishId\" = \"parishes\".\"parishId\"" +
    "LEFT OUTER JOIN \"subCounties\" ON \"parishes\".\"subCountyId\" = \"subCounties\".\"subCountyId\"" +
    "LEFT OUTER JOIN \"districts\" ON \"subCounties\".\"districtId\" = \"districts\".\"districtId\"" +
    "LEFT OUTER JOIN \"financialYears\" ON \"quarterlyAttachments\".\"financialYearId\" = \"financialYears\".\"financialYearId\"" +
    "LEFT OUTER JOIN \"technologies\" ON \"quarterlyAttachments\".\"technologyId\" = \"technologies\".\"technologyId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    QuarterlyAttachmentDataClass arr = new QuarterlyAttachmentDataClass();
                    arr.FinancialYr = dr["Financial Year"].ToString();
                    arr.LC = dr["Local Government"].ToString();
                    arr.NewRehabitation = dr["New / Rehabilitated"].ToString();
                    arr.Quarter = Convert.ToInt32(dr["Quarter"]);
                    arr.TeachnologyId = Convert.ToInt32(dr["TechnologyId"]);
                    arr.Teachnology = dr["Technology"].ToString();
                    arr.SubCounty = dr["Sub-county"].ToString();
                    arr.Parish = dr["Parish"].ToString();
                    arr.Village = dr["Village / LC1"].ToString();
                    arr.SourceNumber = dr["Source Number"].ToString();
                    arr.NameOfWaterSource = dr["Name of Water Source"].ToString();
                    arr.Easting = Convert.ToDouble(dr["Easting"]);
                    arr.Northing = Convert.ToDouble(dr["Northing"]);
                    arr.InvestmentCostUgx = Convert.ToInt32(dr["Investment Cost Ugx(000)"]);
                    arr.SourceOfFunding = dr["Source of Funding"].ToString();
                    QuarterlyAttachmentDataList.Add(arr);
                }
                string response = GetJson(QuarterlyAttachmentDataList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class FetchCategoryOfBudgetTypeClass
    {
        public int BudgetTypeId { get; set; }
        public string BudgetType { get; set; }
    }
    public void FetchCategoryOfBudgetType(HttpContext context)
    {
        try
        {
            List<FetchCategoryOfBudgetTypeClass> FetchCategoryOfBudgetType = new List<FetchCategoryOfBudgetTypeClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"budgetTypeId\",\"budgetTypeName\" from \"budgetTypes\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchCategoryOfBudgetTypeClass arr = new FetchCategoryOfBudgetTypeClass();
                    arr.BudgetTypeId = Convert.ToInt32(dr["budgetTypeId"]);
                    arr.BudgetType = dr["budgetTypeName"].ToString();
                    FetchCategoryOfBudgetType.Add(arr);
                }
                string response = GetJson(FetchCategoryOfBudgetType);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class VillageOfParishClass
    {
        public int VillageId { get; set; }
        public string VillageName { get; set; }
    }
    public void FetchVillageOfParish(HttpContext context)
    {
        try
        {
            int ParishId = Convert.ToInt32(context.Request["ParishId"]);
            List<VillageOfParishClass> VillageOfParishList = new List<VillageOfParishClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"localGovernmentId\",\"localGovernmentName\" from \"localGovernments\" where \"parishId\"=@ParishId");
            cmd.Parameters.AddWithValue("@ParishId", ParishId);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    VillageOfParishClass arr = new VillageOfParishClass();
                    arr.VillageId = Convert.ToInt32(dr["localGovernmentId"]);
                    arr.VillageName = dr["localGovernmentName"].ToString();
                    VillageOfParishList.Add(arr);
                }
                string response = GetJson(VillageOfParishList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class FundingSourceInformationClass
    {
        public int FundingSourceId { get; set; }
        public string FundingSourceName { get; set; }
    }
    public void FetchFundingSourceInformation(HttpContext context)
    {
        try
        {
            List<FundingSourceInformationClass> FundingSourceInformationList = new List<FundingSourceInformationClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"fundingSourceId\",\"fundingSourceName\" from \"fundingSources\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FundingSourceInformationClass arr = new FundingSourceInformationClass();
                    arr.FundingSourceId = Convert.ToInt32(dr["fundingSourceId"]);
                    arr.FundingSourceName = dr["fundingSourceName"].ToString();
                    FundingSourceInformationList.Add(arr);
                }
                string response = GetJson(FundingSourceInformationList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {

            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class BudgetTypeTableClass
    {
        public int BudgetTypeId { get; set; }
        public string BudgetTypeName { get; set; }
        public string BudgetUnder { get; set; }
        public int UnderId { get; set; }
        public int IsDeleted { get; set; }
    }
    public void FetchBudgetTypeTable(HttpContext context)
    {
        try
        {
            List<BudgetTypeTableClass> BudgetTypeTableDataList = new List<BudgetTypeTableClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"budgetTypeId\",\"budgetTypeName\",\"underName\",\"budgetUnderId\",\"isDeleted\" from \"budgetTypes\" join \"unders\" on \"budgetTypes\".\"budgetUnderId\"=\"unders\".\"underId\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    BudgetTypeTableClass arr = new BudgetTypeTableClass();
                    arr.BudgetTypeId = Convert.ToInt32(dr["budgetTypeId"]);
                    arr.UnderId = Convert.ToInt32(dr["budgetUnderId"]);
                    arr.BudgetTypeName = dr["budgetTypeName"].ToString();
                    arr.BudgetUnder = dr["underName"].ToString();
                    arr.IsDeleted = Convert.ToInt32(dr["isDeleted"]);
                    BudgetTypeTableDataList.Add(arr);
                }
                string response = GetJson(BudgetTypeTableDataList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class PlannedFundsClass
    {
        public double PlanedFund { get; set; }
    }
    public void FetchPlannedFunds(HttpContext context)
    {
        try
        {
            List<PlannedFundsClass> PlannedFundList = new List<PlannedFundsClass>();
            int FinancialYear = Convert.ToInt32(context.Request["FinancialYear"]);
            int LocalGovernment = Convert.ToInt32(context.Request["LocalGovernment"]);
            string BudgetType = context.Request["BudgetType"].ToString();
            NpgsqlCommand cmd = new NpgsqlCommand();
            if (BudgetType == "Non Wage Recurrent")
            {
                BudgetType = "recurrent";
                cmd = new NpgsqlCommand("select \"recurrent\" from \"budgetPerDistricts\" where \"financialYearId\"=@FinancialYear and \"districtId\"=@LocalGovernment");
            }
            else if (BudgetType == "Development")
            {
                BudgetType = "development";
                cmd = new NpgsqlCommand("select \"development\" from \"budgetPerDistricts\" where \"financialYearId\"=@FinancialYear and \"districtId\"=@LocalGovernment");
            }
            else if (BudgetType == "Sanitation")
            {
                BudgetType = "sanitation";
                cmd = new NpgsqlCommand("select \"sanitation\" from \"budgetPerDistricts\" where \"financialYearId\"=@FinancialYear and \"districtId\"=@LocalGovernment");
            }


            cmd.Parameters.AddWithValue("@BudgetType", BudgetType);
            cmd.Parameters.AddWithValue("@FinancialYear", FinancialYear);
            cmd.Parameters.AddWithValue("@LocalGovernment", LocalGovernment);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    PlannedFundsClass arr = new PlannedFundsClass();
                    if (BudgetType == "recurrent")
                    {
                        arr.PlanedFund = Convert.ToDouble(dr["recurrent"]);
                    }
                    else if (BudgetType == "development")
                    {
                        arr.PlanedFund = Convert.ToDouble(dr["development"]);
                    }
                    else if (BudgetType == "sanitation")
                    {
                        arr.PlanedFund = Convert.ToDouble(dr["sanitation"]);
                    }

                    PlannedFundList.Add(arr);
                }
                string response = GetJson(PlannedFundList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    public class UnderOfCategoryClass
    {
        public int BudgetTypeId { get; set; }
        public string Under { get; set; }
    }
    public void FetchUnderOfCategory(HttpContext context)
    {
        try
        {
            List<UnderOfCategoryClass> UnderOfCategoryList = new List<UnderOfCategoryClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select \"under\",\"budgetTypeId\" from \"categories\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    UnderOfCategoryClass arr = new UnderOfCategoryClass();
                    arr.BudgetTypeId = Convert.ToInt32(dr["budgetTypeId"]);
                    arr.Under = dr["under"].ToString();
                    UnderOfCategoryList.Add(arr);
                }
                string response = GetJson(UnderOfCategoryList);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string response = GetJson(ex.Message);
            context.Response.Write(response);
        }
    }
    //public class ModelActivityOfWorkplanClass
    //{
    //    public string SlNo { get; set; }
    //    public string ModelActivityName { get; set; }
    //}
    //public void FetchModelActivityOfWorkplan(HttpContext context)
    //{
    //    try
    //    {
    //        string ModelActivityFilterByNumber = context.Request["ModelActivityFilterByNumber"];
    //        List<ModelActivityOfWorkplanClass> ModelActivityOfWorkplanList = new List<ModelActivityOfWorkplanClass>();
    //        NpgsqlCommand cmd = new NpgsqlCommand("select \"modelActivityName\",\"sNo\" from public.\"modelActivities\"" +
    //        "join public.\"modelActivityDetails\"" +
    //        "on public.\"modelActivities\".\"modelActivityId\"=public.\"modelActivityDetails\".\"modelActivityId\"" +
    //        "where \"under\" = 'Work plan' and \"sNo\" like @ModelActivityFilterByNumber order by \"sNo\" asc ");
    //        cmd.Parameters.AddWithValue("@ModelActivityFilterByNumber", ModelActivityFilterByNumber);
    //        DataSet ds = ruwasdb.SelectQuery(cmd);
    //        DataTable dt = ds.Tables[0];
    //        if (dt.Rows.Count > 0)
    //        {

    //            foreach (DataRow dr in dt.Rows)
    //            {
    //                ModelActivityOfWorkplanClass arr = new ModelActivityOfWorkplanClass();
    //                arr.SlNo =dr["sNo"].ToString();
    //                arr.ModelActivityName = dr["modelActivityName"].ToString();
    //                ModelActivityOfWorkplanList.Add(arr);
    //            }
    //            string response = GetJson(ModelActivityOfWorkplanList);
    //            context.Response.Write(response);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        string response = GetJson(ex.Message);
    //        context.Response.Write(response);
    //    }


    //}
    //public class ModelActivityOfSanitationClass
    //{
    //    public string SlNo { get; set; }
    //    public string ModelActivityName { get; set; }
    //    //public int ModelActivityFilterByNumber { get; set; }
    //}
    //public void FetchModelActivityOfSanitation(HttpContext context)
    //{
    //    try
    //    {
    //        //string ModelActivityFilterByNumber = context.Request["ModelActivityFilterByNumber"];
    //        List<ModelActivityOfSanitationClass> ModelActivityOfSanitationList = new List<ModelActivityOfSanitationClass>();
    //        NpgsqlCommand cmd = new NpgsqlCommand("select \"modelActivityName\",\"sNo\" from public.\"modelActivities\"" +
    //        "join public.\"modelActivityDetails\"" +
    //        "on public.\"modelActivities\".\"modelActivityId\"=public.\"modelActivityDetails\".\"modelActivityId\"" +
    //        "where \"under\" = 'Sanitation' order by \"sNo\" asc ");
    //         //\"sNo\" like @ModelActivityFilterByNumber and
    //        //cmd.Parameters.AddWithValue("@ModelActivityFilterByNumber", ModelActivityFilterByNumber);
    //        DataSet ds = ruwasdb.SelectQuery(cmd);
    //        DataTable dt = ds.Tables[0];
    //        if (dt.Rows.Count > 0)
    //        {
    //            foreach (DataRow dr in dt.Rows)
    //            {
    //                ModelActivityOfSanitationClass arr = new ModelActivityOfSanitationClass();
    //                arr.SlNo =dr["sNo"].ToString();
    //                arr.ModelActivityName = dr["modelActivityName"].ToString();
    //                ModelActivityOfSanitationList.Add(arr);
    //            }
    //            string response = GetJson(ModelActivityOfSanitationList);
    //            context.Response.Write(response);
    //        }
    //        else
    //        {
    //            string sms = "No Rows Found";
    //            string response = GetJson(sms);
    //            context.Response.Write(response);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        string response = GetJson(ex.Message);
    //        context.Response.Write(response);
    //    }


    //}
    public class AnnualWorkplanDWSCGClass
    {
        public int WorkplanId { get; set; }
        public int SlctFinancialYear { get; set; }
        public int SlctLocalGovernment { get; set; }
        public DateTime DateOfApprovalByCouncil { get; set; }
        public int TxtTotalAnnualBudget { get; set; }
        public int Quarter1Funds { get; set; }
        public int Quarter2Funds { get; set; }
        public int Quarter3Funds { get; set; }
        public int Quarter4Funds { get; set; }
        public int SlctBudgetType { get; set; }
        public List<ModelActivityOfAnnualWorkplanClass> ModelActivityOfAnnualWorkplanList { get; set; }
    }
    public class ModelActivityOfAnnualWorkplanClass
    {
        public int workPlanDetailId { get; set; }
        public string TxtSlNo { get; set; }
        public string TxtModelActivity { get; set; }
        public int TxtApprovalAnnualTarget { get; set; }
        public int TxtQuarter1 { get; set; }
        public int TxtQuarter2 { get; set; }
        public int TxtQuarter3 { get; set; }
        public int TxtQuarter4 { get; set; }
        public int TxtAnnualBudget { get; set; }
        public int TxtUnitCost { get; set; }
        public string TxtComment { get; set; }
    }
    public void SaveAnnualWorkplanDWSCG(string jsonstring, HttpContext context)
    {
        try
        {
            var js = new JavaScriptSerializer();
            AnnualWorkplanDWSCGClass obj = js.Deserialize<AnnualWorkplanDWSCGClass>(jsonstring);
            int FinancialYr = obj.SlctFinancialYear;
            int District = obj.SlctLocalGovernment;
            DateTime DateOfApprovalByCouncil = obj.DateOfApprovalByCouncil;
            int TxtTotalAnnualBudget = obj.TxtTotalAnnualBudget;
            int Quarter1Funds = obj.Quarter1Funds;
            int Quarter2Funds = obj.Quarter2Funds;
            int Quarter3Funds = obj.Quarter3Funds;
            int Quarter4Funds = obj.Quarter4Funds;
            int SlctBudgetType = obj.SlctBudgetType;
            int IsSubmitted = 0;
            int IsAllowedEdit = 0;
            int Level = 0;
            int ReportSubmitted = 0;
            int IsQuarterOneReportSubmitted = 0;
            int IsQuarterTwoReportSubmitted = 0;
            int IsQuarterThreeReportSubmitted = 0;
            int IsQuarterFourReportSubmitted = 0;
            int IsResubmitted = 0;
            NpgsqlCommand cmd = new NpgsqlCommand("insert into \"workPlans\"" +
                "(\"financialYearId\",\"districtId\",\"preparedDate\",\"totalAprovedBudget\"," +
                "\"quarterOneFunds\",\"quarterTwoFunds\",\"quarterThreeFunds\",\"quarterFourFunds\",\"budgetTypeId\"," +
                "\"isSubmitted\",\"isAllowedEdit\",\"level\",\"reportSubmitted\"," +
                "\"isQuarterOneReportSubmitted\",\"isQuarterTwoReportSubmitted\"," +
                "\"isQuarterThreeReportSubmitted\",\"isQuarterFourReportSubmitted\",\"isResubmitted\")" +
                " values(@FinancialYr,@District,@DateOfApprovalByCouncil," +
                "@TxtTotalAnnualBudget,@Quarter1Funds,@Quarter2Funds,@Quarter3Funds,@Quarter4Funds,@SlctBudgetType," +
                "@IsSubmitted,@IsAllowedEdit,@Level,@ReportSubmitted,@IsQuarterOneReportSubmitted," +
                "@IsQuarterTwoReportSubmitted,@IsQuarterThreeReportSubmitted," +
                "@IsQuarterFourReportSubmitted,@IsResubmitted) returning \"workPlanId\"");
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            cmd.Parameters.AddWithValue("@District", District);
            cmd.Parameters.AddWithValue("@DateOfApprovalByCouncil", DateOfApprovalByCouncil);
            cmd.Parameters.AddWithValue("@TxtTotalAnnualBudget", TxtTotalAnnualBudget);
            cmd.Parameters.AddWithValue("@Quarter1Funds", Quarter1Funds);
            cmd.Parameters.AddWithValue("@Quarter2Funds", Quarter2Funds);
            cmd.Parameters.AddWithValue("@Quarter3Funds", Quarter3Funds);
            cmd.Parameters.AddWithValue("@Quarter4Funds", Quarter4Funds);
            cmd.Parameters.AddWithValue("@SlctBudgetType", SlctBudgetType);
            cmd.Parameters.AddWithValue("@IsSubmitted", IsSubmitted);
            cmd.Parameters.AddWithValue("@IsAllowedEdit", IsAllowedEdit);
            cmd.Parameters.AddWithValue("@Level", Level);
            cmd.Parameters.AddWithValue("@ReportSubmitted", ReportSubmitted);
            cmd.Parameters.AddWithValue("@IsQuarterOneReportSubmitted", IsQuarterOneReportSubmitted);
            cmd.Parameters.AddWithValue("@IsQuarterTwoReportSubmitted", IsQuarterTwoReportSubmitted);
            cmd.Parameters.AddWithValue("@IsQuarterThreeReportSubmitted", IsQuarterThreeReportSubmitted);
            cmd.Parameters.AddWithValue("@IsQuarterFourReportSubmitted", IsQuarterFourReportSubmitted);
            cmd.Parameters.AddWithValue("@IsResubmitted", IsResubmitted);
            DataSet ds = ruwasdb.Insert_Return(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    int WorkplanId = Convert.ToInt32(dr["workPlanId"]);
                    foreach (ModelActivityOfAnnualWorkplanClass x in obj.ModelActivityOfAnnualWorkplanList)
                    {
                        string TxtSlNo = x.TxtSlNo;
                        string TxtModelActivity = x.TxtModelActivity;
                        int TxtApprovalAnnualTarget = x.TxtApprovalAnnualTarget;
                        int TxtQuarter1 = x.TxtQuarter1;
                        int TxtQuarter2 = x.TxtQuarter2;
                        int TxtQuarter3 = x.TxtQuarter3;
                        int TxtQuarter4 = x.TxtQuarter4;
                        int TxtAnnualBudget = x.TxtAnnualBudget;
                        int TxtUnitCost = x.TxtUnitCost;
                        string TxtComment = x.TxtComment;
                        int QuarterOneAchieved = 0;
                        int QuarterTwoAchieved = 0;
                        int QuarterThreeAchieved = 0;
                        int QuarterFourAchieved = 0;
                        int QuarterOneExpenditure = 0;
                        int QuarterTwoExpenditure = 0;
                        int QuarterThreeExpenditure = 0;
                        int QuarterFourExpenditure = 0;
                        NpgsqlCommand cmd1 = new NpgsqlCommand("insert into \"workPlanDetails\"" +
                            "(\"workPlanId\",\"sNo\",\"modelActivity\",\"approvedAnnualTarget\",\"quarterOne\"," +
                            "\"quarterTwo\",\"quarterThree\",\"quarterFour\",\"funds\",\"unitCost\",\"comment\",\"quarterOneAchieved\"," +
                            "\"quarterTwoAchieved\",\"quarterThreeAchieved\",\"quarterFourAchieved\",\"quarterOneExpenditure\"," +
                            "\"quarterTwoExpenditure\",\"quarterThreeExpenditure\",\"quarterFourExpenditure\")" +
                            "values (@WorkplanId,@TxtSlNo,@TxtModelActivity,@TxtApprovalAnnualTarget,@TxtQuarter1,@TxtQuarter2," +
                            "@TxtQuarter3,@TxtQuarter4,@TxtAnnualBudget,@TxtUnitCost,@TxtComment,@QuarterOneAchieved," +
                            "@QuarterTwoAchieved,@QuarterThreeAchieved,@QuarterFourAchieved,@QuarterOneExpenditure," +
                            "@QuarterTwoExpenditure,@QuarterThreeExpenditure,@QuarterFourExpenditure)");
                        cmd1.Parameters.AddWithValue("@WorkplanId", WorkplanId);
                        cmd1.Parameters.AddWithValue("@TxtSlNo", TxtSlNo);
                        cmd1.Parameters.AddWithValue("@TxtModelActivity", TxtModelActivity);
                        cmd1.Parameters.AddWithValue("@TxtApprovalAnnualTarget", TxtApprovalAnnualTarget);
                        cmd1.Parameters.AddWithValue("@TxtQuarter1", TxtQuarter1);
                        cmd1.Parameters.AddWithValue("@TxtQuarter2", TxtQuarter2);
                        cmd1.Parameters.AddWithValue("@TxtQuarter3", TxtQuarter3);
                        cmd1.Parameters.AddWithValue("@TxtQuarter4", TxtQuarter4);
                        cmd1.Parameters.AddWithValue("@TxtAnnualBudget", TxtAnnualBudget);
                        cmd1.Parameters.AddWithValue("@TxtUnitCost", TxtUnitCost);
                        cmd1.Parameters.AddWithValue("@TxtComment", TxtComment);
                        cmd1.Parameters.AddWithValue("@QuarterOneAchieved", QuarterOneAchieved);
                        cmd1.Parameters.AddWithValue("@QuarterTwoAchieved", QuarterTwoAchieved);
                        cmd1.Parameters.AddWithValue("@QuarterThreeAchieved", QuarterThreeAchieved);
                        cmd1.Parameters.AddWithValue("@QuarterFourAchieved", QuarterFourAchieved);
                        cmd1.Parameters.AddWithValue("@QuarterOneExpenditure", QuarterOneExpenditure);
                        cmd1.Parameters.AddWithValue("@QuarterTwoExpenditure", QuarterTwoExpenditure);
                        cmd1.Parameters.AddWithValue("@QuarterThreeExpenditure", QuarterThreeExpenditure);
                        cmd1.Parameters.AddWithValue("@QuarterFourExpenditure", QuarterFourExpenditure);
                        ruwasdb.Insert(cmd1);
                    }
                }
                string response = GetJson("Saved Successfully.");
                context.Response.Write(response);
            }
            else
            {
                string response = GetJson("No Data Found.");
                context.Response.Write(response);
            }

        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class AnnualWorkplanDSHCGClass
    {
        public int Sanitation { get; set; }
        public int SlctFinancialYear { get; set; }
        public int SlctLocalGovernment { get; set; }
        public DateTime DateOfApprovalByCouncil { get; set; }
        public int TxtTotalAnnualBudget { get; set; }
        public int Quarter1Funds { get; set; }
        public int Quarter2Funds { get; set; }
        public int Quarter3Funds { get; set; }
        public int Quarter4Funds { get; set; }
        public int SlctBudgetType { get; set; }
        public string Type { get; set; }
        public List<ModelActivityOfAnnualWorkplanDSHCGClass> ModelActivityOfAnnualWorkplanDSHCGList { get; set; }
    }
    public class ModelActivityOfAnnualWorkplanDSHCGClass
    {
        public int SanitationDtlId { get; set; }
        public string TxtSlNo { get; set; }
        public string TxtModelActivity { get; set; }
        public int TxtApprovalAnnualTarget { get; set; }
        public int TxtQuarter1 { get; set; }
        public int TxtQuarter2 { get; set; }
        public int TxtQuarter3 { get; set; }
        public int TxtQuarter4 { get; set; }
        public int TxtAnnualBudget { get; set; }
        public int TxtUnitCost { get; set; }
        public string TxtComment { get; set; }
    }
    public void SaveAnnualWorkplanDSHCG(string jsonstring, HttpContext context)
    {
        try
        {
            var js = new JavaScriptSerializer();
            AnnualWorkplanDSHCGClass obj = js.Deserialize<AnnualWorkplanDSHCGClass>(jsonstring);

            int FinancialYr = obj.SlctFinancialYear;
            int District = obj.SlctLocalGovernment;
            DateTime DateOfApprovalByCouncil = obj.DateOfApprovalByCouncil;
            int TxtTotalAnnualBudget = obj.TxtTotalAnnualBudget;
            int Quarter1Funds = obj.Quarter1Funds;
            int Quarter2Funds = obj.Quarter2Funds;
            int Quarter3Funds = obj.Quarter3Funds;
            int Quarter4Funds = obj.Quarter4Funds;
            int SlctBudgetType = obj.SlctBudgetType;
            int IsSubmitted = 0;
            int IsAllowedEdit = 0;
            int Level = 0;
            int IsReportSubmitted = 0;
            int IsQuarterOneReportSubmitted = 0;
            int IsQuarterTwoReportSubmitted = 0;
            int IsQuarterThreeReportSubmitted = 0;
            int IsQuarterFourReportSubmitted = 0;
            int IsResubmitted = 0;
            string Type = obj.Type;
            NpgsqlCommand cmd = new NpgsqlCommand();
            if (Type == "Save")
            {
                cmd = new NpgsqlCommand("insert into \"sanitations\"" +
                   "(\"financialYearId\",\"districtId\",\"preparedDate\",\"totalAprovedBudget\"," +
                   "\"quarterOneFunds\",\"quarterTwoFunds\",\"quarterThreeFunds\",\"quarterFourFunds\",\"budgetTypeId\"," +
                   "\"isSubmitted\",\"isAllowedEdit\",\"level\",\"isReportSubmitted\"," +
                   "\"isQuarterOneReportSubmitted\",\"isQuarterTwoReportSubmitted\"," +
                   "\"isQuarterThreeReportSubmitted\",\"isQuarterFourReportSubmitted\",\"isResubmitted\")" +
                   " values(@FinancialYr,@District,@DateOfApprovalByCouncil," +
                   "@TxtTotalAnnualBudget,@quarterOneFunds,@Quarter2Funds,@Quarter3Funds,@Quarter4Funds,@SlctBudgetType," +
                   "@IsSubmitted,@IsAllowedEdit,@Level,@IsReportSubmitted,@IsQuarterOneReportSubmitted," +
                   "@IsQuarterTwoReportSubmitted,@IsQuarterThreeReportSubmitted," +
                   "@IsQuarterFourReportSubmitted,@IsResubmitted) returning \"sanitationId\"");
                cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
                cmd.Parameters.AddWithValue("@District", District);
                cmd.Parameters.AddWithValue("@DateOfApprovalByCouncil", DateOfApprovalByCouncil);
                cmd.Parameters.AddWithValue("@TxtTotalAnnualBudget", TxtTotalAnnualBudget);
                cmd.Parameters.AddWithValue("@quarterOneFunds", Quarter1Funds);
                cmd.Parameters.AddWithValue("@Quarter2Funds", Quarter2Funds);
                cmd.Parameters.AddWithValue("@Quarter3Funds", Quarter3Funds);
                cmd.Parameters.AddWithValue("@Quarter4Funds", Quarter4Funds);
                cmd.Parameters.AddWithValue("@SlctBudgetType", SlctBudgetType);
                cmd.Parameters.AddWithValue("@IsSubmitted", IsSubmitted);
                cmd.Parameters.AddWithValue("@IsAllowedEdit", IsAllowedEdit);
                cmd.Parameters.AddWithValue("@Level", Level);
                cmd.Parameters.AddWithValue("@IsReportSubmitted", IsReportSubmitted);
                cmd.Parameters.AddWithValue("@IsQuarterOneReportSubmitted", IsQuarterOneReportSubmitted);
                cmd.Parameters.AddWithValue("@IsQuarterTwoReportSubmitted", IsQuarterTwoReportSubmitted);
                cmd.Parameters.AddWithValue("@IsQuarterThreeReportSubmitted", IsQuarterThreeReportSubmitted);
                cmd.Parameters.AddWithValue("@IsQuarterFourReportSubmitted", IsQuarterFourReportSubmitted);
                cmd.Parameters.AddWithValue("@IsResubmitted", IsResubmitted);
                DataSet ds = ruwasdb.Insert_Return(cmd);
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        int SanitationId = Convert.ToInt32(dr["sanitationId"]);
                        foreach (ModelActivityOfAnnualWorkplanDSHCGClass x in obj.ModelActivityOfAnnualWorkplanDSHCGList)
                        {
                            string TxtSlNo = x.TxtSlNo;
                            string TxtModelActivity = x.TxtModelActivity;
                            int TxtApprovalAnnualTarget = x.TxtApprovalAnnualTarget;
                            int TxtQuarter1 = x.TxtQuarter1;
                            int TxtQuarter2 = x.TxtQuarter2;
                            int TxtQuarter3 = x.TxtQuarter3;
                            int TxtQuarter4 = x.TxtQuarter4;
                            int TxtAnnualBudget = x.TxtAnnualBudget;
                            int TxtUnitCost = x.TxtUnitCost;
                            string TxtComment = x.TxtComment;
                            int QuarterOneAchieved = 0;
                            int QuarterTwoAchieved = 0;
                            int QuarterThreeAchieved = 0;
                            int QuarterFourAchieved = 0;
                            int QuarterOneExpenditure = 0;
                            int QuarterTwoExpenditure = 0;
                            int QuarterThreeExpenditure = 0;
                            int QuarterFourExpenditure = 0;
                            NpgsqlCommand cmd1 = new NpgsqlCommand("insert into \"sanitationDetails\"" +
                                "(\"sanitationId\",\"sNo\",\"modelActivity\",\"approvedAnnualTarget\",\"quarterOne\"," +
                                "\"quarterTwo\",\"quarterThree\",\"quarterFour\",\"funds\",\"unitCost\",\"comment\",\"quarterOneAchieved\"," +
                                "\"quarterTwoAchieved\",\"quarterThreeAchieved\",\"quarterFourAchieved\",\"quarterOneExpenditure\"," +
                                "\"quarterTwoExpenditure\",\"quarterThreeExpenditure\",\"quarterFourExpenditure\")" +
                                "values (@SanitationId,@TxtSlNo,@TxtModelActivity,@TxtApprovalAnnualTarget,@TxtQuarter1,@TxtQuarter2," +
                                "@TxtQuarter3,@TxtQuarter4,@TxtAnnualBudget,@TxtUnitCost,@TxtComment,@QuarterOneAchieved," +
                                "@QuarterTwoAchieved,@QuarterThreeAchieved,@QuarterFourAchieved,@QuarterOneExpenditure," +
                                "@QuarterTwoExpenditure,@QuarterThreeExpenditure,@QuarterFourExpenditure)");
                            cmd1.Parameters.AddWithValue("@SanitationId", SanitationId);
                            cmd1.Parameters.AddWithValue("@TxtSlNo", TxtSlNo);
                            cmd1.Parameters.AddWithValue("@TxtModelActivity", TxtModelActivity);
                            cmd1.Parameters.AddWithValue("@TxtApprovalAnnualTarget", TxtApprovalAnnualTarget);
                            cmd1.Parameters.AddWithValue("@TxtQuarter1", TxtQuarter1);
                            cmd1.Parameters.AddWithValue("@TxtQuarter2", TxtQuarter2);
                            cmd1.Parameters.AddWithValue("@TxtQuarter3", TxtQuarter3);
                            cmd1.Parameters.AddWithValue("@TxtQuarter4", TxtQuarter4);
                            cmd1.Parameters.AddWithValue("@TxtAnnualBudget", TxtAnnualBudget);
                            cmd1.Parameters.AddWithValue("@TxtUnitCost", TxtUnitCost);
                            cmd1.Parameters.AddWithValue("@TxtComment", TxtComment);
                            cmd1.Parameters.AddWithValue("@QuarterOneAchieved", QuarterOneAchieved);
                            cmd1.Parameters.AddWithValue("@QuarterTwoAchieved", QuarterTwoAchieved);
                            cmd1.Parameters.AddWithValue("@QuarterThreeAchieved", QuarterThreeAchieved);
                            cmd1.Parameters.AddWithValue("@QuarterFourAchieved", QuarterFourAchieved);
                            cmd1.Parameters.AddWithValue("@QuarterOneExpenditure", QuarterOneExpenditure);
                            cmd1.Parameters.AddWithValue("@QuarterTwoExpenditure", QuarterTwoExpenditure);
                            cmd1.Parameters.AddWithValue("@QuarterThreeExpenditure", QuarterThreeExpenditure);
                            cmd1.Parameters.AddWithValue("@QuarterFourExpenditure", QuarterFourExpenditure);
                            ruwasdb.Insert(cmd1);
                        }
                    }
                    string response = GetJson("Saved Successfully.");
                    context.Response.Write(response);
                }
            }
            else if (Type == "Update")
            {
                int Sanitation = obj.Sanitation;
                cmd = new NpgsqlCommand("update  \"sanitations\" set" +
                    "\"financialYearId\"=@FinancialYr,\"districtId\"=@District,\"preparedDate\"=@DateOfApprovalByCouncil,\"totalAprovedBudget\"=@TxtTotalAnnualBudget," +
                    "\"quarterOneFunds\"=@quarterOneFunds,\"quarterTwoFunds\"=@Quarter2Funds,\"quarterThreeFunds\"=@Quarter3Funds,\"quarterFourFunds\"=@Quarter4Funds,\"budgetTypeId\"=@SlctBudgetType," +
                    "\"isSubmitted\"=@IsSubmitted,\"isAllowedEdit\"=@IsAllowedEdit,\"level\"=@Level,\"isReportSubmitted\"=@IsReportSubmitted," +
                    "\"isQuarterOneReportSubmitted\"=@IsQuarterOneReportSubmitted,\"isQuarterTwoReportSubmitted\"=@IsQuarterTwoReportSubmitted," +
                    "\"isQuarterThreeReportSubmitted\"=@IsQuarterThreeReportSubmitted,\"isQuarterFourReportSubmitted\"=@IsQuarterFourReportSubmitted,\"isResubmitted\"=@IsResubmitted" +
                    " where \"sanitationId\"=@Sanitation");
                cmd.Parameters.AddWithValue("@Sanitation", Sanitation);
                cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
                cmd.Parameters.AddWithValue("@District", District);
                cmd.Parameters.AddWithValue("@DateOfApprovalByCouncil", DateOfApprovalByCouncil);
                cmd.Parameters.AddWithValue("@TxtTotalAnnualBudget", TxtTotalAnnualBudget);
                cmd.Parameters.AddWithValue("@quarterOneFunds", Quarter1Funds);
                cmd.Parameters.AddWithValue("@Quarter2Funds", Quarter2Funds);
                cmd.Parameters.AddWithValue("@Quarter3Funds", Quarter3Funds);
                cmd.Parameters.AddWithValue("@Quarter4Funds", Quarter4Funds);
                cmd.Parameters.AddWithValue("@SlctBudgetType", SlctBudgetType);
                cmd.Parameters.AddWithValue("@IsSubmitted", IsSubmitted);
                cmd.Parameters.AddWithValue("@IsAllowedEdit", IsAllowedEdit);
                cmd.Parameters.AddWithValue("@Level", Level);
                cmd.Parameters.AddWithValue("@IsReportSubmitted", IsReportSubmitted);
                cmd.Parameters.AddWithValue("@IsQuarterOneReportSubmitted", IsQuarterOneReportSubmitted);
                cmd.Parameters.AddWithValue("@IsQuarterTwoReportSubmitted", IsQuarterTwoReportSubmitted);
                cmd.Parameters.AddWithValue("@IsQuarterThreeReportSubmitted", IsQuarterThreeReportSubmitted);
                cmd.Parameters.AddWithValue("@IsQuarterFourReportSubmitted", IsQuarterFourReportSubmitted);
                cmd.Parameters.AddWithValue("@IsResubmitted", IsResubmitted);
                ruwasdb.Update(cmd);
                if (Sanitation != 0)
                {
                    foreach (ModelActivityOfAnnualWorkplanDSHCGClass x in obj.ModelActivityOfAnnualWorkplanDSHCGList)
                    {
                        int SanitationDtlId = x.SanitationDtlId;
                        string TxtSlNo = x.TxtSlNo;
                        string TxtModelActivity = x.TxtModelActivity;
                        int TxtApprovalAnnualTarget = x.TxtApprovalAnnualTarget;
                        int TxtQuarter1 = x.TxtQuarter1;
                        int TxtQuarter2 = x.TxtQuarter2;
                        int TxtQuarter3 = x.TxtQuarter3;
                        int TxtQuarter4 = x.TxtQuarter4;
                        int TxtAnnualBudget = x.TxtAnnualBudget;
                        int TxtUnitCost = x.TxtUnitCost;
                        string TxtComment = x.TxtComment;
                        int QuarterOneAchieved = 0;
                        int QuarterTwoAchieved = 0;
                        int QuarterThreeAchieved = 0;
                        int QuarterFourAchieved = 0;
                        int QuarterOneExpenditure = 0;
                        int QuarterTwoExpenditure = 0;
                        int QuarterThreeExpenditure = 0;
                        int QuarterFourExpenditure = 0;
                        NpgsqlCommand cmd1 = new NpgsqlCommand("update \"sanitationDetails\" set" +
                            "\"sNo\"=@TxtSlNo,\"modelActivity\"=@TxtModelActivity,\"approvedAnnualTarget\"=@TxtApprovalAnnualTarget,\"quarterOne\"=@TxtQuarter1," +
                            "\"quarterTwo\"=@TxtQuarter2,\"quarterThree\"=@TxtQuarter3,\"quarterFour\"=@TxtQuarter4,\"funds\"=@TxtAnnualBudget,\"unitCost\"=@TxtUnitCost,\"comment\"=@TxtComment,\"quarterOneAchieved\"=@QuarterOneAchieved," +
                            "\"quarterTwoAchieved\"=@QuarterTwoAchieved,\"quarterThreeAchieved\"=@QuarterThreeAchieved,\"quarterFourAchieved\"=@QuarterFourAchieved,\"quarterOneExpenditure\"=@QuarterOneExpenditure," +
                            "\"quarterTwoExpenditure\"=@QuarterTwoExpenditure,\"quarterThreeExpenditure\"=@QuarterThreeExpenditure,\"quarterFourExpenditure\"=@QuarterFourExpenditure where \"sanitationDetailId\"=@SanitationDtlId");
                        cmd1.Parameters.AddWithValue("@SanitationDtlId", SanitationDtlId);
                        cmd1.Parameters.AddWithValue("@TxtSlNo", TxtSlNo);
                        cmd1.Parameters.AddWithValue("@TxtModelActivity", TxtModelActivity);
                        cmd1.Parameters.AddWithValue("@TxtApprovalAnnualTarget", TxtApprovalAnnualTarget);
                        cmd1.Parameters.AddWithValue("@TxtQuarter1", TxtQuarter1);
                        cmd1.Parameters.AddWithValue("@TxtQuarter2", TxtQuarter2);
                        cmd1.Parameters.AddWithValue("@TxtQuarter3", TxtQuarter3);
                        cmd1.Parameters.AddWithValue("@TxtQuarter4", TxtQuarter4);
                        cmd1.Parameters.AddWithValue("@TxtAnnualBudget", TxtAnnualBudget);
                        cmd1.Parameters.AddWithValue("@TxtUnitCost", TxtUnitCost);
                        cmd1.Parameters.AddWithValue("@TxtComment", TxtComment);
                        cmd1.Parameters.AddWithValue("@QuarterOneAchieved", QuarterOneAchieved);
                        cmd1.Parameters.AddWithValue("@QuarterTwoAchieved", QuarterTwoAchieved);
                        cmd1.Parameters.AddWithValue("@QuarterThreeAchieved", QuarterThreeAchieved);
                        cmd1.Parameters.AddWithValue("@QuarterFourAchieved", QuarterFourAchieved);
                        cmd1.Parameters.AddWithValue("@QuarterOneExpenditure", QuarterOneExpenditure);
                        cmd1.Parameters.AddWithValue("@QuarterTwoExpenditure", QuarterTwoExpenditure);
                        cmd1.Parameters.AddWithValue("@QuarterThreeExpenditure", QuarterThreeExpenditure);
                        cmd1.Parameters.AddWithValue("@QuarterFourExpenditure", QuarterFourExpenditure);
                        ruwasdb.Update(cmd1);
                    }
                    string response = GetJson("Updated Successfully.");
                    context.Response.Write(response);
                }
            }
            else
            {
                string response = GetJson("No Data Found.");
                context.Response.Write(response);
            }

        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void UpdateModelActivity(HttpContext context)
    {
        try
        {
            int TxtOrderNo = Convert.ToInt32(context.Request["txtOrderNo"]);
            string TxtSlNo = context.Request["txtSlNo"].ToString();
            string TxtModelActivityName = context.Request["txtModelActivityName"].ToString();
            string TxtModelActivityDescription = context.Request["txtModelActivityDescription"].ToString();
            string TxtUnitsForTarget = context.Request["txtUnitsForTarget"].ToString();
            int TxtModelActivityDetailId = Convert.ToInt32(context.Request["txtModelActivityDetailId"]);
            NpgsqlCommand cmd = new NpgsqlCommand("Update \"modelActivityDetails\" set \"orderNo\"=@TxtOrderNo," +
            "\"sNo\"=@TxtSlNo,\"modelActivityName\"=@TxtModelActivityName,\"modelActivityDescription\"=@TxtModelActivityDescription," +
            "\"unitTarget\"=@TxtUnitsForTarget where \"modelActivityDetailId\"=@TxtModelActivityDetailId");
            cmd.Parameters.AddWithValue("@TxtOrderNo", TxtOrderNo);
            cmd.Parameters.AddWithValue("@TxtSlNo", TxtSlNo);
            cmd.Parameters.AddWithValue("@TxtModelActivityName", TxtModelActivityName);
            cmd.Parameters.AddWithValue("@TxtModelActivityDescription", TxtModelActivityDescription);
            cmd.Parameters.AddWithValue("@TxtUnitsForTarget", TxtUnitsForTarget);
            cmd.Parameters.AddWithValue("@TxtModelActivityDetailId", TxtModelActivityDetailId);
            ruwasdb.Update(cmd);
            string sms = "Updated successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void UpdateCategories(HttpContext context)
    {
        try
        {
            int TxtCategoriesId = Convert.ToInt32(context.Request["txtCategoriesId"]);
            int TxtOrderNumberId = Convert.ToInt32(context.Request["txtOrderNumberId"]);
            string TxtCategoryNameId = context.Request["txtCategoryNameId"].ToString();
            string TxtCategoryInformationId = context.Request["txtCategoryInformationId"].ToString();
            NpgsqlCommand cmd = new NpgsqlCommand("update \"categoryDetails\" set \"orderNo\"=@TxtOrderNumberId," +
                "\"categoryName\"=@TxtCategoryNameId,\"categoryDescription\"=@TxtCategoryInformationId where \"categoryDetailId\"=@TxtCategoriesId");
            cmd.Parameters.AddWithValue("@TxtOrderNumberId", TxtOrderNumberId);
            cmd.Parameters.AddWithValue("@TxtCategoryNameId", TxtCategoryNameId);
            cmd.Parameters.AddWithValue("@TxtCategoryInformationId", TxtCategoryInformationId);
            cmd.Parameters.AddWithValue("@TxtCategoriesId", TxtCategoriesId);
            ruwasdb.Update(cmd);
            string sms = "Updated successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class PReportDWSCGClass
    {
        public int WorkPlanId { get; set; }
        public int WorkPlanDtlId { get; set; }
        public string SlNo { get; set; }
        public string ModelActivity { get; set; }
        public int ApprovalAnnualTarget { get; set; }
        public int QuarterTarget { get; set; }
        public int AnnualBudget { get; set; }
        public int QuarterAchieved { get; set; }
        public int Expanditure { get; set; }
        public int CumulativeExpanditure { get; set; }
        public int CumulativeAchieved { get; set; }
        public string Comments { get; set; }
        public string Title { get; set; }
        public string caoTitle { get; set; }
    }
    public void FetchPReportDWSCG(HttpContext context)
    {
        try
        {
            List<PReportDWSCGClass> PReportDWSCGList = new List<PReportDWSCGClass>();
            int FinancialYr = Convert.ToInt32(context.Request["FinancialYr"]);
            int LocalGV = Convert.ToInt32(context.Request["LocalGovernment"]);
            string Quarter = context.Request["slctQuarter"].ToString();
            NpgsqlCommand cmd = new NpgsqlCommand();
            if (Quarter == "quarterOne")
            {
                cmd = new NpgsqlCommand("select \"workPlanDetails\".\"workPlanId\",\"workPlanDetailId\",\"sNo\",\"quarterOneComment\"," +
                   "\"modelActivity\",\"approvedAnnualTarget\",\"quarterOne\",\"funds\",\"title\",\"caoTitle\"," +
                   "\"quarterOneAchieved\",\"quarterOneExpenditure\" from" +
                   " \"workPlans\" join \"workPlanDetails\" on \"workPlans\".\"workPlanId\" =" +
                   " \"workPlanDetails\".\"workPlanId\" where \"districtId\" = @LocalGV and" +
                   " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
            } else if (Quarter == "quarterTwo")
            {
                cmd = new NpgsqlCommand("select \"workPlanDetails\".\"workPlanId\",\"workPlanDetailId\",\"sNo\",\"quarterTwoComment\"," +
                   "\"modelActivity\",\"approvedAnnualTarget\",\"quarterTwo\",\"funds\",\"quarterOneAchieved\",\"title\",\"caoTitle\"," +
                   "\"quarterTwoAchieved\",\"quarterOneExpenditure\",\"quarterTwoExpenditure\" from" +
                   " \"workPlans\" join \"workPlanDetails\" on \"workPlans\".\"workPlanId\" =" +
                   " \"workPlanDetails\".\"workPlanId\" where \"districtId\" = @LocalGV and" +
                   " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
            } else if (Quarter == "quarterThree")
            {
                cmd = new NpgsqlCommand("select \"workPlanDetails\".\"workPlanId\",\"workPlanDetailId\",\"sNo\",\"quarterThreeComment\"," +
                   "\"modelActivity\",\"approvedAnnualTarget\",\"quarterThree\",\"funds\",\"quarterOneAchieved\",\"title\",\"caoTitle\"," +
                   "\"quarterTwoAchieved\",\"quarterThreeAchieved\",\"quarterOneExpenditure\",\"quarterTwoExpenditure\",\"quarterThreeExpenditure\" from" +
                   " \"workPlans\" join \"workPlanDetails\" on \"workPlans\".\"workPlanId\" =" +
                   " \"workPlanDetails\".\"workPlanId\" where \"districtId\" = @LocalGV and" +
                   " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
            } else if (Quarter == "quarterFour")
            {
                cmd = new NpgsqlCommand("select \"workPlanDetails\".\"workPlanId\",\"workPlanDetailId\",\"sNo\",\"quarterFourComment\"," +
                   "\"modelActivity\",\"approvedAnnualTarget\",\"quarterFour\",\"funds\",\"quarterOneAchieved\",\"title\",\"caoTitle\"," +
                   "\"quarterTwoAchieved\",\"quarterThreeAchieved\",\"quarterFourAchieved\",\"quarterOneExpenditure\",\"quarterTwoExpenditure\",\"quarterThreeExpenditure\",\"quarterFourExpenditure\" from" +
                   " \"workPlans\" join \"workPlanDetails\" on \"workPlans\".\"workPlanId\" =" +
                   " \"workPlanDetails\".\"workPlanId\" where \"districtId\" = @LocalGV and" +
                   " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
            }
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            cmd.Parameters.AddWithValue("@LocalGV", LocalGV);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    PReportDWSCGClass arr = new PReportDWSCGClass();
                    arr.WorkPlanId = Convert.ToInt32(dr["workPlanId"]);
                    arr.WorkPlanDtlId = Convert.ToInt32(dr["workPlanDetailId"]);
                    arr.SlNo = dr["sNo"].ToString();
                    arr.ModelActivity = dr["modelActivity"].ToString();
                    arr.ApprovalAnnualTarget = Convert.ToInt32(dr["approvedAnnualTarget"]);
                    if (Quarter == "quarterOne")
                    {
                        arr.QuarterTarget = Convert.ToInt32(dr["quarterOne"]);
                        arr.QuarterAchieved = Convert.ToInt32(dr["quarterOneAchieved"]);
                        arr.CumulativeAchieved = Convert.ToInt32(dr["quarterOneAchieved"]);
                        arr.Expanditure = Convert.ToInt32(dr["quarterOneExpenditure"]);
                        arr.CumulativeExpanditure = Convert.ToInt32(dr["quarterOneExpenditure"]);
                        arr.Comments = dr["quarterOneComment"].ToString();
                    }
                    else if (Quarter == "quarterTwo")
                    {
                        arr.QuarterTarget = Convert.ToInt32(dr["quarterTwo"]);
                        arr.QuarterAchieved = Convert.ToInt32(dr["quarterTwoAchieved"]);
                        arr.CumulativeAchieved = Convert.ToInt32(dr["quarterOneAchieved"]) + Convert.ToInt32(dr["quarterTwoAchieved"]);
                        arr.Expanditure = Convert.ToInt32(dr["quarterTwoExpenditure"]);
                        arr.CumulativeExpanditure = Convert.ToInt32(dr["quarterOneExpenditure"]) + Convert.ToInt32(dr["quarterTwoExpenditure"]);
                        arr.Comments = dr["quarterTwoComment"].ToString();
                    }
                    else if (Quarter == "quarterThree")
                    {
                        arr.QuarterTarget = Convert.ToInt32(dr["quarterThree"]);
                        arr.QuarterAchieved = Convert.ToInt32(dr["quarterThreeAchieved"]);
                        arr.CumulativeAchieved = Convert.ToInt32(dr["quarterOneAchieved"]) + Convert.ToInt32(dr["quarterTwoAchieved"]) + Convert.ToInt32(dr["quarterThreeAchieved"]);
                        arr.Expanditure = Convert.ToInt32(dr["quarterThreeExpenditure"]);
                        arr.CumulativeExpanditure = Convert.ToInt32(dr["quarterOneExpenditure"]) + Convert.ToInt32(dr["quarterTwoExpenditure"]) + Convert.ToInt32(dr["quarterThreeExpenditure"]);
                        arr.Comments = dr["quarterThreeComment"].ToString();
                    }
                    else if (Quarter == "quarterFour")
                    {
                        arr.QuarterTarget = Convert.ToInt32(dr["quarterFour"]);
                        arr.QuarterAchieved = Convert.ToInt32(dr["quarterFourAchieved"]);
                        arr.CumulativeAchieved = Convert.ToInt32(dr["quarterOneAchieved"]) + Convert.ToInt32(dr["quarterTwoAchieved"]) + Convert.ToInt32(dr["quarterThreeAchieved"]) + Convert.ToInt32(dr["quarterFourAchieved"]);
                        arr.Expanditure = Convert.ToInt32(dr["quarterFourExpenditure"]);
                        arr.CumulativeExpanditure = Convert.ToInt32(dr["quarterOneExpenditure"]) + Convert.ToInt32(dr["quarterTwoExpenditure"]) + Convert.ToInt32(dr["quarterThreeExpenditure"]) + Convert.ToInt32(dr["quarterFourExpenditure"]);
                        arr.Comments = dr["quarterFourComment"].ToString();
                    }
                    arr.AnnualBudget = Convert.ToInt32(dr["funds"]);
                    arr.Title = dr["title"].ToString();
                    arr.caoTitle = dr["caoTitle"].ToString();
                    PReportDWSCGList.Add(arr);
                }
                string response = GetJson(PReportDWSCGList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class UpdatePRDWSCGClass
    {
        public int txtWorkplan { get; set; }
        public string txtTitle { get; set; }
        public string txtCaoLetter { get; set; }
        public string slctQuarter { get; set; }
        public List<ModelActivityOfDWSCGClass> ModelActivityOfDWSCG { get; set; }
    }
    public class ModelActivityOfDWSCGClass
    {
        public int WorkplanDtlId { get; set; }
        public int QuarterAchived { get; set; }
        public int Expanditure { get; set; }
        public string Comments { get; set; }
    }
    public void UpdatePRDWSCG(string jsonstring, HttpContext context)
    {
        try
        {
            var js = new JavaScriptSerializer();
            UpdatePRDWSCGClass obj = js.Deserialize<UpdatePRDWSCGClass>(jsonstring);
            int Workplan = obj.txtWorkplan;
            string Title = obj.txtTitle;
            string CaoLetter = obj.txtCaoLetter;
            string Quarter = obj.slctQuarter;
            NpgsqlCommand cmd = new NpgsqlCommand("update \"workPlans\" set " +
                "\"title\"=@Title,\"caoTitle\"=@CaoLetter where \"workPlanId\"=@Workplan");
            cmd.Parameters.AddWithValue("@Workplan", Workplan);
            cmd.Parameters.AddWithValue("@Title", Title);
            cmd.Parameters.AddWithValue("@CaoLetter", CaoLetter);
            ruwasdb.Update(cmd);
            if (Workplan != 0)
            {
                foreach (ModelActivityOfDWSCGClass x in obj.ModelActivityOfDWSCG)
                {
                    int WorkplanDtlId = x.WorkplanDtlId;
                    int QuarterAchived = x.QuarterAchived;
                    int Expanditure = x.Expanditure;
                    string Comments = x.Comments;
                    NpgsqlCommand cmd1 = new NpgsqlCommand();
                    if (Quarter == "quarterOne") {
                        cmd1 = new NpgsqlCommand("update \"workPlanDetails\" set " +
                        "\"quarterOneAchieved\"=@QuarterAchived,\"quarterOneExpenditure\"=@Expanditure,\"quarterOneComment\"=@Comments where \"workPlanDetailId\"=@WorkplanDtlId ");
                    }
                    else if (Quarter == "quarterTwo") {
                        cmd1 = new NpgsqlCommand("update \"workPlanDetails\" set " +
                    "\"quarterTwoAchieved\"=@QuarterAchived,\"quarterTwoExpenditure\"=@Expanditure,\"quarterTwoComment\"=@Comments where \"workPlanDetailId\"=@WorkplanDtlId ");
                    }
                    else if (Quarter == "quarterThree")
                    {
                        cmd1 = new NpgsqlCommand("update \"workPlanDetails\" set " +
                        "\"quarterThreeAchieved\"=@QuarterAchived,\"quarterThreeExpenditure\"=@Expanditure,\"quarterThreeComment\"=@Comments where \"workPlanDetailId\"=@WorkplanDtlId ");
                    }
                    else if (Quarter == "quarterFour")
                    {
                        cmd1 = new NpgsqlCommand("update \"workPlanDetails\" set " +
                        "\"quarterFourAchieved\"=@QuarterAchived,\"quarterFourExpenditure\"=@Expanditure,\"quarterFourComment\"=@Comments where \"workPlanDetailId\"=@WorkplanDtlId ");
                    }
                    cmd1.Parameters.AddWithValue("@WorkplanDtlId", WorkplanDtlId);
                    cmd1.Parameters.AddWithValue("@QuarterAchived", QuarterAchived);
                    cmd1.Parameters.AddWithValue("@Expanditure", Expanditure);
                    cmd1.Parameters.AddWithValue("@Comments", Comments);
                    ruwasdb.Update(cmd1);
                }
                string response = GetJson("Updated Successfully.");
                context.Response.Write(response);
            }
            else
            {
                string response = GetJson("No Data Found.");
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class UpdatePRDSHCGClass
    {
        public int SanitationId { get; set; }
        public string Title { get; set; }
        public string Quarter { get; set; }
        public List<ModelActivutyOfDSHCGClass> ModelActivutyOfDSHCG { get; set; }
    }
    public class ModelActivutyOfDSHCGClass
    {
        public int SanitationDtlId { get; set; }
        public int QuarterAchived { get; set; }
        public int Expanditure { get; set; }
        public string Comment { get; set; }
    }
    public void UpdatePRDSHCG(string jsonstring ,HttpContext context)
    {
        try { 
        var js = new JavaScriptSerializer();
        UpdatePRDSHCGClass Obj = js.Deserialize<UpdatePRDSHCGClass>(jsonstring);
        int SanitationId = Obj.SanitationId;
        string Title = Obj.Title;
        string Quarter = Obj.Quarter;
        NpgsqlCommand cmd = new NpgsqlCommand("update \"sanitations\" set \"title\"=@Title where \"sanitationId\"=@SanitationId");
        cmd.Parameters.AddWithValue("@Title", Title);
        cmd.Parameters.AddWithValue("@SanitationId", SanitationId);
        ruwasdb.Update(cmd);
        if (SanitationId != 0)
        {
            foreach(ModelActivutyOfDSHCGClass x in Obj.ModelActivutyOfDSHCG)
            {
                int SanitationDtlId = x.SanitationDtlId;
                int QuarterAchived = x.QuarterAchived;
                int Expanditure = x.Expanditure;
                string Comments = x.Comment;
                NpgsqlCommand cmd1 = new NpgsqlCommand();
                if (Quarter == "quarterOne")
                {
                    cmd1 = new NpgsqlCommand("update \"sanitationDetails\" set " +
                    "\"quarterOneAchieved\"=@QuarterAchived,\"quarterOneExpenditure\"=@Expanditure,\"quarterOneComment\"=@Comments where \"sanitationDetailId\"=@SanitationDtlId ");
                }
                else if (Quarter == "quarterTwo")
                {
                    cmd1 = new NpgsqlCommand("update \"sanitationDetails\" set " +
                "\"quarterTwoAchieved\"=@QuarterAchived,\"quarterTwoExpenditure\"=@Expanditure,\"quarterTwoComment\"=@Comments where \"sanitationDetailId\"=@SanitationDtlId ");
                }
                else if (Quarter == "quarterThree")
                {
                    cmd1 = new NpgsqlCommand("update \"sanitationDetails\" set " +
                    "\"quarterThreeAchieved\"=@QuarterAchived,\"quarterThreeExpenditure\"=@Expanditure,\"quarteThreeComment\"=@Comments where \"sanitationDetailId\"=@SanitationDtlId ");
                }
                else if (Quarter == "quarterFour")
                {
                    cmd1 = new NpgsqlCommand("update \"sanitationDetails\" set " +
                    "\"quarterFourAchieved\"=@QuarterAchived,\"quarterFourExpenditure\"=@Expanditure,\"quarterFourComment\"=@Comments where \"sanitationDetailId\"=@SanitationDtlId ");
                }
                cmd1.Parameters.AddWithValue("@SanitationDtlId", SanitationDtlId);
                cmd1.Parameters.AddWithValue("@QuarterAchived", QuarterAchived);
                cmd1.Parameters.AddWithValue("@Expanditure", Expanditure);
                cmd1.Parameters.AddWithValue("@Comments", Comments);
                ruwasdb.Update(cmd1);
            }
                string response = GetJson("Updated Successfully.");
                context.Response.Write(response);
            }
            else
            {
                string response = GetJson("No Data Found.");
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class FetchPReportDSHCGClass
    {
        public int Sanitation { get; set; }
        public int SanitationDtl { get; set; }
        public string SlNo { get; set; }
        public string ModelActivity { get; set; }
        public int ApprovalAnnualTarget { get; set; }
        public int QuarterTarget { get; set; }
        public int AnnualBudget { get; set; }
        public int QuarterAchieved { get; set; }
        public int CumulativeAchieved { get; set; }
        public int Expanditure { get; set; }
        public int CumulativeExpanditure { get; set; }
        public string Comments { get; set; }
        public string Title { get; set; }
    }
    public void FetchPReportDSHCG(HttpContext context)
    {
        try
        {
            List<FetchPReportDSHCGClass> FetchPReportDSHCGList = new List<FetchPReportDSHCGClass>();
            int FinancialYr = Convert.ToInt32(context.Request["FinancialYr"]);
            int LocalGV = Convert.ToInt32(context.Request["LocalGovernment"]);
            string Quarter = context.Request["slctQuarter"].ToString();
            NpgsqlCommand cmd = new NpgsqlCommand();
            if (Quarter == "quarterOne")
            {
                cmd = new NpgsqlCommand("select \"sanitationDetails\".\"sanitationId\",\"sanitationDetailId\",\"sNo\",\"title\"," +
                   "\"modelActivity\",\"approvedAnnualTarget\",\"quarterOne\",\"funds\",\"quarterOneAchieved\",\"quarterOneExpenditure\",\"quarterOneComment\" from" +
                   " \"sanitations\" join \"sanitationDetails\" on \"sanitations\".\"sanitationId\" =" +
                   " \"sanitationDetails\".\"sanitationId\" where \"districtId\" = @LocalGV and" +
                   " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
            }
            else if (Quarter == "quarterTwo")
            {
                cmd = new NpgsqlCommand("select \"sanitationDetails\".\"sanitationId\",\"sanitationDetailId\",\"sNo\",\"title\"," +
                   "\"modelActivity\",\"approvedAnnualTarget\",\"quarterTwo\",\"funds\"," +
                   "\"quarterOneAchieved\",\"quarterTwoAchieved\"," +
                   "\"quarterOneExpenditure\",\"quarterTwoExpenditure\",\"quarterTwoComment\" from" +
                   " \"sanitations\" join \"sanitationDetails\" on \"sanitations\".\"sanitationId\" =" +
                   " \"sanitationDetails\".\"sanitationId\" where \"districtId\" = @LocalGV and" +
                   " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
            }
            else if (Quarter == "quarterThree")
            {
                cmd = new NpgsqlCommand("select \"sanitationDetails\".\"sanitationId\",\"sanitationDetailId\",\"sNo\",\"title\"," +
                   " \"modelActivity\",\"approvedAnnualTarget\",\"quarterThree\",\"funds\"," +
                   "\"quarterOneAchieved\",\"quarterTwoAchieved\",\"quarterThreeAchieved\"," +
                   "\"quarterOneExpenditure\",\"quarterTwoExpenditure\",\"quarterThreeExpenditure\",\"quarteThreeComment\" from" +
                   " \"sanitations\" join \"sanitationDetails\" on \"sanitations\".\"sanitationId\" =" +
                   " \"sanitationDetails\".\"sanitationId\" where \"districtId\" = @LocalGV and" +
                   " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
            }
            else if (Quarter == "quarterFour")
            {
                cmd = new NpgsqlCommand("select \"sanitationDetails\".\"sanitationId\",\"sanitationDetailId\",\"sNo\",\"title\"," +
                   "\"modelActivity\",\"approvedAnnualTarget\",\"quarterFour\",\"funds\"," +
                   "\"quarterOneAchieved\",\"quarterTwoAchieved\",\"quarterThreeAchieved\",\"quarterFourAchieved\"," +
                   "\"quarterOneExpenditure\",\"quarterTwoExpenditure\",\"quarterThreeExpenditure\",\"quarterFourExpenditure\",\"quarterFourComment\" from" +
                   " \"sanitations\" join \"sanitationDetails\" on \"sanitations\".\"sanitationId\" =" +
                   " \"sanitationDetails\".\"sanitationId\" where \"districtId\" = @LocalGV and" +
                   " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
            }
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            cmd.Parameters.AddWithValue("@LocalGV", LocalGV);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    FetchPReportDSHCGClass arr = new FetchPReportDSHCGClass();
                    arr.Sanitation = Convert.ToInt32(dr["sanitationId"]);
                    arr.SanitationDtl = Convert.ToInt32(dr["sanitationDetailId"]);
                    arr.SlNo = dr["sNo"].ToString();
                    arr.ModelActivity = dr["modelActivity"].ToString();
                    arr.ApprovalAnnualTarget = Convert.ToInt32(dr["approvedAnnualTarget"]);
                    arr.Title = dr["title"].ToString();
                    if (Quarter == "quarterOne")
                    {
                        arr.QuarterTarget = Convert.ToInt32(dr["quarterOne"]);
                        arr.QuarterAchieved = Convert.ToInt32(dr["quarterOneAchieved"]);
                        arr.CumulativeAchieved = Convert.ToInt32(dr["quarterOneAchieved"]);
                        arr.Expanditure = Convert.ToInt32(dr["quarterOneExpenditure"]);
                        arr.CumulativeExpanditure = Convert.ToInt32(dr["quarterOneExpenditure"]);
                        arr.Comments = dr["quarterOneComment"].ToString();
                    }
                    else if (Quarter == "quarterTwo")
                    {
                        arr.QuarterTarget = Convert.ToInt32(dr["quarterTwo"]);
                        arr.QuarterAchieved = Convert.ToInt32(dr["quarterTwoAchieved"]);
                        arr.CumulativeAchieved = Convert.ToInt32(dr["quarterOneAchieved"]) + Convert.ToInt32(dr["quarterTwoAchieved"]);
                        arr.Expanditure = Convert.ToInt32(dr["quarterTwoExpenditure"]);
                        arr.CumulativeExpanditure = Convert.ToInt32(dr["quarterOneExpenditure"]) + Convert.ToInt32(dr["quarterTwoExpenditure"]);
                        arr.Comments = dr["quarterTwoComment"].ToString();
                    }
                    else if (Quarter == "quarterThree")
                    {
                        arr.QuarterTarget = Convert.ToInt32(dr["quarterThree"]);
                        arr.QuarterAchieved = Convert.ToInt32(dr["quarterThreeAchieved"]);
                        arr.CumulativeAchieved = Convert.ToInt32(dr["quarterOneAchieved"]) + Convert.ToInt32(dr["quarterTwoAchieved"]) + Convert.ToInt32(dr["quarterThreeAchieved"]);
                        arr.Expanditure = Convert.ToInt32(dr["quarterThreeExpenditure"]);
                        arr.CumulativeExpanditure= Convert.ToInt32(dr["quarterOneExpenditure"]) + Convert.ToInt32(dr["quarterTwoExpenditure"])+ Convert.ToInt32(dr["quarterThreeExpenditure"]);
                        arr.Comments = dr["quarteThreeComment"].ToString();
                    }
                    else if (Quarter == "quarterFour")
                    {
                        arr.QuarterTarget = Convert.ToInt32(dr["quarterFour"]);
                        arr.QuarterAchieved = Convert.ToInt32(dr["quarterFourAchieved"]);
                        arr.CumulativeAchieved = Convert.ToInt32(dr["quarterOneAchieved"]) + Convert.ToInt32(dr["quarterTwoAchieved"]) + Convert.ToInt32(dr["quarterThreeAchieved"])+ Convert.ToInt32(dr["quarterFourAchieved"]);
                        arr.Expanditure = Convert.ToInt32(dr["quarterFourExpenditure"]);
                        arr.CumulativeExpanditure = Convert.ToInt32(dr["quarterOneExpenditure"]) + Convert.ToInt32(dr["quarterTwoExpenditure"]) + Convert.ToInt32(dr["quarterThreeExpenditure"])+ Convert.ToInt32(dr["quarterFourExpenditure"]);
                        arr.Comments = dr["quarterFourComment"].ToString();
                    }
                    arr.AnnualBudget = Convert.ToInt32(dr["funds"]);
                    FetchPReportDSHCGList.Add(arr);
                }
                string response = GetJson(FetchPReportDSHCGList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    //public class FetchPReportDSHCGClass
    //{
    //    public int Sanitation { get; set; }
    //    public int SanitationDetailId { get; set; }
    //    public string SlNo { get; set; }
    //    public string ModelActivity { get; set; }
    //    public int ApprovalAnnualTarget { get; set; }
    //    public int QuarterTarget1 { get; set; }
    //    public int QuarterTarget2 { get; set; }
    //    public int QuarterTarget3 { get; set; }
    //    public int QuarterTarget4 { get; set; }
    //    public int AnnualBudget { get; set; }
    //    public int QuarterAchieved1 { get; set; }
    //    public int QuarterAchieved2 { get; set; }
    //    public int QuarterAchieved3 { get; set; }
    //    public int QuarterAchieved4 { get; set; }
    //    public int Expanditure1 { get; set; }
    //    public int Expanditure2 { get; set; }
    //    public int Expanditure3 { get; set; }
    //    public int Expanditure4 { get; set; }
    //    public string Comment1 { get; set; }
    //    public string Comment2 { get; set; }
    //    public string Comment3 { get; set; }
    //    public string Comment4 { get; set; }
    //    public string Title { get; set; }
    //}
    //public void FetchPReportDSHCG(HttpContext context)
    //{
    //    try
    //    {
    //        List<FetchPReportDSHCGClass> FetchPReportDSHCGList = new List<FetchPReportDSHCGClass>();
    //        int FinancialYr = Convert.ToInt32(context.Request["FinancialYr"]);
    //        int LocalGV = Convert.ToInt32(context.Request["LocalGovernment"]);
    //        string Quarter = context.Request["slctQuarter"].ToString();
    //        NpgsqlCommand cmd = new NpgsqlCommand();
    //        cmd = new NpgsqlCommand("select \"sanitationDetailId\",\"sanitationDetails\".\"sanitationId\",\"title\",\"sNo\"," +
    //           " \"modelActivity\",\"approvedAnnualTarget\",\"quarterOne\",\"quarterTwo\",\"quarterThree\",\"quarterFour\"," +
    //           " \"funds\",\"quarterOneAchieved\",\"quarterTwoAchieved\",\"quarterThreeAchieved\",\"quarterFourAchieved\"," +
    //           " \"quarterOneExpenditure\",\"quarterTwoExpenditure\",\"quarterThreeExpenditure\",\"quarterFourExpenditure\"," +
    //           " \"quarterOneComment\",\"quarterTwoComment\",\"quarteThreeComment\",\"quarterFourComment\" from" +
    //           " \"sanitations\" join \"sanitationDetails\" on \"sanitations\".\"sanitationId\" =" +
    //           " \"sanitationDetails\".\"sanitationId\" where \"districtId\" = @LocalGV and" +
    //           " \"financialYearId\" = @FinancialYr and \"approvedAnnualTarget\" not in (0) order by \"sNo\" asc");
    //        cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
    //        cmd.Parameters.AddWithValue("@LocalGV", LocalGV);
    //        DataSet ds = ruwasdb.SelectQuery(cmd);
    //        DataTable dt = ds.Tables[0];
    //        if (dt.Rows.Count > 0)
    //        {
    //            foreach (DataRow dr in dt.Rows)
    //            {
    //                FetchPReportDSHCGClass arr = new FetchPReportDSHCGClass();
    //                arr.SlNo = dr["sNo"].ToString();
    //                arr.ModelActivity = dr["modelActivity"].ToString();
    //                arr.ApprovalAnnualTarget = Convert.ToInt32(dr["approvedAnnualTarget"]);
    //                arr.QuarterTarget1 = Convert.ToInt32(dr["quarterOne"]);
    //                arr.QuarterTarget2 = Convert.ToInt32(dr["quarterTwo"]);
    //                arr.QuarterTarget3 = Convert.ToInt32(dr["quarterThree"]);
    //                arr.QuarterTarget4 = Convert.ToInt32(dr["quarterFour"]);
    //                arr.QuarterAchieved1 = Convert.ToInt32(dr["quarterOneAchieved"]);
    //                arr.QuarterAchieved2 = Convert.ToInt32(dr["quarterTwoAchieved"]);
    //                arr.QuarterAchieved3 = Convert.ToInt32(dr["quarterThreeAchieved"]);
    //                arr.QuarterAchieved4 = Convert.ToInt32(dr["quarterFourAchieved"]);
    //                arr.Expanditure1 = Convert.ToInt32(dr["quarterOneExpenditure"]);
    //                arr.Expanditure2 = Convert.ToInt32(dr["quarterTwoExpenditure"]);
    //                arr.Expanditure3 = Convert.ToInt32(dr["quarterThreeExpenditure"]);
    //                arr.Expanditure4 = Convert.ToInt32(dr["quarterFourExpenditure"]);
    //                arr.AnnualBudget = Convert.ToInt32(dr["funds"]);
    //                arr.Comment1 = dr["quarterOneComment"].ToString();
    //                arr.Comment2 = dr["quarterTwoComment"].ToString();
    //                arr.Comment3 = dr["quarteThreeComment"].ToString();
    //                arr.Comment4 = dr["quarterFourComment"].ToString();
    //                arr.Title = dr["title"].ToString();
    //                FetchPReportDSHCGList.Add(arr);
    //            }
    //            string response = GetJson(FetchPReportDSHCGList);
    //            context.Response.Write(response);
    //        }
    //        else
    //        {
    //            string sms = "No Rows Found";
    //            string response = GetJson(sms);
    //            context.Response.Write(response);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        string msg = ex.Message;
    //        string response = GetJson(msg);
    //        context.Response.Write(response);
    //    }
    //}
    public void UpdateBudgetType(HttpContext context)
    {
        try
        {
            var BudgetTypeId = Convert.ToInt32(context.Request["BudgetTypeId"]);
            var BudgetType = context.Request["BudgetType"].ToString();
            var UnderId = Convert.ToInt32(context.Request["UnderId"]);
            var IsDisabled = Convert.ToInt32(context.Request["IsDisabled"]);
            NpgsqlCommand cmd = new NpgsqlCommand("update \"budgetTypes\" set \"budgetTypeName\"=@BudgetType," +
                "\"budgetUnderId\"=@UnderId,\"isDeleted\"=@IsDisabled where \"budgetTypeId\"=@BudgetTypeId");
            cmd.Parameters.AddWithValue("@BudgetTypeId", BudgetTypeId);
            cmd.Parameters.AddWithValue("@BudgetType", BudgetType);
            cmd.Parameters.AddWithValue("@UnderId", UnderId);
            cmd.Parameters.AddWithValue("@IsDisabled", IsDisabled);
            ruwasdb.Update(cmd);
            string sms = "Updated Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }

    }
    public void UpdateTeachnology(HttpContext context)
    {
        try
        {
            int TeachnologyId = Convert.ToInt32(context.Request["TeachnologyId"]);
            string TeachnologyName = context.Request["TeachnologyName"].ToString();
            double PopulationServed = Convert.ToDouble(context.Request["PopulationServed"]);
            NpgsqlCommand cmd = new NpgsqlCommand("update \"technologies\" set \"technologyName\"=@TeachnologyName," +
                "\"populationServed\"=@PopulationServed where \"technologyId\"=@TeachnologyId");
            cmd.Parameters.AddWithValue("@TeachnologyName", TeachnologyName);
            cmd.Parameters.AddWithValue("@PopulationServed", PopulationServed);
            cmd.Parameters.AddWithValue("@TeachnologyId", TeachnologyId);
            ruwasdb.Update(cmd);
            string sms = "Updated Successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class CStatusClass
    {
        public int CStatusId { get; set; }
        public string CStatusName { get; set; }
    }
    public void FetchCStatus(HttpContext context)
    {
        try
        {
            List<CStatusClass> CStatusList = new List<CStatusClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select * from \"cstatuses\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    CStatusClass arr = new CStatusClass();
                    arr.CStatusId = Convert.ToInt32(dr["cstatusId"]);
                    arr.CStatusName = dr["contractStatusName"].ToString();
                    CStatusList.Add(arr);
                    
                }
                string response = GetJson(CStatusList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class FetchLCOfRWSRCClass
    {
        public int LCId { get; set; }
        public string LCName { get; set; }
    }
    public void FetchLCOfRWSRC(HttpContext context)
    {
        try
        {
            List<FetchLCOfRWSRCClass> FetchLCOfRWSRCList = new List<FetchLCOfRWSRCClass>();
            int RWSRCId = Convert.ToInt32(context.Request["RWSRC"]);
            NpgsqlCommand cmd = new NpgsqlCommand("select \"districtId\",\"districtName\" from \"districts\" where \"rwsrcId\"=@RWSRCId order by \"districtName\" asc");
            cmd.Parameters.AddWithValue("@RWSRCId", RWSRCId);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    FetchLCOfRWSRCClass arr = new FetchLCOfRWSRCClass();
                    arr.LCId = Convert.ToInt32(dr["districtId"]);
                    arr.LCName = dr["districtName"].ToString();
                    FetchLCOfRWSRCList.Add(arr);
                }
                string response = GetJson(FetchLCOfRWSRCList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class ModelActivityNumberClass
    {
        public string SlNo { get; set; }
    }
    public void ModelActivityNumber(HttpContext context)
    {
        try
        {
            List<ModelActivityNumberClass> ModelActivityNumberList = new List<ModelActivityNumberClass>();
            NpgsqlCommand cmd = new NpgsqlCommand("select distinct left(\"sNo\",1) from \"modelActivityDetails\"");
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    ModelActivityNumberClass arr = new ModelActivityNumberClass();
                    arr.SlNo = dr["left"].ToString();
                    ModelActivityNumberList.Add(arr);
                }
                string response = GetJson(ModelActivityNumberList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class GetWorkplanIdOfSanitationsClass
    {
        public int SanitationDtlId { get; set; }
        public string SlNo { get; set; }
        public string ModelActivity { get; set; }
        public int ApprovalAnualTargrt { get; set; }
        public int Quarter1 { get; set; }
        public int Quarter2 { get; set; }
        public int Quarter3 { get; set; }
        public int Quarter4 { get; set; }
        public int AnnualBudget { get; set; }
        public int UnitCost { get; set; }
        public int SanitationId { get; set; }
        public string Comment { get; set; }
        public string BudgetTypeId { get; set; }
        public string TotalAprovedBudget { get; set; }
        public string PreparedDate { get; set; }
    }
    public void GetWorkplanIdOfSanitations(HttpContext context)
    {
        try
        {
            var FinancialYear = Convert.ToInt32(context.Request["FinancialYear"]);
            var LocalGovernment = Convert.ToInt32(context.Request["LocalGovernment"]);
            NpgsqlCommand cmd = new NpgsqlCommand("select \"sanitationId\",\"preparedDate\",\"totalAprovedBudget\",\"budgetTypeId\" from \"sanitations\" where \"financialYearId\"=@FinancialYear and \"districtId\"=@LocalGovernment");
            cmd.Parameters.AddWithValue("@FinancialYear", FinancialYear);
            cmd.Parameters.AddWithValue("@LocalGovernment", LocalGovernment);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    List<GetWorkplanIdOfSanitationsClass> GetWorkplanIdOfSanitationsList = new List<GetWorkplanIdOfSanitationsClass>();
                    int SanitationId = Convert.ToInt32(dr["sanitationId"]);
                    string budgetTypeId = dr["budgetTypeId"].ToString();
                    string TotalAprovedBudget =dr["totalAprovedBudget"].ToString();
                    string PreparedDate = dr["preparedDate"].ToString();
                    NpgsqlCommand cmd1 =new NpgsqlCommand("select * from \"sanitationDetails\" where \"sanitationId\"=@SanitationId");
                    cmd1.Parameters.AddWithValue("@SanitationId", SanitationId);
                    DataSet ds1 = ruwasdb.SelectQuery(cmd1);
                    DataTable dt1 = ds1.Tables[0];
                    if (dt1.Rows.Count > 0)
                    {
                        foreach(DataRow dr1 in dt1.Rows)
                        {
                            GetWorkplanIdOfSanitationsClass arr = new GetWorkplanIdOfSanitationsClass();
                            arr.SanitationDtlId = Convert.ToInt32(dr1["sanitationDetailId"]);
                            arr.SlNo = dr1["sNo"].ToString();
                            arr.ModelActivity = dr1["modelActivity"].ToString();
                            arr.ApprovalAnualTargrt = Convert.ToInt32(dr1["approvedAnnualTarget"]);
                            arr.Quarter1 = Convert.ToInt32(dr1["quarterOne"]);
                            arr.Quarter2 = Convert.ToInt32(dr1["quarterTwo"]);
                            arr.Quarter3 = Convert.ToInt32(dr1["quarterThree"]);
                            arr.Quarter4 = Convert.ToInt32(dr1["quarterFour"]);
                            arr.AnnualBudget = Convert.ToInt32(dr1["funds"]);
                            arr.UnitCost = Convert.ToInt32(dr1["unitCost"]);
                            arr.Comment = dr1["comment"].ToString();
                            arr.SanitationId = SanitationId;
                            arr.BudgetTypeId = budgetTypeId;
                            arr.TotalAprovedBudget = TotalAprovedBudget;
                            arr.PreparedDate = Convert.ToDateTime(PreparedDate).ToString("yyyy-MM-dd");
                            GetWorkplanIdOfSanitationsList.Add(arr);
                        }
                        string response = GetJson(GetWorkplanIdOfSanitationsList);
                        context.Response.Write(response);
                    }
                   
                }
            }
            else
            {
                string msg = "No Rows Found";
                string response = GetJson(msg);
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class GetWorkplanIdOfWorkplansClass
    {
        public int workPlanDetailId { get; set; }
        public string SlNo { get; set; }
        public string ModelActivity { get; set; }
        public int ApprovalAnualTargrt { get; set; }
        public int Quarter1 { get; set; }
        public int Quarter2 { get; set; }
        public int Quarter3 { get; set; }
        public int Quarter4 { get; set; }
        public int AnnualBudget { get; set; }
        public int UnitCost { get; set; }
        public string Comment { get; set; }
        public int WorkplanId { get; set; }
        public string BudgetTypeId { get; set; }
        public double TotalAprovedBudget { get; set; }
        public string PreparedDate { get; set; }
    }
    public void GetWorkplanIdOfWorkplans(HttpContext context)
    {
        try
        {
            var FinancialYear = Convert.ToInt32(context.Request["FinancialYear"]);
            var LocalGovernment = Convert.ToInt32(context.Request["LocalGovernment"]);
            NpgsqlCommand cmd = new NpgsqlCommand("select \"workPlanId\",\"preparedDate\",\"totalAprovedBudget\",\"budgetTypeId\" from \"workPlans\" where \"financialYearId\"=@FinancialYear and \"districtId\"=@LocalGovernment");
            cmd.Parameters.AddWithValue("@FinancialYear", FinancialYear);
            cmd.Parameters.AddWithValue("@LocalGovernment", LocalGovernment);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    List<GetWorkplanIdOfWorkplansClass> GetWorkplanIdOfWorkplansList = new List<GetWorkplanIdOfWorkplansClass>();
                    int workplanId = Convert.ToInt32(dr["workPlanId"]);
                    string budgetTypeId = dr["budgetTypeId"].ToString();
                    double TotalAprovedBudget = Convert.ToDouble(dr["totalAprovedBudget"]);
                    string PreparedDate = dr["preparedDate"].ToString();
                    NpgsqlCommand cmd1 =new NpgsqlCommand("select * from \"workPlanDetails\" where \"workPlanId\"=@workplanId");
                    cmd1.Parameters.AddWithValue("@workplanId", workplanId);
                    DataSet ds1 = ruwasdb.SelectQuery(cmd1);
                    DataTable dt1 = ds1.Tables[0];
                    if (dt1.Rows.Count > 0)
                    {
                        foreach(DataRow dr1 in dt1.Rows)
                        {
                            GetWorkplanIdOfWorkplansClass arr = new GetWorkplanIdOfWorkplansClass();
                            arr.workPlanDetailId = Convert.ToInt32(dr1["workPlanDetailId"]);
                            arr.SlNo = dr1["sNo"].ToString();
                            arr.ModelActivity = dr1["modelActivity"].ToString();
                            arr.ApprovalAnualTargrt = Convert.ToInt32(dr1["approvedAnnualTarget"]);
                            arr.Quarter1 = Convert.ToInt32(dr1["quarterOne"]);
                            arr.Quarter2 = Convert.ToInt32(dr1["quarterTwo"]);
                            arr.Quarter3 = Convert.ToInt32(dr1["quarterThree"]);
                            arr.Quarter4 = Convert.ToInt32(dr1["quarterFour"]);
                            arr.AnnualBudget = Convert.ToInt32(dr1["funds"]);
                            arr.UnitCost = Convert.ToInt32(dr1["unitCost"]);
                            arr.Comment = dr1["comment"].ToString();
                            arr.WorkplanId = workplanId;
                            arr.BudgetTypeId = budgetTypeId;
                            arr.TotalAprovedBudget = TotalAprovedBudget;
                            arr.PreparedDate = Convert.ToDateTime(PreparedDate).ToString("yyyy-MM-dd");
                            GetWorkplanIdOfWorkplansList.Add(arr);
                        }
                        string response = GetJson(GetWorkplanIdOfWorkplansList);
                        context.Response.Write(response);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class FundsRecivedDWSCGClass
    {
        public int FundsRecived { get; set; }
    }
    public void FundsRecivedDWSCG(HttpContext context)
    {
        try
        {
            List<FundsRecivedDWSCGClass> FundsRecivedDWSCGList = new List<FundsRecivedDWSCGClass>();
            int FinancialYr = Convert.ToInt32(context.Request["FinancialYr"]);
            int LocalGV = Convert.ToInt32(context.Request["LocalGovernment"]);
            string Quarter = context.Request["slctQuarter"].ToString();
            NpgsqlCommand cmd = new NpgsqlCommand();
            if (Quarter== "quarterOne") { 
             cmd = new NpgsqlCommand("select \"quarterOneFunds\" from \"workPlans\" where \"districtId\" = @LocalGV and \"financialYearId\" = @FinancialYr");
                
            }else if (Quarter== "quarterTwo") { 
             cmd = new NpgsqlCommand("select \"quarterTwoFunds\" from \"workPlans\" where \"districtId\" = @LocalGV and \"financialYearId\" = @FinancialYr");
                
            }else if (Quarter== "quarterThree") { 
             cmd = new NpgsqlCommand("select \"quarterThreeFunds\" from \"workPlans\" where \"districtId\" = @LocalGV and \"financialYearId\" = @FinancialYr");
                
            }else if (Quarter== "quarterFour") { 
             cmd = new NpgsqlCommand("select \"quarterFourFunds\" from \"workPlans\" where \"districtId\" = @LocalGV and \"financialYearId\" = @FinancialYr");
                
            }
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            cmd.Parameters.AddWithValue("@LocalGV", LocalGV);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    FundsRecivedDWSCGClass arr = new FundsRecivedDWSCGClass();
                    if (Quarter == "quarterOne")
                    {
                        arr.FundsRecived = Convert.ToInt32(dr["quarterOneFunds"]);
                    }
                    else if (Quarter == "quarterTwo")
                    {
                        arr.FundsRecived = Convert.ToInt32(dr["quarterTwoFunds"]);
                    }
                    else if (Quarter == "quarterThree")
                    {
                        arr.FundsRecived = Convert.ToInt32(dr["quarterThreeFunds"]);
                    }
                    else if (Quarter == "quarterFour")
                    {
                        arr.FundsRecived = Convert.ToInt32(dr["quarterFourFunds"]);
                    }
                        FundsRecivedDWSCGList.Add(arr);
                }
                string response = GetJson(FundsRecivedDWSCGList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }

        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public class FundsRecivedDSHCGClass
    {
        public int FundsRecived { get; set; }
    }
    public void FundsRecivedDSHCG(HttpContext context)
    {
        try
        {
            List<FundsRecivedDSHCGClass> FundsRecivedDSHCGList = new List<FundsRecivedDSHCGClass>();
            int FinancialYr = Convert.ToInt32(context.Request["FinancialYr"]);
            int LocalGV = Convert.ToInt32(context.Request["LocalGovernment"]);
            string Quarter = context.Request["slctQuarter"].ToString();
            NpgsqlCommand cmd = new NpgsqlCommand();
            if (Quarter== "quarterOne") { 
             cmd = new NpgsqlCommand("select \"quarterOneFunds\" from \"sanitations\" where \"districtId\" = @LocalGV and \"financialYearId\" = @FinancialYr");
                
            }else if (Quarter== "quarterTwo") { 
             cmd = new NpgsqlCommand("select \"quarterTwoFunds\" from \"sanitations\" where \"districtId\" = @LocalGV and \"financialYearId\" = @FinancialYr");
                
            }else if (Quarter== "quarterThree") { 
             cmd = new NpgsqlCommand("select \"quarterThreeFunds\" from \"sanitations\" where \"districtId\" = @LocalGV and \"financialYearId\" = @FinancialYr");
                
            }else if (Quarter== "quarterFour") { 
             cmd = new NpgsqlCommand("select \"quarterFourFunds\" from \"sanitations\" where \"districtId\" = @LocalGV and \"financialYearId\" = @FinancialYr");
                
            }
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            cmd.Parameters.AddWithValue("@LocalGV", LocalGV);
            DataSet ds = ruwasdb.SelectQuery(cmd);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    FundsRecivedDSHCGClass arr = new FundsRecivedDSHCGClass();
                    if (Quarter == "quarterOne")
                    {
                        arr.FundsRecived = Convert.ToInt32(dr["quarterOneFunds"]);
                    }
                    else if (Quarter == "quarterTwo")
                    {
                        arr.FundsRecived = Convert.ToInt32(dr["quarterTwoFunds"]);
                    }
                    else if (Quarter == "quarterThree")
                    {
                        arr.FundsRecived = Convert.ToInt32(dr["quarterThreeFunds"]);
                    }
                    else if (Quarter == "quarterFour")
                    {
                        arr.FundsRecived = Convert.ToInt32(dr["quarterFourFunds"]);
                    }
                        FundsRecivedDSHCGList.Add(arr);
                }
                string response = GetJson(FundsRecivedDSHCGList);
                context.Response.Write(response);
            }
            else
            {
                string sms = "No Rows Found";
                string response = GetJson(sms);
                context.Response.Write(response);
            }

        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void UpdateAnnualWorkplanDWSCG(string jsonstring,HttpContext context)
    {
        try
        {
            var js = new JavaScriptSerializer();
            AnnualWorkplanDWSCGClass obj = js.Deserialize<AnnualWorkplanDWSCGClass>(jsonstring);
            int WorkplanId = obj.WorkplanId;
            int FinancialYr = obj.SlctFinancialYear;
            int District = obj.SlctLocalGovernment;
            DateTime DateOfApprovalByCouncil = obj.DateOfApprovalByCouncil;
            int TxtTotalAnnualBudget = obj.TxtTotalAnnualBudget;
            int Quarter1Funds = obj.Quarter1Funds;
            int Quarter2Funds = obj.Quarter2Funds;
            int Quarter3Funds = obj.Quarter3Funds;
            int Quarter4Funds = obj.Quarter4Funds;
            int SlctBudgetType = obj.SlctBudgetType;
            int IsSubmitted = 0;
            int IsAllowedEdit = 0;
            int Level = 0;
            int ReportSubmitted = 0;
            int IsQuarterOneReportSubmitted = 0;
            int IsQuarterTwoReportSubmitted = 0;
            int IsQuarterThreeReportSubmitted = 0;
            int IsQuarterFourReportSubmitted = 0;
            int IsResubmitted = 0;
            NpgsqlCommand cmd = new NpgsqlCommand("Update \"workPlans\" set " +
                "\"financialYearId\"=@FinancialYr,\"districtId\"=@District,\"preparedDate\"=@DateOfApprovalByCouncil,\"totalAprovedBudget\"=@TxtTotalAnnualBudget," +
                "\"quarterOneFunds\"=@Quarter1Funds,\"quarterTwoFunds\"=@Quarter2Funds,\"quarterThreeFunds\"=@Quarter3Funds,\"quarterFourFunds\"=@Quarter4Funds,\"budgetTypeId\"=@SlctBudgetType," +
                "\"isSubmitted\"=@IsSubmitted,\"isAllowedEdit\"=@IsAllowedEdit,\"level\"=@Level,\"reportSubmitted\"=@ReportSubmitted," +
                "\"isQuarterOneReportSubmitted\"=@IsQuarterOneReportSubmitted,\"isQuarterTwoReportSubmitted\"=@IsQuarterTwoReportSubmitted," +
                "\"isQuarterThreeReportSubmitted\"=@IsQuarterThreeReportSubmitted,\"isQuarterFourReportSubmitted\"=@IsQuarterFourReportSubmitted,\"isResubmitted\"=@IsResubmitted" +
                " where \"workPlanId\"=@WorkplanId");
            cmd.Parameters.AddWithValue("@WorkplanId", WorkplanId);
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            cmd.Parameters.AddWithValue("@District", District);
            cmd.Parameters.AddWithValue("@DateOfApprovalByCouncil", DateOfApprovalByCouncil);
            cmd.Parameters.AddWithValue("@TxtTotalAnnualBudget", TxtTotalAnnualBudget);
            cmd.Parameters.AddWithValue("@Quarter1Funds", Quarter1Funds);
            cmd.Parameters.AddWithValue("@Quarter2Funds", Quarter2Funds);
            cmd.Parameters.AddWithValue("@Quarter3Funds", Quarter3Funds);
            cmd.Parameters.AddWithValue("@Quarter4Funds", Quarter4Funds);
            cmd.Parameters.AddWithValue("@SlctBudgetType", SlctBudgetType);
            cmd.Parameters.AddWithValue("@IsSubmitted", IsSubmitted);
            cmd.Parameters.AddWithValue("@IsAllowedEdit", IsAllowedEdit);
            cmd.Parameters.AddWithValue("@Level", Level);
            cmd.Parameters.AddWithValue("@ReportSubmitted", ReportSubmitted);
            cmd.Parameters.AddWithValue("@IsQuarterOneReportSubmitted", IsQuarterOneReportSubmitted);
            cmd.Parameters.AddWithValue("@IsQuarterTwoReportSubmitted", IsQuarterTwoReportSubmitted);
            cmd.Parameters.AddWithValue("@IsQuarterThreeReportSubmitted", IsQuarterThreeReportSubmitted);
            cmd.Parameters.AddWithValue("@IsQuarterFourReportSubmitted", IsQuarterFourReportSubmitted);
            cmd.Parameters.AddWithValue("@IsResubmitted", IsResubmitted);
            ruwasdb.Update(cmd);
            if (WorkplanId!=0) {
                foreach (ModelActivityOfAnnualWorkplanClass x in obj.ModelActivityOfAnnualWorkplanList)
                {
                    int workPlanDetailId = x.workPlanDetailId;
                    string TxtSlNo = x.TxtSlNo;
                    string TxtModelActivity = x.TxtModelActivity;
                    int TxtApprovalAnnualTarget = x.TxtApprovalAnnualTarget;
                    int TxtQuarter1 = x.TxtQuarter1;
                    int TxtQuarter2 = x.TxtQuarter2;
                    int TxtQuarter3 = x.TxtQuarter3;
                    int TxtQuarter4 = x.TxtQuarter4;
                    int TxtAnnualBudget = x.TxtAnnualBudget;
                    int TxtUnitCost = x.TxtUnitCost;
                    string TxtComment = x.TxtComment;
                    int QuarterOneAchieved = 0;
                    int QuarterTwoAchieved = 0;
                    int QuarterThreeAchieved = 0;
                    int QuarterFourAchieved = 0;
                    int QuarterOneExpenditure = 0;
                    int QuarterTwoExpenditure = 0;
                    int QuarterThreeExpenditure = 0;
                    int QuarterFourExpenditure = 0;
                    NpgsqlCommand cmd1 = new NpgsqlCommand("Update \"workPlanDetails\" set " +
                        "\"workPlanId\"=@WorkplanId,\"sNo\"=@TxtSlNo,\"modelActivity\"=@TxtModelActivity,\"approvedAnnualTarget\"=@TxtApprovalAnnualTarget,\"quarterOne\"=@TxtQuarter1," +
                        "\"quarterTwo\"=@TxtQuarter2,\"quarterThree\"=@TxtQuarter3,\"quarterFour\"=@TxtQuarter4,\"funds\"=@TxtAnnualBudget,\"unitCost\"=@TxtUnitCost,\"comment\"=@TxtComment,\"quarterOneAchieved\"=@QuarterOneAchieved," +
                        "\"quarterTwoAchieved\"=@QuarterTwoAchieved,\"quarterThreeAchieved\"=@QuarterThreeAchieved,\"quarterFourAchieved\"=@QuarterFourAchieved,\"quarterOneExpenditure\"=@QuarterOneExpenditure," +
                        "\"quarterTwoExpenditure\"=@QuarterTwoExpenditure,\"quarterThreeExpenditure\"=@QuarterThreeExpenditure,\"quarterFourExpenditure\"=@QuarterFourExpenditure where \"workPlanDetailId\"=@workPlanDetailId");
                    cmd1.Parameters.AddWithValue("@workPlanDetailId", workPlanDetailId);
                    cmd1.Parameters.AddWithValue("@WorkplanId", WorkplanId);
                    cmd1.Parameters.AddWithValue("@TxtSlNo", TxtSlNo);
                    cmd1.Parameters.AddWithValue("@TxtModelActivity", TxtModelActivity);
                    cmd1.Parameters.AddWithValue("@TxtApprovalAnnualTarget", TxtApprovalAnnualTarget);
                    cmd1.Parameters.AddWithValue("@TxtQuarter1", TxtQuarter1);
                    cmd1.Parameters.AddWithValue("@TxtQuarter2", TxtQuarter2);
                    cmd1.Parameters.AddWithValue("@TxtQuarter3", TxtQuarter3);
                    cmd1.Parameters.AddWithValue("@TxtQuarter4", TxtQuarter4);
                    cmd1.Parameters.AddWithValue("@TxtAnnualBudget", TxtAnnualBudget);
                    cmd1.Parameters.AddWithValue("@TxtUnitCost", TxtUnitCost);
                    cmd1.Parameters.AddWithValue("@TxtComment", TxtComment);
                    cmd1.Parameters.AddWithValue("@QuarterOneAchieved", QuarterOneAchieved);
                    cmd1.Parameters.AddWithValue("@QuarterTwoAchieved", QuarterTwoAchieved);
                    cmd1.Parameters.AddWithValue("@QuarterThreeAchieved", QuarterThreeAchieved);
                    cmd1.Parameters.AddWithValue("@QuarterFourAchieved", QuarterFourAchieved);
                    cmd1.Parameters.AddWithValue("@QuarterOneExpenditure", QuarterOneExpenditure);
                    cmd1.Parameters.AddWithValue("@QuarterTwoExpenditure", QuarterTwoExpenditure);
                    cmd1.Parameters.AddWithValue("@QuarterThreeExpenditure", QuarterThreeExpenditure);
                    cmd1.Parameters.AddWithValue("@QuarterFourExpenditure", QuarterFourExpenditure);
                    ruwasdb.Update(cmd1);
                }
                string response = GetJson("Updated Successfully.");
                context.Response.Write(response);
                
            }
            else
            {
                string response = GetJson("No Data Found.");
                context.Response.Write(response);
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    
            
    }
    public void UpdateFinancialYr(HttpContext context)
    {
        try
        {
            int FinancialYr = Convert.ToInt32(context.Request["FinancialYr"]);
            int ActiveYr = Convert.ToInt32(context.Request["ActiveYr"]);
            NpgsqlCommand cmd=new NpgsqlCommand("update \"financialYears\" set" +
                "\"isActiveYear\"=@ActiveYr where \"financialYearId\"=@FinancialYr");
            cmd.Parameters.AddWithValue("@FinancialYr", FinancialYr);
            cmd.Parameters.AddWithValue("@ActiveYr", ActiveYr);
            ruwasdb.Update(cmd);
            string sms = "Updated successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void UpdateFundingSource(HttpContext context)
    {
        try
        {
            int FundingSourceId = Convert.ToInt32(context.Request["FundingSourceId"]);
            int chkDisabled = Convert.ToInt32(context.Request["chkDisabled"]);
            NpgsqlCommand cmd = new NpgsqlCommand("update \"fundingSources\" set" +
                "\"isDeleted\"=@chkDisabled where \"fundingSourceId\"=@FundingSourceId");
            cmd.Parameters.AddWithValue("@FundingSourceId", FundingSourceId);
            cmd.Parameters.AddWithValue("@chkDisabled", chkDisabled);
            ruwasdb.Update(cmd);
            string sms = "Updated successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void UpdateDistrict(HttpContext context)
    {
        try {
            int DistrictId = Convert.ToInt32(context.Request["DistrictId"]);
            int IsDeleted = Convert.ToInt32(context.Request["IsDeleted"]);
            string Vote = context.Request["Vote"].ToString();
            int Rwsrc = Convert.ToInt32(context.Request["Rwsrc"]);
            NpgsqlCommand cmd = new NpgsqlCommand("update \"districts\" set" +
                "\"isDeleted\"=@IsDeleted,\"vote\"=@Vote," +
                "\"rwsrcId\"=@Rwsrc where \"districtId\"=@DistrictId");
            cmd.Parameters.AddWithValue("@DistrictId", DistrictId);
            cmd.Parameters.AddWithValue("@IsDeleted", IsDeleted);
            cmd.Parameters.AddWithValue("@Vote", Vote);
            cmd.Parameters.AddWithValue("@Rwsrc", Rwsrc);
            ruwasdb.Update(cmd);
            string sms = "Updated successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }
    public void UpdateContract(HttpContext context)
    {
        try
        {
            int ContractDtl = Convert.ToInt32(context.Request["ContractDtl"]);
            string NameOfContractop = context.Request["NameOfContractopr"].ToString();
            string ContractorCountry = context.Request["ContractorCountry"].ToString();
            string DescriptionGoods = context.Request["DescriptionGoods"].ToString();
            int ContractSum = Convert.ToInt32(context.Request["ContractSum"]);
            int AnnualPaymenttUnderContract = Convert.ToInt32(context.Request["AnnualPaymenttUnderContract"]);
            int slctStatus = Convert.ToInt32(context.Request["slctStatus"]);
            NpgsqlCommand cmd = new NpgsqlCommand("update \"contractDetails\" set " +
                "\"contractorName\"=@NameOfContractop,\"contractorCountry\"=@ContractorCountry,\"descriptionGoods\"=@DescriptionGoods," +
                "\"contractSum\"=@ContractSum,\"annualPaymenttUnderContract\"=@AnnualPaymenttUnderContract," +
                "\"cstatusId\"=@slctStatus where \"contractDetailId\"=@ContractDtl");
            cmd.Parameters.AddWithValue("@ContractDtl", ContractDtl);
            cmd.Parameters.AddWithValue("@NameOfContractop", NameOfContractop);
            cmd.Parameters.AddWithValue("@ContractorCountry", ContractorCountry);
            cmd.Parameters.AddWithValue("@DescriptionGoods", DescriptionGoods);
            cmd.Parameters.AddWithValue("@ContractSum", ContractSum);
            cmd.Parameters.AddWithValue("@AnnualPaymenttUnderContract", AnnualPaymenttUnderContract);
            cmd.Parameters.AddWithValue("@slctStatus", slctStatus);
            ruwasdb.Update(cmd);
            string sms = "Updated successfully";
            string response = GetJson(sms);
            context.Response.Write(response);
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            string response = GetJson(msg);
            context.Response.Write(response);
        }
    }

}
