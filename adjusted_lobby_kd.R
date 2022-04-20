team_size <- 4

lobby_kd <- seq(from = 0.8, to = 1.2, by = 0.01)

team_kds <- c(0.5, 1.0, 1.5, 2.5, 4)

for(i in team_kds){
  adj_kds <- (150*lobby_kd - team_size*i)/(150-team_size)
  
  if(i == team_kds[1]){
    kd_tibble <- tibble(lobby_kd = lobby_kd,
                        team_kd = i,
                        adj_kds = adj_kds)
  }else{
    temp_tibble <- tibble(lobby_kd = lobby_kd,
                                       team_kd = i,
                                       adj_kds = adj_kds)
    
    kd_tibble <- rbind(kd_tibble, temp_tibble)
  }
}

ggplot(kd_tibble, aes(x = lobby_kd, y = adj_kds, color = as.factor(team_kd)))+
  geom_line(size = 2)+
  coord_equal()+
  theme_bw()+
  xlab('Reported average lobby KD')+
  ylab('Team Adjusted KD')+
  labs(color = 'Team KD')+
  ggtitle('150 players per lobby | teams of 4')
