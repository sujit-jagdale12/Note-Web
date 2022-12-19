package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.entities.Note;
import com.factory.FactoryProvider;

@WebServlet("/SaveNotes")
public class SaveNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNotes() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			Note note=new Note(title, content, new Date());
			
			Session session=FactoryProvider.getSessionFactory().openSession();
			session.beginTransaction();
			
			session.save(note);
			session.getTransaction().commit();
			session.close();
			
			response.setContentType("text/html");
			PrintWriter pw=response.getWriter();
			pw.println("<h2 style='text-align:center;'>note saved successfully</h2><br><br>");
			pw.println("<h4 style='text-align:center;'>to add new note <a href='add_notes.jsp'>click here</a></h4>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
