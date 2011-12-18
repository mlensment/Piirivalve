// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.piirivalve.web;

import ee.piirivalve.entities.BorderSection;
import ee.piirivalve.entities.CrossingPoint;
import ee.piirivalve.entities.Guard;
import ee.piirivalve.entities.Location;
import ee.piirivalve.entities.Troops;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TroopsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String TroopsController.create(@Valid Troops troops, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("troops", troops);
            addDateTimeFormatPatterns(uiModel);
            return "troopses/create";
        }
        uiModel.asMap().clear();
        troops.persist();
        return "redirect:/troopses/" + encodeUrlPathSegment(troops.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String TroopsController.createForm(Model uiModel) {
        uiModel.addAttribute("troops", new Troops());
        addDateTimeFormatPatterns(uiModel);
        return "troopses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String TroopsController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("troops", Troops.findTroops(id));
        uiModel.addAttribute("itemId", id);
        return "troopses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String TroopsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("troopses", Troops.findTroopsEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Troops.countTroopses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("troopses", Troops.findAllTroopses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "troopses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String TroopsController.update(@Valid Troops troops, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("troops", troops);
            addDateTimeFormatPatterns(uiModel);
            return "troopses/update";
        }
        uiModel.asMap().clear();
        troops.merge();
        return "redirect:/troopses/" + encodeUrlPathSegment(troops.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String TroopsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("troops", Troops.findTroops(id));
        addDateTimeFormatPatterns(uiModel);
        return "troopses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String TroopsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Troops.findTroops(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/troopses";
    }
    
    @ModelAttribute("bordersections")
    public Collection<BorderSection> TroopsController.populateBorderSections() {
        return BorderSection.findAllBorderSections();
    }
    
    @ModelAttribute("crossingpoints")
    public Collection<CrossingPoint> TroopsController.populateCrossingPoints() {
        return CrossingPoint.findAllCrossingPoints();
    }
    
    @ModelAttribute("guards")
    public Collection<Guard> TroopsController.populateGuards() {
        return Guard.findAllGuards();
    }
    
    @ModelAttribute("locations")
    public Collection<Location> TroopsController.populateLocations() {
        return Location.findAllLocations();
    }
    
    @ModelAttribute("troopses")
    public Collection<Troops> TroopsController.populateTroopses() {
        return Troops.findAllTroopses();
    }
    
    void TroopsController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("troops_startdate_date_format", "d.MM.yyyy");
        uiModel.addAttribute("troops_enddate_date_format", "d.MM.yyyy");
        uiModel.addAttribute("troops_modified_date_format", "d.MM.yyyy");
        uiModel.addAttribute("troops_created_date_format", "d.MM.yyyy");
        uiModel.addAttribute("troops_deleted_date_format", "d.MM.yyyy");
    }
    
    String TroopsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
