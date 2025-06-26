package spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.BoardDao;
import spring.mvc.dto.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/list")
	public ModelAndView blist(
			@RequestParam(value = "currentPage",
					defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=dao.getTotalCount();
		
		int perPage=5; //���������� ������ ���� ����
		int perBlock=5; //�Ѻ��� ������ �������� ����
		int startNum; //db���� ������ ���� ���۹�ȣ(mysql:0 ����Ŭ:1��)
		int startPage; //�� ���� ������ ���� ������
		int endPage; //�� ���� ������ �� ������
		int totalPage; //�� ������
		int no; //�� �������� ����� ���۹�ȣ

		//�� ���������� ���Ѵ�
		//�� ���� ����/�� �������� ������ ������ ����(7/5=1)
		//�������� 1�̶� ������ ������ 1������ �߰�(1+1=2�������� �ʿ�)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
		//�� ���� ������ ���� ������
		//perBlock=5�� ��� ���� �������� 1~5 ����1, ��5
		//���� ���� �������� 13�� ���� ����11, ��15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		
		//�� �������� 23���� ��� ������ ���� 25�� �ƴ϶� 23�̴�
		if(endPage>totalPage)
			endPage=totalPage;
		
		//�� ���������� ������ ���� ��ȣ
		//��: 1������-->0 2������-->5 3������-->10
		startNum=(currentPage-1)*perPage;
		
		//�� �������� ����� ���۹�ȣ
		//������� �� �� ������ 23 1������:23 2������:18 3������:13...
		no=totalCount-(currentPage-1)*perPage;
		
		List<BoardDto> list=dao.getList(startNum, perPage);
		
		model.addObject("list", list);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount", totalCount);
		model.addObject("no", no);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/board/boardList");
		
		return model;
	}
	
	//�۾��� ������ �̵�
	@GetMapping("/board/form")
	public ModelAndView form1(
			@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "1") int currentPage)
	{

		ModelAndView model=new ModelAndView();
		
		//����϶��� �ѿ��� ��(4��)
		//�����϶��� ��� null�̹Ƿ� defaultValue������ ����
		model.addObject("num", num);
		model.addObject("regroup", regroup);
		model.addObject("restep", restep);
		model.addObject("relevel", relevel);
		model.addObject("currentPage", currentPage);
		
		//���� ����� ��� �ش� ���� �־��
		/*
		 * String subject=""; if(num>0) {
		 * 
		 * }
		 */
		
		model.setViewName("/board/writeForm");
		
		return model;
	}
	
	//insert
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session)
	{
		//���ε��� ���� ���
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		//System.out.println(path);
	
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";
		
		//�������� ���ϸ� "no", �ϸ� ��¥ ���� ���Ͽ� db���� ,�� ����
		
		if(upload.get(0).getOriginalFilename().equals("")) 
			photo="no";
		
		else {
			
			for(MultipartFile f:upload)
			{
				String fname=sdf.format(new Date())+"_"+f.getOriginalFilename();
				photo+=fname+",";
				
				//���ε�
				try {
					f.transferTo(new File(path+"\\"+fname));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//photo������ �ĸ� ����
			photo=photo.substring(0, photo.length()-1);
		}
		
		//dto�� photo�־��ֱ�
		dto.setPhoto(photo);
		
		//dao insert
		dao.insertBoard(dto);
		
		return "redirect:list";
	}
	
	//���� ������ ������ �������� ����
	@GetMapping("/board/content")
	public ModelAndView content(
			@RequestParam int num,
			@RequestParam int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		//��ȸ��
		dao.updateReadCount(num);
		
		//dto
		BoardDto dto=dao.getOneData(num);
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/board/content");
		
		return model;
	}
		
}
