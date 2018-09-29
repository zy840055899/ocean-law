package com.jinge.ocean.dao;

import com.jinge.ocean.entity.Ship;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zheng 2018-9-29 14:38:16
 */
public interface ShipDao {
    void addShip(Ship ship);

    void delShipById(@Param("shipId") String shipId);

    void updateShip(Ship ship);

    List<Ship> getAllShips(@Param("shipName") String shipName, @Param("shipowner") String shipowner);

    Ship getShipById(@Param("shipId") String shipId);


}
