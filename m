Return-Path: <linux-mips+bounces-189-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A67F56DE
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 04:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18687281894
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 03:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432E28BE3;
	Thu, 23 Nov 2023 03:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdGxucWE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E169D46;
	Wed, 22 Nov 2023 19:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709140; x=1732245140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YK+QY6r4HYFA8JXtUB/EwU57HdbWk25Z4Y1AtkcDu58=;
  b=QdGxucWEo9QkWm3laWeKuFhbL1gCgjrcUb3KrDUga/95+MoszsDK3Wr3
   EZTnNruCfTLf/H1EaiRwKjvdMVlr1P/hMyLfnnXOjW/1O66OazcD70X8h
   +zilcaaPM+jl2psjvEmM3Ockw28C8hK/LClKkht9e2xjVihCo0Ao/4kl5
   wK0P5x6rPsUbtpxJUQ4ApoIMG5HcCt/hZfIqKthKVs05b58MoaoUIfIZ9
   ctoMocgps8pAjwrEodd+0fZQZpq8P6DebCWtfMGIdls8tuXy5z0wHhf75
   ZL4aNxjjxdlRtey30g/y3xcRiLFaGlLW5VlHRs3Kv/q1NBzSj4A+gp3yy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458685584"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="458685584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="716933915"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="716933915"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Nov 2023 19:12:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r608P-00019u-2S;
	Thu, 23 Nov 2023 03:12:09 +0000
Date: Thu, 23 Nov 2023 11:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v1 08/17] pinctrl: core: Embed struct pingroup into
 struct group_desc
Message-ID: <202311230849.YPJuLoNP-lkp@intel.com>
References: <20231122164040.2262742-9-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122164040.2262742-9-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next next-20231122]
[cannot apply to geert-renesas-drivers/renesas-pinctrl pinctrl-samsung/for-next linus/master v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-equilibrium-Convert-to-use-struct-pingroup/20231123-005932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20231122164040.2262742-9-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 08/17] pinctrl: core: Embed struct pingroup into struct group_desc
config: i386-buildonly-randconfig-004-20231123 (https://download.01.org/0day-ci/archive/20231123/202311230849.YPJuLoNP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230849.YPJuLoNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230849.YPJuLoNP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                    from drivers/pinctrl/mediatek/pinctrl-mt7981.c:9:
>> drivers/pinctrl/mediatek/../core.h:217:21: error: initializer element is not constant
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7981.c:795:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
     795 |         PINCTRL_PIN_GROUP("wa_aice1", mt7981_wa_aice1),
         |         ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/../core.h:217:21: note: (near initialization for 'mt7981_groups')
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7981.c:795:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
     795 |         PINCTRL_PIN_GROUP("wa_aice1", mt7981_wa_aice1),
         |         ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                    from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
>> drivers/pinctrl/mediatek/../core.h:217:21: error: initializer element is not constant
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7623.c:1079:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
    1079 |         PINCTRL_PIN_GROUP("aud_ext_clk0", mt7623_aud_ext_clk0),
         |         ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/../core.h:217:21: note: (near initialization for 'mt7623_groups')
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7623.c:1079:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
    1079 |         PINCTRL_PIN_GROUP("aud_ext_clk0", mt7623_aud_ext_clk0),
         |         ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                    from drivers/pinctrl/mediatek/pinctrl-mt7629.c:9:
>> drivers/pinctrl/mediatek/../core.h:217:21: error: initializer element is not constant
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7629.c:312:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
     312 |         PINCTRL_PIN_GROUP("ephy_leds", mt7629_ephy_leds),
         |         ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/../core.h:217:21: note: (near initialization for 'mt7629_groups')
     217 | (struct group_desc) {                                           \
         |                     ^
   drivers/pinctrl/mediatek/pinctrl-moore.h:41:9: note: in expansion of macro 'PINCTRL_GROUP_DESC'
      41 |         PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mt7629.c:312:9: note: in expansion of macro 'PINCTRL_PIN_GROUP'
     312 |         PINCTRL_PIN_GROUP("ephy_leds", mt7629_ephy_leds),
         |         ^~~~~~~~~~~~~~~~~


vim +217 drivers/pinctrl/mediatek/../core.h

c7059c5ac70aea1 Tony Lindgren   2016-12-27  214  
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  215  /* Convenience macro to define a generic pin group descriptor */
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  216  #define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22 @217  (struct group_desc) {						\
4930128932e4e5e Andy Shevchenko 2023-11-22  218  	.grp = PINCTRL_PINGROUP(_name, _pins, _num_pins),	\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  219  	.name = _name,						\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  220  	.pins = _pins,						\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  221  	.num_pins = _num_pins,					\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  222  	.data = _data,						\
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  223  }
3bea9da5ae4cf43 Andy Shevchenko 2023-11-22  224  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

