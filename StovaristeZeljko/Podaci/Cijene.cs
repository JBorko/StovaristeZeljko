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
    
    public partial class Cijene
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cijene()
        {
            this.Automobili = new HashSet<Automobili>();
            this.Dijelovi = new HashSet<Dijelovi>();
        }
    
        public int Id { get; set; }
        public decimal Bruto { get; set; }
        public double Porez { get; set; }
        public decimal Neto { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Automobili> Automobili { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Dijelovi> Dijelovi { get; set; }
    }
}