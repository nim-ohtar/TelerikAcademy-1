#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by the ClassGenerator.ttinclude code generation file.
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
using Supermarket.Model;
using System.ComponentModel.DataAnnotations.Schema;

namespace Supermarket.Model	
{
	public partial class Product
	{
		private int iD;
		public virtual int ID
		{
			get
			{
				return this.iD;
			}
			set
			{
				this.iD = value;
			}
		}
		
		private string name;
		public virtual string Name
		{
			get
			{
				return this.name;
			}
			set
			{
				this.name = value;
			}
		}
		
		private decimal basePrice;
		public virtual decimal BasePrice
		{
			get
			{
				return this.basePrice;
			}
			set
			{
				this.basePrice = value;
			}
		}
		
		private int vendor_ID;
        [ForeignKey("Vendor")]
		public virtual int Vendor_ID
		{
			get
			{
				return this.vendor_ID;
			}
			set
			{
				this.vendor_ID = value;
			}
		}
		
		private int measure_ID;
        [ForeignKey("Measure")]
		public virtual int Measure_ID
		{
			get
			{
				return this.measure_ID;
			}
			set
			{
				this.measure_ID = value;
			}
		}
		
		private Measure measure;
		public virtual Measure Measure
		{
			get
			{
				return this.measure;
			}
			set
			{
				this.measure = value;
			}
		}
		
		private Vendor vendor;
		public virtual Vendor Vendor
		{
			get
			{
				return this.vendor;
			}
			set
			{
				this.vendor = value;
			}
		}
		
	}
}
#pragma warning restore 1591
