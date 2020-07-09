<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.section_subway_menu{
    font-weight: bold;
    font-family: font_sw;
    background: url(../images/bul_tit.png) 0 0 no-repeat;
    background-size: 40px;
    background-position:6px 0px;
    
}
.sidebar .sidebar-brand{
	padding: 0px;
}
</style> 
<html>
	  
   <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #009223;">
      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../" style="margin-top: 100px">
        <div class="sidebar-brand-text mx-3 section_subway_menu" style="height:70px;font-size:17px;margin: 0 9px">Subway's Managment</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider">
		
      <!-- Heading -->
      <div class="sidebar-heading" style="font-size:14px">
       	Sales Management
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <!-- 매출현황 -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/headOfficeSales/chart">
          <i class='fas fa-chart-bar' style='font-size:20px'></i>
          <span>매출현황</span>
          </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog" style='font-size:20px'></i>
          <span>매출관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Sales Management:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/headOfficeSales/byProduct">상품별 매출</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/headOfficeSales/byPeriod">기간별 매출</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/headOfficeSales/byDay">요일별 매출</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/headOfficeSales/byTime">시간별 매출</a>
          </div>
        </div>
      </li>

    
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading" style="font-size:14px">
        Product
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder" style='font-size:20px'></i>
          <span>상품관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Product Management:</h6>

           <a class="collapse-item" href="${pageContext.request.contextPath}/ingredient/headOfficeIngredientList">재료관리</a>
           <a class="collapse-item" href="${pageContext.request.contextPath}/ingredient/ingredientRegister">재료등록</a>
           <a class="collapse-item" href="${pageContext.request.contextPath}/product/headOfficeProductList">메뉴관리</a>
           <a class="collapse-item" href="${pageContext.request.contextPath}/product/productInsert">메뉴등록</a>

          </div>
        </div>
      </li>
      <hr class="sidebar-divider d-none d-md-block">
      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages1" aria-expanded="true" aria-controls="collapsePages">
          <i class='far fa-address-card' style='font-size:20px'></i>
          <span>가맹점관리</span>
          </a>
           <div id="collapsePages1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
           <a class="collapse-item" href="${pageContext.request.contextPath}/ownerManagement/ownerList">가맹점관리</a>
         </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
    </ul>

</html>

