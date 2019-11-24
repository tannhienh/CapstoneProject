#include "xmlreader.h"
#include <QDebug>

// Constructor XmlReader function
XmlReader::XmlReader(QString filePath, ApplicationsModel &appsModel)
{
    if (ReadXmlFile(filePath))
        ParseXmlFile(appsModel);
}

// Check xml file and set content for xmlDocument
// Return true if read xml file successfull
// Return false if read xml file failed
bool XmlReader::ReadXmlFile(QString filePath)
{
    // Load xml file as raw data
    QFile xmlFile(filePath);

    if (xmlFile.open(QIODevice::ReadOnly)) {
        if (xmlDocument.setContent(&xmlFile)) {
            xmlFile.close();
            return true;    // read file successfull
        }
        xmlFile.close();    // close xml file
        return false;       // load file failed
    }
    xmlFile.close();        // close xml file
    return false;           // read file failed
}

// Parse xml file
void XmlReader::ParseXmlFile(ApplicationsModel &appsModel)
{
    // Extract the root markup
    QDomElement root=xmlDocument.documentElement();

    // Get the first child of the root (Markup COMPONENT is expected)
    QDomElement Component=root.firstChild().toElement();

    // Loop while there is a child
    while(!Component.isNull())
    {
        // Check if the child tag name is COMPONENT
        if (Component.tagName()=="APP")
        {
            // Read the component ID
            QString ID=Component.attribute("ID","No ID");

            // Get the first child of the component
            QDomElement Child=Component.firstChild().toElement();

            QString title;
            QString url;
            QString iconPath;

            // Read each child of the component node
            while (!Child.isNull())
            {
                // Read Name and value
                if (Child.tagName() == "TITLE")
                    title = Child.firstChild().toText().data();
                if (Child.tagName() == "URL")
                    url = Child.firstChild().toText().data();
                if (Child.tagName() == "ICON_PATH")
                    iconPath = Child.firstChild().toText().data();

                // Next node
                Child = Child.nextSibling().toElement();
            }

            // Create application item
            ApplicationItem item(title,url,iconPath);

            // Add application item into apps model
            appsModel.addApplication(item);
        }

        // Next component
        Component = Component.nextSibling().toElement();
    }
}