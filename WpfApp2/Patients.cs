//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp2
{
    using System;
    using System.Collections.Generic;
    
    public partial class Patients
    {
        public int Id { get; set; }
        public string Imya { get; set; }
        public string Age { get; set; }
        public string Diagnoz { get; set; }
        public int IDvr { get; set; }
    
        public virtual Vrach Vrach { get; set; }
    }
}