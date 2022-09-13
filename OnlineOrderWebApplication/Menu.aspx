<%@ Page Title="Menu" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="OnlineOrderWebApplication.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container" id="content" runat="server">

  <div class="row">
    <div class="col-sm">
        <br />
        <p> <label class="text-center lead">Category :</label>  
        <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="catName" DataValueField="catID" AutoPostBack="True" Width="100%" CssClass="btn-lg btn-danger" ></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [catID], [catName] FROM [tblCategory]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblProduct] WHERE ([catID] = @catID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" Name="catID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetItems" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="custID" SessionField="custID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceProduct" RepeatColumns="2" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" DataKeyField="prodID" OnItemDataBound="DataList1_ItemDataBound">
 <ItemTemplate>
                
                <div class="card" style="width: 20rem; height:20rem;">
                    <br />
                    <p style="text-align:center;">
                         <asp:Image ID="Image1" ImageUrl='<%# string.Format("~/Images/Menu/{0}.png",Eval("prodImg"))%>' runat="server" Width="175" />
                        
                    </p>
                    
                    <div class="card-body text-center">
                        <h6>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("prodName")%>' />
                            <asp:Label Visible="false" ID="lblProdID" runat="server" Text='<%# Eval("prodID")%>'></asp:Label>
                        </h6>
                    
                  </div>
                   <div class="card-footer text-muted">
                        <div class="row">
                            <div class="col-sm">
                                <p class="card-text text-success font-weight-bold"><asp:Label ID="prodPriceLabel" runat="server" Text='<%# Eval("prodPrice", "RM {0:n}") %>' /></p>
                            </div>
                            <div class="col-sm">

                                
                                    <asp:LinkButton ID="btnaddtoCart" Visible="true" CommandName="delete" runat="server" Width="120px" CssClass="btn-sm btn-warning text-center text-danger float-right" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</asp:LinkButton>  
                                

                            </div>
                        </div>
                  </div>
                </div>
                &nbsp;
                <br />
            </ItemTemplate>
        </asp:DataList>
    </p>
    </div>
      &nbsp;&nbsp;&nbsp;
    <div class="col-sm">
        <br />
        <br />
        <br />

            <div class="card" >
                <div class="card-header bg-warning">
                    <h1 class="lead text-center"><i class="fa fa-shopping-cart" aria-hidden="true"></i> My Cart</h1>
                </div>
                <div class="card-body">
                    <asp:Label ID="Label2" runat="server" Visible="False" ></asp:Label><asp:Label ID="Label3" runat="server" Text="Label3" Visible="False"></asp:Label>
                        
                  <div runat="server" id="summaryOrder">

                    <h6 class="lead" style="">Order Summary</h6>
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
                      <br />
                        </div>


                       <div class="animate__animated animate__fadeIn" runat="server" id="noOrder">
                        <div class="text-center">
                                <asp:Image  ID="imgNoOrder" ImageUrl="~/Images/mcdonalds.png" runat="server" Width="100" />
                            <label class="text-muted"><br />
                                <i>
                        <asp:Label runat="server" ID="lblNoOrder" Text="Please select an item to begin your order."></asp:Label>
                                </i>

                                </label>

                                </div>
                       </div>

                   <ul class="list-group list-group-flush">

                       <div runat="server" id="labelItem" >
                     <h6 class="lead" runat="server" style=""><asp:Label ID="lblItemQty" runat="server" Text="Item(s)"></asp:Label></h6>     
                    </div>

                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSourceCart" OnDeleteCommand="DataList2_DeleteCommand" OnEditCommand="DataList2_EditCommand">
                        <ItemTemplate>
                            <li class="list-group-item">
                            <div class="row animate__animated animate__fadeIn">
                                <div class="col">
                                    <asp:Image ID="Image2" ImageUrl='<%# string.Format("~/Images/Menu/{0}.png",Eval("prodImg"))%>' runat="server" Width="100" />
                                </div>
                                <div class="col-6 my-auto">
                                    <asp:Label ID="prodNameLabel" runat="server" CssClass="font-weight-bold" Text='<%# Eval("prodName") %>' />
                                    <asp:Label ID="prodIDLabel" Visible="false" runat="server" CssClass="font-weight-bold" Text='<%# Eval("prodID") %>' />
                                </div>
                                <div class="col my-auto">
                                    <small><asp:Label ID="prodQtyLabel" runat="server" CssClass="float-right lead" Text='<%# Eval("prodQty", "x{0}") %>' /></small>
    
                                </div>
                            </div>

                            <div class="row my-2">
                                <div class="col mx-3">
                                    <asp:LinkButton ID="btneditCart" CommandName="edit" runat="server" CssClass="btn-sm btn-light border text-center text-danger" style="font-size:12px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                    <asp:LinkButton ID="btndeleteCart" CommandName="delete" runat="server" CssClass="btn-sm btn-light border text-center text-danger" style="font-size:12px;"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton> 

  
                                 </div>
                                <div class="col">
                                    <asp:Label ID="prodTotalPriceLabel" CssClass="float-right font-weight-bold text-success" runat="server" Text='<%# Eval("SubTotal", "RM {0:n}") %>' />
                                </div>
                            </div>
                            
                                </li>
                        </ItemTemplate>

                        <FooterTemplate>
                                    

                        
                        </FooterTemplate>
                      
                    </asp:DataList>
                        </ul>    



                     </div>
                </div>
        <br />
        <div runat="server" id="buttonCheckout" >

            <asp:Button ID="btnCheckout" CssClass="btn btn-danger text-light btn-lg btn-block shadow-sm" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
         
        </div>   

            </div>
        
    </div>
  </div>



    <br />
    <br />


    <!-- Modal Update Quantity-->
<div class="modal fade animate__animated animate__bounceInDown animate__pulse " id="edititemModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title">
            Edit Quantity
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <p style="text-align:center;">
        <asp:Image ID="imgProd" ImageUrl='Test' runat="server" Width="200" /></p>
          <p class="text-center font-weight-bold"><asp:Label ID="lblProdName" runat="server" Text="lblProdName"></asp:Label></p>
          <p id="price" class="text-center">RM<asp:Label ID="lblProdPrice" runat="server" Text="lblProdPrice"></asp:Label></p>
          <div class="row justify-content-md-center">
              <div class="col-md-auto">
                  <fieldset>
					    <div class="form-group">
                            <label>Quantity</label>
						    <input id="colorful" name="QuantityUpdate" class="form-control rounded-0 bg-light" type="number" value="1" min="1" max="10" onchange="calculatePrice()" />
					       </div>
				      </fieldset>
                 
              </div>
          </div>



          
      </div>
<div class="modal-footer">

    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
     <asp:Button ID="btnUpdateQuantity" CssClass="btn btn-danger" runat="server" Text="Update" OnClick="btnUpdateQuantity_Click" />
     
</div>
  </div>
</div>
    </div>




    <!-- Modal No Address -->
<div class="modal fade" id="modalNoAddress" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
              <label class="text-muted text-center">Please fill in your delivery address<br /> in My Account section to continue order.</label>
          </div>

      </div>
      <div class="modal-footer">

          <a class="btn btn-danger" href="MyAccount.aspx" role="button">Go to My Account</a>
      </div>
    </div>
  </div>
</div>














    <!-- Modal Add Item-->
<div class="modal fade animate__animated animate__bounceInDown animate__pulse " id="additemModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title">
            Add Item
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <p style="text-align:center;">
        <asp:Image ID="imgProdAdd" ImageUrl='Test' runat="server" Width="200" /></p>
          <p class="text-center font-weight-bold"><asp:Label ID="lblProdNameAdd" runat="server" Text="lblProdNameAdd"></asp:Label></p>
          <p id="price2" class="text-center">RM<asp:Label ID="lblProdPriceAdd" runat="server" Text="lblProdPriceAdd"></asp:Label></p>
          <div class="row justify-content-md-center">
              <div class="col-md-auto">
                  <fieldset>
					    <div class="form-group">
                            <label>Quantity</label>
						    <input id="colorful2" name="QuantityAdd" class="form-control rounded-0 bg-light" type="number" value="1" min="1" max="10" onchange="calculatePriceAdd()" />
					       </div>
				      </fieldset>
                 
              </div>
          </div>

      </div>
<div class="modal-footer">

    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

    <asp:Button ID="btnAddtoCart" runat="server" CssClass="btn btn-danger" Text="Add to Cart" OnClick="btnAddtoCart_Click" />

     
</div>
  </div>
</div>
    </div>
               

    
              <script type="text/javascript">
                  function editModal() {
                      $('#edititemModal').modal('show');
                  }
                  function addModal() {
                      $('#additemModal').modal('show');
                  }

                  function modalNoAddress() {
                      $('#modalNoAddress').modal('show');
                  }

              </script>
                
                <script src="Styles/bootstrap-number-input.js"></script>
            <script>


                $('#after').bootstrapNumber();
                $('#colorful').bootstrapNumber({
                    upClass: 'warning rounded-0',
                    downClass: 'warning rounded-0'
                });
                $('#colorful2').bootstrapNumber({
                    upClass: 'warning rounded-0',
                    downClass: 'warning rounded-0'
                });


            </script>

    <script type="text/javascript">

        var price = 0;

        function setAddPrice(getprice) {
            price = getprice;
            document.getElementById("price2").textContent = "RM" + parseFloat(price).toFixed(2);
        }

        function showPrice(getprice, getquantity) {

            price = getprice;
            quantity = getquantity;
            result = price * quantity;

            document.getElementById("price").textContent = "RM" + parseFloat(result).toFixed(2);
            document.getElementById("colorful").value = parseInt(getquantity);
        }

        function calculatePrice() {
            var qty = parseFloat(document.getElementById("colorful").value);
            var pr = parseFloat(price);
            var result = pr * qty;
            document.getElementById("price").textContent = "RM " + (pr * qty).toFixed(2);;
        }

        function calculatePriceAdd() {
            var qty = parseFloat(document.getElementById("colorful2").value);
            var pr = parseFloat(price);
            var result = pr * qty;
            document.getElementById("price2").textContent = "RM " + (pr * qty).toFixed(2);;
        }

    </script>


    </asp:Content>
