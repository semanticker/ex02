<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Data Tables
        <small>advanced tables</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content"> 
      <div class="row">
        <div class="col-xs-12">
          
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
              <!-- <button type="button" class="btn btn-block btn-info">Info</button> -->
              <button id="regBtn" type="button" class="btn btn-default">+ 추가</button>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>수정일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="board" >
                	<tr>
                		<td><c:out value="${board.bno}" /></td>
                		<td><c:out value="${board.title}" /></td>
                		<td><c:out value="${board.writer}" /></td>
                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}" /></td>
                	</tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>수정일</th>
                </tr>
                </tfoot>
              </table>
              
              <div class="modal modal-success fade" id="modal-success">
	          <div class="modal-dialog">
	            <div class="modal-content">
	              <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                  <span aria-hidden="true">&times;</span></button>
	                <h4 class="modal-title">Success Modal</h4>
	              </div>
	              <div class="modal-body">
	                <p>One fine body&hellip;</p>
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
	                <!-- <button type="button" class="btn btn-outline">Save changes</button> -->
	              </div>
	            </div>
	            <!-- /.modal-content -->
	          </div>
	          <!-- /.modal-dialog -->
	        </div>
	        <!-- /.modal -->
              
           
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </section>
    <!-- /.content -->
    
    <script type="text/javascript">
    $(document).ready(function(){
    	var result = '<c:out value="${result}" />';
    	
    	checkModal(result);
    	
    	function checkModal(result){
    		if(result == ''){
    			return;
    		}
    		
    		if(parseInt(result)>0){
    			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
    		}
    		
    		$('#modal-success').modal("show");
    	}
    	
    	$('#regBtn').on("click", function(){
    		self.location = "/board/register";
    	});
    	
    	
    });
    </script>
    <%@include file="../includes/footer.jsp" %>
    
