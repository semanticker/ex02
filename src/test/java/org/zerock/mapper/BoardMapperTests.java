package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	//@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	//@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("�깉濡� �옉�꽦�븯�뒗 湲�");
		board.setContent("�깉濡� �옉�꽦�븯�뒗 �궡�슜");
		board.setWriter("newbie");
		
		mapper.insert(board);
		log.info(board);
	}
	
	//@Test
	public void testInsertReturnKey() {
		BoardVO board = new BoardVO();
		board.setTitle("�깉濡� �옉�꽦�븯�뒗 湲�");
		board.setContent("�깉濡� �옉�꽦�븯�뒗 �궡�슜");
		board.setWriter("newbie");
		
		mapper.insertReturnKey(board);
		log.info(board);
	}
	
	//@Test
	public void testRead() {
		BoardVO board = mapper.read(5L);
		log.info(board);
	}
	
	//@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(5L));
	}
	
	//@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(3L);
		board.setTitle("�닔�젙�맂 �젣紐�");
		board.setContent("�닔�젙�맂 �궡�슜");
		board.setWriter("user00");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}
	
	//@Test
	public void testPaging() {
		Criteria criteria = new Criteria();
		
		criteria.setPageNum(3);
		criteria.setAmount(10);	
		
		List<BoardVO> list = mapper.getListWithPaging(criteria);
		list.forEach(board->log.info(board));
	}
	
	@Test
	public void testSearch() {
		Criteria criteria = new Criteria();
		criteria.setKeyword("안효");
		criteria.setType("T");
		
		List<BoardVO> list = mapper.getListWithPaging(criteria);
		list.forEach(board -> log.info(board));
		
		int result = mapper.getTotalCount(criteria);
		log.info(result);
		
	}
}
