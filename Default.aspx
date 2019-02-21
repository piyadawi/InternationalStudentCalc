<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="InterStudentVisaCalc.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet"/>
    <script src="Scripts/canvasjs.min.js"></script>
    <script src="Scripts/chartScript.js"></script>


    <title></title>
    </head>
<body>
    <div class="container heading">
        <div class="model text-center">
         <h1>International Student Application for UK visa Calculator 2019-2020</h1>
          <h3>Enter your estimated expenses below and click the calculate button at the bottom to get the the cost of your application shown in a chart.</h3>
        </div>
    </div>
    <br />
    <%--End of heading--%>
    <hr class="top"/>
    <form id="form1" runat="server" class="form-horizontal">
        <div class="container content">
        <br />
            <div class="row">
                <asp:ValidationSummary ID="vs" runat="server" CssClass="alert-danger" HeaderText="Enter only digits in the following fields:" 
                BorderStyle="Solid" BorderWidth="2px" BorderColor="Red" />
                <br />  
                   <%-- <div class="col-md-6">--%>
                        <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                            <%--<asp:Label ID="lbCourseFee" runat="server" Text="Course Fee"></asp:Label>--%>
                                <label class="control-label">Course Fee</label>
                            </div>            
                            <div class="col-md-6">
                                <asp:TextBox ID="tbCourseFee" CssClass="form-control txtBox" runat="server" Width="120px"></asp:TextBox>
                                <asp:CompareValidator ID="cpvCourseFee" runat="server" ControlToValidate="tbCourseFee" Type="Currency" Operator="DataTypeCheck" Text="*" ErrorMessage="CourseFee" Display="Static" CssClass="alert-danger"></asp:CompareValidator>
                               
                            </div>
                        </div>
                        <br />
                                                      

                        <div class="row">    
                            <div class="col-md-4 col-md-offset-1">
                            <%--<asp:Label ID="lbVisaFee" runat="server" Text="Visa Fee"></asp:Label>--%>
                                <label class="control-label">Visa Fee</label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="tbVisaFee" CssClass="form-control txtBox" runat="server" Width="120px" MaxLength="10"></asp:TextBox>
                                <asp:CompareValidator ID="cpvVisaFee" runat="server" controlToValidate="tbVisaFee"  Type="Currency"
                                Operator="DataTypeCheck" Text="" ErrorMessage="VisaFee" Display="Static" CssClass="alert-danger"></asp:CompareValidator>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                            <%--<asp:Label ID="lbIHealthS" runat="server" Text="Immigration Health Surcharge (IHS)"></asp:Label>--%>
                                <label class="control-label">IHS Fee</label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="tbIHealthS" CssClass="form-control txtBox" runat="server" Width="120px"></asp:TextBox> 
                                <asp:CompareValidator ID="cpvIHealthS" runat="server" controlToValidate="tbIHealthS"  Type="Currency"
                                Operator="DataTypeCheck" Text="" ErrorMessage="International Health Surcharge" Display="Static" CssClass="alert-danger"></asp:CompareValidator>
                            </div>            
                        </div>
                        <div class="badge">
                            <asp:Label ID="Label1" runat="server" Text="*Immigration Health Surcharge (IHS) Currently £150 for each period of 12 months."></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                            <%--<asp:Label ID="lbIOMTest" runat="server" Text="I.O.M. Test Fee"></asp:Label>--%>
                                <label class="control-label">I.O.M. Test Fee</label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="tbIOMTest" CssClass="form-control txtBox" runat="server" Width="120px"></asp:TextBox>
                                <asp:CompareValidator ID="cpvIOMTest" runat="server" controlToValidate="tbIOMTest"  Type="Currency"
                                Operator="DataTypeCheck" Text="" ErrorMessage="I.O.M. Fee" Display="Static" CssClass="alert-danger"></asp:CompareValidator>
                            </div>         
                        </div>
                        <br />
                        <div class="badge">
                            <asp:Label ID="Label3" runat="server" Text="*For a study period more than 6 months in some countries"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                                <label class="control-label">Flight</label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="tbFlight" CssClass="form-control txtBox" runat="server" Width="120px"></asp:TextBox>
                                <asp:CompareValidator ID="cpvFlight" runat="server" ControlToValidate="tbFlight" Type="Currency"
                                     Operator="DataTypeCheck" Text="" ErrorMessage="Flight" Display="Static" CssClass="alert-danger"></asp:CompareValidator>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                                <label class="control-label">Miscellaneous</label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="tbMisc" CssClass="form-control txtBox" runat="server" Width="120px"></asp:TextBox>
                                <asp:CompareValidator ID="cpvMisc" runat="server" ControlToValidate="tbMisc"  Type="Currency"
                           Operator="DataTypeCheck" Text="" ErrorMessage="Miscellaneous" Display="Static" CssClass="alert-danger"></asp:CompareValidator>
                            </div>
                        </div>
                        <br />
                    
                <hr />
                <%--living cost section--%>
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="lbCostsOfLiving0" runat="server" Text="Costs of Living**"></asp:Label>
                                </div>
                            <div class="row">
                                <div class="col-md-9">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" style="font-size: medium">
                                        <asp:ListItem>Leave To Enter</asp:ListItem> 
                                        <asp:ListItem>Leave to Remain</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-9">
                                    <asp:Panel ID="LeaveToEnterPanel" runat="server" Visible="false">
                                        <asp:DropDownList ID="ddListLeaveToEnter" runat="server" OnSelectedIndexChanged="ddListLeaveToEnter_SelectedIndexChanged">
                                            <asp:ListItem>Please choose a location</asp:ListItem>
                                            <asp:ListItem Value="InsideLondon">Living Inside London</asp:ListItem>
                                            <asp:ListItem Value="OutsideLondon">Living Outside London</asp:ListItem>
                                        </asp:DropDownList> 
                                        <asp:DropDownList ID="ddListMonths" runat="server" OnSelectedIndexChanged="ddListMonths_SelectedIndexChanged">
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="6">6</asp:ListItem>
                                            <asp:ListItem Value="7">7</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                            <asp:ListItem Value="9">More than 9</asp:ListItem>
                                        </asp:DropDownList>
                                    <asp:Label ID="lbMonth" runat="server" Text="Months"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label4" runat="server" Text="*If in case your study time is more than 9 months, count just 9 months as maximum is required. "></asp:Label>
                                    </asp:Panel>
                                </div>
                           </div>
                           <div class="row">
                               <div class="col-md-9">
                                   <asp:Panel ID="LeaveToRemainPanel" runat="server"  Visible="false">
                                        <asp:DropDownList ID="ddListLeaveToRemain" runat="server" OnSelectedIndexChanged="ddListLeaveToRemain_SelectedIndexChanged">
                                            <asp:ListItem>Please choose a location</asp:ListItem>
                                            <asp:ListItem Value="InsideLondon">Living Inside London</asp:ListItem>
                                            <asp:ListItem Value="OutsideLondon">Living Outside London</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                   <asp:Label ID="Label2" runat="server" Text="*The Home Office requires a minimum of 2 months of Living Costs for Leave to Remain Applicants"></asp:Label>
                                   </asp:Panel>
                                </div>
                           </div>
                           <br />

                           <div class="badge">
                               <div class="col-md-4">
                                    <p>**Costs Of Living<br />
                                    -£1,265 per month for living costs if you are studying in London for the majority of your study<br /> (more than 50% of your study time)<br /><br />
                                    -£1,015 per month for living costs if you are studying outside London or anywhere else in the UK<br /> for the majority of your study (more than 50% of your study time)
                                    <br />"Requirement from Home Office"
                                    </p>     
                                </div>
                           </div>
                            <br />
                            <br />

                           <div class="row">
                               <div class="col-md-4 col-md-offset-5">
                                    <asp:Button ID="btCalculator" runat="server" Text="Calculate" cssclass="btn-primary" OnClick="btCalculator_Click"/>
                               </div>
                           </div>
                    </div>
                <%--</div>--%>
                <div>
                    <asp:Label ID="errorInfo" runat="server" Text="Label"></asp:Label>
                    <br />
                    <p id="chartData"></p>
                    <br />
                    <br />
                </div>
               <%-- chart secter--%>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <div id="chartContainer" style="height: 400px; width: 80%;">
                                    <div id="chartPlaceholder"></div>
                                    <div id="noDataPlaceholder" class="h1"></div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                                <asp:label ID="lblChartType" runat="server" Visible="False">Change chart type</asp:label>
                            </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddListChart" runat="server" OnSelectedIndexChanged="ddListChart_SelectedIndexChanged" Visible="False" CausesValidation="True">
                                <asp:ListItem Selected="True" Value="bar">Bar</asp:ListItem>
                                <asp:ListItem Value="pie">Pie</asp:ListItem>
                                <asp:ListItem Value="column">Column</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        </div>
                    </div>
                <%--<asp:HyperLink ID="linkToSource" runat="server" NavigateUrl="https://www.gov.uk/tier-4-general-visa" Target="_blank" Visible="false">Home Office Requirements</asp:HyperLink>--%>
            </div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.gov.uk/tier-4-general-visa" Target="_blank">Home Office Requirements</asp:HyperLink>
        </div>

        <footer>
            <div class="container footer">
                    <p>&copy; 2018 International Student Application for UK Visa Calculator &middot;</p>
            </div>
        </footer>
    </form>
</body>
</html>
