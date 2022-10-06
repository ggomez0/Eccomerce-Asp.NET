namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class werr : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.pedrepodets",
                c => new
                    {
                        idcomprdet = c.Int(nullable: false, identity: true),
                        cantidad = c.Int(nullable: false),
                        ProvID = c.Int(),
                        Comprobantes_idcomp = c.Int(),
                        Product_ProductID = c.Int(),
                    })
                .PrimaryKey(t => t.idcomprdet)
                .ForeignKey("dbo.comprobantes", t => t.Comprobantes_idcomp)
                .ForeignKey("dbo.Products", t => t.Product_ProductID)
                .ForeignKey("dbo.proveedores", t => t.ProvID)
                .Index(t => t.ProvID)
                .Index(t => t.Comprobantes_idcomp)
                .Index(t => t.Product_ProductID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.pedrepodets", "ProvID", "dbo.proveedores");
            DropForeignKey("dbo.pedrepodets", "Product_ProductID", "dbo.Products");
            DropForeignKey("dbo.pedrepodets", "Comprobantes_idcomp", "dbo.comprobantes");
            DropIndex("dbo.pedrepodets", new[] { "Product_ProductID" });
            DropIndex("dbo.pedrepodets", new[] { "Comprobantes_idcomp" });
            DropIndex("dbo.pedrepodets", new[] { "ProvID" });
            DropTable("dbo.pedrepodets");
        }
    }
}
