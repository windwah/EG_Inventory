package com.windwah.inventory.controller;

import com.windwah.inventory.entity.Manufacturer;
import com.windwah.inventory.exception.DuplicateManufacturerNameException;
import com.windwah.inventory.exception.ResourceNotFoundException;
import com.windwah.inventory.service.ManufacturerService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manufacturers")
public class ManufacturerWebController {

    private final ManufacturerService manufacturerService;

    public ManufacturerWebController(ManufacturerService manufacturerService) {
        this.manufacturerService = manufacturerService;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("manufacturers", manufacturerService.findAll());
        return "manufacturers/list";
    }

    @GetMapping("/new")
    public String newForm(Model model) {
        if (!model.containsAttribute("form")) {
            model.addAttribute("form", new ManufacturerForm());
        }
        return "manufacturers/form";
    }

    @PostMapping
    public String create(@Valid @ModelAttribute("form") ManufacturerForm form,
                         BindingResult binding,
                         RedirectAttributes ra) {
        if (binding.hasErrors()) {
            ra.addFlashAttribute("org.springframework.validation.BindingResult.form", binding);
            ra.addFlashAttribute("form", form);
            return "redirect:/manufacturers/new";
        }
        try {
            Manufacturer saved = manufacturerService.create(
                    form.getName(),
                    form.getContactPerson(),
                    form.getContactPhone(),
                    form.getContactEmail(),
                    form.getAddress(),
                    form.getCountry()
            );
            ra.addFlashAttribute("info", "Manufacturer created: " + saved.getName());
            return "redirect:/manufacturers";
        } catch (DuplicateManufacturerNameException ex) {
            binding.rejectValue("name", "duplicate", ex.getMessage());
            ra.addFlashAttribute("org.springframework.validation.BindingResult.form", binding);
            ra.addFlashAttribute("form", form);
            return "redirect:/manufacturers/new";
        }
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        Manufacturer m = manufacturerService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Manufacturer", id));
        if (!model.containsAttribute("form")) {
            ManufacturerForm f = new ManufacturerForm();
            f.setName(m.getName());
            f.setContactPerson(m.getContactPerson());
            f.setContactPhone(m.getContactPhone());
            f.setContactEmail(m.getContactEmail());
            f.setAddress(m.getAddress());
            f.setCountry(m.getCountry());
            model.addAttribute("form", f);
            model.addAttribute("id", id);
        }
        return "manufacturers/form";
    }

    @PostMapping("/{id}/edit")
    public String update(@PathVariable Long id,
                         @Valid @ModelAttribute("form") ManufacturerForm form,
                         BindingResult binding,
                         RedirectAttributes ra) {
        if (binding.hasErrors()) {
            ra.addFlashAttribute("org.springframework.validation.BindingResult.form", binding);
            ra.addFlashAttribute("form", form);
            return "redirect:/manufacturers/" + id + "/edit";
        }
        try {
            Manufacturer saved = manufacturerService.update(id,
                    form.getName(),
                    form.getContactPerson(),
                    form.getContactPhone(),
                    form.getContactEmail(),
                    form.getAddress(),
                    form.getCountry());
            ra.addFlashAttribute("info", "Manufacturer updated: " + saved.getName());
            return "redirect:/manufacturers";
        } catch (DuplicateManufacturerNameException ex) {
            binding.rejectValue("name", "duplicate", ex.getMessage());
            ra.addFlashAttribute("org.springframework.validation.BindingResult.form", binding);
            ra.addFlashAttribute("form", form);
            return "redirect:/manufacturers/" + id + "/edit";
        }
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes ra) {
        String name = manufacturerService.findById(id).map(Manufacturer::getName).orElse("#" + id);
        manufacturerService.deleteById(id);
        ra.addFlashAttribute("info", "Manufacturer deleted: " + name);
        return "redirect:/manufacturers";
    }

    public static class ManufacturerForm {
        @NotBlank(message = "Manufacturer name must not be blank")
        @Size(max = 128, message = "Manufacturer name must not exceed 128 characters")
        private String name;

        @Size(max = 128, message = "Contact person must not exceed 128 characters")
        private String contactPerson;

        @Size(max = 64, message = "Contact phone must not exceed 64 characters")
        private String contactPhone;

        @Email(message = "Contact email must be a valid email address")
        @Size(max = 128, message = "Contact email must not exceed 128 characters")
        private String contactEmail;

        @Size(max = 500, message = "Address must not exceed 500 characters")
        private String address;

        @Size(max = 64, message = "Country must not exceed 64 characters")
        private String country;

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }

        public String getContactPerson() { return contactPerson; }
        public void setContactPerson(String contactPerson) { this.contactPerson = contactPerson; }

        public String getContactPhone() { return contactPhone; }
        public void setContactPhone(String contactPhone) { this.contactPhone = contactPhone; }

        public String getContactEmail() { return contactEmail; }
        public void setContactEmail(String contactEmail) { this.contactEmail = contactEmail; }

        public String getAddress() { return address; }
        public void setAddress(String address) { this.address = address; }

        public String getCountry() { return country; }
        public void setCountry(String country) { this.country = country; }
    }
}
