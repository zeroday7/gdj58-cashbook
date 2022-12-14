package dao;

import java.sql.*;
import java.util.ArrayList;

import util.DBUtil;
import vo.Notice;

public class NoticeDao {
	public int deleteNotcie(Notice notice) throws Exception {
		String sql = "DELETE FROM notice WHERE notice_no = ?";
		return 0;
	}
	
	public int updateNotice(Notice notice) throws Exception {
		String sql = "UPDATE notice SET notice_memo = ? WHERE notice_no = ?";
		return 0;
	}
	
	public int insertNotice(Notice notice) throws Exception {
		String sql = "INSERT notice(notice_memo, updatedate, createdate)"
					+" VALUES(?, NOW(), NOW())";
		return 0;
	}
	
	// 마지막 페이지를 구할려면 전체row수가 필요
	public int selectNoitceCount() {
		int count = 0;
		//
		return count;
	}
	
	// loginForm.jsp 공지목록
	public ArrayList<Notice> selectNoticeListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT notice_no noticeNo, notice_memo noticeMemo, createdate"
					+ " FROM notice ORDER BY createdate DESC"
					+ " LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice n = new Notice();
			n.setNoticeNo(rs.getInt("noticeNo"));
			n.setNoticeMemo(rs.getString("noticeMemo"));
			n.setCreatedate(rs.getString("createdate"));
			list.add(n);
		}
		return list;
	}
}
