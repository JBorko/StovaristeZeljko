//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class ModeliAutomobila
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ModeliAutomobila()
        {
            this.GodineProizvodnjes = new HashSet<GodineProizvodnje>();
        }
    
        public int Id { get; set; }
        public string Naziv { get; set; }
        public int MarkaAutomobila { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GodineProizvodnje> GodineProizvodnjes { get; set; }
        public virtual MarkeAutomobila MarkeAutomobila { get; set; }
    }
}