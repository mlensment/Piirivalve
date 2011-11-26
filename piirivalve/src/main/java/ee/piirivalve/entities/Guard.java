package ee.piirivalve.entities;

import java.io.Serializable;
import java.lang.Long;

import javax.persistence.*;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.tostring.RooToString;
import ee.piirivalve.entities.CrossingPoint;
import java.util.Collection;
import ee.piirivalve.entities.BorderSection;

/**
 * Entity implementation class for Entity: Guard
 *
 */
@Entity
@RooToString
@RooEntity
public class Guard implements Serializable {

	   
	@Id
	private Long id;
	private String name;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private static final long serialVersionUID = 1L;
	@OneToMany(mappedBy = "guard")
	private Collection<CrossingPoint> crossingPoint;
	@OneToMany(mappedBy = "guard")
	private Collection<BorderSection> borderSection;

	public Guard() {
		super();
	}   
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Collection<CrossingPoint> getCrossingPoint() {
	    return crossingPoint;
	}
	public void setCrossingPoint(Collection<CrossingPoint> param) {
	    this.crossingPoint = param;
	}
	public Collection<BorderSection> getBorderSection() {
	    return borderSection;
	}
	public void setBorderSection(Collection<BorderSection> param) {
	    this.borderSection = param;
	}
   
}