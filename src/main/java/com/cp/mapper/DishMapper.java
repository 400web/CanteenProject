package com.cp.mapper;

import com.cp.domain.Dish;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface DishMapper{
    /**
     * 通过菜品ID获取菜品对象
     *
     * @param dishId 菜品ID
     * @return 菜品对象，若不存在返回null
     */
    Dish selectById(@Param("dishId") String dishId);

    /**
     * 通过食堂ID获取该食堂所有菜品列表
     *
     * @param canteenId 食堂ID
     * @return 菜品列表，若不存在返回空列表
     */
    List<Dish> selectListByCanteenId(@Param("canteenId") String canteenId);

    /**
     * 通过菜系获取菜品列表
     *
     * @param cuisine 菜系
     * @return 菜品列表，若不存在返回空列表
     */
    List<Dish> selectListByCuisine(@Param("cuisine") String cuisine);

    /**
     * 通过价格区间获取菜品列表
     *
     * @param minPrice 最大价格
     * @param maxPrice 最小价格
     * @return 菜品列表，若不存在返回空列表
     */
    List<Dish> selectListByPrice(@Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice);
    List<Dish> selectList();
    List<Dish> selectListByPage(Map<String,Object> data);
    List<Dish> selectListByRecommend(@Param("recommend") String recommend);
    List<Dish> selectDishesDynamic(Map<String, Object> map);
    boolean addDish(Dish dish);
    boolean updateDish(Dish dish);
    boolean deleteDish(@Param("id") String id);
}
