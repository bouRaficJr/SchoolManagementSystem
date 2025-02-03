<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="SchoolManagementSystem.Admin.ClassFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <div style="background-image:url(''); width:100% ;height:720px ; background-repeat:no-repeat ; background-size:cover;background-attachment:fixed ;">
    <div class="container p-md-4 p-sm-4 ">
        <div>
            <asp:Label ID="lblMsg" runat="server" ></asp:Label>
        </div>
        <h2 class="text-center"> New Fees </h2>

        <div class="row mb-3 mr-lg-5 ml-lg-5 ml-md-5">
            <div class="col-md-6">
                <label for="ddlClass"> Class </label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required."
                     ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
              </div>
            <div>
                 <div class="col-md-6">
                     <label for="txtFeeAmounts"> Fees(annual)</label>
                     <asp:TextBox ID="txtFeeAmounts" runat="server" CssClass="form-control" Placeholder="Enter Fees Amount" TextMode="Number" required >
                     </asp:TextBox>
                </div>
        </div>
        <div class="row mb-3 mr-lg-5 ml-lg-5 ml-md-5">
                <div class="Col-md-3 col-md-offset-2 md-3" >
                    
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Class" OnClick="btnAdd_Click"  />

                </div>
        </div>
         <div class="row mb-3 mr-lg-5 ml-lg-5 ml-lg-5">
                 <div class="col-md-8">

                     <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display"
                         AutoGenerateColumns="False" AllowPaging="true" PageSize="4" OnPageIndexChanging="Gridview1_PageIndexChanging"
                         OnRowCancelingEdit=" Gridview1_PageCancelingEdit" OnRowDeleting=" Gridview1_RowDeleting" DataKeyNames="FeesId" 
                         OnRowEditing=" Gridview1_RowEditing" OnRowUpdating="GridView1_RowUpdating1">
                         <Columns> 
                             <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             </asp:BoundField>
                             <asp:BoundField DataField="ClassName" HeaderText="Class" ReadOnly="True">
                             <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="Fees(Annual)">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("FeesAmount") %>' CssClass="form-control"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             </asp:TemplateField>
                             <asp:CommandField  CausesValidation="false" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">

                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             </asp:CommandField>
                         </Columns>
                           <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                     </asp:GridView>

                 </div>
         </div>

    </div>
</div>






</asp:Content>
