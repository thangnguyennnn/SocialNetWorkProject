package model;
public class calTime {
    private int totalSecond;
    private int countTime;
    private String unit;

    public calTime() {
    }

    public calTime(int totalSecond, int countTime, String unit) {
        this.totalSecond = totalSecond;
        this.countTime = countTime;
        this.unit = unit;
    }

    public int getTotalSecond() {
        return totalSecond;
    }

    public void setTotalSecond(int totalSecond) {
        this.totalSecond = totalSecond;
    }

    public int getCountTime() {
        return countTime;
    }

    public void setCountTime(int countTime) {
        this.countTime = countTime;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Override
    public String toString() {
        return "calTime{" + "totalSecond=" + totalSecond + ", countTime=" + countTime + ", unit=" + unit + '}';
    }

 
}
