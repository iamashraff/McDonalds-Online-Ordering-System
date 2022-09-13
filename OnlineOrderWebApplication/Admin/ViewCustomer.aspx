<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ViewCustomer.aspx.cs" Inherits="OnlineOrderWebApplication.Admin.ViewCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   


                            <h1 class="mt-4 animate__animated animate__fadeIn animate__slow">Customers</h1>
<asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT [custID], [custUsername], [custEmail], [custFirstName], [custLastName], [custPhone], [custPass] FROM [tblCustomer]">

</asp:SqlDataSource>
    

    <script>

        function showAlertSuccess() {
            if ($("#myAlert3").find("div#myAlert4").length == 0) {
                $("#myAlert3").append("<div class='alert alert-success alert-dismissable' id='myAlert4'> <button type='button' class='close' data-dismiss='alert'  aria-hidden='true'>&times;</button> Success! message sent successfully.</div>");
            }
            $("#myAlert3").css("display", "");
        }
    </script>    


                <div class="container-fluid animate__animated animate__fadeIn animate__slow" style="display:none;" id="myAlert3">
                            <div class="alert alert-success alert-dismissible fade show" role="alert" id="myAlert4">&nbsp;&nbsp;
                                <i class="fa fa-check" aria-hidden="true"></i>
                                <strong>Customer details has been updated !</strong> &nbsp; &nbsp; Refreshing Page...
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>  
                            </div>

                        </div>

    
    <div class="row animate__animated animate__fadeIn animate__slow">
          <div class="col">
              <asp:GridView ID="GridView1" HeaderStyle-CssClass="bg-warning" CssClass="text-center border table table-borderless table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="custID" DataSourceID="SqlDataSourceCustomer" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="custID" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="custID" />
            <asp:BoundField DataField="custUsername" HeaderText="Username" SortExpression="custUsername" />
            <asp:BoundField DataField="custEmail" HeaderText="Email" SortExpression="custEmail" />
            <asp:BoundField DataField="custFirstName" HeaderText="First Name" SortExpression="custFirstName" />
            <asp:BoundField DataField="custLastName" HeaderText="Last Name" SortExpression="custLastName" />
            <asp:BoundField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" />
            <asp:BoundField DataField="custPass" HeaderText="Password" SortExpression="custPass" DataFormatString="*****" ReadOnly="True" />
            <asp:buttonfield buttontype="Button" ControlStyle-CssClass="btn btn-danger" 
                 commandname="Select"
                 headertext="Action" 
                 text="Select"/>
        </Columns>
                            </asp:GridView>
         </div>
        </div>



    <!-- Modal -->
<div class="modal fade animate__animated animate__bounceInDown" id="viewcustModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title" id="exampleModalLongTitle">Edit User #<asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label></h5>

      </div>
      <div class="modal-body">
        
          <div class="row">
              <div class="col">
                  <label>Username:</label>
                  <label><asp:TextBox ID="txtUsername" CssClass="form-control" ReadOnly="true" runat="server" CausesValidation="True"></asp:TextBox></label>
                  <asp:RequiredFieldValidator ID="rfvUsername" runat="server" CssClass="badge badge-danger" ErrorMessage="Username is required" Display="Dynamic" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
              </div>
              <div class="col">
                  <label>Email:</label>
                  <asp:TextBox ID="txtEmail" CssClass="form-control" ReadOnly="true" runat="server" CausesValidation="True"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="badge badge-danger" ErrorMessage="Email is required" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
              </div>
          </div>
          <br />
           <div class="row">
              <div class="col">
                  <label>First Name:</label>
                  <label><asp:TextBox ID="txtFName" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox></label>
                  <asp:RequiredFieldValidator ID="rfvFName" runat="server" CssClass="badge badge-danger" ErrorMessage="First name is required" ControlToValidate="txtFName" Display="Dynamic"></asp:RequiredFieldValidator>
              </div>
              <div class="col">
                  <label>Last Name:</label>
                  <asp:TextBox ID="txtLName" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvLName" runat="server" CssClass="badge badge-danger" ErrorMessage="Last name is required" Display="Dynamic" ControlToValidate="txtLName"></asp:RequiredFieldValidator>
              </div>
          </div>
          <br />
           <div class="row">
              <div class="col">
                  <label>Phone:</label><br />
                  <label><asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox></label>
                  <asp:RegularExpressionValidator ID="regexPhone" runat="server"  
                                    ControlToValidate="txtPhone" ErrorMessage="Phone number must be numeric format only"  
                                    ValidationExpression="^\d+$" Display="Dynamic" CssClass="badge badge-danger" ></asp:RegularExpressionValidator>
                  <asp:RequiredFieldValidator ID="rfvPhone" runat="server" CssClass="badge badge-danger" ErrorMessage="Phone is required" Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
              </div>
          </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <asp:Button ID="btnSave" runat="server" CssClass="btn btn-danger" Text="Save Changes" OnClick="btnSave_Click" />
      </div>
    </div>
  </div>
</div>




                  <script type="text/javascript">
                  function viewcustModal() {
                      $('#viewcustModal').modal('show');
                  }
                  </script>


</asp:Content>
