using System;
using System.Data;

namespace com.triario.repositorio.model
{
    #region Comments
    /// <summary>
    /// CategoriaVO Class.
    /// </summary>
    /// <remarks>
    /// <h3>Changes</h3>
    /// <list type="table">
    /// 	<listheader>
    /// 		<th>Author</th>
    /// 		<th>Date</th>
    /// 		<th>Details</th>
    /// 	</listheader>
    /// 	<item>
    /// 		<term>Diego Bustamanate</term>
    /// 		<description>27/09/2012</description>
    /// 		<description>Created</description>
    /// 	</item>
    /// </list>
    /// </remarks>
    #endregion

    [Serializable]
    public class CategoriaVO
    {
        #region Construction
        /// <summary>
        /// Initializes a new (no-args) instance of the CategoriaVO class.
        /// </summary>
        public CategoriaVO()
        {
        }

        /// <summary>
        /// Initializes a new instance of the CategoriaVO class.
        /// </summary>
        public CategoriaVO(Int32 ID, String DSNOMBRE)
        {
            this.ID = ID;
            this.DSNOMBRE = DSNOMBRE;
        }
        #endregion

        #region Properties
        /// <summary>
        /// Gets or sets the ID value.
        /// </summary>
        public virtual Int32 ID { get; set; }

        /// <summary>
        /// Gets or sets the DSNOMBRE value.
        /// </summary>
        public virtual String DSNOMBRE { get; set; }
        #endregion

        #region Overrides
        /// <summary>
        /// Returns the Primary Key of the object.
        /// </summary>
        /// <returns>String</returns>
        public override String ToString()
        {
            return "[CategoriaVO] " + this.ID.ToString();
        }

        /// <summary>
        /// Returns true if the Ids of the two instances are equal.
        /// </summary>
        /// <param name="ObjectToCompare">The other object instance.</param>
        /// <returns>String</returns>
        public override Boolean Equals(Object ObjectToCompare)
        {
            if (ObjectToCompare == null) return false;
            CategoriaVO otherObject = ObjectToCompare as CategoriaVO;
            if (otherObject == null) return false;
            return CategoriaVO.Equals(this, otherObject);
        }

        /// <summary>
        /// Returns the GetHashCode() method of the Primary Key member.
        /// </summary>
        /// <returns>String</returns>
        public override Int32 GetHashCode()
        {
            return this.ID.GetHashCode();
        }
        #endregion


    }
}