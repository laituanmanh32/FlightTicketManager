namespace OracleConnect
{
    partial class ListDialog
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lstTableName = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // lstTableName
            // 
            this.lstTableName.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lstTableName.FormattingEnabled = true;
            this.lstTableName.Location = new System.Drawing.Point(12, 9);
            this.lstTableName.Name = "lstTableName";
            this.lstTableName.Size = new System.Drawing.Size(260, 238);
            this.lstTableName.TabIndex = 0;
            // 
            // ListDialog
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.lstTableName);
            this.Name = "ListDialog";
            this.Text = "Table Name";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox lstTableName;
    }
}