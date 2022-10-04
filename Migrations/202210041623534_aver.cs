namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class aver : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Products", "ProvID", "dbo.proveedores");
            DropIndex("dbo.Products", new[] { "ProvID" });
            DropColumn("dbo.Products", "ProvID");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Products", "ProvID", c => c.Int());
            CreateIndex("dbo.Products", "ProvID");
            AddForeignKey("dbo.Products", "ProvID", "dbo.proveedores", "ProvID");
        }
    }
}
