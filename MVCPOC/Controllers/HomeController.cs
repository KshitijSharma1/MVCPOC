using MVCPOC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCPOC.ViewModels;


namespace MVCPOC.Controllers
{
    public class HomeController : Controller
    {
        POCDBEntities1 db = new POCDBEntities1();
        // GET: Home
        public ActionResult Index()
        {
           
                EmployeeViewModel model = new EmployeeViewModel();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = null;
                return View(model);
           
        }

        [HttpPost]
        public ActionResult New()
        {
           
                EmployeeViewModel model = new EmployeeViewModel();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = null;
                model.DisplayMode = "WriteOnly";
                return View("Index", model);
          
        }

        [HttpPost]
        public ActionResult Insert(Employee obj)
        {
            EmployeeViewModel model = new EmployeeViewModel();
           
            try
            {
                if (ModelState.IsValid)
                {
                    db.Employees.Add(obj);

                    db.SaveChanges();
                    
                    model.employees = db.Employees.ToList();
                    model.SelectedEmployee = db.Employees.Find(obj.ID);
                    model.DisplayMode = "ReadOnly";
                    return View("Index", model);
                }
                else
                {
                    model.employees = db.Employees.ToList();
                    model.SelectedEmployee = null;
                    return View("Index",model);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        [HttpPost]
        public ActionResult Select(int id)
        {
            
                EmployeeViewModel model = new EmployeeViewModel();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = db.Employees.Find(id);
                model.DisplayMode = "ReadOnly";
                return View("Index", model);
            
        }


        [HttpPost]
        public ActionResult Edit(int id)
        {
           
                EmployeeViewModel model = new EmployeeViewModel();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = db.Employees.Find(id);
                model.DisplayMode = "ReadWrite";
                return View("Index", model);
          
        }



        [HttpPost]
        public ActionResult Update(Employee obj)
        {
          
                Employee existing = db.Employees.Find(obj.ID);
                existing.Name = obj.Name;
                existing.Email = obj.Email;
                existing.Password = obj.Password;
                existing.Department = obj.Department;
                db.SaveChanges();
                EmployeeViewModel model = new EmployeeViewModel();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = existing;
                model.DisplayMode = "ReadOnly";
                return View("Index", model);
           
        }


        [HttpPost]
        public ActionResult Delete(int id)
        {
           
                Employee existing = db.Employees.Find(id);
                db.Employees.Remove(existing);
                db.SaveChanges();
                EmployeeViewModel model = new EmployeeViewModel();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = null;
                model.DisplayMode = "";
                return View("Index", model);
         
        }


        [HttpPost]
        public ActionResult Cancel(int id)
        {
           
                EmployeeViewModel model = new EmployeeViewModel();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = db.Employees.Find(id);
                model.DisplayMode = "ReadOnly";
                return View("Index", model);
           
        }
    }
}