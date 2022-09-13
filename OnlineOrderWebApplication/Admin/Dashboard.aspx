<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnlineOrderWebApplication.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
                        <h1 class="mt-4 animate__animated animate__fadeIn animate__slow">Dashboard</h1>

    
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <div class="row">
          <div class="col-xl-3 col-md-6">
            <div class="card bg-danger border-bottom text-white mb-4 animate__animated animate__fadeInDown animate__slow">
                   <div class="card-body text-center">   
                       <label class="text-center font-weight-bold" style="font-size:25px;"><asp:Label ID="lblTotalOrder" runat="server" Text="Label"></asp:Label></label> <br />
                       <label class="lead text-center">Total Order</label> 
                   </div>     
                </div>
         </div>

          <div class="col-xl-3 col-md-6">
            <div class="card bg-danger border-bottom text-white mb-4 animate__animated animate__fadeInDown animate__slow">
                   <div class="card-body text-center">   
                       <label class="text-center font-weight-bold" style="font-size:25px;"><asp:Label ID="lblTotalEarnings" runat="server" Text="Label"></asp:Label></label> <br />
                       <label class="lead text-center">Total Earnings</label> 
                   </div>     
                </div>
         </div>

          <div class="col-xl-3 col-md-6">
            <div class="card bg-danger border-bottom text-white mb-4 animate__animated animate__fadeInDown animate__slow">
                   <div class="card-body text-center">                           
                       
                       <label class="text-center font-weight-bold" style="font-size:25px;"><asp:Label ID="lblTotalCust" runat="server" Text="Label"></asp:Label></label><br />
                       <label class="lead text-center">Total Customer</label>
                   </div>     
                </div>
         </div>

          <div class="col-xl-3 col-md-6">
            <div class="card bg-danger border-bottom text-white mb-4 animate__animated animate__fadeInDown animate__slow">
                   <div class="card-body text-center">   
                       <label class="text-center font-weight-bold" style="font-size:25px;"><asp:Label ID="lblTotalProduct" runat="server" Text="Label"></asp:Label></label> <br />
                       <label class="lead text-center">Total Product</label> 
                   </div>     
                </div>
         </div>

     </div>


     <div class="card mb-4 animate__animated animate__zoomIn animate__slow">
                            <div class="card-header">
                                
                                Sales Chart
                            </div>
                            <div class="card-body"><canvas id="myChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Last update on 
                                <asp:Label ID="lbllastUpdate" runat="server" Text="Label"></asp:Label></div>
      </div>




    <div>

</div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>

        var labels = new Array();
        labels = document.getElementById('<%=HiddenField1.ClientID%>').value.split(',');


        /*const labels = [
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
        ];*/

        var myOrder = new Array();
        myOrder = document.getElementById('<%=HiddenField2.ClientID%>').value.split(',');



  const data = {
    labels: labels,
    datasets: [{
      label: 'Sales for last 7 days',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
        data: myOrder,
    }]
  };

  const config = {
    type: 'line',
    data: data,
    options: {}
  };
    </script>


    <script>
        const myChart = new Chart(
            document.getElementById('myChart'),
            config
        );
    </script>



</asp:Content>
