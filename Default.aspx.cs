using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InterStudentVisaCalc
{
    public partial class Default : System.Web.UI.Page
    {
        double courseFee;
        double visaFee;
        double IHealthSurcharge;
        double iomTest;
        double flightCosts;
        double miscCosts;

        double costsOfLivingRemainInsideLondon = 2530;
        double costsOfLivingRemainOutsideLondon = 2030;
        double costsOfLivingEnterInsideLondon = 1265;
        double costsOfLivingEnterOutsideLondon = 1015;
        double livingCosts;
        double livingCostsMonths;
        double applicationFee;
        double total;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "Leave To Enter")
            {
                LeaveToEnterPanel.Visible = true;
                LeaveToRemainPanel.Visible = false;

            }
            else
            {
                LeaveToRemainPanel.Visible = true;
                LeaveToEnterPanel.Visible = false;
            }

        }

        protected void ddListLeaveToEnter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddListLeaveToEnter.SelectedValue == "InsideLondon")
            {
                livingCosts = costsOfLivingEnterInsideLondon * livingCostsMonths;
            }
            else
            {
                livingCosts = costsOfLivingEnterOutsideLondon * livingCostsMonths;
            }
        }


        protected void ddListMonths_SelectedIndexChanged(object sender, EventArgs e)
        {

            livingCostsMonths = Convert.ToDouble(ddListMonths.SelectedValue);
        }

        protected void ddListLeaveToRemain_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddListLeaveToEnter.SelectedValue == "InsideLondon")
            {
                livingCosts = costsOfLivingRemainInsideLondon;
            }
            else
            {
                livingCosts = costsOfLivingRemainOutsideLondon;
            }
        }

        protected void btCalculator_Click(object sender, EventArgs e)
        {
            //moved from ddListMonths_SelectedIndexChanged event handler
            //livingCostsMonths = Convert.ToDouble(ddListMonths.SelectedValue);

            //moved from ddListLeaveToEnter_SelectedIndexChanged event handler
            if (ddListLeaveToEnter.SelectedValue == "InsideLondon")
            {
                livingCosts = costsOfLivingEnterInsideLondon * livingCostsMonths;
            }
            else if (ddListLeaveToEnter.SelectedValue == "OutsideLondon")
            {
                livingCosts = costsOfLivingEnterOutsideLondon * livingCostsMonths;
            }
            //moved (and corrected) from ddListLeaveToRemain_SelectedIndexChanged event handler
            if (ddListLeaveToRemain.SelectedValue == "InsideLondon")
            {
                livingCosts = costsOfLivingRemainInsideLondon * 2;
            }
            else if (ddListLeaveToRemain.SelectedValue == "OutsideLondon")
            {
                livingCosts = costsOfLivingRemainOutsideLondon * 2;
            }

            lblChartType.Visible = true;
                ddListChart.Visible = true;
                drawChart(getChartType());
            
        }

        private void drawChart(string chartType)
        {
            courseFee = parseValue(tbCourseFee);
            visaFee = parseValue(tbVisaFee);
            IHealthSurcharge = parseValue(tbIHealthS);
            iomTest = parseValue(tbIOMTest);
            flightCosts = parseValue(tbFlight);
            
            miscCosts = parseValue(tbMisc);


            applicationFee = visaFee + IHealthSurcharge + iomTest;

            total = applicationFee + courseFee + flightCosts + miscCosts + livingCosts;

            errorInfo.Text = "Misc costs = " + miscCosts.ToString() + " Living costs = " + livingCosts;

            ClientScript.RegisterStartupScript(GetType(), "draw", "draw('" + chartType + "','" + applicationFee + "','" + courseFee + "','" + flightCosts + "','" +
                        miscCosts + "', '" + livingCosts + "','" + total + "');", true);

        }


        protected void ddListChart_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddListChart.SelectedValue)
            {
                case "pie":
                    drawChart("pie");
                    break;
                case "column":
                    drawChart("column");
                    break;
                case "bar":
                    drawChart("bar");
                    break;
            }
        }

        private double parseValue(TextBox txtBoxValue)
        {
            if (!string.IsNullOrWhiteSpace(txtBoxValue.Text))
            {
                return double.Parse(txtBoxValue.Text);
            }
            else
            {
                txtBoxValue.Text = "0";
                return 0;
            }
        }

        private string getChartType()
        {
            return ddListChart.SelectedValue;
        }


    }
}
