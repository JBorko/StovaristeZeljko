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
    
    public partial class Automobili
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Automobili()
        {
            this.BodyAndMainParts = new HashSet<Dijelovi>();
        }
    
        public int Id { get; set; }
        public string Boja { get; set; }
        public int Marka { get; set; }
        public int ZapreminaMotoraCCM { get; set; }
        public int SnagaMotoraKW { get; set; }
        public int VrstaGoriva { get; set; }
        public int BrojVrata { get; set; }
        public int TipMjenjaca { get; set; }
        public int Kilometraza { get; set; }
        public string KodMotora { get; set; }
        public string Napomena { get; set; }
        public Nullable<int> Prodavac { get; set; }
        public decimal KupovnaCijena { get; set; }
    
        public virtual BrojeviVrata BrojeviVrata { get; set; }
        public virtual MarkeAutomobila MarkeAutomobila { get; set; }
        public virtual Prodavci Prodavci { get; set; }
        public virtual TipoviMjenjaca TipoviMjenjaca { get; set; }
        public virtual VrsteGoriva VrsteGoriva { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Dijelovi> BodyAndMainParts { get; set; }
    }
}