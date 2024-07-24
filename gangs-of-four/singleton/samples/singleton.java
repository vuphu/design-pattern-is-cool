// javac singleton.java && java GameSetting && rm GameSetting.class

class GameSetting {
    private static GameSetting instance;
    private int volume;

    private GameSetting() {
        volume = 0;
    }
    
    public void increaseVolume() {
        volume += 1;
    }
    
    public int getVolume() {
        return volume;
    }

    public static synchronized GameSetting getInstance() {
        if (instance == null) {
            instance = new GameSetting();
        }
        return instance;
    }

    public static void main(String[] args) {
        GameSetting setting = GameSetting.getInstance();
        setting.increaseVolume();
        setting.increaseVolume();
        
        System.out.println(GameSetting.getInstance().getVolume());
    }
}

