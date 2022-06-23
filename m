Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A998D5570C9
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jun 2022 04:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377348AbiFWCAU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jun 2022 22:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377427AbiFWCAS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 22:00:18 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1939DA5;
        Wed, 22 Jun 2022 19:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655949618; x=1687485618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KbeXCVtz+edFvopo5p5QoDn9huAgw0qHkMWWoFBLhXA=;
  b=TRcjg/fXfLp1F9SNfyxslU1rzSfaxkUWr07brf1Q4kxr1JKxkSrviN54
   V7HhryJQkD1028NN9t0UzDDcyBAOsAG6hxbIkfOdXZKz7KwT94N67Qaox
   LLq+zGWlh4R6xZgznNWfR85Gyg+lc8l3UogXVj73y8NC/RtcsRy3ItHmH
   ob2ctiH1fmRSRziYqDH5KHeGSVNWGjuISCd/gWbPdBhiPVTPnyyQa0Zw5
   69Z6NP4z4eftiWNh/0M74rfpASd9qv/4GcEoOoQ6AL5CpR0CBMT0V6amg
   0zfoSBW01Kk9kKY0jx5cqg4fTd0XHuEPf9FJ4ZQV4uN0CV82j6ROoao8y
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281325558"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="281325558"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 19:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="615398908"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Jun 2022 19:00:02 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o4C8X-0000LT-BJ;
        Thu, 23 Jun 2022 02:00:01 +0000
Date:   Thu, 23 Jun 2022 09:59:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc:     kbuild-all@lists.01.org, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, vkoul@kernel.org,
        nicolas.ferre@microchip.com, nsaenz@kernel.org,
        shawnguo@kernel.org, linux-imx@nxp.com, cezary.rojewski@intel.com,
        pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, daniel@zonque.org,
        srinivas.kandagatla@linaro.org, linux-rockchip@lists.infradead.org,
        krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
        heiko@sntech.de, jbrunet@baylibre.com, kernel@pengutronix.de,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 27/96] ASoC: au1x: Migrate to new style legacy DAI naming
 flag
Message-ID: <202206230910.wUXKFP3z-lkp@intel.com>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Charles,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tegra/for-next sunxi/sunxi/for-next linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/Refactor-non_legacy_dai_naming-flag/20220616-224300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20220623/202206230910.wUXKFP3z-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/794205d61285d0921e564e722daf9b20df82ed57
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Charles-Keepax/Refactor-non_legacy_dai_naming-flag/20220616-224300
        git checkout 794205d61285d0921e564e722daf9b20df82ed57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/au1x/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> sound/soc/au1x/ac97c.c:227:10: error: 'const struct snd_soc_component_driver' has no member named 'legacy_dai_name'; did you mean 'legacy_dai_naming'?
     227 |         .legacy_dai_name        = 1,
         |          ^~~~~~~~~~~~~~~
         |          legacy_dai_naming
>> sound/soc/au1x/ac97c.c:227:35: warning: initialization of 'const struct snd_kcontrol_new *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     227 |         .legacy_dai_name        = 1,
         |                                   ^
   sound/soc/au1x/ac97c.c:227:35: note: (near initialization for 'au1xac97c_component.controls')


vim +227 sound/soc/au1x/ac97c.c

   224	
   225	static const struct snd_soc_component_driver au1xac97c_component = {
   226		.name			= "au1xac97c",
 > 227		.legacy_dai_name	= 1,
   228	};
   229	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
