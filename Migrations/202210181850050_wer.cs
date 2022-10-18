namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class wer : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Cards",
                c => new
                    {
                        IDCARD = c.Int(nullable: false, identity: true),
                        NameCard = c.String(),
                        CardNumber = c.String(),
                        ExpDate = c.String(),
                        CVV = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.IDCARD);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        CategoryID = c.Int(nullable: false, identity: true),
                        CategoryName = c.String(nullable: false, maxLength: 100),
                        Description = c.String(),
                    })
                .PrimaryKey(t => t.CategoryID);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        ProductID = c.Int(nullable: false, identity: true),
                        ProductName = c.String(nullable: false, maxLength: 100),
                        Description = c.String(),
                        ImagePath = c.String(),
                        UnitPrice = c.Double(nullable: false),
                        CategoryID = c.Int(),
                        stock = c.Int(),
                        vendido = c.Int(),
                        Depositos_DepID = c.Int(),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Categories", t => t.CategoryID)
                .ForeignKey("dbo.depositos", t => t.Depositos_DepID)
                .Index(t => t.CategoryID)
                .Index(t => t.Depositos_DepID);
            
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
                        stringn = c.String(),
                        descripcion = c.String(),
                        importe = c.Int(),
                        fechacomprobante = c.String(),
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
                "dbo.proveedores",
                c => new
                    {
                        ProvID = c.Int(nullable: false, identity: true),
                        ProvName = c.String(nullable: false, maxLength: 100),
                        ReprProv = c.String(),
                        telefono = c.String(),
                        email = c.String(),
                        comentario = c.String(),
                        cuit = c.String(),
                    })
                .PrimaryKey(t => t.ProvID);
            
            CreateTable(
                "dbo.pedrepodets",
                c => new
                    {
                        idcomprdet = c.Int(nullable: false, identity: true),
                        cantidad = c.Int(nullable: false),
                        ProvID = c.Int(),
                        Comprobantes_idcomp = c.Int(),
                        Product_ProductID = c.Int(),
                        pedrepo_idcomp = c.Int(),
                    })
                .PrimaryKey(t => t.idcomprdet)
                .ForeignKey("dbo.comprobantes", t => t.Comprobantes_idcomp)
                .ForeignKey("dbo.Products", t => t.Product_ProductID)
                .ForeignKey("dbo.proveedores", t => t.ProvID)
                .ForeignKey("dbo.pedrepoes", t => t.pedrepo_idcomp)
                .Index(t => t.ProvID)
                .Index(t => t.Comprobantes_idcomp)
                .Index(t => t.Product_ProductID)
                .Index(t => t.pedrepo_idcomp);
            
            CreateTable(
                "dbo.tipocomprobantes",
                c => new
                    {
                        idcomprobante = c.Int(nullable: false, identity: true),
                        nombre = c.String(),
                    })
                .PrimaryKey(t => t.idcomprobante);
            
            CreateTable(
                "dbo.depositos",
                c => new
                    {
                        DepID = c.Int(nullable: false, identity: true),
                        DepName = c.String(nullable: false, maxLength: 100),
                        Description = c.String(),
                        ImagePath = c.String(),
                        ubicacion = c.String(),
                    })
                .PrimaryKey(t => t.DepID);
            
            CreateTable(
                "dbo.prodendeps",
                c => new
                    {
                        IngID = c.Int(nullable: false, identity: true),
                        Observaciones = c.String(),
                        cantingreso = c.Int(nullable: false),
                        Depositos_DepID = c.Int(),
                        Product_ProductID = c.Int(),
                    })
                .PrimaryKey(t => t.IngID)
                .ForeignKey("dbo.depositos", t => t.Depositos_DepID)
                .ForeignKey("dbo.Products", t => t.Product_ProductID)
                .Index(t => t.Depositos_DepID)
                .Index(t => t.Product_ProductID);
            
            CreateTable(
                "dbo.OrderDetails",
                c => new
                    {
                        OrderDetailId = c.Int(nullable: false, identity: true),
                        OrderId = c.Int(nullable: false),
                        ProductId = c.Int(nullable: false),
                        ProductName = c.String(),
                        Quantity = c.Int(nullable: false),
                        UnitPrice = c.Double(nullable: false),
                        totalprod = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.OrderDetailId)
                .ForeignKey("dbo.Orders", t => t.OrderId, cascadeDelete: true)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.OrderId)
                .Index(t => t.ProductId);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        OrderId = c.Int(nullable: false, identity: true),
                        OrderDate = c.DateTime(),
                        Username = c.String(),
                        FirstName = c.String(nullable: false, maxLength: 160),
                        LastName = c.String(nullable: false, maxLength: 160),
                        Address = c.String(nullable: false, maxLength: 70),
                        City = c.String(nullable: false, maxLength: 40),
                        State = c.String(nullable: false, maxLength: 40),
                        PostalCode = c.String(nullable: false, maxLength: 10),
                        Country = c.String(nullable: false, maxLength: 40),
                        Phone = c.String(maxLength: 24),
                        Email = c.String(nullable: false),
                        Total = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.OrderId);
            
            CreateTable(
                "dbo.historials",
                c => new
                    {
                        idhist = c.Int(nullable: false, identity: true),
                        cant = c.Int(),
                        ingegr = c.String(),
                        dateTime = c.DateTime(nullable: false),
                        ProductName = c.String(),
                        DepID = c.Int(),
                    })
                .PrimaryKey(t => t.idhist)
                .ForeignKey("dbo.depositos", t => t.DepID)
                .Index(t => t.DepID);
            
            CreateTable(
                "dbo.pedrepoes",
                c => new
                    {
                        idcomp = c.Int(nullable: false, identity: true),
                        Nombre = c.String(),
                        stringn = c.String(),
                        descripcion = c.String(),
                        importe = c.Int(),
                        fechacomprobante = c.String(),
                        dateTime = c.DateTime(nullable: false),
                        idcomprobante = c.Int(),
                    })
                .PrimaryKey(t => t.idcomp);
            
            CreateTable(
                "dbo.CartItems",
                c => new
                    {
                        ItemId = c.String(nullable: false, maxLength: 128),
                        CartId = c.String(),
                        Quantity = c.Int(nullable: false),
                        DateCreated = c.DateTime(nullable: false),
                        ProductId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ItemId)
                .ForeignKey("dbo.Products", t => t.ProductId, cascadeDelete: true)
                .Index(t => t.ProductId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.CartItems", "ProductId", "dbo.Products");
            DropForeignKey("dbo.pedrepodets", "pedrepo_idcomp", "dbo.pedrepoes");
            DropForeignKey("dbo.historials", "DepID", "dbo.depositos");
            DropForeignKey("dbo.OrderDetails", "ProductId", "dbo.Products");
            DropForeignKey("dbo.OrderDetails", "OrderId", "dbo.Orders");
            DropForeignKey("dbo.Products", "Depositos_DepID", "dbo.depositos");
            DropForeignKey("dbo.prodendeps", "Product_ProductID", "dbo.Products");
            DropForeignKey("dbo.prodendeps", "Depositos_DepID", "dbo.depositos");
            DropForeignKey("dbo.comprobantesdets", "Product_ProductID", "dbo.Products");
            DropForeignKey("dbo.comprobantes", "idcomprobante", "dbo.tipocomprobantes");
            DropForeignKey("dbo.pedrepodets", "ProvID", "dbo.proveedores");
            DropForeignKey("dbo.pedrepodets", "Product_ProductID", "dbo.Products");
            DropForeignKey("dbo.pedrepodets", "Comprobantes_idcomp", "dbo.comprobantes");
            DropForeignKey("dbo.comprobantes", "ProvID", "dbo.proveedores");
            DropForeignKey("dbo.comprobantesdets", "Comprobantes_idcomp", "dbo.comprobantes");
            DropForeignKey("dbo.Products", "CategoryID", "dbo.Categories");
            DropIndex("dbo.CartItems", new[] { "ProductId" });
            DropIndex("dbo.historials", new[] { "DepID" });
            DropIndex("dbo.OrderDetails", new[] { "ProductId" });
            DropIndex("dbo.OrderDetails", new[] { "OrderId" });
            DropIndex("dbo.prodendeps", new[] { "Product_ProductID" });
            DropIndex("dbo.prodendeps", new[] { "Depositos_DepID" });
            DropIndex("dbo.pedrepodets", new[] { "pedrepo_idcomp" });
            DropIndex("dbo.pedrepodets", new[] { "Product_ProductID" });
            DropIndex("dbo.pedrepodets", new[] { "Comprobantes_idcomp" });
            DropIndex("dbo.pedrepodets", new[] { "ProvID" });
            DropIndex("dbo.comprobantes", new[] { "idcomprobante" });
            DropIndex("dbo.comprobantes", new[] { "ProvID" });
            DropIndex("dbo.comprobantesdets", new[] { "Product_ProductID" });
            DropIndex("dbo.comprobantesdets", new[] { "Comprobantes_idcomp" });
            DropIndex("dbo.Products", new[] { "Depositos_DepID" });
            DropIndex("dbo.Products", new[] { "CategoryID" });
            DropTable("dbo.CartItems");
            DropTable("dbo.pedrepoes");
            DropTable("dbo.historials");
            DropTable("dbo.Orders");
            DropTable("dbo.OrderDetails");
            DropTable("dbo.prodendeps");
            DropTable("dbo.depositos");
            DropTable("dbo.tipocomprobantes");
            DropTable("dbo.pedrepodets");
            DropTable("dbo.proveedores");
            DropTable("dbo.comprobantes");
            DropTable("dbo.comprobantesdets");
            DropTable("dbo.Products");
            DropTable("dbo.Categories");
            DropTable("dbo.Cards");
        }
    }
}
