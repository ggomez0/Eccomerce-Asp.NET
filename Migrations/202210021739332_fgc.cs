namespace ShopGaspar.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class fgc : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.historials", "DepID", c => c.Int());
            CreateIndex("dbo.historials", "DepID");
            AddForeignKey("dbo.historials", "DepID", "dbo.depositos", "DepID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.historials", "DepID", "dbo.depositos");
            DropIndex("dbo.historials", new[] { "DepID" });
            DropColumn("dbo.historials", "DepID");
        }
    }
}
