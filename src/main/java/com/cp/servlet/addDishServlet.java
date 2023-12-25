package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.domain.CanteenAdmin;
import com.cp.domain.Dish;
import com.cp.domain.User;
import com.cp.service.CanteenAdminService;
import com.cp.service.CanteenService;
import com.cp.service.DishService;
import com.cp.service.impl.CanteenAdminServiceImpl;
import com.cp.service.impl.CanteenServiceImpl;
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
        DishService dishService = new DishServiceImpl();
        List<Dish> dishes = dishService.getList();
        request.setAttribute("dishes", dishes);
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
            input.transferTo(output);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 获取其他表单字段
        String dishName = request.getParameter("name");
        String dishDescription = request.getParameter("description");
        double dishPrice = Double.parseDouble(request.getParameter("price"));
        String dishCuisine = request.getParameter("cuisine");
        String imagePath = uploadPath + File.separator + fileName;
        String recommend = request.getParameter("recommend");
        System.out.println(11+dishName);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        CanteenAdminService canteenAdminService = new CanteenAdminServiceImpl();
        Canteen canteen =  canteenAdminService.getCanteenByAdminId(user.getId());
        // 创建菜品对象并保存
        Dish dish = new Dish(null,canteen.getId(),dishName, canteen.getName(), imagePath, dishDescription, dishPrice, dishCuisine,0,0,recommend);
         DishService dishService = new DishServiceImpl();
         dishService.addDish(dish);

        if(dishService.addDish(dish)){
            doGet(request, response);
        }
    }
}