<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolManagementSystem.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



     <div style="background-image:url(''); width:100% ;height:720px ; background-repeat:no-repeat ; background-size:cover;background-attachment:fixed ;">
           <div class="container p-md-4 p-sm-4 ">
             <div>
            <asp:Label ID="lblMsg" runat="server" ></asp:Label>
             </div>
                 <h2 class="text-center"> Add Teacher </h2>

                 <div class="row mb-3 mr-lg-5 ml-lg-5 ml-md-5">
                  <div class="col-md-6">
                     <label for="txtName"> Name </label>
                     <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter Name "   >
                      </asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage=" name should be in characters"
                       foreColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                              </asp:RegularExpressionValidator>
                 
              </div>
            <div>
                 <div class="col-md-6">
                     <label for="txtDoB"> Date of Birth</label>
                     <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date" >
                </asp:TextBox>
                </div>
        </div>

             <div class="row mb-3 mr-lg-5 ml-lg-5 ml-md-5">
     <div class="col-md-6">
         <label for="ddlGender"> Gender </label>
         <asp:DropDownList ID="ddlGender" runat="server"  CssClass="form-control">
             <asp:ListItem Value="0">Select Gender</asp:ListItem>
             <asp:ListItem>Male</asp:ListItem>
             <asp:ListItem>Female</asp:ListItem>
             <asp:ListItem>Other</asp:ListItem>
         </asp:DropDownList>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is required" ForeColor="Red" 
             ControlToValidate ="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Gender">
         </asp:RequiredFieldValidator>
          
       </div>
     <div>
          <div class="col-md-6">
              <label for="txtMobile"> Moblie</label>
              <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder=" 8 Digits Mobile No.">
         </asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage=" invalid  Mobile No. "
      foreColor="Red" ValidationExpression="[0-9]{8}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                </asp:RegularExpressionValidator>
         </div>
 </div>
                 

    <div class="row mb-3 mr-lg-5 ml-lg-5 ml-md-5">
     <div class="col-md-6">
         <label for="txtEmail"> Email </label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter Email " TextMode="Email"   >
         </asp:TextBox>
          
       </div>
     <div>
          <div class="col-md-6">
              <label for="txtPasword"> Password</label>
              <asp:TextBox ID="txtPasword" runat="server" CssClass="form-control"  Placeholder="EnterPassword" TextMode="Password"  >
         </asp:TextBox>
         </div>
 </div>
                        <div class="row mb-3 mr-lg-5 ml-lg-5 ml-md-5">
    <div class="col-md-12">
        <label for="txtAddress"> Address </label>
       <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="Enter Address " TextMode="MultiLine"   >
        </asp:TextBox>         
      </div>
</div>


       <div class="row mb-3 mr-lg-5 ml-lg-5 ml-md-5">
               <div class="Col-md-3 col-md-offset-2 md-3" >
                   
                   <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Teacher " OnClick="Button1_Click"  />
               </div>
       </div>
                     </div>                   
         <div class="row mb-3 mr-lg-5 ml-lg-5 ml-lg-5">
                 <div class="col-md-12">

                      <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display"
                         AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging="Gridview1_PageIndexChanging"
                         OnRowCancelingEdit=" Gridview1_PageCancelingEdit" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="TeacherId" 
                         OnRowEditing=" Gridview1_RowEditing" OnRowUpdating="GridView1_RowUpdating1">
                         <Columns> 

                             <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             </asp:BoundField>

                             <asp:TemplateField HeaderText="Classs">
                                 <EditItemTemplate>
                                     
                                       <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control"
                                           Width="100px">  </asp:TextBox>

                                     </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Mobile">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control" 
                                         Width="100px"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %> '></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             </asp:TemplateField>

                              <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                  <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %> '></asp:Label>
                                    </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                               <asp:TemplateField HeaderText="Password">
                                <EditItemTemplate>
                                         <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control" 
                                              Width="100px"></asp:TextBox>
                                  </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %> '></asp:Label>
                                        </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>

                                <asp:TemplateField HeaderText="Address">
                                 <EditItemTemplate>
                                      <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control" 
                                     Width="100px" TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                  <ItemTemplate>
                                     <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %> '></asp:Label>
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
</div>

</div>

</asp:Content>
