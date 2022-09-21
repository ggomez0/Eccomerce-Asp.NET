namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class provdatabase : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.lstcompras", "dateTime", c => c.DateTime(nullable: false));
            AddColumn("dbo.proveedores", "Product_ProductID", c => c.Int());
            CreateIndex("dbo.proveedores", "Product_ProductID");
            AddForeignKey("dbo.proveedores", "Product_ProductID", "dbo.Products", "ProductID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.proveedores", "Product_ProductID", "dbo.Products");
            DropIndex("dbo.proveedores", new[] { "Product_ProductID" });
            DropColumn("dbo.proveedores", "Product_ProductID");
            DropColumn("dbo.lstcompras", "dateTime");
        }
    }
}
