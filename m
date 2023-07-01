Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F197446D2
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jul 2023 07:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjGAFuE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jul 2023 01:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjGAFuD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jul 2023 01:50:03 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04F41FE8;
        Fri, 30 Jun 2023 22:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688190601; x=1719726601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=11wr5dJpoS1GpZs2TiT4A2d3ST6KbLKlccMr4/HVdFo=;
  b=cpz7eu7+m552CJFlsCcyo1zea6Yj8hcCqyGQdi9AkmWmFJ2GvrXpw7eS
   YCm1XwtxelKBvFvzz7Yl6Q8+/UmaYpzzYMwTMje9mWTH99gEuhUeJGq0V
   06ZfQrLWn4ANVmcYGSJ/57yEwRdZutH8x++xbjueFr+TqgaIWGn/6yIUG
   oiO9wpQ1GGmEqFGmR0N8O4Or/XG4nZgwrezrrpcGND/vv1vF03kwndVu+
   XuRD/bp2A9m0AfXOT+6MmJdwex/IhcNY/pNlImsiU+dooBRPY7Nl1WN2X
   6YJqs1PkcT8E/8Jg1m069xkWyU4HEN0TWnbVDMCHjvg86YIIeKfgkyf2Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="366040225"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="366040225"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 22:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="747629734"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="747629734"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jun 2023 22:49:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qFTUc-000FkP-1L;
        Sat, 01 Jul 2023 05:49:58 +0000
Date:   Sat, 1 Jul 2023 13:49:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ladislav Michl <oss-lists@triops.cz>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 10/11] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Message-ID: <202307011354.M9asTVJw-lkp@intel.com>
References: <ZJC3eK8QMxShyZDt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC3eK8QMxShyZDt@lenoch>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ladislav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next v6.4]
[cannot apply to linus/master next-20230630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ladislav-Michl/MIPS-OCTEON-octeon-usb-add-all-register-offsets/20230620-041822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/ZJC3eK8QMxShyZDt%40lenoch
patch subject: [PATCH 10/11] usb: dwc3: dwc3-octeon: Move node parsing into driver probe
config: mips-randconfig-r083-20230701 (https://download.01.org/0day-ci/archive/20230701/202307011354.M9asTVJw-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011354.M9asTVJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011354.M9asTVJw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/dwc3/dwc3-octeon.c:277:43: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +277 drivers/usb/dwc3/dwc3-octeon.c

d83bf20c53410d arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  255  
3c47bbb8f554f8 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  256  static int dwc3_octeon_config_power(struct device *dev, void __iomem *base)
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  257  {
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  258  	uint32_t gpio_pwr[3];
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  259  	int gpio, len, power_active_low;
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  260  	struct device_node *node = dev->of_node;
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  261  	u64 val;
3c47bbb8f554f8 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  262  	void __iomem *uctl_host_cfg_reg = base + USBDRD_UCTL_HOST_CFG;
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  263  
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  264  	if (of_find_property(node, "power", &len) != NULL) {
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  265  		if (len == 12) {
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  266  			of_property_read_u32_array(node, "power", gpio_pwr, 3);
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  267  			power_active_low = gpio_pwr[2] & 0x01;
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  268  			gpio = gpio_pwr[1];
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  269  		} else if (len == 8) {
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  270  			of_property_read_u32_array(node, "power", gpio_pwr, 2);
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  271  			power_active_low = 0;
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  272  			gpio = gpio_pwr[1];
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  273  		} else {
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  274  			dev_err(dev, "invalid power configuration\n");
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  275  			return -EINVAL;
06df6469e3e1a1 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  276  		}
3c47bbb8f554f8 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19 @277  		dwc3_octeon_config_gpio(((u64)base >> 24) & 1, gpio);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill 2017-01-25  278  
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill 2017-01-25  279  		/* Enable XHCI power control and set if active high or low. */
3c47bbb8f554f8 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  280  		val = dwc3_octeon_readq(uctl_host_cfg_reg);
52245e391fcf6c arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  281  		val |= USBDRD_UCTL_HOST_PPC_EN;
52245e391fcf6c arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  282  		if (power_active_low)
52245e391fcf6c arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  283  			val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
52245e391fcf6c arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  284  		else
52245e391fcf6c arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  285  			val |= USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
3c47bbb8f554f8 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  286  		dwc3_octeon_writeq(uctl_host_cfg_reg, val);
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill 2017-01-25  287  	} else {
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill 2017-01-25  288  		/* Disable XHCI power control and set if active high. */
3c47bbb8f554f8 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  289  		val = dwc3_octeon_readq(uctl_host_cfg_reg);
52245e391fcf6c arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  290  		val &= ~USBDRD_UCTL_HOST_PPC_EN;
52245e391fcf6c arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  291  		val &= ~USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN;
3c47bbb8f554f8 arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2023-06-19  292  		dwc3_octeon_writeq(uctl_host_cfg_reg, val);
4a24f6e0cc17ba arch/mips/cavium-octeon/octeon-usb.c Ladislav Michl 2022-12-21  293  		dev_info(dev, "power control disabled\n");
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill 2017-01-25  294  	}
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill 2017-01-25  295  	return 0;
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill 2017-01-25  296  }
93e502b3c2d44d arch/mips/cavium-octeon/octeon-usb.c Steven J. Hill 2017-01-25  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
