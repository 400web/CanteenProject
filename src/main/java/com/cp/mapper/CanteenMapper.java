package com.cp.mapper;

import com.cp.domain.Canteen;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CanteenMapper {
    /**
     * 通过食堂ID获取食堂对象
     *
     * @param id 食堂ID
     * @return 食堂对象，若不存在返回null
     */
    Canteen selectById(@Param("id") String id);

    /**
     * 通过食堂名称获取食堂对象
     *
     * @param name 食堂名称
     * @return 食堂对象，若不存在返回null
     */
    Canteen selectByName(@Param("name") String name);

    List<Canteen> selectListLikeName(@Param("name") String name);

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
     * @param id 食堂ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteCanteen(@Param("id") String id);

    List<Canteen> selectList();

    List<Canteen> selectListByPage(Map<String, Object> data);
}
