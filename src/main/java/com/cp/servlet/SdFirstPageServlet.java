package com.cp.servlet;

import com.cp.domain.Canteen;
import com.cp.service.CanteenService;
import com.cp.service.impl.CanteenServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(name = "SdFirstPageServlet", value = "/SdFirstPageServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,    // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class SdFirstPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CanteenService canteenService = new CanteenServiceImpl();
        List<Canteen> canteens = canteenService.getList();
        request.setAttribute("canteens", canteens);
        request.getRequestDispatcher("sdFirstPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String uploadPath = getServletContext().getRealPath("/css"); // 修改为您的项目路径下的 image 文件夹路径
        // 获取上传文件的部分
        Part filePart = request.getPart("canteenImageInput");
        // 获取上传文件的文件名
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        // 检查上传路径是否存在，如果不存在则创建目录
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // 创建文件夹
        }

        // 写入文件到指定目录
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

        // 文件已保存到指定文件夹
        // 可以在此处添加代码来处理保存成功后的逻辑
        CanteenService canteenService = new CanteenServiceImpl();
        String name = request.getParameter("canteenNameInput");
        String location = request.getParameter("canteenLocationInput");
        String introduction = request.getParameter("canteenDescriptionInput");
        String openingTime = request.getParameter("canteenOpeningInput");
        String closingTime = request.getParameter("canteenClosingInput");
        String image = null;
        if(fileName != null && !fileName.isEmpty()){
            image = "css/"+fileName;
        }
        Canteen canteen = new Canteen(null, name, image, location, introduction, openingTime, closingTime, null, 0D );
        if(canteenService.addCanteen(canteen)){
            doGet(request, response);
        }
    }
}