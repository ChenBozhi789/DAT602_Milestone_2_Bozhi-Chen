namespace DAT602_MIlestone_Two
{
    partial class MainGameLobby
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
            this.btnDeleteGame = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.btnAdminconsole = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.btnNewgame1 = new System.Windows.Forms.Button();
            this.listBox2 = new System.Windows.Forms.ListBox();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.txtMaxrow = new System.Windows.Forms.TextBox();
            this.txtMaxCol = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtDeleteGame = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnDeleteGame
            // 
            this.btnDeleteGame.Font = new System.Drawing.Font("Calibri", 10F, System.Drawing.FontStyle.Bold);
            this.btnDeleteGame.Location = new System.Drawing.Point(452, 19);
            this.btnDeleteGame.Name = "btnDeleteGame";
            this.btnDeleteGame.Size = new System.Drawing.Size(128, 35);
            this.btnDeleteGame.TabIndex = 29;
            this.btnDeleteGame.Text = "Delete Account";
            this.btnDeleteGame.UseVisualStyleBackColor = true;
            this.btnDeleteGame.Click += new System.EventHandler(this.btnDeleteGame_Click);
            // 
            // button5
            // 
            this.button5.AutoSize = true;
            this.button5.Font = new System.Drawing.Font("Calibri", 14F);
            this.button5.Location = new System.Drawing.Point(410, 164);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(171, 43);
            this.button5.TabIndex = 28;
            this.button5.Text = "Join Game";
            this.button5.UseVisualStyleBackColor = true;
            // 
            // btnAdminconsole
            // 
            this.btnAdminconsole.AutoSize = true;
            this.btnAdminconsole.Font = new System.Drawing.Font("Calibri", 14F);
            this.btnAdminconsole.Location = new System.Drawing.Point(409, 214);
            this.btnAdminconsole.Name = "btnAdminconsole";
            this.btnAdminconsole.Size = new System.Drawing.Size(172, 43);
            this.btnAdminconsole.TabIndex = 27;
            this.btnAdminconsole.Text = "Admin Console";
            this.btnAdminconsole.UseVisualStyleBackColor = true;
            this.btnAdminconsole.Click += new System.EventHandler(this.btnAdminconsole_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Calibri", 14F, System.Drawing.FontStyle.Bold);
            this.label2.Location = new System.Drawing.Point(25, 25);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(154, 29);
            this.label2.TabIndex = 26;
            this.label2.Text = "Current Game";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Calibri", 14F, System.Drawing.FontStyle.Bold);
            this.label1.Location = new System.Drawing.Point(217, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(147, 29);
            this.label1.TabIndex = 25;
            this.label1.Text = "Online Player";
            // 
            // button2
            // 
            this.button2.AutoSize = true;
            this.button2.Font = new System.Drawing.Font("Calibri", 14F);
            this.button2.Location = new System.Drawing.Point(410, 263);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(171, 43);
            this.button2.TabIndex = 23;
            this.button2.Text = "Logout";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // btnNewgame1
            // 
            this.btnNewgame1.AutoSize = true;
            this.btnNewgame1.Font = new System.Drawing.Font("Calibri", 14F);
            this.btnNewgame1.Location = new System.Drawing.Point(409, 115);
            this.btnNewgame1.Name = "btnNewgame1";
            this.btnNewgame1.Size = new System.Drawing.Size(171, 43);
            this.btnNewgame1.TabIndex = 22;
            this.btnNewgame1.Text = "New 1v1 Game";
            this.btnNewgame1.UseVisualStyleBackColor = true;
            this.btnNewgame1.Click += new System.EventHandler(this.button1_Click);
            // 
            // listBox2
            // 
            this.listBox2.Font = new System.Drawing.Font("Calibri", 12F);
            this.listBox2.FormattingEnabled = true;
            this.listBox2.ItemHeight = 24;
            this.listBox2.Items.AddRange(new object[] {
            "Bozhi\t2000",
            "Josef\t1200\t\t",
            "Super\t7000"});
            this.listBox2.Location = new System.Drawing.Point(221, 63);
            this.listBox2.Name = "listBox2";
            this.listBox2.Size = new System.Drawing.Size(173, 244);
            this.listBox2.TabIndex = 21;
            // 
            // listBox1
            // 
            this.listBox1.Font = new System.Drawing.Font("Calibri", 12F);
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 24;
            this.listBox1.Items.AddRange(new object[] {
            "Game 1v1(1)",
            "Game 1v1(2)",
            "Game 2v2(1)",
            "Game 3v3(1)"});
            this.listBox1.Location = new System.Drawing.Point(29, 63);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(173, 244);
            this.listBox1.TabIndex = 20;
            // 
            // txtMaxrow
            // 
            this.txtMaxrow.Location = new System.Drawing.Point(410, 84);
            this.txtMaxrow.Name = "txtMaxrow";
            this.txtMaxrow.Size = new System.Drawing.Size(85, 25);
            this.txtMaxrow.TabIndex = 30;
            // 
            // txtMaxCol
            // 
            this.txtMaxCol.Location = new System.Drawing.Point(501, 84);
            this.txtMaxCol.Name = "txtMaxCol";
            this.txtMaxCol.Size = new System.Drawing.Size(79, 25);
            this.txtMaxCol.TabIndex = 31;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold);
            this.label3.Location = new System.Drawing.Point(407, 63);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 17);
            this.label3.TabIndex = 32;
            this.label3.Text = "MaxRow";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Bold);
            this.label4.Location = new System.Drawing.Point(498, 63);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(55, 18);
            this.label4.TabIndex = 33;
            this.label4.Text = "MaxCol";
            // 
            // txtDeleteGame
            // 
            this.txtDeleteGame.Location = new System.Drawing.Point(409, 26);
            this.txtDeleteGame.Name = "txtDeleteGame";
            this.txtDeleteGame.Size = new System.Drawing.Size(36, 25);
            this.txtDeleteGame.TabIndex = 34;
            // 
            // MainGameLobby
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(601, 325);
            this.Controls.Add(this.txtDeleteGame);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtMaxCol);
            this.Controls.Add(this.txtMaxrow);
            this.Controls.Add(this.btnDeleteGame);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.btnAdminconsole);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.btnNewgame1);
            this.Controls.Add(this.listBox2);
            this.Controls.Add(this.listBox1);
            this.Name = "MainGameLobby";
            this.Text = "MainGameLobby";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnDeleteGame;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button btnAdminconsole;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button btnNewgame1;
        private System.Windows.Forms.ListBox listBox2;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.TextBox txtMaxrow;
        private System.Windows.Forms.TextBox txtMaxCol;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtDeleteGame;
    }
}