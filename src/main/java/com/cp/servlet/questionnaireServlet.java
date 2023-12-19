package com.cp.servlet;

import com.cp.domain.Survey;
import com.cp.service.SurveyService;
import com.cp.service.impl.SurveyServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "questionnaireServlet", value = "/questionnaireServlet")
public class questionnaireServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SurveyService surveyService=new SurveyServiceImpl();
        List<Survey> surveys = surveyService.getAllSurveys();
        surveys.forEach(System.out::println);
        if(surveys!=null){
        request.setAttribute("surveys",surveys);
        request.getRequestDispatcher("questionnaire.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}