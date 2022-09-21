<!doctype html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/menu-resp.css" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mobile-compatible Responsive Dropdown Menu Demo</title>
    <style>
    @import url(http://fonts.googleapis.com/css?family=roboto);
    </style>
</head>

<body>
<nav>
  <div id="logo">
      <asp:Image runat="server" Width="50px" ImageAlign="AbsMiddle" ImageUrl="img/logov2.gif" /> 
      <a href="/Default.aspx"></a>
  </div>
  <label for="drop" class="toggle"> <asp:Image runat="server" ImageAlign="AbsMiddle" Width="40px" ImageUrl="img/menu.png" /> </label>
  <input type="checkbox" id="drop" />
  <ul class="menu">
    <li><a href="/Default.aspx">Home</a></li>
    <li> 
      <!-- First Tier Drop Down -->
      <label for="drop-1" class="toggle">Paciente +</label>
      <a href="#">Paciente</a>
      <input type="checkbox" id="drop-1"/>
      <ul>
        <li><a href="/paciente/consultar_paciente.aspx">Consultar/Alterar</a></li>
      </ul>
    </li>
    <li> 
      <!-- First Tier Drop Down -->
      <label for="drop-2" class="toggle">Carteira de Vacinação +</label>
      <a href="#">Portfolio</a>
      <input type="checkbox" id="drop-2"/>
      <ul>
        <li><a href="/carteira/vacinacao.aspx">Vacinação</a></li>
        <li><a href="/carteira/carteira_vacina.aspx">Consultar Carteira</a></li>
        <!-- <li> 
          <!-- Second Tier Drop Down
          <label for="drop-3" class="toggle">Works +</label>
          <a href="#">Works</a>
          <input type="checkbox" id="drop-3"/>
          <ul>
            <li><a href="#">HTML/CSS</a></li>
            <li><a href="#">jQuery</a></li>
            <li><a href="#">Python</a></li>
          </ul>
        </li> -->
      </ul>
    </li>
    <li><a href="#">Blog</a></li>
    <li><a href="#">Submit</a></li>
    <li>
        <asp:HyperLink ID="hplAdministracao" CssClass="dropbtn" runat="server" NavigateUrl="/login.aspx" Text="Administração"></asp:HyperLink>
        <a href="testes.aspx">
            <asp:LinkButton ID="lbtnSair" runat="server" visible="false">
                <asp:Image ImageUrl="img/door2.png" ImageAlign="AbsMiddle" Width="20px" ID="imgSair" runat="server" />
                <asp:Label ID="lblSair" runat="server" Text="   Sair"></asp:Label>
            </asp:LinkButton>
        </a>
    </li>
    <li><a href="/sobre.aspx"><asp:Label ID="lblVersao" runat="server" Text="v0.2.10 (b)"></asp:Label></a></li>
  </ul>
</nav>
<h1> Mobile-compatible Responsive Dropdown Menu Demo </h1>
</body>
</html>
