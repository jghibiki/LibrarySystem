<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBooks.aspx.cs" Inherits="LibrarySystem.MyBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Checked Out Books:</h2>
    <asp:GridView ID="CheckedOutBooksGridView" AutoGenerateColumns="false" runat="server" Width="925px">
        <Columns>
            <asp:TemplateField HeaderText="Title">
                <ItemTemplate>
                    <%# Eval("Copy.Medium.Title") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Author">
                <ItemTemplate>
                    <%# Eval("Copy.Medium.Author1") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Checked Out Date">
                <ItemTemplate>
                    <%# Eval("IssuedDate") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Due Date">
                <ItemTemplate>
                    <%# Eval("DueDate") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <h2>Reserved Books:</h2>
    <asp:GridView ID="ReservedBooksGridView" runat="server" Width="922px" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="Title">
                <ItemTemplate>
                    <%# Eval("Copy.Medium.Title") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Author">
                <ItemTemplate>
                    <%# Eval("Copy.Medium.Author1") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reserved Until">
                <ItemTemplate>
                    <%# Eval("ReservationDate") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
