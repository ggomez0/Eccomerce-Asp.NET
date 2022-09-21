namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class lclc : DbMigration
    {
        public override void Up()
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
                .PrimaryKey(t => t.lstcpradetid)
                .ForeignKey("dbo.lstcompras", t => t.Lstcompra_lstcpraid)
                .ForeignKey("dbo.Products", t => t.Product_ProductID)
                .Index(t => t.Lstcompra_lstcpraid)
                .Index(t => t.Product_ProductID);
            
            AlterColumn("dbo.lstcompras", "descripcion", c => c.String());
            AlterColumn("dbo.lstcompras", "importe", c => c.Int());
            DropColumn("dbo.lstcompras", "cantidad");
        }
        
        public override void Down()
        {
            AddColumn("dbo.lstcompras", "cantidad", c => c.Int(nullable: false));
            DropForeignKey("dbo.lstcompradetalles", "Product_ProductID", "dbo.Products");
            DropForeignKey("dbo.lstcompradetalles", "Lstcompra_lstcpraid", "dbo.lstcompras");
            DropIndex("dbo.lstcompradetalles", new[] { "Product_ProductID" });
            DropIndex("dbo.lstcompradetalles", new[] { "Lstcompra_lstcpraid" });
            AlterColumn("dbo.lstcompras", "importe", c => c.Int(nullable: false));
            AlterColumn("dbo.lstcompras", "descripcion", c => c.String(nullable: false));
            DropTable("dbo.lstcompradetalles");
        }
    }
}
