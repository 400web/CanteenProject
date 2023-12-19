package com.cp.servlet;

import com.cp.domain.Option;
import com.cp.domain.Question;
import com.cp.domain.Survey;
import com.cp.service.SurveyService;
import com.cp.service.impl.SurveyServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "viewSurveyServlet", value = "/viewSurveyServlet")
public class viewSurveyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String surveyId = request.getParameter("id");
        if (surveyId != null && !surveyId.isEmpty()){
            SurveyService surveyService=new SurveyServiceImpl();
            Survey survey = surveyService.getSurveyById(surveyId);
            request.setAttribute("survey",survey);
            request.getRequestDispatcher("viewSurvey.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}