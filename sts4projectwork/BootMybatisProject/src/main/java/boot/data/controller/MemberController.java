package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/form")
	public String form()
	{
		return "member/addForm";
	}
	
	@GetMapping("/member/mypage")
	public String mypage(Model model)
	{
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		
		return "member/myPage";
	}
	
	@GetMapping("/member/list")
	public String memList(Model model)
	{
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		return "member/memberList";
	}
	
	//아이디 중복체크_rest
	@GetMapping("/member/idcheck")
	public @ResponseBody Map<String, Integer> idCheckProcess(@RequestParam String id)
	{
		Map<String, Integer> map=new HashMap<>();
		
		//id
		int idresult=service.getSearchId(id);
		
		map.put("idresult", idresult); //0 or 1
		
		return map;
	}
	
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
			@RequestParam MultipartFile myphoto,
			HttpSession session)
	{
		
		String path=session.getServletContext().getRealPath("/membersave");
		
			
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				
				System.out.println(path);
				
				String fName=sdf.format(new Date())+"_"+myphoto.getOriginalFilename();
				
				
				//업로드
				try {
					myphoto.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
		dto.setPhoto(fName);
		
		service.insertMember(dto);
		
		return "/member/gaipSuccess";
	}
	
	//마이페이지에서 프로필 사진만 변경하고자 할 때
	@PostMapping("member/updatephoto")
	@ResponseBody
	public void photoUpload(String num,
			MultipartFile photo,
			HttpSession session)
	{
		//업로드될 경로 구하기
		String path=session.getServletContext().getRealPath("/membersave");
		
		//System.out.println(path);
		String old_photo=service.getDataByNum(num).getPhoto();
		
		File file=new File(path+"\\"+old_photo);
		
		file.delete();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String fileName=sdf.format(new Date())+"_"+photo.getOriginalFilename();
		
		//업로드
		try {
			photo.transferTo(new File(path+"\\"+fileName));
			
			//db수정
			service.updatePhoto(num, fileName);
			
			//상단 프로필 사진도 변경
			session.setAttribute("loginphoto", fileName);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@PostMapping("member/update")
	@ResponseBody
	public void update(@ModelAttribute MemberDto dto,
			HttpSession session)
	{
		session.setAttribute("loginname", dto.getName());
		
		service.updateMember(dto);
	}
	
	@PostMapping("member/delete")
	@ResponseBody
	public void delete(String num,
			HttpSession session)
	{
		session.removeAttribute("myid");
		session.removeAttribute("loginphoto");
		session.removeAttribute("loginok");
		session.removeAttribute("loginname");
		
		String photo=service.getDataByNum(num).getPhoto();
		 
		String path=session.getServletContext().getRealPath("/membersave");
			 
		File file=new File(path+"\\"+photo);
		file.delete();
			 
		service.deleteMember(num);
	}
	
}
