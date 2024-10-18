namespace DAT602_MIlestone_Two
{
    partial class AdminManagerForm
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
            this.btnDel = new System.Windows.Forms.Button();
            this.btnConfirm = new System.Windows.Forms.Button();
            this.chkAdmin = new System.Windows.Forms.CheckBox();
            this.chkLocked = new System.Windows.Forms.CheckBox();
            this.lblGamename = new System.Windows.Forms.Label();
            this.txtPwd = new System.Windows.Forms.TextBox();
            this.txtUsername = new System.Windows.Forms.TextBox();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.lblEmail = new System.Windows.Forms.Label();
            this.lblPwd = new System.Windows.Forms.Label();
            this.lblUsername = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnDel
            // 
            this.btnDel.Font = new System.Drawing.Font("Calibri", 12F);
            this.btnDel.Location = new System.Drawing.Point(46, 313);
            this.btnDel.Name = "btnDel";
            this.btnDel.Size = new System.Drawing.Size(203, 31);
            this.btnDel.TabIndex = 33;
            this.btnDel.Text = "Delete";
            this.btnDel.UseVisualStyleBackColor = true;
            this.btnDel.Click += new System.EventHandler(this.btnDel_Click);
            // 
            // btnConfirm
            // 
            this.btnConfirm.Font = new System.Drawing.Font("Calibri", 13F);
            this.btnConfirm.Location = new System.Drawing.Point(44, 350);
            this.btnConfirm.Name = "btnConfirm";
            this.btnConfirm.Size = new System.Drawing.Size(206, 42);
            this.btnConfirm.TabIndex = 32;
            this.btnConfirm.Text = "Confirm";
            this.btnConfirm.UseVisualStyleBackColor = true;
            this.btnConfirm.Click += new System.EventHandler(this.btnConfirm_Click);
            // 
            // chkAdmin
            // 
            this.chkAdmin.AutoSize = true;
            this.chkAdmin.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.chkAdmin.Location = new System.Drawing.Point(159, 278);
            this.chkAdmin.Name = "chkAdmin";
            this.chkAdmin.Size = new System.Drawing.Size(90, 29);
            this.chkAdmin.TabIndex = 31;
            this.chkAdmin.Text = "Admin";
            this.chkAdmin.UseVisualStyleBackColor = true;
            // 
            // chkLocked
            // 
            this.chkLocked.AutoSize = true;
            this.chkLocked.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.chkLocked.Location = new System.Drawing.Point(46, 278);
            this.chkLocked.Name = "chkLocked";
            this.chkLocked.Size = new System.Drawing.Size(98, 29);
            this.chkLocked.TabIndex = 30;
            this.chkLocked.Text = "Locked";
            this.chkLocked.UseVisualStyleBackColor = true;
            // 
            // lblGamename
            // 
            this.lblGamename.AutoSize = true;
            this.lblGamename.Font = new System.Drawing.Font("Calibri", 20F);
            this.lblGamename.Location = new System.Drawing.Point(12, 28);
            this.lblGamename.Name = "lblGamename";
            this.lblGamename.Size = new System.Drawing.Size(275, 41);
            this.lblGamename.TabIndex = 29;
            this.lblGamename.Text = "Player Information";
            // 
            // txtPwd
            // 
            this.txtPwd.Location = new System.Drawing.Point(43, 240);
            this.txtPwd.Multiline = true;
            this.txtPwd.Name = "txtPwd";
            this.txtPwd.Size = new System.Drawing.Size(206, 30);
            this.txtPwd.TabIndex = 28;
            // 
            // txtUsername
            // 
            this.txtUsername.Location = new System.Drawing.Point(43, 108);
            this.txtUsername.Multiline = true;
            this.txtUsername.Name = "txtUsername";
            this.txtUsername.Size = new System.Drawing.Size(206, 30);
            this.txtUsername.TabIndex = 27;
            // 
            // txtEmail
            // 
            this.txtEmail.Location = new System.Drawing.Point(43, 174);
            this.txtEmail.Multiline = true;
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(206, 30);
            this.txtEmail.TabIndex = 26;
            // 
            // lblEmail
            // 
            this.lblEmail.AutoSize = true;
            this.lblEmail.Font = new System.Drawing.Font("Calibri", 14F);
            this.lblEmail.Location = new System.Drawing.Point(39, 144);
            this.lblEmail.Name = "lblEmail";
            this.lblEmail.Size = new System.Drawing.Size(68, 29);
            this.lblEmail.TabIndex = 25;
            this.lblEmail.Text = "Email";
            // 
            // lblPwd
            // 
            this.lblPwd.AutoSize = true;
            this.lblPwd.Font = new System.Drawing.Font("Calibri", 14F);
            this.lblPwd.Location = new System.Drawing.Point(39, 210);
            this.lblPwd.Name = "lblPwd";
            this.lblPwd.Size = new System.Drawing.Size(105, 29);
            this.lblPwd.TabIndex = 24;
            this.lblPwd.Text = "Password";
            // 
            // lblUsername
            // 
            this.lblUsername.AutoSize = true;
            this.lblUsername.Font = new System.Drawing.Font("Calibri", 14F);
            this.lblUsername.Location = new System.Drawing.Point(39, 78);
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(113, 29);
            this.lblUsername.TabIndex = 23;
            this.lblUsername.Text = "Username";
            // 
            // AdminManagerForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(294, 409);
            this.Controls.Add(this.btnDel);
            this.Controls.Add(this.btnConfirm);
            this.Controls.Add(this.chkAdmin);
            this.Controls.Add(this.chkLocked);
            this.Controls.Add(this.lblGamename);
            this.Controls.Add(this.txtPwd);
            this.Controls.Add(this.txtUsername);
            this.Controls.Add(this.txtEmail);
            this.Controls.Add(this.lblEmail);
            this.Controls.Add(this.lblPwd);
            this.Controls.Add(this.lblUsername);
            this.Name = "AdminManagerForm";
            this.Text = "AdminManagerForm";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnDel;
        private System.Windows.Forms.Button btnConfirm;
        private System.Windows.Forms.CheckBox chkAdmin;
        private System.Windows.Forms.CheckBox chkLocked;
        private System.Windows.Forms.Label lblGamename;
        private System.Windows.Forms.TextBox txtPwd;
        private System.Windows.Forms.TextBox txtUsername;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Label lblEmail;
        private System.Windows.Forms.Label lblPwd;
        private System.Windows.Forms.Label lblUsername;
    }
}