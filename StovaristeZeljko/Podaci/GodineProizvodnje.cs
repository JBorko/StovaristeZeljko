//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Podaci
{
    using System;
    using System.Collections.Generic;
    
    public partial class GodineProizvodnje
    {
        public int Id { get; set; }
        public System.DateTime Datum { get; set; }
        public int ModelAutomobila { get; set; }
    
        public virtual ModeliAutomobila ModeliAutomobila { get; set; }
    }
}
