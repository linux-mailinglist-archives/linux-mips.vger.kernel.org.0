Return-Path: <linux-mips+bounces-3399-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 449128D4482
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 06:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC8A1F2235F
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 04:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F806143898;
	Thu, 30 May 2024 04:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N60VcUMT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC9C143884;
	Thu, 30 May 2024 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717043306; cv=none; b=GV1KLPA4X+k0R1nqacl20VyyDJATUE9b0Try+uX5shEyRJkl4DSyNANdUDNZz+ZNojszUyELbZK+GMtJIXq7x2ipxsA8+PmOxjIQeqoIvA9UZ5mwhIWUMaHjlBU6iUthjfJmbRQDuBKa7oapXV5pI0AC2cUCok9FOep2kTTDWPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717043306; c=relaxed/simple;
	bh=v5tjOO9HmCSCEa8MYghEPg07vHQ4gZzTHlkRqnsQfVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4WMb+Rrl6ZNuvY9pkYMmmEtbMPvtkQu3cTuNsq9Ue4PC6bfoAOdcdlsfa5HC247wXTRPIGfcJWH+Cn9oNejlzACSJ6TqK/FYEE8sSqLIO15xJGCwSB7g62IVnkHhiR4JuibNBdqIfKw7VhFK3O10MSGMl+K6ocpNO7M24lc0C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N60VcUMT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717043305; x=1748579305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v5tjOO9HmCSCEa8MYghEPg07vHQ4gZzTHlkRqnsQfVI=;
  b=N60VcUMTipNsICAo4uPnNsUe7V35ywotzXeXppHNycIdVlonNWCJH3JB
   ai1SpPgZrerTIZUyyuSUTnVPqSul1MwFbgcd6F+Z0zkryjZZ0S6HOn1/f
   ykGyVZt4H15I7ttNK/MdsLW0aQ3bZS167gl+dJMOGJDoi61sndZ1KhW0D
   Rlf1CCXGADUQ4DvSsOa0UMQnT+NhAou8yjRsZaMBktIKMPPs/+Q+IyDbL
   af057F2bhFlGH5pKiJ91uhoZnUj8ZBW+dOK2Rt1/DpNvz4Z0KiPc3+VW5
   f34WcwrPfRSF28pa4+aDEHlwJiGi40LHl+x+iIJblxkdTR5u8/61bi/BF
   A==;
X-CSE-ConnectionGUID: 3LQSmPmuS72zQeC5YNMIvw==
X-CSE-MsgGUID: J9fMD7oVR1uPuB+oZoAjuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13340446"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13340446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 21:28:24 -0700
X-CSE-ConnectionGUID: 0/ZUuWfvR7qEdHtbyIv6RQ==
X-CSE-MsgGUID: ehlieuwQQxmSfolO3L8mGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36153670"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 May 2024 21:28:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCXOi-000Eo1-3B;
	Thu, 30 May 2024 04:28:16 +0000
Date: Thu, 30 May 2024 12:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
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
Subject: Re: [PATCH v2 07/11] pinctrl: imx: Convert to use func member
Message-ID: <202405301147.XaijPkPT-lkp@intel.com>
References: <20240528194951.1489887-8-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528194951.1489887-8-andy.shevchenko@gmail.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-berlin-Make-use-of-struct-pinfunction/20240529-035554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240528194951.1489887-8-andy.shevchenko%40gmail.com
patch subject: [PATCH v2 07/11] pinctrl: imx: Convert to use func member
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20240530/202405301147.XaijPkPT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301147.XaijPkPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301147.XaijPkPT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_functions':
>> drivers/pinctrl/freescale/pinctrl-imx.c:603:52: error: 'struct function_desc' has no member named 'ngroups'
     603 |         group_names = devm_kcalloc(ipctl->dev, func->ngroups, sizeof(*func->func.groups),
         |                                                    ^~


vim +603 drivers/pinctrl/freescale/pinctrl-imx.c

   577	
   578	static int imx_pinctrl_parse_functions(struct device_node *np,
   579					       struct imx_pinctrl *ipctl,
   580					       u32 index)
   581	{
   582		struct pinctrl_dev *pctl = ipctl->pctl;
   583		struct device_node *child;
   584		struct function_desc *func;
   585		struct group_desc *grp;
   586		const char **group_names;
   587		u32 i;
   588	
   589		dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
   590	
   591		func = pinmux_generic_get_function(pctl, index);
   592		if (!func)
   593			return -EINVAL;
   594	
   595		/* Initialise function */
   596		func->func.name = np->name;
   597		func->func.ngroups = of_get_child_count(np);
   598		if (func->func.ngroups == 0) {
   599			dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
   600			return -EINVAL;
   601		}
   602	
 > 603		group_names = devm_kcalloc(ipctl->dev, func->ngroups, sizeof(*func->func.groups),
   604					   GFP_KERNEL);
   605		if (!group_names)
   606			return -ENOMEM;
   607		i = 0;
   608		for_each_child_of_node(np, child)
   609			group_names[i++] = child->name;
   610		func->func.groups = group_names;
   611	
   612		i = 0;
   613		for_each_child_of_node(np, child) {
   614			grp = devm_kzalloc(ipctl->dev, sizeof(*grp), GFP_KERNEL);
   615			if (!grp) {
   616				of_node_put(child);
   617				return -ENOMEM;
   618			}
   619	
   620			mutex_lock(&ipctl->mutex);
   621			radix_tree_insert(&pctl->pin_group_tree,
   622					  ipctl->group_index++, grp);
   623			mutex_unlock(&ipctl->mutex);
   624	
   625			imx_pinctrl_parse_groups(child, grp, ipctl, i++);
   626		}
   627	
   628		return 0;
   629	}
   630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

