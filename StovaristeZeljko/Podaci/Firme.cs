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
    
    public partial class Firme
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Firme()
        {
            this.Adrese = new HashSet<Adrese>();
            this.Kupci = new HashSet<Kupci>();
        }
    
        public string PIB { get; set; }
        public string Naziv { get; set; }
        public string Fax { get; set; }
        public string Mejl { get; set; }
        public Nullable<int> Rabat { get; set; }
        public Nullable<int> BankovniNalog { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Adrese> Adrese { get; set; }
        public virtual BankovniNalozi BankovniNalozi { get; set; }
        public virtual Rabati Rabati { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kupci> Kupci { get; set; }
    }
}
