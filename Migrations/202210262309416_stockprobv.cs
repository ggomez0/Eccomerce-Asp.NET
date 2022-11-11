namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class stockprobv : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.comprobantes", "ProvID", "dbo.proveedores");
            DropIndex("dbo.comprobantes", new[] { "ProvID" });
        }
        
        public override void Down()
        {
            CreateIndex("dbo.comprobantes", "ProvID");
            AddForeignKey("dbo.comprobantes", "ProvID", "dbo.proveedores", "ProvID");
        }
    }
}
