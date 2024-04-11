package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	/*
	 * JDBC 5단계 절차를 지켜서 개발 데이터 수정, 삭제, 조회 경우도 반복해야함 동일한 코드 구현으로 유지보수가 어렵고, 오타 등 구현에
	 * 불편함 공통된 부분은 별도 클래스로 분리해서 재사용 DBUtil에서는 1, 2, 5번 단계 구현
	 * 
	 * 1. 드라이버 객체 로딩 2. 커넥션 연결 3. PreparedStatement 생성 4. sql 전송 5. 연결 해제
	 */

	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 1. 드라이버 객체 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2. 커넥션 연결
			String jdbcUrl = "jdbc:mysql://localhost:3306/companydb";
			conn = DriverManager.getConnection(jdbcUrl, "root", "1234");

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn, PreparedStatement pstmt) {

		try {
			// 5. 연결 해제
			// PreparedStatement 객체
			pstmt.close();

			// Connection 객체
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//오버로딩
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {

		try {
			// 5. 연결 해제
			//ResultSet 객체
			rs.close();
			
			// PreparedStatement 객체
			pstmt.close();

			// Connection 객체
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
