namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class fgcvvlff : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.historials", "ProductID", "dbo.Products");
            DropIndex("dbo.historials", new[] { "ProductID" });
            AddColumn("dbo.historials", "ProductName", c => c.String());
            DropColumn("dbo.historials", "ProductID");
        }
        
        public override void Down()
        {
            AddColumn("dbo.historials", "ProductID", c => c.Int());
            DropColumn("dbo.historials", "ProductName");
            CreateIndex("dbo.historials", "ProductID");
            AddForeignKey("dbo.historials", "ProductID", "dbo.Products", "ProductID");
        }
    }
}
