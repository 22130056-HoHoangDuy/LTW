package vn.edu.nlu.fit.be.controller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Contact;
import vn.edu.nlu.fit.be.service.ContactService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminContactController", value = "/admin/contacts")
public class AdminContactController extends HttpServlet {
    private final ContactService contactService = new ContactService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Danh sách
        List<Contact> contactList = contactService.loadMoreContacts();
        request.setAttribute("contactList", contactList);

        // Nếu có action=view → load chi tiết
        String action = request.getParameter("action");
        if ("view".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Contact selectedContact = contactService.getContactById(id);
            request.setAttribute("selectedContact", selectedContact);
        }

        request.getRequestDispatcher("/admin_contacts.jsp").forward(request, response);
    }
}