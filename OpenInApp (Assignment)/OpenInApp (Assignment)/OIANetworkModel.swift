//
//  OIANetworkModel.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 31/05/24.
//

import Foundation

struct OIANetworkModel: Codable {
    var status: Bool
    var statusCode: Double
    var message: String
    var supportWhatsAppNumber: String
    var extraIncome: Double
    var totalLinks: Double
    var totalClicks: Double
    var todayClicks: Double
    var topSource: String
    var topLocation: String
    var startTime: String
    var linksCreatedToday: Double
    var appliedCampaign: Double
    var data: DataModel
    
    private enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "statusCode"
        case message
        case supportWhatsAppNumber = "support_whatsapp_number"
        case extraIncome = "extra_income"
        case totalLinks = "total_links"
        case totalClicks = "total_clicks"
        case todayClicks = "today_clicks"
        case topSource = "top_source"
        case topLocation = "top_location"
        case startTime = "startTime"
        case linksCreatedToday = "links_created_today"
        case appliedCampaign = "applied_campaign"
        case data
    }
    
    func toKeyValuePairs() -> [(String, String)] {
            return [
                ("Extra Income", String(extraIncome)),
                ("Total Links", String(totalLinks)),
                ("Total Clicks", String(totalClicks)),
                ("Today Clicks", String(todayClicks)),
                ("Top Source", topSource),
                ("Top Location", topLocation),
                ("Start Time", startTime),
                ("Links Created Today", String(linksCreatedToday)),
                ("Applied Campaign", String(appliedCampaign))
            ]
        }
}

struct DataModel: Codable {
    var recentLinks: [URLLink]
    var topLinks: [URLLink]
    var favouriteLinks: [URLLink]
    var overallURLChart: [String: Double]?
    
    private enum CodingKeys: String, CodingKey {
        case recentLinks = "recent_links"
        case topLinks = "top_links"
        case favouriteLinks = "favourite_links"
        case overallURLChart = "overall_url_chart"
    }
}

struct URLLink: Codable {
    var urlID: Double
    var webLink: String
    var smartLink: String
    var title: String
    var totalClicks: Int
    var originalImage: String
    var thumbnail: String?
    var timesAgo: String
    var createdAt: String
    var domainID: String
    var urlPrefix: String?
    var urlSuffix: String
    var app: String
    var isFavourite: Bool
    
    private enum CodingKeys: String, CodingKey {
        case urlID = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case thumbnail
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainID = "domain_id"
        case urlPrefix = "url_prefix"
        case urlSuffix = "url_suffix"
        case app
        case isFavourite = "is_favourite"
    }
}
