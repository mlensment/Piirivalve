// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.piirivalve.entities;

import java.lang.String;

privileged aspect Troops_Roo_ToString {
    
    public String Troops.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Code: ").append(getCode()).append(", ");
        sb.append("Comment: ").append(getComment()).append(", ");
        sb.append("Enddate: ").append(getEnddate()).append(", ");
        sb.append("Guard: ").append(getGuard() == null ? "null" : getGuard().size()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Location: ").append(getLocation()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Startdate: ").append(getStartdate()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
