namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class vgf : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.lstcompras", "Product_ProductID", "dbo.Products");
            DropIndex("dbo.lstcompras", new[] { "Product_ProductID" });
            CreateTable(
                "dbo.comprobantesdets",
                c => new
                    {
                        idcomprdet = c.Int(nullable: false, identity: true),
                        cantidad = c.Int(nullable: false),
                        Comprobantes_idcomp = c.Int(),
                        Product_ProductID = c.Int(),
                    })
                .PrimaryKey(t => t.idcomprdet)
                .ForeignKey("dbo.comprobantes", t => t.Comprobantes_idcomp)
                .ForeignKey("dbo.Products", t => t.Product_ProductID)
                .Index(t => t.Comprobantes_idcomp)
                .Index(t => t.Product_ProductID);
            
            CreateTable(
                "dbo.comprobantes",
                c => new
                    {
                        idcomp = c.Int(nullable: false, identity: true),
                        Nombre = c.String(),
                        descripcion = c.String(),
                        importe = c.Int(),
                        dateTime = c.DateTime(nullable: false),
                        ProvID = c.Int(),
                        idcomprobante = c.Int(),
                    })
                .PrimaryKey(t => t.idcomp)
                .ForeignKey("dbo.proveedores", t => t.ProvID)
                .ForeignKey("dbo.tipocomprobantes", t => t.idcomprobante)
                .Index(t => t.ProvID)
                .Index(t => t.idcomprobante);
            
            CreateTable(
                "dbo.tipocomprobantes",
                c => new
                    {
                        idcomprobante = c.Int(nullable: false, identity: true),
                        nombre = c.String(),
                    })
                .PrimaryKey(t => t.idcomprobante);
            
            DropColumn("dbo.lstcompras", "Product_ProductID");
        }
        
        public override void Down()
        {
            AddColumn("dbo.lstcompras", "Product_ProductID", c => c.Int());
            DropForeignKey("dbo.comprobantesdets", "Product_ProductID", "dbo.Products");
            DropForeignKey("dbo.comprobantes", "idcomprobante", "dbo.tipocomprobantes");
            DropForeignKey("dbo.comprobantes", "ProvID", "dbo.proveedores");
            DropForeignKey("dbo.comprobantesdets", "Comprobantes_idcomp", "dbo.comprobantes");
            DropIndex("dbo.comprobantes", new[] { "idcomprobante" });
            DropIndex("dbo.comprobantes", new[] { "ProvID" });
            DropIndex("dbo.comprobantesdets", new[] { "Product_ProductID" });
            DropIndex("dbo.comprobantesdets", new[] { "Comprobantes_idcomp" });
            DropTable("dbo.tipocomprobantes");
            DropTable("dbo.comprobantes");
            DropTable("dbo.comprobantesdets");
            CreateIndex("dbo.lstcompras", "Product_ProductID");
            AddForeignKey("dbo.lstcompras", "Product_ProductID", "dbo.Products", "ProductID");
        }
    }
}
