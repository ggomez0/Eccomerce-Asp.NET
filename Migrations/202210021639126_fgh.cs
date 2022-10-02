namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class fgh : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.historials",
                c => new
                    {
                        idhist = c.Int(nullable: false, identity: true),
                        cant = c.Int(),
                        ingegr = c.String(),
                        dateTime = c.DateTime(nullable: false),
                        ProductID = c.Int(),
                    })
                .PrimaryKey(t => t.idhist)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.historials", "ProductID", "dbo.Products");
            DropIndex("dbo.historials", new[] { "ProductID" });
            DropTable("dbo.historials");
        }
    }
}
