package com.cp.servlet;

import com.cp.domain.Option;
import com.cp.domain.Question;
import com.cp.domain.Survey;
import com.cp.service.OptionService;
import com.cp.service.SurveyService;
import com.cp.service.impl.OptionServiceImpl;
import com.cp.service.impl.SurveyServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "submitSurveyServlet", value = "/submitSurveyServlet")
public class submitSurveyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String surveyId = request.getParameter("id");
        SurveyService surveyService=new SurveyServiceImpl();
        OptionService optionService = new OptionServiceImpl();
        Survey survey = surveyService.getSurveyById(surveyId);

        for (Question question : survey.getQuestionList()) {
            String selectedOptionId = request.getParameter("question" + question.getId());
            if (selectedOptionId != null) {
                Option selectedOption = null;
                for (Option option : question.getOptionList()) {
                    if (option.getId().equals(selectedOptionId)) {
                        selectedOption = option;
                        break;
                    }
                }
                if (selectedOption != null) {
                    optionService.updateOption(selectedOption);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}