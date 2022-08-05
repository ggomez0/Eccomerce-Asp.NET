//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using PagedList;
//using ShopGaspar.Models;

//namespace ShopGaspar.Logic
//{
//    public class Ordenarlista
//    {
//        public ViewResult Index(string sortOrder, string currentFilter, string searchString, int? page)
//        {
//            using (var _db = new ShopGaspar.Models.ProductContext())
//            {
//                ViewBag.CurrentSort = sortOrder;
//                ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
//                ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";

//                if (searchString != null)
//                {
//                    page = 1;
//                }
//                else
//                {
//                    searchString = currentFilter;
//                }

//                ViewBag.CurrentFilter = searchString;

//                var students = from s in _db.Products
//                               select s;
//                if (!String.IsNullOrEmpty(searchString))
//                {
//                    students = students.Where(s => s.ProductName.Contains(searchString));
//                }
//                switch (sortOrder)
//                {
//                    case "name_desc":
//                        students = students.OrderByDescending(s => s.LastName);
//                        break;
//                    case "Date":
//                        students = students.OrderBy(s => s.EnrollmentDate);
//                        break;
//                    case "date_desc":
//                        students = students.OrderByDescending(s => s.EnrollmentDate);
//                        break;
//                    default:  // Name ascending 
//                        students = students.OrderBy(s => s.LastName);
//                        break;
//                }

//                int pageSize = 3;
//                int pageNumber = (page ?? 1);
//                return View(students.ToPagedList(pageNumber, pageSize));
//            }

//        }
//    }