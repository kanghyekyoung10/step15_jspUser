package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import dto.UserDTO;
import jdbc.DBConPoolUtil;
import jdbc.DBUtil;


public class UserDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	//select
	ResultSet rs = null;

	// 가입
	//public void insertUser(String userId, String name, String password, int age, String email, String jobTitle) {
	public void insertUser(UserDTO dto) {
		try {
			
			//1. 드라이버 객체 로딩
			//2. 커넥션 연결
			conn = DBConPoolUtil.getConnection();
				
			//3. PreparedStatement 생성
			String sql = "insert into User values(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
//			pstmt.setString(1, userId);
//			pstmt.setString(2, name);
//			pstmt.setString(3, password);
//			pstmt.setInt(4, age);
//			pstmt.setString(5, email);
//			pstmt.setString(6, jobTitle);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPassword());
			pstmt.setInt(4, dto.getAge());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getJobTitle());
			pstmt.setDate(7, Date.valueOf(LocalDate.now()));
			
			System.out.println("3. PreparedStatement 생성 성공");
			
			//4. sql 전송
			int count = pstmt.executeUpdate();
			System.out.println("4. SQL 전송 성공");
			System.out.println("count : " + count);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//5. 연결 해제
			DBUtil.close(conn, pstmt);
			System.out.println("");
		}

	}

	// 수정
	public void updateUser(UserDTO dto) {
		try {
			//1. 드라이버 객체 로딩
			//2. 커넥션 연결
			conn = DBConPoolUtil.getConnection();
			
		
			//3. PreparedStatement 생성
			//delete from user where userId = 'user5'
			String sql = "update user set password = ?, email = ?  where userId = ?" ;
			//insert into User values('user1', '홍길동', '1234', 20, 'hong@multi.com', 'employee', '2024-05-01');
			//PreparedStatement 생성 (database에 전송할 sql문 설정)
			pstmt = conn.prepareStatement(sql);
			
			//parameter 값 설정. 문자 타입 : setString(), 숫자 타입 : setInt(), 날짜 타입 : setDate()
			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getUserId());

			System.out.println("3. PreparedStatement 생성 성공");
			
			//4. sql 전송
			int count = pstmt.executeUpdate();
			System.out.println("4. SQL 전송 성공");
			System.out.println("count : " + count);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//5. 연결 해제
			DBUtil.close(conn, pstmt);
			System.out.println("5. 연결 해제");
		}
		
	}

	// 삭제
	public void deleteUser(String userId) {
		try {
			//1. 드라이버 객체 로딩
			//2. 커넥션 연결
			conn = DBConPoolUtil.getConnection();
			
			//3. PreparedStatement 생성
			//delete from user where userId = 'user5'
			String sql = "delete from user where userId = ?";
			//insert into User values('user1', '홍길동', '1234', 20, 'hong@multi.com', 'employee', '2024-05-01');
			//PreparedStatement 생성 (database에 전송할 sql문 설정)
			pstmt = conn.prepareStatement(sql);
			
			//parameter 값 설정. 문자 타입 : setString(), 숫자 타입 : setInt(), 날짜 타입 : setDate()
			
			pstmt.setString(1, userId);
			System.out.println("3. PreparedStatement 생성 성공");
			
			//4. sql 전송
			int count = pstmt.executeUpdate();
			System.out.println("4. SQL 전송 성공");
			System.out.println("count : " + count);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//5. 연결 해제
			DBUtil.close(conn, pstmt);
			System.out.println("5. 연결 해제");
		}
		
	}

	// 내정보 조회
	public UserDTO getUser(String userId, String password) {
		UserDTO user = null;
		try {
			// 1. 드라이버 객체 로딩
			// 2. 커넥션 연결
			conn = DBConPoolUtil.getConnection();
			
			System.out.println("1. 드라이버 객체 로딩 성공");
			System.out.println("2. 커넥션 연결 성공");
			
			// 3. PreparedStatement 생성
			String sql = "select * from user where userId=? and password=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			// 4. sql 전송
			// select문 executeQuery()
			// ResultSet 객체에 담아서 반환
			rs = pstmt.executeQuery();

		
			System.out.println("여러행 출력=========================");
			
			//조회 결과가 있으면
			if(rs.next()) {
				user = new UserDTO(rs.getString("userid"), rs.getString("name"), rs.getString("password"),
						rs.getInt("age"), rs.getString("email"), rs.getString("jobTitle"), rs.getDate("joindate"));
				
			}			
		} catch (SQLException e) {
			e.getStackTrace();
		} finally {
			// 5. 연결 해제
			//ResultSet
			//PreparedStatement
			//Connection
			DBUtil.close(conn, pstmt, rs);
		}
		return user;
	}

	// 전체 목록 조회
	public List<UserDTO> getUserList() {
		List<UserDTO> list = new ArrayList<UserDTO>();
		try {
			// 1. 드라이버 객체 로딩
			// 2. 커넥션 연결
			conn = DBConPoolUtil.getConnection();
			
			System.out.println("1. 드라이버 객체 로딩 성공");
			System.out.println("2. 커넥션 연결 성공");
			
			// 3. PreparedStatement 생성
			String sql = "select * from user";
			pstmt = conn.prepareStatement(sql);

			// 4. sql 전송
			// select문 executeQuery()
			// ResultSet 객체에 담아서 반환
			rs = pstmt.executeQuery();

		
			System.out.println("여러행 출력=========================");
			UserDTO dto = null;
			//db 여러행 가져오기 
			 while(rs.next()) { 
				dto = new UserDTO(rs.getString("userid"), rs.getString("name"), rs.getString("password"), rs.getInt("age"), rs.getString("email"), rs.getString("jobTitle"), rs.getDate("joindate"));
				list.add(dto);
				
			 }
			
			
		} catch (SQLException e) {
			e.getStackTrace();
		} finally {
			// 5. 연결 해제
			//ResultSet
			//PreparedStatement
			//Connection
			DBUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
}
