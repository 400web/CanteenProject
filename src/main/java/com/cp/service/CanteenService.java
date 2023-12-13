package com.cp.service;

import com.cp.domain.Canteen;

import java.util.List;


public interface CanteenService{
    /**
     * 通过食堂ID获取食堂对象
     *
     * @param canteenId 食堂ID
     * @return 食堂对象，若不存在返回null
     */
    Canteen getCanteenById(String canteenId);

    /**
     * 通过食堂名称获取食堂对象
     *
     * @param canteenName 食堂名称
     * @return 食堂对象，若不存在返回null
     */
    Canteen getCanteenByName(String canteenName);

    /**
     * 向数据库中添加食堂
     *
     * @param canteen 食堂对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addCanteen(Canteen canteen);

    /**
     * 更新食堂信息
     *
     * @param canteen 食堂对象
     * @return 更新成功返回true，失败返回false
     */
    boolean updateCanteen(Canteen canteen);

    /**
     * 删除食堂信息
     *
     * @param canteenId 食堂ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteCanteen(String canteenId);
    List<Canteen> getListByPage(int currPage, int pageSize);

}
