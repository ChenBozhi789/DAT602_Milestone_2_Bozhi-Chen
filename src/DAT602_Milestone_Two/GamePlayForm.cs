using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAT602_MIlestone_Two
{
    public partial class GamePlayForm : Form
    {
        public GamePlayForm()
        {
            InitializeComponent();            
        }

        private void CreateBoard(int MapID)
        {
            Map map = new Map
            {
                MapID = MapID
            };
            UserDAO userDAO = new UserDAO();
            List<Tile> tiles = userDAO.GetTiles(map);

            foreach (Tile tile in tiles)
            {
                int btny = 30;
                Button btn = new Button();
                // Initial colour of the button
                btn.Size = new Size(30, 30);
                btn.Location = new Point(tile.TileRow * 30, (tile.TileCol * 30) + btny);
                btn.Name = $"btn_{tile.TileRow}_{tile.TileCol}";

                if (tile.TileRow == 0 && tile.TileCol == 0)
                {
                    // Default color of the first tile is gray
                    btn.BackColor = Color.Gray;
                }
                else
                {
                    // Default color of the last tile is white
                    btn.BackColor = Color.White;
                }

                // Add event to the button
                btn.Click += (sender, e) => TestedButton_Click(sender, e, tile);

                //Add button to the game board
                gbBoard.Controls.Add(btn);                
            }
        }

        private void TestedButton_Click(object sender, EventArgs e, Tile tile)
        {
            UserDAO userDAO = new UserDAO();
            // When player click tile, the event will be triggered
            Button clickedButton = sender as Button;

            bool movementResult = userDAO.Player_game_play_movement(GlobalVariable.UserID, tile.TileRow, tile.TileCol);

            if (movementResult)
            {
                if (clickedButton.BackColor == Color.White)
                {
                    // Item is diamond
                    if (tile.ItemType == 1)
                    {
                        clickedButton.BackColor = Color.Red;
                    }
                    // Item is bomb
                    else if (tile.ItemType == 2)
                    {
                        clickedButton.BackColor = Color.Black;
                    }
                    // If the tile is empty, the tile will be changed to gray
                    else
                    {
                        clickedButton.BackColor = Color.Gray;
                    }
                }
                bool scoringResult = userDAO.game_play_scoring_and_inventory(GlobalVariable.UserID, tile.TileID);
            }
        }

        private void GamePlayForm_Load(object sender, EventArgs e)
        {
            CreateBoard(GlobalVariable.MapID);
        }
    }
}