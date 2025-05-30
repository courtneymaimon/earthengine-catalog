local id = 'CIESIN/GPWv411/GPW_Basic_Demographic_Characteristics';
local subdir = 'CIESIN';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.cc_by_4_0;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'GPWv411: Basic Demographic Characteristics (Gridded Population of the World Version 4.11)',
  version: 'v4.11',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    This dataset contains population estimates, by age and sex, per
    30 arc-second grid cell consistent with national censuses and population
    registers. There is one image for each modeled age and sex category based
    on the 2010 round of Census.

    [General Documentation](https://sedac.ciesin.columbia.edu/data/set/gpw-v4-basic-demographic-characteristics-rev11/docs)
  ||| + importstr 'GPWv411.md',
  license: license.id,
  links: ee.standardLinks(subdir, id) + [
    ee.link.license(license.reference),
    {
      rel: ee_const.rel.cite_as,
      href: 'https://doi.org/10.7927/H46M34XX',
    },
  ],
  'gee:categories': ['population'],
  keywords: [
    'ciesin',
    'gpw',
    'nasa',
    'population',
  ],
  providers: [
    ee.producer_provider('NASA SEDAC at the Center for International Earth Science Information Network', 'https://doi.org/10.7927/H46M34XX'),
    ee.host_provider(self_ee_catalog_url),
  ],
  'gee:provider_ids': [
    'C1597149465-SEDAC',
  ],
  extent: ee.extent_global('2000-01-01T00:00:00Z', '2020-01-01T00:00:00Z'),
  summaries: {
    'gee:schema': [
      {
        name: 'Sex',
        description: 'The sex of a population subgroup.',
        type: ee_const.var_type.string,
      },
      {
        name: 'Age_Group',
        description: 'The age range of a population subgroup.',
        type: ee_const.var_type.string,
      },
    ],
    gsd: [
      927.67,
    ],
    'eo:bands': [
      {
        name: 'basic_demographic_characteristics',
        description: 'The estimated number of persons, by age and sex, per 30 arc-second grid cell.',
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Basic Demographic Characteristics',
        lookat: {
          lat: 19.81,
          lon: 79.1,
          zoom: 3,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              1000.0,
            ],
            palette: [
              'ffffe7',
              '86a192',
              '509791',
              '307296',
              '2c4484',
              '000066',
            ],
            bands: [
              'basic_demographic_characteristics',
            ],
          },
        },
      },
    ],
    basic_demographic_characteristics: {
      minimum: 0.0,
      maximum: 140852.0,
      'gee:estimated_range': true,
    },
  },
  'sci:doi': '10.7927/H46M34XX',
  'sci:citation': |||
    Center for International Earth Science Information Network - CIESIN -
    Columbia University. 2018. Gridded Population of the World, Version 4
    (GPWv4): Basic Characteristics, Revision 11. Palisades, NY: NASA Socioeconomic Data and
    Applications Center (SEDAC). [doi:10.7927/H46M34XX](https://doi.org/10.7927/H46M34XX).
    Accessed DAY MONTH YEAR.
  |||,
  'gee:interval': {
    type: 'cadence',
    unit: 'year',
    interval: 5,
  },
  'gee:terms_of_use': ee.gee_terms_of_use(license),
  'gee:user_uploaded': true,
}
