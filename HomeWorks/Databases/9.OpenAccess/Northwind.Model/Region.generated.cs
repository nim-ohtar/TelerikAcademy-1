#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Data.Common;
using System.Collections.Generic;
using Telerik.OpenAccess;
using Telerik.OpenAccess.Metadata;
using Telerik.OpenAccess.Data.Common;
using Telerik.OpenAccess.Metadata.Fluent;
using Telerik.OpenAccess.Metadata.Fluent.Advanced;
using NorthwindFramework;
using Northwind.Model;


namespace Northwind.Model	
{
	[Table("Region")]
	[ConcurrencyControl(OptimisticConcurrencyControlStrategy.Changed)]
	[Serializable()]
	public partial class Region : NotificationObject
	{
		private int _regionID;
		[Column("RegionID", OpenAccessType = OpenAccessType.Int32, IsPrimaryKey = true, Length = 0, Scale = 0, SqlType = "int")]
		[Storage("_regionID")]
		public virtual int RegionID 
		{ 
		    get
		    {
		        return this._regionID;
		    }
		    set
		    {
				if (this.RegionID == value)
				{
					return;
				}
		        this._regionID = value;
				this.RaisePropertyChanged("RegionID");
		    }
		}
		
		private string _regionDescription;
		[Column("RegionDescription", OpenAccessType = OpenAccessType.UnicodeStringFixedLength, Length = 50, Scale = 0, SqlType = "nchar")]
		[Storage("_regionDescription")]
		public virtual string RegionDescription 
		{ 
		    get
		    {
		        return this._regionDescription;
		    }
		    set
		    {
				if (this.RegionDescription == value)
				{
					return;
				}
		        this._regionDescription = value;
				this.RaisePropertyChanged("RegionDescription");
		    }
		}
		
		private IList<Territory> _territories = new List<Territory>();
		[Collection(InverseProperty = "Region")]
		[Storage("_territories")]
		public virtual IList<Territory> Territories 
		{ 
		    get
		    {
		        return this._territories;
		    }
		}
		
	}
}
