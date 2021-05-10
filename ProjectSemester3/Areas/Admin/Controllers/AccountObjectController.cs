﻿using System;
using System.Linq;
using ProjectSemester3.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq.Dynamic;
using System.Diagnostics;

namespace ProjectSemester3.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin/accountObject")]
    public class AccountObjectController : Controller
    {
        private DatabaseContext db;

        public AccountObjectController(DatabaseContext _db)
        {
            db = _db;
        }

        #region Add, update and delete
        [HttpGet]
        [Route("add")]
        public IActionResult Add()
        {
            var account = new AccountObject
            {
                CreatedDate = DateTime.Today
            };
            return View("add", account);
        }

        [HttpPost]
        [Route("add")]
        public IActionResult Add(AccountObject _accountObj)
        {
            _accountObj.Password = BCrypt.Net.BCrypt.HashString(_accountObj.Password);
            db.AccountObjects.Add(_accountObj);
            db.SaveChanges();

            return View("add");
        }

        [HttpGet]
        [Route("update/{id}")]
        public IActionResult Add(Guid id)
        {
            var accountObj = db.AccountObjects.Find(id);

            return View("update", accountObj);
        }

        [HttpPost]
        [Route("update")]
        public IActionResult Update(AccountObject _accountObj)
        {
            var accountObj = db.AccountObjects.Find(_accountObj.Id);

            accountObj.Name = _accountObj.Name;
            accountObj.Birthday = _accountObj.Birthday;
            accountObj.PhoneNumber = _accountObj.PhoneNumber;
            accountObj.Email = _accountObj.Email;
            accountObj.Address = _accountObj.Address;
            accountObj.Job = _accountObj.Job;
            accountObj.Gender = _accountObj.Gender;
            accountObj.IdNum = _accountObj.IdNum;
            accountObj.Staff = _accountObj.Staff;
            accountObj.PositionId = _accountObj.PositionId;
            accountObj.Username = _accountObj.Username;
            accountObj.Locked = _accountObj.Locked;

            db.SaveChanges();

            return View("update");
        }

        [Route("delete/{id}")]
        public IActionResult Delete(Guid id)
        {
            try
            {
                db.AccountObjects.Remove(db.AccountObjects.Find(id));
                db.SaveChanges();
                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        } 
        #endregion

        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }

        [Route("loadData")]
        public IActionResult LoadData()
        {
            try
            {
                return new JsonResult(db.AccountObjects.ToList());
            }
            catch (Exception e)
            {
                Debug.WriteLine("Error account obj: " + e.Message);
                return null;
            }
        }
    }
}
