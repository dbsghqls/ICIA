package com.icia.dabyinsa.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.dabyinsa.user.dto.MiligeDto;

@Repository
public class MiligeDaoImpl implements MiligeDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MiligeDto> miList(String m_id) {
		return sqlSession.selectList("miList", m_id);
	}

}
