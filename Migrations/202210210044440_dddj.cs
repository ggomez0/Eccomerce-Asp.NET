namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class dddj : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.comprobantesdets", "factid", c => c.Int());
        }
        
        public override void Down()
        {
            DropColumn("dbo.comprobantesdets", "factid");
        }
    }
}
