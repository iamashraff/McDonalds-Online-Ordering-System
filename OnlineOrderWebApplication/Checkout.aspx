<%@ Page Title="Checkout" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="OnlineOrderWebApplication.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container animate__animated animate__fadeIn animate__slow" id="content" runat="server">
        
        <div class="row">

           <div class="col-7 mx-auto">

               <!-- My Cart Card-->
               <div class="card animate__animated animate__fadeIn animate__slow">
                  <div class="card-header lead text-center bg-warning">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> My Cart
                  </div>
                  <div class="card-body my-auto">
                      <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetItems" SelectCommandType="StoredProcedure">
                          <SelectParameters>
                              <asp:SessionParameter Name="custID" SessionField="custID" Type="Int32" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                      <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceCart">
                          <ItemTemplate>

                           <div class="row">
                            <div class="col my-auto">
                                <asp:Image ID="Image1" ImageUrl='<%# string.Format("~/Images/Menu/{0}.png",Eval("prodImg"))%>' runat="server" Width="100" />
                            </div>
                            <div class="col my-auto">
                                <label class="lead">
                                    <h6>
                                        <asp:Label ID="prodNameLabel" runat="server" Text='<%# Eval("prodName") %>' />
                                    </h6>
                                </label>
                            </div>
                            <div class="col my-auto">
                                <label>
                                    <asp:Label ID="prodQtyLabel" runat="server" CssClass="float-left lead" Text='<%# Eval("prodQty", "x{0}") %>' />
                                </label>
                            </div>
                            <div class="col my-auto">
                                <asp:Label ID="prodTotalPriceLabel" CssClass="float-right font-weight-bold text-success" runat="server" Text='<%# Eval("SubTotal", "RM {0:n}") %>' />
                            </div>
                        </div>

                         <hr />

                          </ItemTemplate>

                      </asp:DataList>

                      <br />
                      <label class="lead">Order Remarks:</label><br />
                      <asp:TextBox id="orderRemarks" TextMode="multiline" Columns="50" Rows="5" Placeholder="Eg. More sauces" CssClass="form-control" runat="server" />
                  </div>
                </div>
               <!--End My Cart Card-->



           </div>
            &nbsp;&nbsp;
           
           <div class="col">

                <!-- Summary Card-->
                <div class="card animate__animated animate__fadeIn animate__slow">
                  <div class="card-header lead text-center bg-warning">
                    Summary
                  </div>
                  <div class="card-body">
                      <div class="row">
                        <div class="col mx-3 text-muted">
                            
                            <small><b>SubTotal</b></small><br />
                            <small class="mx-2"><b>Processing Fee</b></small><br />
                            <small class="mx-2"><b>Service Tax</b></small><br />
                            <small class="mx-2"><b>Rounding</b></small><br />
                            
                        </div>
                        <div class="col text-muted">
                            <small><b><asp:Label ID="lblSubTotal" runat="server" Text="RM0.00"></asp:Label></b></small><br />
                            <small><b><asp:Label ID="lblProcessFee" runat="server" Text="RM0.00"></asp:Label></b></small><br />
                            <small><b><asp:Label ID="lblServiceTax" runat="server" Text="RM0.00"></asp:Label></b></small><br />
                            <small><b><asp:Label ID="lblRounding" runat="server" Text="RM0.00"></asp:Label></b></small><br />
                        </div>
                    </div>

                    <hr />
                    <div class="row">
                        <div class="col mx-3">
                            <p class="lead font-weight-bold">Total:</p>
                        </div>
                        <div class="col">
                            <p class="font-weight-bold text-success animate__animated animate__fadeIn animate__slow" style="font-size:25px;"><asp:Label ID="lblTotalPrice" runat="server" Text="RM0.00"></asp:Label></p>
                          
                        </div>
                    </div>


                  </div>
                </div>



               <hr />
               <!-- My Address Card-->
               <div class="card animate__animated animate__fadeIn animate__slow">
                  <div class="card-header text-center bg-warning"">
                      <label class="lead">Customer Details</label>
                  </div>
                  <div class="card-body">
                      <div class="row">
                          <div class="col">
                               <small class="text-muted font-weight-bold">Customer Name</small>
                          </div>
                          <div class="col">
                              <small class="float-right font-weight-bold">
                                    <asp:Label ID="lblName" runat="server" Text="lblName"></asp:Label>
                                  &nbsp;&nbsp;&nbsp;
                              </small>   
                          </div>
                      </div>

                      <hr class="bg-warning" />

                      <div class="row">
                          <div class="col">
                               <small class="text-muted font-weight-bold">Deliver to</small>
                          </div>
                          <div class="col">
                              <small class="float-right font-weight-bold">
                                    <asp:Label ID="lblAddress" runat="server" Text="lblAddress"></asp:Label>
                                  &nbsp;&nbsp;&nbsp;
                              </small>   
                          </div>
                      </div>

                      <hr class="bg-warning" />

                       <div class="row">
                          <div class="col">
                               <small class="text-muted font-weight-bold">Contact No.</small>
                          </div>
                          <div class="col">
                              <small class="float-right font-weight-bold">
                                    <asp:Label ID="lblPhoneNo" runat="server" Text="lblPhoneNo"></asp:Label>
                                  &nbsp;&nbsp;&nbsp;
                              </small>   
                          </div>
                      </div>

                      <hr class="bg-warning" />

                       <div class="row">
                          <div class="col">
                              <small class="text-muted font-weight-bold">Delivery Time</small>
                          </div>
                          <div class="col">
                              <small class="float-right font-weight-bold">
                               
                              </small>
                          </div>

                      </div>

                     <br />
                      <div class="row">
                          <div class="col mx-4">
                              <small class="text-muted font-weight-bold">Date :</small>
                          </div>
                          <div class="col">
                              <small class="float-right">
                                  <label><asp:Label ID="lblDate" runat="server" Text="lblDate"></asp:Label></label>
                              </small>
                          </div>
                      </div>

                      <br />
                      <div class="row">
                          <div class="col mx-4">
                              <small class="text-muted font-weight-bold">Time :</small>
                          </div>
                          <div class="col">
                              <small class="float-right">
                                <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-control-sm border-warning" ></asp:DropDownList>
                              </small>
                          </div>
                      </div>
                  </div>
                </div>
               <!-- End Address Card-->
               <hr />
               <!-- Payment Method Card-->
                <div class="card animate__animated animate__fadeIn animate__slow">
                  <div class="card-header text-center bg-warning"">
                      <label class="lead">Payment Method</label>
                  </div>
                  <div class="card-body">
                      <div class="row">
                          <div class="col mx-4">
                              
                          </div>
                          <div class="col">

                          </div>
                      </div>


                      <div class="row" style="height:80px;">
                          <div class="col">
                              <fieldset class="form-group">
                                <div class="row">
                                  </div>
                                  <legend class="col-form-label col-sm-2 pt-0"></legend>
                                  <div class="col-sm-10">
                                    <div class="form-check">
                                            <asp:RadioButtonList ID="rblPaymentMethod" AutoPostBack="true"  runat="server" CssClass="form-check-input" OnSelectedIndexChanged="rblPaymentMethod_SelectedIndexChanged">

                                              <asp:ListItem Text='&nbsp;&nbsp;<img src="Images/creditcard.png" alt="cc" width="80" /> <b>Credit Card</b>' Value="CreditCard" Selected="True" />
                                                
                                              <asp:ListItem Text='&nbsp;&nbsp;<img src="Images/fpx.png" alt="cc" width="80" /> <b>Online Banking</b>' Value="Online Banking" />
                                            </asp:RadioButtonList>
                                    </div>
                                  </div>
                                </div>
                              </fieldset>
                          </div>
                      </div>


                  </div>
               <!-- End Payment Method Card-->

               <br />
               <asp:Button ID="btnPayment" CssClass="btn btn-danger text-light btn-lg btn-block shadow-sm" runat="server" Text="Make payment" OnClick="btnPayment_Click" />
               <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>


           </div>
               

               
                 
          

        </div>

    </div>
    <br />
    <br />
    <br />



    <!-- Modal -->
<div class="modal fade" id="modalNoTime" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;Message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="centeronpage">
              <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
              <lottie-player src="https://assets6.lottiefiles.com/temp/lf20_QYm9j9.json"  background="transparent"  speed="1"  style="width: 100px; height: 100px;"  loop  autoplay></lottie-player>
          </div>
          <div class="centeronpage">
              <label class="text-danger">Please select delivery time !</label>
          </div>
          

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Okay</button>
      </div>
    </div>
  </div>
</div>



                  <script type="text/javascript">

                      function modalNoTime() {
                      $('#modalNoTime').modal('show');
                  }

                  </script>



</asp:Content>
