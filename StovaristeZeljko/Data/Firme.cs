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
    
    public partial class Firme
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Firme()
        {
            this.Adrese = new HashSet<Adrese>();
            this.BankovniNalozis = new HashSet<BankovniNalozi>();
            this.Kupcis = new HashSet<Kupci>();
        }
    
        public string PIB { get; set; }
        public string Naziv { get; set; }
        public string Fax { get; set; }
        public string Mejl { get; set; }
        public Nullable<int> Rabat { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Adrese> Adrese { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BankovniNalozi> BankovniNalozis { get; set; }
        public virtual Rabati Rabati { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kupci> Kupcis { get; set; }
    }
}
