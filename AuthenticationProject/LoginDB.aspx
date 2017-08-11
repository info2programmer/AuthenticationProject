<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginDB.aspx.cs" Inherits="AuthenticationProject.LoginDB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Useing Database</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <table style="border:1px solid black">
            <tr>
                <td colspan="2">
                    <h2 align="center">Login</h2>
                </td>
            </tr>
            <tr>
                <td>
                    Email/UserName :
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtEmail" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ErrorMessage="*" ControlToValidate="txtEmail" 
                        Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password :
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" /><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ErrorMessage="*" ControlToValidate="txtPassword" 
                        Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Login" ID="btnLogin" runat="server" 
                        onclick="btnLogin_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:CheckBox Text="Remember Me" ID="chkRemember" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="" ID="lblMessage" Font-Bold="true" ForeColor="Red" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink NavigateUrl="~/Authntication(web.config)/Registation/Registation.aspx" runat="server" Text="Don't Have Account? Click Here To Register" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="#" runat="server" Text="Forget Password?" />
                </td>
            </tr>
        </table>
    </center>
    </div>
    </form>
</body>
</html>
