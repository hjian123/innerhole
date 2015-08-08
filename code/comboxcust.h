#ifndef COMBOBOXCUST_H
#define COMBOBOXCUST_H
#include <QObject>
#include <QComboBox>
class Comboxcust: public QComboBox
{
    Q_OBJECT
     Q_PROPERTY(int cheight READ cheight)
     Q_PROPERTY(int cwidth READ cwidth)
     Q_PROPERTY(int cfontsize READ cfontsize  WRITE setcfontsize)
     Q_PROPERTY(int currentindex READ currentindex  WRITE setcurrentindex)
    Q_PROPERTY(int ccount READ ccount)
public:
    Comboxcust();
    ~Comboxcust();
    Q_INVOKABLE  void addContent(QString  text);

    int cheight(void);
  //  void setCheight(const int setheight);
    int cwidth(void);
  //  void setCwidth(const int setwidth);
    int cfontsize(void);
    void setcfontsize( int fontsize);
    int currentindex(void);
    void setcurrentindex( int index);
    int ccount();
private:
    int m_cheight;
    int m_cwidth;
    int m_cfontsize;
    int m_currentindex;
    int m_ccount;
};

#endif // COMBOBOXCUST_H
