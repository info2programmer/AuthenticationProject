<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registation.aspx.cs" Inherits="AuthenticationProject.Authntication_web.config_.Registation.Registation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registation Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <table style="border:1px solid black">
            <tr>
                <td colspan="2">
                    <h2 align="center">Registation</h2>
                </td>
            </tr>
            <tr>
                <td>
                    Name 
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtName" placeholder="Enter Your Name" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server"
                         ErrorMessage="Enter Name" Text="*" SetFocusOnError="True"
                         ControlToValidate="txtName" ForeColor="#0033CC" Font-Size="Medium" Font-Bold="True">
                         </asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td>
                    Email 
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Enter Your Name" TextMode="Email" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server"
                         ErrorMessage="Enter Email" Text="*" SetFocusOnError="True"
                         ControlToValidate="txtEmail" ForeColor="#0033CC" Font-Size="Medium" Font-Bold="True">
                         </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" placeholder="Enter Password" TextMode="Password" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" runat="server"
                         ErrorMessage="Enter Password" Text="*" SetFocusOnError="True"
                         ControlToValidate="txtPassword" ForeColor="#0033CC" Font-Size="Medium" Font-Bold="True">
                         </asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                   Re-Type Password
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtRePassword" placeholder="Enter Password" TextMode="Password" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" runat="server"
                         ErrorMessage="Re-type Your Password" Text="*" SetFocusOnError="True"
                         ControlToValidate="txtRePassword" ForeColor="#0033CC" Font-Size="Medium" Font-Bold="True">
                         </asp:RequiredFieldValidator>

                    <asp:CompareValidator ID="CompareValidator1"
                     runat="server" ErrorMessage="Password and Re-type password must be same"
                     ControlToValidate="txtRePassword" ControlToCompare="txtPassword"
                      Text="*" SetFocusOnError="True"
                      ForeColor="#0033CC" Font-Size="Medium" Font-Bold="True">
                     </asp:CompareValidator>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Register" ID="btnRegister" runat="server" 
                        onclick="btnRegister_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <p align="center">
                        <asp:ValidationSummary ID="ValidationSummary1" Font-Bold="True" 
                        ForeColor="#0033CC" runat="server" Font-Names="Segoe UI Light" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <p align="center">
                        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" 
                            ForeColor="#FF3300" />
                    </p>
                </td>
            </tr>
             <tr>
                <td colspan="2">
                    <p align="center">
                        <asp:HyperLink NavigateUrl="~/LoginDB.aspx" runat="server" >Have Account? Login Here</asp:HyperLink>
                    </p>
                </td>
            </tr>
        </table>
       </center>
    </div>
    </form>
</body>
</html>
