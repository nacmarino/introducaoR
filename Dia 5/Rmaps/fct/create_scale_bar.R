createScaleBar <- function(lon,lat,distanceLon,distanceLat,distanceLegend, dist.units = "km"){
    # First rectangle
    bottomRight <- gcDestination(lon = lon, lat = lat, bearing = 90, dist = distanceLon, dist.units = dist.units, model = "WGS84")

    topLeft <- gcDestination(lon = lon, lat = lat, bearing = 0, dist = distanceLat, dist.units = dist.units, model = "WGS84")
    rectangle <- cbind(lon=c(lon, lon, bottomRight[1,"long"], bottomRight[1,"long"], lon),
                       lat = c(lat, topLeft[1,"lat"], topLeft[1,"lat"],lat, lat))
    rectangle <- data.frame(rectangle, stringsAsFactors = FALSE)

    # Second rectangle t right of the first rectangle
    bottomRight2 <- gcDestination(lon = lon, lat = lat, bearing = 90, dist = distanceLon*2, dist.units = dist.units, model = "WGS84")
    rectangle2 <- cbind(lon = c(bottomRight[1,"long"], bottomRight[1,"long"], bottomRight2[1,"long"], bottomRight2[1,"long"], bottomRight[1,"long"]),
                        lat=c(lat, topLeft[1,"lat"], topLeft[1,"lat"], lat, lat))
    rectangle2 <- data.frame(rectangle2, stringsAsFactors = FALSE)

    # Now let's deal with the text
    onTop <- gcDestination(lon = lon, lat = lat, bearing = 0, dist = distanceLegend, dist.units = dist.units, model = "WGS84")
    onTop2 <- onTop3 <- onTop
    onTop2[1,"long"] <- bottomRight[1,"long"]
    onTop3[1,"long"] <- bottomRight2[1,"long"]

    legend <- rbind(onTop, onTop2, onTop3)
    legend <- data.frame(cbind(legend, text = c(0, distanceLon, distanceLon*2)), stringsAsFactors = FALSE, row.names = NULL)
    return(list(rectangle = rectangle, rectangle2 = rectangle2, legend = legend))
}

createOrientationArrow <- function(scaleBar, length, distance = 1, dist.units = "km"){
    lon <- scaleBar$rectangle2[1,1]
    lat <- scaleBar$rectangle2[1,2]

    # Bottom point of the arrow
    begPoint <- gcDestination(lon = lon, lat = lat, bearing = 0, dist = distance, dist.units = dist.units, model = "WGS84")
    lon <- begPoint[1,"long"]
    lat <- begPoint[1,"lat"]

    # Let us create the endpoint
    onTop <- gcDestination(lon = lon, lat = lat, bearing = 0, dist = length, dist.units = dist.units, model = "WGS84")

    leftArrow <- gcDestination(lon = onTop[1,"long"], lat = onTop[1,"lat"], bearing = 225, dist = length/5, dist.units = dist.units, model = "WGS84")

    rightArrow <- gcDestination(lon = onTop[1,"long"], lat = onTop[1,"lat"], bearing = 135, dist = length/5, dist.units = dist.units, model = "WGS84")

    res <- rbind(
        cbind(x = lon, y = lat, xend = onTop[1,"long"], yend = onTop[1,"lat"]),
        cbind(x = leftArrow[1,"long"], y = leftArrow[1,"lat"], xend = onTop[1,"long"], yend = onTop[1,"lat"]),
        cbind(x = rightArrow[1,"long"], y = rightArrow[1,"lat"], xend = onTop[1,"long"], yend = onTop[1,"lat"]))

    res <- as.data.frame(res, stringsAsFactors = FALSE)

    # Coordinates from which "N" will be plotted
    coordsN <- cbind(x = lon, y = (lat + onTop[1,"lat"])/2)

    return(list(res = res, coordsN = coordsN))
}

scaleBar <- function(lon, lat, distanceLon, distanceLat, distanceLegend, dist.unit = "km", rec.fill = "white", rec.colour = "black", rec2.fill = "black", rec2.colour = "black", legend.colour = "black", legend.size = 3, orientation = TRUE, arrow.length = 500, arrow.distance = 300, arrow.North.size = 6){
    laScaleBar <- createScaleBar(lon = lon, lat = lat, distanceLon = distanceLon, distanceLat = distanceLat, distanceLegend = distanceLegend, dist.unit = dist.unit)
    # First rectangle
    rectangle1 <- geom_polygon(data = laScaleBar$rectangle, aes(x = lon, y = lat), fill = rec.fill, colour = rec.colour)

    # Second rectangle
    rectangle2 <- geom_polygon(data = laScaleBar$rectangle2, aes(x = lon, y = lat), fill = rec2.fill, colour = rec2.colour)

    # Legend
    scaleBarLegend <- annotate("text", label = paste(laScaleBar$legend[,"text"], dist.unit, sep=""), x = laScaleBar$legend[,"long"], y = laScaleBar$legend[,"lat"], size = legend.size, colour = legend.colour)

    res <- list(rectangle1, rectangle2, scaleBarLegend)

    if(orientation){# Add an arrow pointing North
        coordsArrow <- createOrientationArrow(scaleBar = laScaleBar, length = arrow.length, distance = arrow.distance, dist.unit = dist.unit)
        arrow <- list(geom_segment(data = coordsArrow$res, aes(x = x, y = y, xend = xend, yend = yend)), annotate("text", label = "N", x = coordsArrow$coordsN[1,"x"], y = coordsArrow$coordsN[1,"y"], size = arrow.North.size, colour = "black"))
        res <- c(res, arrow)
    }
    return(res)
}