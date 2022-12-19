package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.entities.Note;
import com.factory.FactoryProvider;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int id=Integer.parseInt(request.getParameter("note_id"));			
			Session session=FactoryProvider.getSessionFactory().openSession();
			session.beginTransaction();
			Note  note=session.get(Note.class, id);
			note.setTitle(title);
			note.setContent(content);
			note.setDate(new Date());
			
			session.getTransaction().commit();
			session.close();
			
			response.sendRedirect("GetAll_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
