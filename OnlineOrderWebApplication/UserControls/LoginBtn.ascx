<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginBtn.ascx.cs" Inherits="OnlineOrderWebApplication.UserControls.LoginBtn" %>



<div runat="server" id="LoginButton">

    <a class="btn btn-danger text-light" href="Login.aspx" role="button"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Login</a>

</div>


<div runat="server" id="LoginMenu">


<div class="btn-group">
  <button type="button" class="btn btn-danger">
      <i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;<asp:Label ID="saluteMsg" runat="server" Text="Hi, user"></asp:Label>
  </button>
  <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="Menu.aspx">My Cart</a>
    <a class="dropdown-item" href="MyOrder.aspx">My Order</a>
    <a class="dropdown-item" href="MyAccount.aspx">My Account</a>
    <div class="dropdown-divider"></div>
      <a href="#" class="dropdown-item" runat="server" id="lnkLogout" onserverclick="lnkLogout_Click"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
  </div>
</div>


</div>

