/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SlotSwap.Entity;

import java.sql.Date;

/**
 *
 * @author amitk
 */
public class SlotEntity {

    private String timeFrom;
    private String timeTo;
    private String weekDay;
    private String SlotDate;
    private Boolean isActive;

    public String getTimeFrom() {
        return timeFrom;
    }

    public void setTimeFrom(String timeFrom) {
        this.timeFrom = timeFrom;
    }

    public String getTimeTo() {
        return timeTo;
    }

    public void setTimeTo(String timeTo) {
        this.timeTo = timeTo;
    }

    public String getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(String weekDay) {
        this.weekDay = weekDay;
    }

    public String getSlotDate() {
        return SlotDate;
    }

    public void setSlotDate(String SlotDate) {
        this.SlotDate = SlotDate;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

   
}
