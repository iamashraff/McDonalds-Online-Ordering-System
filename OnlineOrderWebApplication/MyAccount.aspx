<%@ Page Title="My Account" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="OnlineOrderWebApplication.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container animate__animated animate__fadeIn animate__slow">
        <br />
        <br />
        <h2>My Account</h2>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <hr />
        <br />
        <h5>Profile</h5>
        <div class="row">
            <div class="col">
                <label>First Name :</label>
                <asp:TextBox ID="txtFname" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFname" runat="server" CssClass="badge badge-danger" ErrorMessage="First name is required" Display="Dynamic" ControlToValidate="txtFname"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
                <label>Last Name :</label>
                <asp:TextBox ID="txtLname" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLname" runat="server" CssClass="badge badge-danger" ErrorMessage="Last name is required" ControlToValidate="txtLname" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <label>Email:</label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="badge badge-danger" ErrorMessage="Email is required" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
                <label>Phone:</label>
                <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" CssClass="badge badge-danger" ErrorMessage="Phone number is required" ControlToValidate="txtPhone" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <h5>Address</h5>

         <div class="row">
            <div class="col">
                <label>House No.:</label>
                <asp:TextBox ID="txtHouseno" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvHouseno" runat="server" CssClass="badge badge-danger" ErrorMessage="House number is required" ControlToValidate="txtHouseno" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <label>Street:</label>
                <asp:TextBox ID="txtStreet" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvStreet" runat="server" CssClass="badge badge-danger" ErrorMessage="Street is required" Display="Dynamic" ControlToValidate="txtStreet"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="row">
            <div class="col">
                <label>City:</label>
                <asp:TextBox ID="txtCity" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" CssClass="badge badge-danger" ErrorMessage="City is required" Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
            </div>
            <div class="col">
                <label>Postcode:</label>
                <asp:TextBox ID="txtPostcode" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPostcode" runat="server" CssClass="badge badge-danger" ErrorMessage="Postcode is required" ControlToValidate="txtPostcode" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>

        
        <div class="row">
            <div class="col">
                <label>State</label>
                <asp:TextBox ID="txtState" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" CssClass="badge badge-danger" ErrorMessage="State is required" ControlToValidate="txtState" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
       <div class="row">
            <div class="col">
                
                <p class="float-right"><asp:Button ID="btnSave" runat="server" Text=" Save " CssClass="btn btn-danger" OnClick="btnSave_Click" /></p>
                
            </div>
        </div>

               <br />
        <br />       <br />
        <br />
        <br />




        </div>


    <!-- Modal -->
<div class="modal fade animate__animated animate__bounceInDown" id="modalSaveSuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;Save Success</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="centeronpage" style="margin-top:-60px;">
              <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                <lottie-player src="https://assets6.lottiefiles.com/packages/lf20_rtxcgnqq.json"  background="transparent"  speed="1"  style="width: 300px; height: 300px;"  autoplay></lottie-player>
          </div>
          <div class="centeronpage" style="margin-top:-60px;">
              <label class="text-muted text-center">Your details has been successfully saved !</label>
          </div>

        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Okay</button>
         <a class="btn btn-danger" href="Menu.aspx" role="button">Go to Menu</a>
      </div>
    </div>
  </div>
</div>

    <script type="text/javascript">
                  function saveModal() {
                      $('#modalSaveSuccess').modal('show');
                  }
    </script>

</asp:Content>
