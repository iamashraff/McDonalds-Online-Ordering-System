<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineOrderWebApplication.Login" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>

        function showAlert() {
            if ($("#myAlert").find("div#myAlert2").length == 0) {
                $("#myAlert").append("<div class='alert alert-success alert-dismissable' id='myAlert2'> <button type='button' class='close' data-dismiss='alert'  aria-hidden='true'>&times;</button> Success! message sent successfully.</div>");
            }
            $("#myAlert").css("display", "");
        }

        function showAlertSuccess() {
            if ($("#myAlert3").find("div#myAlert4").length == 0) {
                $("#myAlert3").append("<div class='alert alert-success alert-dismissable' id='myAlert4'> <button type='button' class='close' data-dismiss='alert'  aria-hidden='true'>&times;</button> Success! message sent successfully.</div>");
            }
            $("#myAlert3").css("display", "");
        }

    </script>


    <div class="container animate__animated animate__fadeIn animate__slow" style="height: 80vh;">

        


        <div class="d-flex align-items-center justify-content-center" style="height: 80vh;">

            
            
            
                <div class="card rounded-lg shadow" style="width: 35rem;">
                  <h5 class="card-header text-center bg-warning">
                      <asp:Image ImageUrl="~/Images/logo.svg" runat="server" Width="50" /></h5>
                  <div class="card-body">

                          <div class="container animate__animated animate__shakeX" style="display:none;" id="myAlert">
                            <div class="alert alert-danger alert-dismissable" id="myAlert2">&nbsp;&nbsp;
                                <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>

                      <div class="container" style="display:none;" id="myAlert3">
                            <div class="alert alert-success alert-dismissable" id="myAlert4">&nbsp;&nbsp;
                                <i class="fa fa-check" aria-hidden="true"></i>
                                
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                
                            </div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <asp:Image ImageUrl="~/Images/loading.gif" runat="server" Width="50" />
                              </div>
                        </div>

                     


                    <h3 class="card-title">Login</h3>
                      <hr />
                      <div class="row">
                          <div class="col">
                      <label>Email or Username:</label>
                      <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="badge badge-danger" ErrorMessage="Email or Username is required" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                           </div>
                      </div>
                              <br />
                      
                      <div class="row">
                          <div class="col">
                      <label>Password :</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" CausesValidation="True"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvPassword" runat="server" CssClass="badge badge-danger" ErrorMessage="Password is required" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                              <br />
                        </div>
                      </div>
                      <br />
                      
                          <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-warning btn-block" OnClick="btnLogin_Click" />
                      <hr />
                      <div class="text-center">
                          <small class="text-muted">Dont have an account ?</small> <a href="Register.aspx"><small>Register now</small></a>
                          
                         
                          
                          </div>
                      
                      
                  </div>
                </div>
            

                    
        </div>
    </div>


</asp:Content>
