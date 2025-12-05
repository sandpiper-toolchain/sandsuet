---
header-includes:
  - \newcommand{\sandsuetversion}{$sandsuetversion$}
---

1. The dataset shall be organized hierarchically.

    a. The top level shall contain variables that (i) have the maximum number of dimensions in the dataset and (ii) make up the essential data that the creator intends to share for reuse.
    b. Lower levels, if present, shall contain data and information that reference and support the essential data variables, hereafter referred to as auxiliary data.[^1]
    c. Lower level group names are arbitrary.


2. All data shall be arranged in a rectilinear grid and projected.


3. The dataset shall have attributes briefly describing and contextualizing the underlying data; the only required metadata field is the "sandsuet\_version".[^2]


4. Data dimensions shall be ordered according to the hierarchy: temporal > vertical spatial > horizontal spatial > horizontal spatial. If any dimensions are not present in the underlying data, that dimension is to be simply omitted. 

    a. Ordering of horizontal spatial dimensions is arbitrary. However, if spatial information represents real-world information, the north-south oriented dimension shall be ordered first (e.g., UTM Northing). 

    b. No more than four dimensions are permitted for a single variable.

    c. Spatial dimensions shall be orthogonal to one another.

    d. Dimension names are arbitrary.[^3]


5. A coordinate variable shall be specified for each dimension represented in the dataset.

    a. Coordinate names shall match the corresponding dimension name exactly.[^4]

    b. Coordinates shall provide specific rectifiable information to place the data along applicable dimensions.

    c. Spatial coordinates must have  uniform spacing, and temporal coordinates may have non-uniform spacing.

    d. Coordinates must be monotonically increasing or decreasing, with the exception of temporal coordinates, which must be monotonically increasing.[^5]
    

6. Variables shall be labeled with applicable coordinates.
    
    a. Any number of coordinates can locate variables along the same data dimension.[^6]

    b. Variable units shall be  consistent across the dataset.[^7]
            
    c. Variable attributes shall specify variable units and a description of the variable information.[^8]
            
    d. Variables shall have between zero and four dimensions (scalar up to time by three spatial dimensions).
        
    e. Variable names are arbitrary.[^9]
            
    f. Missing values shall be filled consistently across a variable, and variable metadata shall indicate the fill value.[^10]


[^1]: Note, auxiliary data is distinct from metadata; see Specification 3 and Specification 6c.
[^2]: I.e., metadata. Metadata are information _about_ the dataset as a whole and/or individual variables. For example, date generated, author, DOI of an associated publication, variable units, or which instrument generated the variable data. The NetCDF attribute "sandsuet\_version" shall be specified without preceding "v", e.g., 1.0.0.
[^3]: Consider that descriptive dimension names are helpful. For example, a temporal dimension could be named "elapsed seconds", "Date", or "Myr".
[^4]: This forms a dimension-coordinate pair that is essential for referencing data in absolute space and time, that is, in relation to other variables in the dataset (e.g., Specification 6a).
[^5]: For example, use elevation, rather than depth or two-way travel time for stratigraphic information.
[^6]: For example, if Sensor 1 data collected every 5 minutes, and Sensor 2 data collected every 20 minutes, each should have their own temporal dimension name and matching coordinate variable, and each should reference the same absolute time (e.g., elapsed time since beginning of experiment; Specification 6b).
[^7]: For example, if one spatial dimension has units of meters, additional spatial dimensions should also use meters, including when multiple dimension-coordinate pairs locate data along the same dimension. Derived variables, like velocity, should also then use meters, as meters per second. Consider applying the UDUNITS specification.
[^8]: Consider the [Scientific Variables Ontology](https://scientificvariablesontology.org/) for the NetCDF "long\_name" variables attribute.
[^9]: Consider using memorable and easy to type variable names that are aligned with conventions of the discipline.
[^10]: For example, the NetCDF specification indicates missing values with a variable attribute called "\_FillValue". Different variables can use different fill values, if needed.
