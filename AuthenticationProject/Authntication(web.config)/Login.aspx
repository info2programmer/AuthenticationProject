<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AuthenticationProject.Authntication_web.config_.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
    <table style="border:1px solid red">
            <tr>
                <td colspan="2">
                    <center><h2>Login</h2></center>
                </td>
            </tr>
            <tr>
                <td>User Name</td>
                <td>
                    <asp:TextBox runat="server" ID="txtUserName" placeholder="Enter User Name" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtUserName" ForeColor="#CC3300"></asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td>Passworde</td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" placeholder="Enter Password" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtPassword" ForeColor="#CC3300"></asp:RequiredFieldValidator> 
                </td>
            </tr>
            <tr>
                <td colspan="2">
                  <center><asp:CheckBox ID="chkKeep" Text="Keep Me Login" runat="server" /></center>  
                </td>
            </tr>
            <tr>
                <td colspan="2">
                  <center>
                      <asp:Button Text="Login" ID="btnLogin" runat="server" 
                          onclick="btnLogin_Click" Width="102px" /></center>  
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI Light" Font-Size="Medium" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink ID="lnkRegistation" NavigateUrl="~/Authntication(web.config)/Registation/Registation.aspx" runat="server">Don'tHave Any Account? Click Here To Register</asp:HyperLink>
                </td>
            </tr>
        </table>
    </center>
        
    </div>
    </form>
</body>
</html>
