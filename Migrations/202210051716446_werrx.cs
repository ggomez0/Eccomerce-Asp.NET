namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class werrx : DbMigration
    {
        public override void Up()
        {
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
            
            AddColumn("dbo.pedrepodets", "pedrepo_idcomp", c => c.Int());
            CreateIndex("dbo.pedrepodets", "pedrepo_idcomp");
            AddForeignKey("dbo.pedrepodets", "pedrepo_idcomp", "dbo.pedrepoes", "idcomp");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.pedrepodets", "pedrepo_idcomp", "dbo.pedrepoes");
            DropIndex("dbo.pedrepodets", new[] { "pedrepo_idcomp" });
            DropColumn("dbo.pedrepodets", "pedrepo_idcomp");
            DropTable("dbo.pedrepoes");
        }
    }
}
