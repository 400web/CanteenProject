package com.cp.servlet;

import com.cp.domain.*;
import com.cp.service.CanteenAdminService;
import com.cp.service.CanteenService;
import com.cp.service.ComplaintService;
import com.cp.service.DishService;
import com.cp.service.impl.CanteenAdminServiceImpl;
import com.cp.service.impl.CanteenServiceImpl;
import com.cp.service.impl.ComplaintServiceImpl;
import com.cp.service.impl.DishServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.websocket.Session;

import java.io.*;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(name = "addDishServlet", value = "/addDishServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,    // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class addDishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CanteenService canteenService = new CanteenServiceImpl();
        DishService dishService = new DishServiceImpl();
        ComplaintService complaintService = new ComplaintServiceImpl();
        CanteenAdminService canteenAdminService = new CanteenAdminServiceImpl();
        User user = (User) request.getSession().getAttribute("user");
        Canteen canteen=canteenAdminService.getCanteenByAdminId(user.getId());
        List<Dish> dishes=dishService.getDishesByCanteenId(canteen.getId());
        List<Complaint> complaints=complaintService.getComplaintsByCanteenName(canteen.getName());
        request.setAttribute("canteen",canteen);
        request.setAttribute("dishes",dishes);
        request.setAttribute("complaints",complaints);

        request.getRequestDispatcher("canteenManagement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 处理文件上传
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("/css"); // 确保有这个目录
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        File file = new File(uploadDir, fileName);

        try (InputStream input = filePart.getInputStream();
             OutputStream output = new FileOutputStream(file)) {
            byte[] buffer = new byte[1024];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        } catch (IOException e) {
            // 文件读写过程中可能会发生异常
            e.printStackTrace();
        } finally {
            // 关闭输入输出流
            filePart.delete(); // 删除临时文件
        }

        // 获取其他表单字段
        String dishName = request.getParameter("name");
        String dishDescription = request.getParameter("description");
        double dishPrice = Double.parseDouble(request.getParameter("price"));
        String dishCuisine = request.getParameter("cuisine");

        String recommend = request.getParameter("recommend");
        System.out.println(11+dishName);
//        if(fileName != null && !fileName.isEmpty()){
//            image = "css/"+fileName;
            String imagePath = "css/" + fileName;


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        CanteenAdminService canteenAdminService = new CanteenAdminServiceImpl();
        Canteen canteen =  canteenAdminService.getCanteenByAdminId(user.getId());
        // 创建菜品对象并保存
        Dish dish = new Dish(null,canteen.getId(),dishName, canteen.getName(), imagePath, dishDescription, dishPrice, dishCuisine,0,0,recommend);
         DishService dishService = new DishServiceImpl();
//         dishService.addDish(dish);

        if(dishService.addDish(dish)){
            doGet(request, response);
        }
    }
}