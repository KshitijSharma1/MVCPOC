using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCPOC.Models;
using System.ComponentModel.DataAnnotations;

namespace MVCPOC.ViewModels
{
    public class EmployeeViewModel
    {
        public List<Employee> employees { get; set; }

        public Employee SelectedEmployee { get; set; }
    }
}