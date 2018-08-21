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
        EmployeeViewModel model = new EmployeeViewModel();

        // GET: Home
        public ActionResult Index()
        {
            try
            {
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = null;
                return View(model);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Insert(Employee obj)
        {
           
               if (ModelState.IsValid)
                {
                    db.Employees.Add(obj);
                    db.SaveChanges();
                }
                    model.employees = db.Employees.ToList();
                    model.SelectedEmployee = null;
                    return View("Index", model);
           
        }
        

        [HttpPost]
        public ActionResult Select(int id)
        {
            try
            {
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = db.Employees.Find(id);
                return View("Index", model);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(Employee obj)
        {
            try
            {
                Employee existing = db.Employees.Find(obj.ID);
                existing.Name = obj.Name;
                existing.Email = obj.Email;
                existing.Password = obj.Password;
                existing.Department = obj.Department;
                db.SaveChanges();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = existing;
                return View("Index", model);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        
        [HttpPost]
        public ActionResult Delete(int id)
        {
            try
            {
                Employee existing = db.Employees.Find(id);
                db.Employees.Remove(existing);
                db.SaveChanges();
                model.employees = db.Employees.ToList();
                model.SelectedEmployee = null;
                return View("Index", model);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }


    }
}