Return-Path: <linux-mips+bounces-3347-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56A8D10D4
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 02:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D35AB282C91
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 00:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC9A1870;
	Tue, 28 May 2024 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZ76nE1A"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A76CA6B;
	Tue, 28 May 2024 00:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716855608; cv=none; b=Pfu2EeCeBuWBKtbt3ipjuaM+Mj3tMBWp+SR5KTvDfF5hWa/AU9nJ8kg+ID6fuT9k0zB22oLlrTwjomi7uiETfONhTEMuliQjpUs0Dinx8BEM3iBiERYa4J6o7dVGBfIMIv4KXwkbEHvLm88o9aduX+0vJAHGwCq8KfcZN+3V9t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716855608; c=relaxed/simple;
	bh=eWutr2ixlnG62KX0n+3CKcwCg7XUOaIpMKsxTO2P7eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1XONIFI030FIl2GKGJAhjp2DcjASzGLXaBXu7t+pwFkFpd5WuOi5/cbBc7OYWd/nDsreEnZOtM75D3HkGGdZeyGj1hcD5k2puL5UUlsN0gcJqURyyOOB/uI1ppBUzMjKO+nMwr7uLp2gC81r3p8wCm2N450LYrC7Z6cF1q2Bjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZ76nE1A; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716855607; x=1748391607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eWutr2ixlnG62KX0n+3CKcwCg7XUOaIpMKsxTO2P7eI=;
  b=eZ76nE1AQk8kYLxkEItfa/UaZ2gufhuEfsMdsljY/5BcTOUgm9Ekmh3x
   emWGAr2Z+6Cc1P2IiCZW7AB+aBIHpmfk4naoH2g/r4AaKW9TeoGH+7fT5
   Q/E4mDDARE7MH+fz6ix6gTr7eQCGL3zBXJr/mrpxheXv/OdXSKfRbShcz
   neTtSs+n2iokE+O/TV0K0NKsTDAZsZmM4gM7hPjGDg5AoCSmS9eApk4/v
   V+xxvceAw5M3KKh8ElVzeGLRA0rnPIjNa3VenxNGfhc1jz8TelDGZYljY
   4DyNAv+VON94I8QSmMuhbSnhe7nU0L/epxAB9FFT+bG6QwkBMVTBO/uqf
   Q==;
X-CSE-ConnectionGUID: 3oOB2dv3Qh2bfyomSW+kWA==
X-CSE-MsgGUID: k9jyHRJrSV2QxlqOvvn9WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13005897"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13005897"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 17:20:06 -0700
X-CSE-ConnectionGUID: w4akoXTfQ/WInjn+IB/C/A==
X-CSE-MsgGUID: WDKBma7rRiOAj5w/CeSwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="65697189"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2024 17:20:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBkZK-000BDz-1x;
	Tue, 28 May 2024 00:19:58 +0000
Date: Tue, 28 May 2024 08:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: Re: [PATCH v1 05/11] pinctrl: pinmux: Add a convenient define
 PINCTRL_FUNCTION_DESC()
Message-ID: <202405280739.VSX5oEnr-lkp@intel.com>
References: <20240527212742.1432960-6-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527212742.1432960-6-andy.shevchenko@gmail.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.10-rc1 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-berlin-Make-use-of-struct-pinfunction/20240528-053304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240527212742.1432960-6-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 05/11] pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240528/202405280739.VSX5oEnr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280739.VSX5oEnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280739.VSX5oEnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinmux.c:863: warning: Function parameter or struct member 'ngroups' not described in 'pinmux_generic_add_function'
>> drivers/pinctrl/pinmux.c:863: warning: Excess function parameter 'num_groups' description in 'pinmux_generic_add_function'


vim +863 drivers/pinctrl/pinmux.c

a76edc89b100e4 Tony Lindgren      2016-12-27  849  
a76edc89b100e4 Tony Lindgren      2016-12-27  850  /**
6bffa7e1631d55 Geert Uytterhoeven 2017-04-03  851   * pinmux_generic_add_function() - adds a function group
a76edc89b100e4 Tony Lindgren      2016-12-27  852   * @pctldev: pin controller device
a76edc89b100e4 Tony Lindgren      2016-12-27  853   * @name: name of the function
a76edc89b100e4 Tony Lindgren      2016-12-27  854   * @groups: array of pin groups
a76edc89b100e4 Tony Lindgren      2016-12-27  855   * @num_groups: number of pin groups
a76edc89b100e4 Tony Lindgren      2016-12-27  856   * @data: pin controller driver specific data
a76edc89b100e4 Tony Lindgren      2016-12-27  857   */
a76edc89b100e4 Tony Lindgren      2016-12-27  858  int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
a76edc89b100e4 Tony Lindgren      2016-12-27  859  				const char *name,
bd0aae66c48208 Rafał Miłecki      2021-12-16  860  				const char * const *groups,
368512f04e89e0 Andy Shevchenko    2024-05-28  861  				const unsigned int ngroups,
a76edc89b100e4 Tony Lindgren      2016-12-27  862  				void *data)
a76edc89b100e4 Tony Lindgren      2016-12-27 @863  {
a76edc89b100e4 Tony Lindgren      2016-12-27  864  	struct function_desc *function;
6ec89cd4d17bd5 Sergey Shtylyov    2023-07-19  865  	int selector, error;
f913cfce4ee49a Tony Lindgren      2018-07-05  866  
f913cfce4ee49a Tony Lindgren      2018-07-05  867  	if (!name)
f913cfce4ee49a Tony Lindgren      2018-07-05  868  		return -EINVAL;
f913cfce4ee49a Tony Lindgren      2018-07-05  869  
f913cfce4ee49a Tony Lindgren      2018-07-05  870  	selector = pinmux_func_name_to_selector(pctldev, name);
f913cfce4ee49a Tony Lindgren      2018-07-05  871  	if (selector >= 0)
f913cfce4ee49a Tony Lindgren      2018-07-05  872  		return selector;
f913cfce4ee49a Tony Lindgren      2018-07-05  873  
f913cfce4ee49a Tony Lindgren      2018-07-05  874  	selector = pctldev->num_functions;
a76edc89b100e4 Tony Lindgren      2016-12-27  875  
a76edc89b100e4 Tony Lindgren      2016-12-27  876  	function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
a76edc89b100e4 Tony Lindgren      2016-12-27  877  	if (!function)
a76edc89b100e4 Tony Lindgren      2016-12-27  878  		return -ENOMEM;
a76edc89b100e4 Tony Lindgren      2016-12-27  879  
368512f04e89e0 Andy Shevchenko    2024-05-28  880  	function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
a76edc89b100e4 Tony Lindgren      2016-12-27  881  
6ec89cd4d17bd5 Sergey Shtylyov    2023-07-19  882  	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
6ec89cd4d17bd5 Sergey Shtylyov    2023-07-19  883  	if (error)
6ec89cd4d17bd5 Sergey Shtylyov    2023-07-19  884  		return error;
a76edc89b100e4 Tony Lindgren      2016-12-27  885  
a76edc89b100e4 Tony Lindgren      2016-12-27  886  	pctldev->num_functions++;
a76edc89b100e4 Tony Lindgren      2016-12-27  887  
f913cfce4ee49a Tony Lindgren      2018-07-05  888  	return selector;
a76edc89b100e4 Tony Lindgren      2016-12-27  889  }
a76edc89b100e4 Tony Lindgren      2016-12-27  890  EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
a76edc89b100e4 Tony Lindgren      2016-12-27  891  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

