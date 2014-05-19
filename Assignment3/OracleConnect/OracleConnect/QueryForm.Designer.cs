namespace OracleConnect
{
    partial class QueryForm
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.sqlString = new System.Windows.Forms.TextBox();
            this.btnQuery = new System.Windows.Forms.Button();
            this.result = new System.Windows.Forms.DataGridView();
            this.btnShowTableName = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.result)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(54, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Command";
            // 
            // sqlString
            // 
            this.sqlString.Location = new System.Drawing.Point(76, 9);
            this.sqlString.Name = "sqlString";
            this.sqlString.Size = new System.Drawing.Size(306, 20);
            this.sqlString.TabIndex = 1;
            // 
            // btnQuery
            // 
            this.btnQuery.Location = new System.Drawing.Point(401, 7);
            this.btnQuery.Name = "btnQuery";
            this.btnQuery.Size = new System.Drawing.Size(75, 23);
            this.btnQuery.TabIndex = 2;
            this.btnQuery.Text = "Query";
            this.btnQuery.UseVisualStyleBackColor = true;
            this.btnQuery.Click += new System.EventHandler(this.btnQuery_Click);
            // 
            // result
            // 
            this.result.AllowUserToOrderColumns = true;
            this.result.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.result.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.result.Location = new System.Drawing.Point(0, 60);
            this.result.Name = "result";
            this.result.Size = new System.Drawing.Size(596, 276);
            this.result.TabIndex = 3;
            // 
            // btnShowTableName
            // 
            this.btnShowTableName.Location = new System.Drawing.Point(493, 7);
            this.btnShowTableName.Name = "btnShowTableName";
            this.btnShowTableName.Size = new System.Drawing.Size(75, 23);
            this.btnShowTableName.TabIndex = 4;
            this.btnShowTableName.Text = "Table Name";
            this.btnShowTableName.UseVisualStyleBackColor = true;
            this.btnShowTableName.Click += new System.EventHandler(this.btnShowTableName_Click);
            // 
            // QueryForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnShowTableName);
            this.Controls.Add(this.result);
            this.Controls.Add(this.btnQuery);
            this.Controls.Add(this.sqlString);
            this.Controls.Add(this.label1);
            this.Name = "QueryForm";
            this.Size = new System.Drawing.Size(599, 339);
            ((System.ComponentModel.ISupportInitialize)(this.result)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox sqlString;
        private System.Windows.Forms.Button btnQuery;
        private System.Windows.Forms.DataGridView result;
        private System.Windows.Forms.Button btnShowTableName;
    }
}
