#include "comboxcust.h"
#include <QFont>
#include <QDebug>

Comboxcust::Comboxcust()
{
    //qDebug()<<"combox!!!!!";
}

Comboxcust::~Comboxcust()
{

}



void Comboxcust::addContent( QString text)
{
    addItem(text);
}

int Comboxcust::cheight()
{
    return m_cheight;
}

//void Comboxcust::setCheight(const int setheight)
//{

//}

int Comboxcust::cwidth()
{
    return m_cwidth;
}

//void Comboxcust::setCwidth(const int setwidth)
//{

//}

int Comboxcust::cfontsize()
{
    return m_cfontsize;
}

void Comboxcust::setcfontsize( int fontsize)
{
    QFont fonts;
   fonts.setPointSize(fontsize);
    setFont(fonts);
    m_cfontsize=fontsize;
}

int Comboxcust::currentindex()
{
    return m_currentindex;
}

void Comboxcust::setcurrentindex( int index)
{
    m_currentindex=index;
    setCurrentIndex(m_currentindex);
}

int Comboxcust::ccount()
{
    m_ccount=count();
    return m_ccount;
}
