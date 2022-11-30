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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'hospitalDataSet.NURSE' table. You can move, or remove it, as needed.
            this.nURSETableAdapter.Fill(this.hospitalDataSet.NURSE);
            SqlConnection SqlConnection = new SqlConnection(@"Data Source=CS-MOA-HOMEOFFI\SQLEXPRESS; Initial Catalog=Hospital ; Integrated Security=True");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection SqlConnection = new SqlConnection(@"Data Source=CS-MOA-HOMEOFFI\SQLEXPRESS; Initial Catalog=Hospital ; Integrated Security=True ");
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = SqlConnection;
            SqlConnection.Open();
            sqlCommand.CommandText = "insert into NURSE values( '" + textBox1.Text + "', '" + textBox2.Text + "'  , '" + textBox3.Text + "' ,'" + textBox4.Text + "','" + textBox5.Text + "')";
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
            sqlCommand.CommandText = "UPDATE NURSE SET NURSENAME = '" + textBox2.Text + "'WHERE  NURSEID = '" + textBox1.Text + "'";
            sqlCommand.ExecuteNonQuery();
            SqlConnection.Close();
            MessageBox.Show("Update is  successfully completed");
        }

        private void button3_Click(object sender, EventArgs e)
        {

            SqlConnection SqlConnection = new SqlConnection(@"Data Source=CS-MOA-HOMEOFFI\SQLEXPRESS; Initial Catalog=Hospital ; Integrated Security=True ");
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = SqlConnection;
            SqlConnection.Open();
            sqlCommand.CommandText = "DELETE FROM  NURSE WHERE NURSEID = '" + textBox1.Text + "'";
            sqlCommand.ExecuteNonQuery();
            SqlConnection.Close();
            MessageBox.Show("Delete is successfully completed");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form2 form = new Form2();
            form.Show();
            this.Hide();
        }
    }
}
