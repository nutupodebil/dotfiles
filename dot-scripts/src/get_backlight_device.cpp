#include <fstream>
#include <iostream>
#include <string>
int main(){
    //std::ifstream f("/home/vldzn/backlight");
    std::string back_dev;
    //std::getline(f, back_dev);
    //f.close();
    std::cin >> back_dev;

    std::ofstream hypr("/home/vldzn/.config/hypr/modules/backlight_device.lua");
    hypr << "mon_bright = '" << back_dev << "'";
    hypr.close();

    //std::ofstream swaync("/home/vldzn/.config/swaync/backlight_device.json");
    //swaync << '"' << "device" << '"' << ": " << '"' << back_dev << '"';
    //swaync.close();
    
    std::ifstream swaync_conf_in("/home/vldzn/.config/swaync/config");
    std::ofstream swaync_conf_out("/home/vldzn/.config/swaync/config.json");
    
    std::string line;
    bool flag;
    while (getline(swaync_conf_in, line)){
        flag = false;
        char pprev = line[0];
        char prev = '0';
        if (line.size() >= 2ull) prev = line[1];
        for (unsigned long long i = 2ull; i < line.size(); ++i){
            char now = line[i];
            if (pprev == 'd' && prev == 'e' && now == 'v'){
                swaync_conf_out << '"' << "device" << '"' << ": " << '"' << back_dev << '"' << std::endl;
                flag = true;
                break;
            }
            pprev = prev;
            prev = now;
        }
        if (!flag) swaync_conf_out << line << std::endl;
    }

    swaync_conf_in.close();
    swaync_conf_out.close();
}
