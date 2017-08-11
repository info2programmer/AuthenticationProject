using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

namespace AdminPanel
{
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            InitializeComponent();
            loadData();
        }

        string ConnectionString = ConfigurationManager.ConnectionStrings["cnnstring"].ConnectionString;

        private void loadData()
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT ID, Name, Email, RetryAttemps, LockedDatetime FROM tbl_Users",con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            DataGridViewRow drow = this.dataGridView1.Rows[e.RowIndex];
            int updateID = int.Parse(drow.Cells[0].Value.ToString());
            SqlCommand cmd = new SqlCommand("UPDATE  tbl_Users SET IsLocked = NULL, LockedDatetime = NULL, RetryAttemps = 0 WHERE  (ID ='" +updateID+ "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            loadData();
            MessageBox.Show("Data Updated");
        }
    }
}
