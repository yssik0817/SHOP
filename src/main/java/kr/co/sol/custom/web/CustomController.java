package kr.co.sol.custom.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sol.custom.service.MemberService;
import kr.co.sol.member.dto.MemberDTO;

@Controller
public class CustomController {

	@Autowired
	MemberService memberService;
	
	@GetMapping("/")	
	public String index(HttpServletRequest request,  Model model, 
			HttpServletResponse response) {
		//세션을 생성해서 받어서
		//회원정보가 있으면 저장
		
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("idKey");
		MemberDTO member = new MemberDTO();
		member.setMem_id(mem_id);
		return "index";
	}
	
	@GetMapping("/register")	
	public String register(HttpServletRequest request,  Model model, 
			HttpServletResponse response) {
		return "Register";
	}
	@RequestMapping(value="/registerProc")	
	public String registerProc(MemberDTO mdto, HttpServletRequest request, 
			HttpServletResponse response, Model model) {
		//memberJoin
		int r = memberService.memberJoin(mdto);
		if(r>0)
			model.addAttribute("msg","회원가입성공");//저장 결과 등을 확인하는 메소드		
		else
			model.addAttribute("msg","회원가입실패");//저장 결과 등을 확인하는 메소드		
		return "MsgPage";
	}
	
	@RequestMapping("/login")	
	public String login(HttpServletRequest request,  Model model, 
			HttpServletResponse response) {
		return "Login";
	}
	
	@RequestMapping(value = "/loginProc")
	public String loginProc(MemberDTO mdto, HttpServletRequest request, HttpServletResponse response, Model model) {
		// memberJoin
		// logger.info("멤버: "+mdto.toString());
		String id = memberService.logonProc(mdto);
		HttpSession session = request.getSession();
		session.setAttribute("idKey", id);
		if(id==null) {
			model.addAttribute("msg","id 또는 password 오류입니다.");
		}
		model.addAttribute("url","/");
		return "MsgPage";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(MemberDTO mdto, HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		session.removeAttribute("idKey");
		session.invalidate();
		return "index";
	}
	
	@RequestMapping(value = "/memberUpdate")
	public String memberUpdate(MemberDTO mdto, HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("idKey");
		mdto.setMem_id(id);
		//서비스 호출 
		mdto = memberService.memberSelect(mdto);
		
		return "Update";
	}
	
	@RequestMapping(value = "/memberUpdateProc")
	public String memberUpdateProc(MemberDTO mdto, HttpServletRequest request, HttpServletResponse response, Model model) {
		//서비스 호출하고 받은 정보 저장, 
		
		//메세지 저장
		int r = memberService.memberUpdate(mdto);
		if(r>0) {
			model.addAttribute("msg","회원정보 수정성공");//저장 결과 등을 확인하는 메소드		
		}else {
			model.addAttribute("msg","회원정보 수정실패");//저장 결과 등을 확인하는 메소드		
		}model.addAttribute("url","/");	
		return "MsgPage";
		
	}
	
	@GetMapping("/idCheck")	
	public int idCheck(MemberDTO mdto, HttpServletRequest request, 
			HttpServletResponse response, Model model) {
		System.out.println(mdto.getMem_id());
		int cnt=0;
		String id = mdto.getMem_id();
		if(mdto.getMem_id()!=null) {
			cnt=memberService.idCheck(id);
		}
		return cnt;
	}
	
	
	
	
}
