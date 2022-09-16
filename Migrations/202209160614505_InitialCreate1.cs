namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate1 : DbMigration
    {
        public override void Up()
        {
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
                    })
                .PrimaryKey(t => t.ProvID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.proveedores");
        }
    }
}
