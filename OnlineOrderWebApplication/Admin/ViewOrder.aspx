<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="OnlineOrderWebApplication.Admin.ViewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mt-4 animate__animated animate__fadeIn animate__slow">Orders
    </h1>
       
        
        <asp:SqlDataSource ID="SqlDataSourceOrderList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(tblOrderDetails.orderID) AS ItemNo, tblOrderDetails.orderID, SUM(tblOrderDetails.prodQty) AS Quantity, SUM(tblOrderDetails.prodQty * tblProduct.prodPrice) AS TotalPrice, SUM(tblOrderDetails.prodQty * tblProduct.prodPrice) AS Tax, tblCustomer.custUsername, tblCustomer.custID, tblOrder.dateCreated FROM tblOrder INNER JOIN tblOrderDetails ON tblOrder.orderID = tblOrderDetails.orderID INNER JOIN tblProduct ON tblOrderDetails.prodID = tblProduct.prodID INNER JOIN tblCustomer ON tblOrder.custID = tblCustomer.custID GROUP BY tblOrderDetails.orderID, tblCustomer.custUsername, tblCustomer.custID, tblOrder.dateCreated"></asp:SqlDataSource>
        


    <div class="row animate__animated animate__fadeIn animate__slow">
          <div class="col">
              <asp:GridView ID="GridView1" runat="server" HeaderStyle-CssClass="bg-warning" CssClass="text-center border table table-borderless table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSourceOrderList" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                  <Columns>
                      <asp:BoundField DataField="orderID" HeaderText="Order #" InsertVisible="False" ReadOnly="True" SortExpression="orderID"  />
                      <asp:BoundField DataField="custID" HeaderText="Customer #"  SortExpression="custID" />
                      <asp:BoundField DataField="custUsername" HeaderText="Username" SortExpression="custUsername" />
                      <asp:BoundField DataField="ItemNo" HeaderText="Total Item" ReadOnly="True" SortExpression="ItemNo" />
                      <asp:BoundField DataField="Quantity" HeaderText="Total Quantity" ReadOnly="True" SortExpression="Quantity" />
                      <asp:BoundField DataField="TotalPrice" HeaderText="Sub Total" ReadOnly="True" SortExpression="TotalPrice" DataFormatString="RM{0:n2}" />
                      <asp:BoundField DataField="Tax" HeaderText="Tax" ReadOnly="True" SortExpression="Tax" DataFormatString="RM{0:n2}" />
                      <asp:BoundField DataField="dateCreated" HeaderText="Order Date" SortExpression="dateCreated" DataFormatString="{0:dd-MM-yyyy}" />
                      <asp:buttonfield buttontype="Button" ControlStyle-CssClass="btn btn-danger" 
                 commandname="Select"
                 headertext="Action" 
                 text="View Details">
             
<ControlStyle CssClass="btn btn-danger"></ControlStyle>
                      </asp:buttonfield>
             
                  </Columns>



<HeaderStyle CssClass="bg-warning"></HeaderStyle>
              </asp:GridView>

        </div>
    </div>


    
        <div class="row">
        <div class="col">
       
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="	SELECT tblProduct.prodName, tblProduct.prodPrice, tblProduct.prodImg, tblOrderDetails.prodQty, tblProduct.prodPrice * tblOrderDetails.prodQty AS SubTotal   FROM tblOrder
INNER JOIN tblOrderDetails ON tblOrderDetails.orderID = tblOrder.orderID
INNER JOIN tblProduct ON tblProduct.prodID = tblOrderDetails.prodID
WHERE tblOrder.orderID = @orderID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="orderID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>



        </div>

    </div>



    <!-- Modal -->
<div class="modal fade animate__animated animate__bounceInDown" id="vieworderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title" id="exampleModalLongTitle">Order #<asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label></h5>

      </div>
      <div class="modal-body">


          <div class="row">
              <div class="col mx-3">
                  <small>Customer Name : <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></small><br />
                  <small>Email : <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></small><br />
                  <small>Date : <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label></small><br />
                  <small>Payment : <asp:Label ID="lblPay" runat="server" Text="Label"></asp:Label></small><br />
                  <small>Address : <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label></small><br />
              </div>
          </div>



          <br />

          
          <div class="row">
              <div class="col">
                              <asp:GridView ID="GridView2" CssClass="border-0 table table-borderless table-sm table-hover table-striped small" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
 <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                                  <asp:BoundField DataField="prodPrice" HeaderText="Price" SortExpression="prodPrice" DataFormatString="RM{0:n2}" />
                                  <asp:BoundField DataField="prodQty" HeaderText="Quantity" ItemStyle-CssClass="text-center" SortExpression="prodQty" />
                                  <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" DataFormatString="RM{0:n2}" ItemStyle-CssClass="text-success"/>
                              
                  </Columns>
            </asp:GridView>
              </div>
          </div>










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
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


                                        <script type="text/javascript">
                  function vieworderModal() {
                      $('#vieworderModal').modal('show');
                  }
                  </script>
    </asp:Content>