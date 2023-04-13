Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D006E1433
	for <lists+linux-mips@lfdr.de>; Thu, 13 Apr 2023 20:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjDMSgN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Apr 2023 14:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjDMSgM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Apr 2023 14:36:12 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3AC76A2;
        Thu, 13 Apr 2023 11:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681410971; x=1712946971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r97ETdLe83X1qhr3CYIugk6zwVDKsPmPWxIRW6Sbhmw=;
  b=OnIrChrrF8Kgza2FRaYiTkJcsT5lWQu7nlxIS8DkCzN+vnhHiLQDDvpc
   gOquhVSEJpKUBA6x/xLtwf5BpF5Kc84dgxfZNUgmTr8GHZKTXry2B+zdh
   PFqIkEoZhmJis3gnumJ4wP/711ZBchDEVS5z+q2+Bb9Ah+AmTxFJhrzz/
   JwupX31R9DJ0lNTuMutszEZgD5UenJ6Hqn9UEZjjOBHgZiXrU8U6LyPBJ
   1COCMg+zG+t8078nXibqvDCxDrwy1a8iYGYZBVf4yGp1dxJekGNBxIwyg
   efXpQuxCUJ+ydOyQRnZ/0DGcuIV4YxCQtSnvcfzuDOzB1beAbEsa6oqO9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="328411521"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="328411521"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 11:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="800906389"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="800906389"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 11:36:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pn1nb-000YsN-19;
        Thu, 13 Apr 2023 18:35:59 +0000
Date:   Fri, 14 Apr 2023 02:35:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-rtc@vger.kernel.org, linux-mips@vger.kernel.org,
        loongarch@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V3 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
Message-ID: <202304140202.URh2nrLx-lkp@intel.com>
References: <09f381f445cfbcf857845f61d10238452037b2e8.1681370153.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09f381f445cfbcf857845f61d10238452037b2e8.1681370153.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on robh/for-next linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/dt-bindings-rtc-Subdivision-of-LS2X-RTC-compatible/20230413-155906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/09f381f445cfbcf857845f61d10238452037b2e8.1681370153.git.zhoubinbin%40loongson.cn
patch subject: [PATCH V3 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304140202.URh2nrLx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/30ef4691d0ab95241315bf9ba7cf20b7d549b071
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Binbin-Zhou/dt-bindings-rtc-Subdivision-of-LS2X-RTC-compatible/20230413-155906
        git checkout 30ef4691d0ab95241315bf9ba7cf20b7d549b071
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140202.URh2nrLx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-ls2x.c:276:25: warning: cast to smaller integer type 'enum ls2x_pm_offset' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           priv->pm_base = regs - (enum ls2x_pm_offset)device_get_match_data(dev);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +276 drivers/rtc/rtc-ls2x.c

   249	
   250	static int ls2x_rtc_probe(struct platform_device *pdev)
   251	{
   252		int ret;
   253		void __iomem *regs;
   254		struct ls2x_rtc_priv *priv;
   255		struct device *dev = &pdev->dev;
   256	
   257		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   258		if (!priv)
   259			return -ENOMEM;
   260	
   261		regs = devm_platform_ioremap_resource(pdev, 0);
   262		if (IS_ERR(regs))
   263			return dev_err_probe(dev, PTR_ERR(regs),
   264					     "devm_platform_ioremap_resource failed\n");
   265	
   266		priv->regmap = devm_regmap_init_mmio(dev, regs,
   267						     &ls2x_rtc_regmap_config);
   268		if (IS_ERR(priv->regmap))
   269			return dev_err_probe(dev, PTR_ERR(priv->regmap),
   270					     "devm_regmap_init_mmio failed\n");
   271	
   272		device_init_wakeup(dev, 1);
   273		spin_lock_init(&priv->lock);
   274		platform_set_drvdata(pdev, priv);
   275	
 > 276		priv->pm_base = regs - (enum ls2x_pm_offset)device_get_match_data(dev);
   277	
   278		if (has_acpi_companion(dev))
   279			acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
   280							 ls2x_rtc_handler, priv);
   281	
   282		priv->rtcdev = devm_rtc_allocate_device(dev);
   283		if (IS_ERR(priv->rtcdev))
   284			return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
   285					     "devm_rtc_allocate_device failed\n");
   286	
   287		priv->rtcdev->ops = &ls2x_rtc_ops;
   288		priv->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
   289		priv->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
   290	
   291		priv->irq = platform_get_irq(pdev, 0);
   292		if (priv->irq < 0)
   293			return dev_err_probe(dev, priv->irq, "platform_get_irq failed\n");
   294	
   295		ret = devm_request_irq(dev, priv->irq, ls2x_rtc_isr,
   296				       IRQF_TRIGGER_RISING, "ls2x-alarm", priv);
   297		if (ret < 0)
   298			return dev_err_probe(dev, ret, "Unable to request irq %d\n",
   299					     priv->irq);
   300	
   301		return devm_rtc_register_device(priv->rtcdev);
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
