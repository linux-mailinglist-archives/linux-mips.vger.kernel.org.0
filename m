Return-Path: <linux-mips+bounces-3349-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8618D10E4
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 02:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E3C8282129
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 00:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4953CB677;
	Tue, 28 May 2024 00:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIvC0fdb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161A8567D;
	Tue, 28 May 2024 00:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716856270; cv=none; b=HKUfmBIV6Jxa1+fzR8HhyOP2VcXT92FYQKVGchwCoY1QU31o6UlHVRAJgGtbED4Jk8+MlMp93Z+NmJqwJ5tVKaRUP84x41xjGgGMKScIlOAodOeh+lbb6h805y7bwewtnAlaQSyvhmDF/W2bhduu/a7AHVVK7L8eDP6DF02qxzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716856270; c=relaxed/simple;
	bh=5wyq/PCQQDCnYxQzdKRW3eAoy0uAeddcUgmwP9qxBFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqQJtv171W8EcSllYHmpFXm9DLf6s0pNbp/uSCzdMjfD73bRaXvO/Q9LOoZev4QPQc1wgfjXHAvjb//yS1KlciAhSim+/Er1eZjGazb0Oy9HEizoeQ3kkdrTofxlhYFpBJ8BSxz0Q8dpA10KFCWilEcj77uBDOxvf5a7k7Oi54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIvC0fdb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716856269; x=1748392269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5wyq/PCQQDCnYxQzdKRW3eAoy0uAeddcUgmwP9qxBFQ=;
  b=hIvC0fdbdrYCZcI+zRfSyhHNJ0lkBOPrcegI9cIHAllYNsZnJibe2xUe
   f32oHh5YjXm9SBckmp7YSaSA+8nMrSzrR8lNgoRB3NJX/1SMusSHzBcOW
   llvfh4+7+XHVpYa8XRZfDu3fJUVC18WGgQKK73cUXjlUM500s9HPo3OYA
   w+/CHw/rYNw+Xas0QcfRRIKJwnm/FLfa4fgUpRqRvpEg5zKWGxnMFgfIa
   8ytCLDFRFtRQxPKv1T7j0X4esPyASscHoo51M5AlYDgmBW1G5r5gcB9BT
   GZt1zuInNeHlilYtJPWHcMRG8DDtA94t7UxRH0g66hMoR9zzt/+bcRz0v
   A==;
X-CSE-ConnectionGUID: RvhksCLOStOLy3QET9wn5w==
X-CSE-MsgGUID: 1MHEFIQ2QhuxSYJOTmO22g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23739179"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="23739179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 17:31:06 -0700
X-CSE-ConnectionGUID: AnToqBoySGyg8R8G3srTXQ==
X-CSE-MsgGUID: DOdQIOmjRaWtK/W8/LXsTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="66098718"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2024 17:31:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBkjy-000BEB-2J;
	Tue, 28 May 2024 00:30:58 +0000
Date: Tue, 28 May 2024 08:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: Re: [PATCH v1 01/11] pinctrl: berlin: Make use of struct pinfunction
Message-ID: <202405280810.6djYxvIm-lkp@intel.com>
References: <20240527212742.1432960-2-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527212742.1432960-2-andy.shevchenko@gmail.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.10-rc1 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-berlin-Make-use-of-struct-pinfunction/20240528-053304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240527212742.1432960-2-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 01/11] pinctrl: berlin: Make use of struct pinfunction
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240528/202405280810.6djYxvIm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280810.6djYxvIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280810.6djYxvIm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/berlin/berlin.c:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pinctrl/berlin/berlin.c:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pinctrl/berlin/berlin.c:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/pinctrl/berlin/berlin.c:261:45: error: passing 'const char *const *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     261 |                         groups = devm_krealloc_array(&pdev->dev, function->groups,
         |                                                                  ^~~~~~~~~~~~~~~~
   include/linux/device.h:346:47: note: passing argument to parameter 'p' here
     346 | devm_krealloc_array(struct device *dev, void *p, size_t new_n, size_t new_size, gfp_t flags)
         |                                               ^
   6 warnings and 1 error generated.


vim +261 drivers/pinctrl/berlin/berlin.c

   200	
   201	static int berlin_pinctrl_build_state(struct platform_device *pdev)
   202	{
   203		struct berlin_pinctrl *pctrl = platform_get_drvdata(pdev);
   204		const struct berlin_desc_group *desc_group;
   205		const struct berlin_desc_function *desc_function;
   206		int i, max_functions = 0;
   207	
   208		pctrl->nfunctions = 0;
   209	
   210		for (i = 0; i < pctrl->desc->ngroups; i++) {
   211			desc_group = pctrl->desc->groups + i;
   212			/* compute the maximum number of functions a group can have */
   213			max_functions += 1 << (desc_group->bit_width + 1);
   214		}
   215	
   216		/* we will reallocate later */
   217		pctrl->functions = kcalloc(max_functions, sizeof(*pctrl->functions), GFP_KERNEL);
   218		if (!pctrl->functions)
   219			return -ENOMEM;
   220	
   221		/* register all functions */
   222		for (i = 0; i < pctrl->desc->ngroups; i++) {
   223			desc_group = pctrl->desc->groups + i;
   224			desc_function = desc_group->functions;
   225	
   226			while (desc_function->name) {
   227				berlin_pinctrl_add_function(pctrl, desc_function->name);
   228				desc_function++;
   229			}
   230		}
   231	
   232		pctrl->functions = krealloc(pctrl->functions,
   233					    pctrl->nfunctions * sizeof(*pctrl->functions),
   234					    GFP_KERNEL);
   235		if (!pctrl->functions)
   236			return -ENOMEM;
   237	
   238		/* map functions to theirs groups */
   239		for (i = 0; i < pctrl->desc->ngroups; i++) {
   240			desc_group = pctrl->desc->groups + i;
   241			desc_function = desc_group->functions;
   242	
   243			while (desc_function->name) {
   244				struct pinfunction *function = pctrl->functions;
   245				const char **groups;
   246				bool found = false;
   247	
   248				while (function->name) {
   249					if (!strcmp(desc_function->name, function->name)) {
   250						found = true;
   251						break;
   252					}
   253					function++;
   254				}
   255	
   256				if (!found) {
   257					kfree(pctrl->functions);
   258					return -EINVAL;
   259				}
   260	
 > 261				groups = devm_krealloc_array(&pdev->dev, function->groups,
   262							     function->ngroups,
   263							     sizeof(*function->groups),
   264							     GFP_KERNEL);
   265				if (!groups) {
   266					kfree(pctrl->functions);
   267					return -ENOMEM;
   268				}
   269				function->groups = groups;
   270				while (*groups)
   271					groups++;
   272	
   273				*groups = desc_group->name;
   274	
   275				desc_function++;
   276			}
   277		}
   278	
   279		return 0;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

