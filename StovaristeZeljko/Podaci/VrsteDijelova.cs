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
    
    public partial class VrsteDijelova
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public VrsteDijelova()
        {
            this.Dijelovi = new HashSet<Dijelovi>();
        }
    
        public int Id { get; set; }
        public string EnNaziv { get; set; }
        public string SrNaziv { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Dijelovi> Dijelovi { get; set; }
    }
}