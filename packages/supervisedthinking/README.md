### **Extended packages**

- these folders & subfolders contain all packages to fulfil the dependencies of LibreELEC-RR
- they are structured in the same way the upstream project organises packages
- you'll find packages that are not reused by others, like frontend themes, in the subfolder of the specific package
- the oem package contain project specific files, adjust these packages to add emulators, configs, scripts (...) to your build

---
### **Patches**

Some packages need patches to build properly or have to be adjusted for the distribution, the naming scheme is listed below:

- 100.* - LibreELEC specific patches that wont go upstream
- 995.* - LibreELEC specific patches that should be send upstream
- 999.* - patches backported from upstream
