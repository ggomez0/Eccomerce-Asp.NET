namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class escs : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.comprobantes", "fechacomprobante", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.comprobantes", "fechacomprobante", c => c.DateTime(nullable: false));
        }
    }
}
