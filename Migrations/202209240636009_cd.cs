namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class cd : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.lstcompradetalles", "Lstcompra_lstcpraid", "dbo.lstcompras");
            DropForeignKey("dbo.lstcompradetalles", "Product_ProductID", "dbo.Products");
            DropForeignKey("dbo.lstcompras", "ProvID", "dbo.proveedores");
            DropIndex("dbo.lstcompras", new[] { "ProvID" });
            DropIndex("dbo.lstcompradetalles", new[] { "Lstcompra_lstcpraid" });
            DropIndex("dbo.lstcompradetalles", new[] { "Product_ProductID" });
            DropTable("dbo.lstcompras");
            DropTable("dbo.lstcompradetalles");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.lstcompradetalles",
                c => new
                    {
                        lstcpradetid = c.Int(nullable: false, identity: true),
                        cantidad = c.Int(nullable: false),
                        Lstcompra_lstcpraid = c.Int(),
                        Product_ProductID = c.Int(),
                    })
                .PrimaryKey(t => t.lstcpradetid);
            
            CreateTable(
                "dbo.lstcompras",
                c => new
                    {
                        lstcpraid = c.Int(nullable: false, identity: true),
                        descripcion = c.String(),
                        importe = c.Int(),
                        dateTime = c.DateTime(nullable: false),
                        ProvID = c.Int(),
                    })
                .PrimaryKey(t => t.lstcpraid);
            
            CreateIndex("dbo.lstcompradetalles", "Product_ProductID");
            CreateIndex("dbo.lstcompradetalles", "Lstcompra_lstcpraid");
            CreateIndex("dbo.lstcompras", "ProvID");
            AddForeignKey("dbo.lstcompras", "ProvID", "dbo.proveedores", "ProvID");
            AddForeignKey("dbo.lstcompradetalles", "Product_ProductID", "dbo.Products", "ProductID");
            AddForeignKey("dbo.lstcompradetalles", "Lstcompra_lstcpraid", "dbo.lstcompras", "lstcpraid");
        }
    }
}
