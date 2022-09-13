<%@ Page Title="Order Success" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="OnlineOrderWebApplication.OrderSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header class="masterhead animate__animated animate__fadeIn animate__slow">
        <br />
        <br />
        <br />
      <div class="container h-100">
        <div class="row h-100 align-items-center">
          <div class="col-12 text-center">
              <div class="centeronpage animate__animated animate__fadeInDown">
                  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                    <lottie-player src="https://assets9.lottiefiles.com/packages/lf20_txJcSM.json"  background="transparent"  speed="0.7"  style="width: 10%;"  autoplay></lottie-player>
              </div>

              <div class="centeronpage" style="margin-top:-260px;">
                  <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                  <lottie-player src="https://assets4.lottiefiles.com/packages/lf20_ky24lkyk.json"  background="transparent"  speed="1"  style="width: 300px; height: 300px;"    autoplay></lottie-player>

                </div>

            <h1 class="fw-light">Thank you for your purchase ! </h1>

            <p class="lead">Here is the summarize of what you have ordered :</p>
             

                      <label class="font-weight-bold">Your Order ID : <asp:Label ID="lblorderID" runat="server" Text="Label"></asp:Label></label>

            

              <div class="centeronpage"> 
                  
                 <div class="card bg-transparent border-0">
                  <div class="card-body">
                    
                  <div class="row h-100 ">
                      <div class="col">
                          <small><span class="badge badge-warning">Deliver to:</span> <br />
                              <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                          </small>
                      </div>
                      <div class="col ">
                        <small><span class="badge badge-warning">Your Name:</span><br />
                            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                        </small>

                      </div>
                      <div class="col ">
                          <small><span class="badge badge-warning">Delivery Time:</span> <br />
                              <asp:Label ID="lblTime" runat="server" Text="Label"></asp:Label>
                          </small>
                      </div>
                 </div>

                  </div>
                </div>
                  
                </div>

              
                

              
              <div class="centeronpage"> 
                    <div class="card animate__animated animate__fadeIn animate__slow">
                      <div class="card-body">
                            
                          <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetListOrderSuccess" SelectCommandType="StoredProcedure">
                              <SelectParameters>
                                  <asp:SessionParameter Name="orderID" SessionField="orderID" Type="Int32" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                            
                          <asp:SqlDataSource ID="SqlDataSourceReceipt" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetListOrderSuccess" SelectCommandType="StoredProcedure">
                              <SelectParameters>
                                  <asp:SessionParameter Name="orderID" SessionField="orderID" Type="Int32" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                            
                          <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceOrder">

                              <ItemTemplate>
                                  
                                   <div class="row mt-4">
                                      <div class="col">
                                          <label class="lead"><asp:Label ID="prodNameLabel" runat="server" Text='<%# Eval("prodName") %>' /></label>

                                      </div>
                                      
                                      <div class="col">
                                          <asp:Image ID="prodImgLabel" ImageUrl='<%# string.Format("~/Images/Menu/{0}.png",Eval("prodImg"))%>' runat="server" Width="100" />

                                      </div>
                                      
                                      <div class="col">
                                          <asp:Label ID="prodPriceLabel" runat="server" Text='<%# Eval("prodPrice", "RM {0:n}") %>' />
                                      </div>

                                       <div class="col">
                                           <asp:Label ID="prodQtyLabel" runat="server" Text='<%# Eval("prodQty", "x {0}") %>' />
                                       </div>
                                 </div>
                                  <hr />

                                  


                              </ItemTemplate>

                          </asp:DataList>



                      </div>
                    </div>

                  <br />

   
              </div>




              <div class="centeronpage"> 
                 <div class="card bg-transparent border-0">
                  <div class="card-body">
                    
                  <div class="row h-100 align-items-center">
                      <div class="col text-center">
                          <asp:Button ID="btnReceipt" CssClass="btn btn-danger" runat="server" Text="View Receipt" OnClick="btnReceipt_Click" />
                      </div>
                      <div class="col text-center">
                          <asp:Button ID="btnOrder" CssClass="btn btn-danger" runat="server" Text="Go to My Order" OnClick="btnOrder_Click" />
                      </div>
                 </div>

                  </div>
                </div>
                  </div>


 

          </div>




        </div>

                    


      </div>



        <br />
        <br />
        <br />


    </header>

    <!-- Modal -->
<div class="modal fade" id="viewreceiptModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title" id="exampleModalLabel">Receipt Order #<asp:Label ID="lblOrderNo" runat="server" Text="Label"></asp:Label></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

          <!-- <div class="row" style="margin-top:-100px;">
              <div class="col">
                            <div class="centeronpage animate__animated animate__fadeInDown">
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets6.lottiefiles.com/packages/lf20_ynz5xr.json"  background="transparent"  speed="0.5"  style="width: 180px;"    autoplay></lottie-player>
                          </div>
              </div>
          </div> -->

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

          
          <div class="row">
              <div class="col mx-4">
                  <small>Order #<asp:Label ID="lblOrderNo2" runat="server" Text="Label"></asp:Label>&nbsp;on&nbsp;<asp:Label ID="lblorderDate" runat="server" Text="Label"></asp:Label></small><br />
                  <small>Customer Name : <asp:Label ID="lblCustName" runat="server" Text="Label"></asp:Label>&nbsp;(Delivery)</small><br />
                  <small>Payment Method : <asp:Label ID="lblPayMethod" runat="server" Text="Label"></asp:Label></small>
                  
              </div>
          </div>
          <br />
          

          <div class="row centeronpage">
                  <asp:GridView ID="GridView1" CssClass="border-0 table table-borderless table-sm table-hover table-striped small" runat="server" DataSourceID="SqlDataSourceReceipt" AutoGenerateColumns="False">
                              <Columns>
                                  <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                                  <asp:BoundField DataField="prodPrice" HeaderText="Price" SortExpression="prodPrice" DataFormatString="RM{0:n2}" />
                                  <asp:BoundField DataField="prodQty" HeaderText="Quantity" ItemStyle-CssClass="text-center" SortExpression="prodQty" />
                                  <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" DataFormatString="RM{0:n2}" ItemStyle-CssClass="text-success"/>
                              </Columns>


                          </asp:GridView>
              
          </div>

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
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

        
              <script type="text/javascript">
                  function receiptModal() {
                      $('#viewreceiptModal').modal('show');
                  }
              </script>

</asp:Content>
