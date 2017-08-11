<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AuthenticationProject.Admin.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1 align="center">
        Admin Login Section 
        </h1>
        <center>
            <table style="border:1px solid black">
                <tr>
                    <td>
                        EmployeeID :
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtEmpID" Placeholder="Enter Employee Id" />  
                    </td>
                </tr>
                <tr>
                    <td>
                        Password :
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPassword" Placeholder="Enter Password" />  
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <asp:Button Text="Login" runat="server" ID="btnLogin" /> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <center>
                        <asp:Label runat="server" ID="lblErrorMessage" Font-Bold="True" 
                            Font-Italic="False" Font-Names="Segoe UI Light" ForeColor="Red" />
                    </center>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
