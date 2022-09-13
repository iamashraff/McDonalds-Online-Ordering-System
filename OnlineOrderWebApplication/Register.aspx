<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineOrderWebApplication.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <script type="text/javascript">
               function openModal() {
                   $('#successModal').modal('show');
               }

               function showAlert() {
                   if ($("#myAlert").find("div#myAlert2").length == 0) {
                       $("#myAlert").append("<div class='alert alert-success alert-dismissable' id='myAlert2'> <button type='button' class='close' data-dismiss='alert'  aria-hidden='true'>&times;</button> Success! message sent successfully.</div>");
                   }
                   $("#myAlert").css("display", "");
               }
           </script>



        <div class="container animate__animated animate__fadeIn animate__slow" style="height: 120vh;">
        <div class="d-flex align-items-center justify-content-center" style="height: 120vh;">
                    <div class="card rounded-lg shadow" style="width: 35rem;">
                  <h5 class="card-header text-center bg-warning">
                      <asp:Image ImageUrl="~/Images/logo.svg" runat="server" Width="50" /></h5>
                  <div class="card-body">

                       <div class="container animate__animated animate__shakeX" style="display:none;" id="myAlert">
                            <div class="alert alert-danger alert-dismissable" id="myAlert2">&nbsp;&nbsp;
                                <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>


                    <h3 class="card-title">Register</h3>
                      <hr />
                      <p class="text-muted" style="font-size:18px;">Create Account</p>

                      <div class="row">
                          <div class="col">
                            <label>Email :</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" CssClass="badge badge-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                           </div>
                      </div>
                      <br />

                      <div class="row">
                          <div class="col">
                              <label>Username :</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" CausesValidation="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" CssClass="badge badge-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                          </div>
                      </div>
                      <br />

                      <div class="row">
                          <div class="col">
                              <label>Password :</label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"  CausesValidation="True" ControlToValidate="txtPassword" ControlToCompare="txtPassword"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" CssClass="badge badge-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="regexPassword" runat="server" ErrorMessage="Your password must be minimum 8 characters long, contain at least 1 letter and 1 number." ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ControlToValidate="txtPassword" Display="Dynamic" CssClass="badge badge-danger"></asp:RegularExpressionValidator>
                          </div>

                          <div class="col">
                              <label>Confirm Password :</label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" CausesValidation="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ErrorMessage="Confirmation password is required" ControlToValidate="txtConfirmPassword" CssClass="badge badge-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                          </div>
                      </div>
                      <asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="Password does not match" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" CssClass="badge badge-danger" Display="Dynamic"></asp:CompareValidator>

 
                      <br />
                      <hr />
                      <p class="text-muted" style="font-size:18px;">Your Details</p>
                      <div class="row">
                          <div class="col">
                              <label>First Name :</label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" CausesValidation="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First name is required" ControlToValidate="txtFirstName" CssClass="badge badge-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                           </div>
                          <div class="col">
                              <label>Last Name :</label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" CausesValidation="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last name is required" ControlToValidate="txtLastName" CssClass="badge badge-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                          </div>
                      </div>
                      <br />

                      <div class="row">
                          <div class="col">
                              <label>Phone Number :</label>
                              <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" CausesValidation="true"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  
                                    ControlToValidate="txtPhoneNumber" ErrorMessage="Phone number must be numeric format only"  
                                    ValidationExpression="^\d+$" Display="Dynamic" CssClass="badge badge-danger" ></asp:RegularExpressionValidator>
                              <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ErrorMessage="Phone Number is required" ControlToValidate="txtPhoneNumber" CssClass="badge badge-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                          </div>
                      </div>
                      <br />

                      
                          <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-warning btn-block" OnClick="btnRegister_Click" />
                      <hr />
                      <div class="text-center">
                          <small class="text-muted">Already have an account ?</small> <a href="Login.aspx"><small>Login</small></a>
                          <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                      </div>
                      
                      
                  </div>
                </div>
        </div>
    </div>

    

    <!-- Modal -->
    <div class="modal fade" data-backdrop="static" id="successModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Registration Success</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col d-flex align-items-center justify-content-center">
                      <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                        <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_3wo4gag4.json"  background="transparent"  speed="0.5"  style="width: 100px; height: 100px;"    autoplay></lottie-player>
                  </div>
              </div>
                            <br />
              <p class="text-success text-center">Account successfully registered !</p>
              <p class="text-center alert alert-success" id="countdown"></p>
          </div>
          <div class="modal-footer">
            
            
          </div>
        </div>
      </div>
    </div>



    <script type="text/javascript">
        function ShowPopup() {
            $("#successModal").modal("show");
        };
    </script>

    <script>
        function countdown() {
        var timeleft = 5;
        var downloadTimer = setInterval(function () {
            if (timeleft <= 0) {
                clearInterval(downloadTimer);
                document.getElementById("countdown").innerHTML = "Finished";
            } else {
                document.getElementById("countdown").innerHTML = "<b>Redirecting to login page in " + timeleft + " seconds</b>";
            }
            timeleft -= 1;
        }, 1000);
        };
    </script>

            

</asp:Content>
