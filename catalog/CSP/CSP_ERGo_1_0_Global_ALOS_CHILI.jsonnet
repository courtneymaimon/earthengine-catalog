local id = 'CSP/ERGo/1_0/Global/ALOS_CHILI';
local subdir = 'CSP';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.cc_by_nc_sa_4_0;

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
  title: 'Global ALOS CHILI (Continuous Heat-Insolation Load Index)',
  version: '1.0',
  'gee:type': ee_const.gee_type.image,
  description: |||
    CHILI is a surrogate for effects of insolation and topographic shading on
    evapotranspiration represented by calculating insolation at early afternoon,
    sun altitude equivalent to equinox. It is based on the 30m \"AVE\" band of
    JAXA's ALOS DEM (available in EE as JAXA/ALOS/AW3D30_V1_1).

    The Conservation Science Partners (CSP) Ecologically Relevant Geomorphology
    (ERGo) Datasets, Landforms and Physiography contain detailed, multi-scale
    data on landforms and physiographic (aka land facet) patterns. Although
    there are many potential uses of these data, the original purpose for these
    data was to develop an ecologically relevant classification and map of
    landforms and physiographic classes that are suitable for climate adaptation
    planning. Because there is large uncertainty associated with future climate
    conditions and even more uncertainty around ecological responses, providing
    information about what is unlikely to change offers a strong foundation for
    managers to build robust climate adaptation plans. The quantification of
    these features of the landscape is sensitive to the resolution, so we
    provide the highest resolution possible given the extent and characteristics
    of a given index.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  'gee:categories': ['elevation-topography'],
  keywords: [
    'aspect',
    'csp',
    'elevation',
    'ergo',
    'geophysical',
    'global',
    'landforms',
    'slope',
    'topography',
  ],
  providers: [
    ee.producer_provider('Conservation Science Partners', 'https://www.csp-inc.org/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('2006-01-24T00:00:00Z', '2011-05-13T00:00:00Z'),
  summaries: {
    gsd: [
      90.0,
    ],
    'eo:bands': [
      {
        name: 'constant',
        description: |||
          ALOS-derived CHILI index ranging from 0 (very cool) to 255
          (very warm). This was rescaled from the [0,1] range in the publication.
        |||,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'ALOS CHILI',
        lookat: {
          lat: 40.3439,
          lon: -105.8636,
          zoom: 11,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              255.0,
            ],
            bands: [
              'constant',
            ],
          },
        },
      },
    ],
    constant: {
      minimum: 0.0,
      maximum: 255.0,
      'gee:estimated_range': false,
    },
  },
  'sci:citation': |||
    Theobald, D. M., Harrison-Atlas, D., Monahan, W. B., & Albano, C. M.
    (2015). Ecologically-relevant maps of landforms and physiographic diversity
    for climate adaptation planning. PloS one, 10(12),
    [e0143619](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0143619)
  |||,
  'gee:terms_of_use': ee.gee_terms_of_use(license),
  'gee:unusual_terms_of_use': true,
  'gee:user_uploaded': true,
}
