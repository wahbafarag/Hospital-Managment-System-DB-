using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApp3Last
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'hospitalDataSet.MEDICINE' table. You can move, or remove it, as needed.
            this.mEDICINETableAdapter.Fill(this.hospitalDataSet.MEDICINE);
            SqlConnection SqlConnection = new SqlConnection(@"Data Source=CS-MOA-HOMEOFFI\SQLEXPRESS; Initial Catalog=Hospital ; Integrated Security=True");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection SqlConnection = new SqlConnection(@"Data Source=CS-MOA-HOMEOFFI\SQLEXPRESS; Initial Catalog=Hospital ; Integrated Security=True ");
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = SqlConnection;
            SqlConnection.Open();
            sqlCommand.CommandText = "insert into MEDICINE  values( '" + textBox1.Text + "', '" + textBox2.Text + "','" + textBox3.Text + "')";
            sqlCommand.ExecuteNonQuery();
            SqlConnection.Close();
            MessageBox.Show("Insertion is successfully completed");
        }

        private void button2_Click(object sender, EventArgs e)
        {

            SqlConnection SqlConnection = new SqlConnection(@"Data Source=CS-MOA-HOMEOFFI\SQLEXPRESS; Initial Catalog=Hospital ; Integrated Security=True ");
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = SqlConnection;
            SqlConnection.Open();
            sqlCommand.CommandText = "DELETE FROM  MEDICINE WHERE MEDICINEID = '" + textBox1.Text + "'";
            sqlCommand.ExecuteNonQuery();
            SqlConnection.Close();
            MessageBox.Show("Delete is successfully completed");
        }
    }
}
