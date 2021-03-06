#include "applicationsmodel.h"

// Constructor function applications model
ApplicationsModel::ApplicationsModel()
{
}

// Count the number of applications in list model
int ApplicationsModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.count();
}

// Get data a role of an application at index position
QVariant ApplicationsModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_data.count())
        return QVariant();

    const ApplicationItem &item = m_data.at(index.row());

    switch (role)
    {
    case IdRole:
        return item.id();
    case TitleRole:
        return item.title();
    case UrlRole:
        return item.url();
    case IconPathRole:
        return item.iconPath();
    default:
        return QVariant();
    }
}

// Add an application item into list model
void ApplicationsModel::addApplication(ApplicationItem &item)
{
    m_data.append(item);
}

// Swap position 2 apps icon
void ApplicationsModel::swap(int index1, int index2)
{
    m_data.swapItemsAt(index1, index2);
}

// Reset model
void ApplicationsModel::endReloadModel()
{
    this->endResetModel();
}

// Create hash table for roles an application
QHash<int, QByteArray> ApplicationsModel::roleNames() const
{
    QHash<int, QByteArray> roles;

    roles[IdRole] = "id";
    roles[TitleRole] = "title";
    roles[UrlRole] = "url";
    roles[IconPathRole] = "iconPath";

    return roles;
}
