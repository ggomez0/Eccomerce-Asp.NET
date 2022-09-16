namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class lstcpra : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.lstcompras",
                c => new
                    {
                        lstcpraid = c.Int(nullable: false, identity: true),
                        descripcion = c.String(nullable: false),
                        cantidad = c.Int(nullable: false),
                        importe = c.Int(nullable: false),
                        Product_ProductID = c.Int(),
                        Proveedores_ProvID = c.Int(),
                    })
                .PrimaryKey(t => t.lstcpraid)
                .ForeignKey("dbo.Products", t => t.Product_ProductID)
                .ForeignKey("dbo.proveedores", t => t.Proveedores_ProvID)
                .Index(t => t.Product_ProductID)
                .Index(t => t.Proveedores_ProvID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.lstcompras", "Proveedores_ProvID", "dbo.proveedores");
            DropForeignKey("dbo.lstcompras", "Product_ProductID", "dbo.Products");
            DropIndex("dbo.lstcompras", new[] { "Proveedores_ProvID" });
            DropIndex("dbo.lstcompras", new[] { "Product_ProductID" });
            DropTable("dbo.lstcompras");
        }
    }
}
