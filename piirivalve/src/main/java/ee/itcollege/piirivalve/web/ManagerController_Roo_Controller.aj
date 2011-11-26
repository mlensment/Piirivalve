// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.piirivalve.web;

import ee.piirivalve.entities.BorderSection;
import ee.piirivalve.entities.Manager;
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

privileged aspect ManagerController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ManagerController.create(@Valid Manager manager, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("manager", manager);
            return "managers/create";
        }
        uiModel.asMap().clear();
        manager.persist();
        return "redirect:/managers/" + encodeUrlPathSegment(manager.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ManagerController.createForm(Model uiModel) {
        uiModel.addAttribute("manager", new Manager());
        return "managers/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ManagerController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("manager", Manager.findManager(id));
        uiModel.addAttribute("itemId", id);
        return "managers/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ManagerController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("managers", Manager.findManagerEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Manager.countManagers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("managers", Manager.findAllManagers());
        }
        return "managers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ManagerController.update(@Valid Manager manager, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("manager", manager);
            return "managers/update";
        }
        uiModel.asMap().clear();
        manager.merge();
        return "redirect:/managers/" + encodeUrlPathSegment(manager.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ManagerController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("manager", Manager.findManager(id));
        return "managers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ManagerController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Manager.findManager(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/managers";
    }
    
    @ModelAttribute("bordersections")
    public Collection<BorderSection> ManagerController.populateBorderSections() {
        return BorderSection.findAllBorderSections();
    }
    
    @ModelAttribute("managers")
    public Collection<Manager> ManagerController.populateManagers() {
        return Manager.findAllManagers();
    }
    
    String ManagerController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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