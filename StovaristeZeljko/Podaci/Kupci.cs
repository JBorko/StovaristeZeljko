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
    
    public partial class Kupci
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kupci()
        {
            this.BankovniNalozi = new HashSet<BankovniNalozi>();
            this.KorisnickiNalozi = new HashSet<KorisnickiNalozi>();
        }
    
        public int Id { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string BrojTelefona { get; set; }
        public string Firma { get; set; }
        public string Mejl { get; set; }
        public Nullable<int> Rabat { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BankovniNalozi> BankovniNalozi { get; set; }
        public virtual Firme Firme { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KorisnickiNalozi> KorisnickiNalozi { get; set; }
        public virtual Rabati Rabati { get; set; }
    }
}
