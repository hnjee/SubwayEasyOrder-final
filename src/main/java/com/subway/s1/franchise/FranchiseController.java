package com.subway.s1.franchise;

import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.subway.s1.member.MemberService;
import com.subway.s1.store.StoreService;

@Controller
@RequestMapping("/franchise/**")
public class FranchiseController {

	@Autowired
	private FranchiseService franchiseService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	@GetMapping("franchiseRequest")
	public void franchiseRequest() throws Exception{
		
	}
	
	@PostMapping("franchiseRequest")
	public ModelAndView franchiseRequest(FranchiseVO franchiseVO, ModelAndView mv) throws Exception{
		int res = franchiseService.franchiseInsert(franchiseVO);
		if(res>0) {
			mv.addObject("result", "성공적으로 등록되었습니다.");
			mv.addObject("path", "../");
		} else {
			mv.addObject("result", "등록에 실패했습니다.");
			mv.setViewName("franschise/franchiseRequest");
		}
		mv.setViewName("template/result");
		return mv;
	}
	
	// 가맹점 관리
	@GetMapping("franchiseManage")
	public ModelAndView franchiseManage() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FranchiseVO> ar = franchiseService.franchiseList();
		
		mv.addObject("list", ar);
		mv.setViewName("franchise/franchiseManage");
		return mv;		
	}	
	
	@PostMapping("franchiseManage")
	public ModelAndView franchiseManage(int requestNum,ModelAndView mv) throws Exception{
		int res = franchiseService.franchiseUpdate(requestNum);
		if(res>0) {
			FranchiseVO franchiseVO = franchiseService.franchiseSelect(requestNum);
			int storeRes = storeService.storeInsert(franchiseVO);
			storeRes = memberService.ownerInsert(franchiseVO);
			
			if(storeRes>0) {
				// 메일 주소로 생성된 아이디랑 비번 보내주기
				String email = franchiseVO.getEmail1()+"@"+franchiseVO.getEmail2();
				System.out.println("신규 가맹점 이메일 주소 : "+email);
				
				MimeMessage message = javaMailSender.createMimeMessage();
				message.setSubject("[안내] Subway 가맹점 전용 계정 발송 및 안내");		
				String htmlContent = "<table>\r\n" + 
						"		<tr><td style=\"margin: 0px;\" width=\"39\"></td><td style=\"margin: 0px;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"570\"><tbody><tr><td align=\"center\"><img alt=\"SUBWAY\" src=\"https://www.subway.co.kr/images/common/logo_w.png\" width=\"150\" loading=\"lazy\" style=\"margin-top:30px;\"></td></tr><tr><td height=\"40\" style=\"margin: 0px;\"></td></tr><tr><td height=\"45\" style=\"font-size: 18px; text-align: center;\"> 써브웨이의 가족이 되신 것을 환영합니다!</td></tr><tr><td style=\"font-size: 18px; text-align: center;\"> <strong>"+franchiseVO.getOwnerName()+"</strong>님의 가입정보는 다음과 같습니다.</td></tr>"
								+ "<tr><td height=\"30\"></td></tr><tr><td align=\"center\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 80%; font-weight: bold; color: #919eb1; font-size: 14px;\"><tbody><tr><td style=\"border-top: solid 1px #acbacc; border-right: solid 1px #acbacc; width: 38%; background-color: #f2f4f9; padding: 15px 30px; vertical-align: middle; text-align: center;\"> 가맹점 명</td><td style=\"border-top: solid 1px #acbacc; padding: 15px 30px; vertical-align: middle; color: #666666;\"> "+franchiseVO.getStoreName()+"</td></tr>"
										+ "<tr><td style=\"border-top: solid 1px #acbacc; border-right: solid 1px #acbacc; width: 38%; background-color: #f2f4f9; padding: 15px 30px; vertical-align: middle; text-align: center;\"> 계정 ID</td><td style=\"border-top: solid 1px #acbacc; padding: 15px 30px; vertical-align: middle; color: #666666;\"> owner_S"+franchiseVO.getRequestNum()+"</td></tr>"
												+ "<tr><td style=\"border-top: solid 1px #acbacc; border-right: solid 1px #acbacc; border-bottom: solid 1px #acbacc; width: 38%; background-color: #f2f4f9; padding: 15px 30px; vertical-align: middle; text-align: center;\"> 비밀번호</td><td style=\"border-top: solid 1px #acbacc; border-bottom: solid 1px #acbacc; padding: 15px 30px; vertical-align: middle; color: #666666;\"> owner_S"+franchiseVO.getRequestNum()+"</td></tr></tbody></table></td></tr><tr><td height=\"30\"></td></tr>"
														+ "<tr><td style=\"font-size: 14px; text-align:center;\"> 매장 정보는 초기 로그인 시 등록해주세요.</td></tr><tr><td height=\"40\"></td></tr><tr><td style=\"font-family: Dotum; margin: 0px; font-size: 12px; line-height: 1.4; color: rgb(140, 140, 140); text-align:center;\"> 사이트 이용시에 필요한 정보성 메일은 수신동의 여부와 관계 없이 발송됩니다.</td></tr></tbody></table></td></tr>\r\n" + 
						"	</table>";
				message.setText(htmlContent,"UTF-8","html");
				message.setFrom("subway.test2020@gmail.com");
				message.addRecipient(RecipientType.TO, new InternetAddress(email));
				javaMailSender.send(message);
			}
	
			mv.addObject("result", "가맹점 허가되었습니다.");
		} else {
			mv.addObject("result", "허가 실패했습니다.");
		}
		mv.addObject("path", "./franchiseManage");
		mv.setViewName("template/result");
		return mv;
	}
	
}
