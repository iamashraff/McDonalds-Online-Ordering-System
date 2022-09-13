<%@ Page Title="My Order" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="OnlineOrderWebApplication.MyOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<header class="myordermain">
  <div class="container h-100">
    <div class="row h-100 align-items-center animate__animated animate__fadeIn animate__slow">
      <div class="col-12 text-center">
        <h1 class="fw-light">My Order</h1>
          <br />
          
          <br />

          <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM tblOrder
WHERE custID = @custID">
              <SelectParameters>
                  <asp:SessionParameter Name="custID" SessionField="custID" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:GridView ID="GridView1" runat="server" class=" border-0 table table-borderless  table-hover table-striped " AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSourceProduct" AutoGenerateSelectButton="True" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
              <Columns>
                  <asp:BoundField DataField="orderID" HeaderText="Order #" InsertVisible="False" ReadOnly="True" SortExpression="orderID" />
                  <asp:BoundField DataField="deliveryDate" HeaderText="Delivery Date" SortExpression="deliveryDate" />
                  <asp:BoundField DataField="deliveryTime" HeaderText="Delivery Time" SortExpression="deliveryTime" />
                  <asp:BoundField DataField="paymentType" HeaderText="Payment Method" SortExpression="paymentType" />
              </Columns>
          </asp:GridView>






      </div>


             




    </div>
  </div>



    <!-- Modal -->
<div class="modal fade animate__animated animate__bounceInDown" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title" id="exampleModalLongTitle"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

           <div class="centeronpage animate__animated animate__fadeInDown">
              
              <img src="Images/mcdonalds.png" width="80"/>
          </div>

          <div class="centeronpage">
              <small class="font-weight-bold">Gerbang Alaf Restaurants Sdn Bhd (65351-M)</small>
             
          </div>

          <div class="centeronpage text-center">
                  <small>Licensee of McDonald's<br />
                  Level 6, Bangunan TH, Damansara Uptown 3<br />
                  No. 3, Jalan SS21/39, 47400 Petaling Jaya<br />
                  Selangor
              </small>
            </div>

          
          <br />




        
                                <asp:SqlDataSource ID="SqlDataSourceReceipt" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetListOrderSuccess" SelectCommandType="StoredProcedure">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="GridView1" Name="orderID" PropertyName="SelectedValue" Type="Int32" />
                              </SelectParameters>
                          </asp:SqlDataSource>
          <asp:GridView ID="GridView3" CssClass="border-0 table table-borderless table-sm table-hover table-striped small" runat="server" DataSourceID="SqlDataSourceReceipt" AutoGenerateColumns="False">
                              <Columns>
                                    <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                                  <asp:BoundField DataField="prodPrice" HeaderText="Price" SortExpression="prodPrice" DataFormatString="RM{0:n2}" />
                                  <asp:BoundField DataField="prodQty" HeaderText="Quantity" ItemStyle-CssClass="text-center" SortExpression="prodQty" />
                                  <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" DataFormatString="RM{0:n2}" ItemStyle-CssClass="text-success"/>
                              </Columns>

            </asp:GridView>


          <hr />
          
           <div class="row">
              <div class="col mx-4">
                 <small>Sub-Total:</small>
              </div>
              <div class="col mx-5">
                  <small class="float-right"><asp:Label ID="lblSubTOtalAmount" runat="server" Text="Label"></asp:Label></small>
              </div>
          </div>

           <div class="row">
              <div class="col mx-4">
                 <small>Processing Fee:</small>
              </div>
              <div class="col mx-5">
                  <small class="float-right"><asp:Label ID="lblProcessFee" runat="server" Text="Label"></asp:Label></small>
              </div>
          </div>

           <div class="row">
              <div class="col mx-4">
                 <small>Service Tax (6%) :</small>
              </div>
              <div class="col mx-5">
                  <small class="float-right"><asp:Label ID="lblServiceTax" runat="server" Text="Label"></asp:Label></small>
              </div>
          </div>

          <div class="row">
              <div class="col mx-4">
                 <small>Rounding :</small>
              </div>
              <div class="col mx-5">
                  <small class="float-right"><asp:Label ID="lblRounding" runat="server" Text="Label"></asp:Label></small>
              </div>
          </div>

         <div class="row">
              <div class="col mx-4">
                 <small></small>
              </div>
              <div class="col mx-5">
                  <small class="float-right"></small>
              </div>
          </div>

          <div class="row">
              <div class="col mx-5">
                 <small class="font-weight-bold">Total :</small>
              </div>
              <div class="col mx-5">
                  <small class="float-right text-success font-weight-bold"><asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label></small>
              </div>
          </div>
            
        
    


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>





</header>

<script type="text/javascript">
                  function viewModal() {
                      $('#viewModal').modal('show');
                  }
</script>



</asp:Content>
