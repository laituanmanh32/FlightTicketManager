using System;
using System.Drawing;
using System.Windows.Forms;

namespace OracleConnect
{
    public partial class RootWindow : Form
    {
        private static RootWindow mInstance;
        private readonly OracleDatabase odb;

        private RootWindow()
        {
            InitializeComponent();
            odb = OracleDatabase.GetInstance();
        }

        public static RootWindow GetWindow()
        {
            if (mInstance == null)
            {
                mInstance = new RootWindow();
            }
            return mInstance;
        }

        public void CreateSession()
        {
            if (queryForm == null)
            {
                queryForm = new QueryForm();
                queryForm.Anchor = ((AnchorStyles.Top | AnchorStyles.Bottom)
                                    | AnchorStyles.Left)
                                   | AnchorStyles.Right;
                queryForm.Location = new Point(1, 31);
                queryForm.Name = "queryForm";
                queryForm.Size = new Size(617, 314);
                queryForm.TabIndex = 0;
            }
            logOutToolStripMenuItem.Enabled = true;
            saveToolStripMenuItem.Enabled = true;
            Controls.Remove(signInForm);
            Controls.Add(queryForm);
        }

        public void DeleteSession()
        {
            logOutToolStripMenuItem.Enabled = false;
            saveToolStripMenuItem.Enabled = false;
            odb.Close();
            Controls.Remove(queryForm);
            Controls.Add(signInForm);
        }

        private void logOutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DeleteSession();
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            odb.Update();
        }
    }
}