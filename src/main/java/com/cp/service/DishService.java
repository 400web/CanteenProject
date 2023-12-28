package com.cp.service;

import com.cp.domain.Dish;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DishService{
    /**
     * 通过菜品ID获取菜品对象
     *
     * @param dishId 菜品ID
     * @return 菜品对象，若不存在返回null
     */
    Dish getDishById(String dishId);

    /**
     * 通过食堂ID获取该食堂所有菜品列表
     *
     * @param canteenId 食堂ID
     * @return 菜品列表，若不存在返回空列表
     */
    List<Dish> getDishesByCanteenId(String canteenId);

    /**
     * 通过菜系获取菜品列表
     *
     * @param cuisine 菜系
     * @return 菜品列表，若不存在返回空列表
     */
    List<Dish> getDishByCuisine(String cuisine);

    /**
     * 通过价格区间获取菜品列表
     *
     * @param minPrice 最大价格
     * @param maxPrice 最小价格
     * @return 菜品列表，若不存在返回空列表
     */
    List<Dish> getDishByPrice(String minPrice, String maxPrice);
    List<Dish> getList();
    List<Dish> getListByPage(int currPage, int pageSize);
    List<Dish> getDishesDynamic(String dishName,String canteenName,String cuisine,String minPrice, String maxPrice);
    List<Dish> getDishesByRecommend();
    boolean addDish(Dish dish);
    boolean updateDish(Dish dish);
    boolean deleteDish(@Param("id") String id);
}
