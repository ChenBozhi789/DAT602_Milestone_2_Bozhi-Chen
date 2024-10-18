namespace DAT602_MIlestone_Two
{
    partial class AdminMainForm
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
            this.lblAllplayer = new System.Windows.Forms.Label();
            this.lblCurrentgame = new System.Windows.Forms.Label();
            this.btnDel = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnKill = new System.Windows.Forms.Button();
            this.lstAllplayer = new System.Windows.Forms.ListBox();
            this.lstCurrentgame = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // lblAllplayer
            // 
            this.lblAllplayer.AutoSize = true;
            this.lblAllplayer.Font = new System.Drawing.Font("SimSun", 12F, System.Drawing.FontStyle.Bold);
            this.lblAllplayer.Location = new System.Drawing.Point(362, 27);
            this.lblAllplayer.Name = "lblAllplayer";
            this.lblAllplayer.Size = new System.Drawing.Size(240, 20);
            this.lblAllplayer.TabIndex = 16;
            this.lblAllplayer.Text = "All Registered Player";
            // 
            // lblCurrentgame
            // 
            this.lblCurrentgame.AutoSize = true;
            this.lblCurrentgame.Font = new System.Drawing.Font("SimSun", 12F, System.Drawing.FontStyle.Bold);
            this.lblCurrentgame.Location = new System.Drawing.Point(36, 27);
            this.lblCurrentgame.Name = "lblCurrentgame";
            this.lblCurrentgame.Size = new System.Drawing.Size(141, 20);
            this.lblCurrentgame.TabIndex = 15;
            this.lblCurrentgame.Text = "Current Game";
            // 
            // btnDel
            // 
            this.btnDel.AutoSize = true;
            this.btnDel.Font = new System.Drawing.Font("Calibri", 14F);
            this.btnDel.Location = new System.Drawing.Point(585, 337);
            this.btnDel.Name = "btnDel";
            this.btnDel.Size = new System.Drawing.Size(93, 43);
            this.btnDel.TabIndex = 14;
            this.btnDel.Text = "Delete";
            this.btnDel.UseVisualStyleBackColor = true;
            // 
            // btnEdit
            // 
            this.btnEdit.AutoSize = true;
            this.btnEdit.Font = new System.Drawing.Font("Calibri", 16F);
            this.btnEdit.Location = new System.Drawing.Point(475, 337);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(93, 43);
            this.btnEdit.TabIndex = 13;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.AutoSize = true;
            this.btnAdd.Font = new System.Drawing.Font("Calibri", 14F);
            this.btnAdd.Location = new System.Drawing.Point(365, 337);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(93, 43);
            this.btnAdd.TabIndex = 12;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnKill
            // 
            this.btnKill.AutoSize = true;
            this.btnKill.Font = new System.Drawing.Font("Calibri", 16F);
            this.btnKill.Location = new System.Drawing.Point(39, 337);
            this.btnKill.Name = "btnKill";
            this.btnKill.Size = new System.Drawing.Size(93, 43);
            this.btnKill.TabIndex = 11;
            this.btnKill.Text = "Kill";
            this.btnKill.UseVisualStyleBackColor = true;
            // 
            // lstAllplayer
            // 
            this.lstAllplayer.Font = new System.Drawing.Font("Calibri", 12F);
            this.lstAllplayer.FormattingEnabled = true;
            this.lstAllplayer.ItemHeight = 24;
            this.lstAllplayer.Items.AddRange(new object[] {
            "Bozhi",
            "Josef",
            "Super"});
            this.lstAllplayer.Location = new System.Drawing.Point(365, 49);
            this.lstAllplayer.Name = "lstAllplayer";
            this.lstAllplayer.Size = new System.Drawing.Size(313, 268);
            this.lstAllplayer.TabIndex = 10;
            // 
            // lstCurrentgame
            // 
            this.lstCurrentgame.Font = new System.Drawing.Font("Calibri", 12F);
            this.lstCurrentgame.FormattingEnabled = true;
            this.lstCurrentgame.ItemHeight = 24;
            this.lstCurrentgame.Items.AddRange(new object[] {
            "Game 1v1(1)",
            "Game 1v1(2)",
            "Game 2v2(1)",
            "Game 3v3(1)"});
            this.lstCurrentgame.Location = new System.Drawing.Point(39, 49);
            this.lstCurrentgame.Name = "lstCurrentgame";
            this.lstCurrentgame.Size = new System.Drawing.Size(272, 268);
            this.lstCurrentgame.TabIndex = 9;
            // 
            // AdminMainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(719, 399);
            this.Controls.Add(this.lblAllplayer);
            this.Controls.Add(this.lblCurrentgame);
            this.Controls.Add(this.btnDel);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnKill);
            this.Controls.Add(this.lstAllplayer);
            this.Controls.Add(this.lstCurrentgame);
            this.Name = "AdminMainForm";
            this.Text = "AdminMainForm";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblAllplayer;
        private System.Windows.Forms.Label lblCurrentgame;
        private System.Windows.Forms.Button btnDel;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnKill;
        private System.Windows.Forms.ListBox lstAllplayer;
        private System.Windows.Forms.ListBox lstCurrentgame;
    }
}