using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using System.Web.ModelBinding;

namespace ShopGaspar
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Product> GetProduct([QueryString("productID")] int? productId)
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ProductID == productId);
            }
            else
            {
                query = null;
            }
            return query;
        }

        public IQueryable<Product> GetProduct1([QueryString("productID")] int? productId)
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ProductID-1 == productId);
            }
            else
            {
                query = null;
            }
            return query;
        }

        public IQueryable<Product> GetProduct2([QueryString("productID")] int? productId)
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ProductID +1 == productId);
            }
            else
            {
                query = null;
            }
            return query;
        }

        public IQueryable<Product> GetProduct3([QueryString("productID")] int? productId)
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ProductID -2 == productId);
            }
            else
            {
                query = null;
            }
            return query;
        }

        public IQueryable<Product> GetProduct4([QueryString("productID")] int? productId)
        {
            var _db = new ShopGaspar.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ProductID +2 == productId);
            }
            else
            {
                query = null;
            }
            return query;
        }
    }
}