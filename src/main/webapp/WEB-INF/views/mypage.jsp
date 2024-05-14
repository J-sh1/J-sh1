<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html>
<html>

<head>
    <link href="https://fonts.googleapis.com/css?family=NanumSquare+Neo+OTF&display=swap" rel="stylesheet" />
    <link href="/controller/resources/css/mypage.css" rel="stylesheet" />
    <link href="/controller/resources/css/font.css" rel="stylesheet" />
    <title>마이페이지</title>
</head>

<body>
    <div class="main">
        <div class="main_box">



            <table>

                <thead>
                     <span class="userInfo_H">회원개인 정보</span>
                </thead>




                <div id="table_box">

                    <tr>
                        <td colspan="2"><span class="id_td" >아이디</span></td>
                        
                        <TD colspan="2"><input type="text" class="input_Id" value="${info.user_id}" readonly></TD>
                       
                    </tr>
                  
                    <tr>
                        <TD colspan="2"> <span class="nick">닉네임</span></TD>
                        
                        <TD colspan="2"> <input class="nick_input" value="${info.user_nick}" readonly></TD>
                       
                    </tr>

                    
                    <!-- <div class="v67_12"></div> -->
                    <tr>
                        <TD colspan="2"><span class="initial_date">최초가입일시</span></TD>
                       
                        <TD colspan="2"><input class="initial_date_input" value="${fn:split(info.joined_at," ")[0]}" readonly></TD>
                        
                    </tr>
                   
                    <tr>
                        <TD colspan="2"> <span class="favorit1">선호장르1</span></TD>
                        <TD colspan="2"> <input class="favorita1_input" value="${info.user_genre1}" readonly> </TD>
                      
                    </tr>

                   
                    <div class="line2"></div>

                    <Tr>
                        <td colspan="2"> <span class="favorita_td2">선호장르2</span></td>
                        <td colspan="2"> <input class="fovorita2_input" value="${info.user_genre2}" readonly>
                           
                        </td>

                    </Tr>

                   
                    <div class="line"></div>



                    <TR>


                        <div class="btn">

                            <TD colspan="2">
                              
                                    <button type="button" class="btn_out"
                                    onclick="window.location.href='main.do'">나가기</button>
                                  
                               
                            </TD>


                            <TD>
                                
                                <button type="button" class="btn_edt"
                                onclick="window.location.href='usereditForm.do'">수정</button>
                                  
                               
                            </TD>

                            <TD >
                                <div class="bye">
                                    <button type="submit" class="btn_bye"
                                    onclick="window.location.href='goodbyeForm.do'">탈퇴</button>

                                </div>
                            </TD>
                    </TR>


                </div>

            </table>
        </div>

        </div>
        

   
   
</body>

</html>