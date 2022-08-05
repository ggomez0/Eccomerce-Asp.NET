using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopGaspar.Models;
using ShopGaspar.Logic;
using System.Collections.Specialized;
using System.Collections;
using System.Web.ModelBinding;

namespace ShopGaspar
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
            using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
            {
                decimal cartTotal = 0;
                cartTotal = usersShoppingCart.GetTotal();
                //List<CartItem> myOrderList = usersShoppingCart.GetCartItems();
                //        String cartId = usersShoppingCart.GetCartId();
                //        ShoppingCartActions.ShoppingCartUpdates[] cartUpdates = new ShoppingCartActions.ShoppingCartUpdates[CartList.Rows.Count];
                //        for (int j = 0; j < CartList.Rows.Count; j++)
                //        {
                //        if (myOrderList[j].Product.stock <= 0 || (myOrderList[j].Product.stock < myOrderList[j].Quantity))
                //        {

                //            IOrderedDictionary rowValues = new OrderedDictionary();
                //            rowValues = GetValues(CartList.Rows[j]);
                //            cartUpdates[j].ProductId = Convert.ToInt32(rowValues["ProductID"]);

                //            CheckBox cbRemove = new CheckBox();
                //            cbRemove = (CheckBox)CartList.Rows[j].FindControl("Remove");
                //            cbRemove.Checked = true;

                //            usersShoppingCart.UpdateShoppingCartDatabase(cartId, cartUpdates);
                //            CartList.DataBind();
                //            lblTotal.Text = String.Format("{0:c}", usersShoppingCart.GetTotal());
                        
                //            usersShoppingCart.GetCartItems();

                //        }
                //    UpdateCartItems();
                //    }
                
                if (cartTotal > 0)
                {
                    // Muestra el total
                    lblTotal.Text = String.Format("{0:c}", cartTotal);
                    
                }
                else
                {
                    LabelTotalText.Text = "";
                    lblTotal.Text = "";
                    ShoppingCartTitle.InnerText = "El carrito esta vacio, elige un producto";
                    UpdateBtn.Visible = false;
                    Pagarbtn.Visible = false;
                }
            }

        }

        public List<CartItem> GetShoppingCartItems()
        {
            ShoppingCartActions actions = new ShoppingCartActions();
            return actions.GetCartItems();
        }
        public List<CartItem> UpdateCartItems()
        {
            using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
            {
                String cartId = usersShoppingCart.GetCartId();

                ShoppingCartActions.ShoppingCartUpdates[] cartUpdates = new ShoppingCartActions.ShoppingCartUpdates[CartList.Rows.Count];
                for (int i = 0; i < CartList.Rows.Count; i++)
                {
                    IOrderedDictionary rowValues = new OrderedDictionary();
                    rowValues = GetValues(CartList.Rows[i]);
                    cartUpdates[i].ProductId = Convert.ToInt32(rowValues["ProductID"]);

                    CheckBox cbRemove = new CheckBox();
                    cbRemove = (CheckBox)CartList.Rows[i].FindControl("Remove");
                    cartUpdates[i].RemoveItem = cbRemove.Checked;

                    TextBox quantityTextBox = new TextBox();
                    quantityTextBox = (TextBox)CartList.Rows[i].FindControl("PurchaseQuantity");
                    cartUpdates[i].PurchaseQuantity = Convert.ToInt16(quantityTextBox.Text.ToString());
                }
                usersShoppingCart.UpdateShoppingCartDatabase(cartId, cartUpdates);
                CartList.DataBind();
                lblTotal.Text = String.Format("{0:c}", usersShoppingCart.GetTotal());
                return usersShoppingCart.GetCartItems();
            }
        }

        public static IOrderedDictionary GetValues(GridViewRow row)
        {
            IOrderedDictionary values = new OrderedDictionary();
            foreach (DataControlFieldCell cell in row.Cells)
            {
                if (cell.Visible)
                {
                    // Extract values from the cell.
                    cell.ContainingField.ExtractValuesFromCell(values, cell, row.RowState, true);
                }
            }
            return values;
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            UpdateCartItems();
        }

        protected void Pagarbtn_Click(object sender, EventArgs e)
        {
            UpdateCartItems();
            Response.Redirect("~/Checkout/Pagocard.aspx?total=" + lblTotal.Text);
        }

        //protected void imgremove_Click(object sender, ImageClickEventArgs e)
        //{
        //    using (ShoppingCartActions usersShoppingCart = new ShoppingCartActions())
        //    {
        //        String cartId = usersShoppingCart.GetCartId();

        //        ShoppingCartActions.ShoppingCartUpdates[] cartUpdates = new ShoppingCartActions.ShoppingCartUpdates[CartList.Rows.Count];
        //        for (int i = 0; i < CartList.Rows.Count; i++)
        //        {

        //            IOrderedDictionary rowValues = new OrderedDictionary();
        //            rowValues = GetValues(CartList.Rows[i]);
        //            cartUpdates[i].ProductId = Convert.ToInt32(rowValues["ProductID"]);
        //            ImageButton imgbtnremove = new ImageButton();
        //            imgbtnremove = (ImageButton)CartList.Rows[i].FindControl("imgremove");
        //            cartUpdates[i].RemoveItem = imgbtnremove.Enabled;
        //        }
        //        usersShoppingCart.UpdateShoppingCartDatabase(cartId, cartUpdates);
        //        CartList.DataBind();
        //        UpdateCartItems();
               
            
        }
    }
