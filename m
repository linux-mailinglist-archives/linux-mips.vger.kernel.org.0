Return-Path: <linux-mips+bounces-12537-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A65CD30F1
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 15:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E4D6300DCD1
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 14:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672712C1598;
	Sat, 20 Dec 2025 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjDup0Jo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB72BE7D2;
	Sat, 20 Dec 2025 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241317; cv=none; b=HUMOTJ2Wse217U+Ikn68WSKVx6dlBCIjBaIryWZ+KLUpyTyQG4eb4dk2tpyqNzJHhstLkAem9LzdZEBaICWQOWNBCTvxRzdcQAtu0WKFgFx8sEjpQPy5H1URuA/Fdxt5t5FyHMf1xj6kGnXeSUCXGThnPwtZ3ZHR6oVsqfxEAFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241317; c=relaxed/simple;
	bh=GsZe3oYDGQQQdCIWN2VonPdTj7WIfct+WPUTYIxdLoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBYU7cLKj7TA3+sDWcG28l+V99yuRVxtr1uLZAkLTic0vHb6cfAwghbyA07UPf0IgAkOf1EFYZWpSFkrJKpdO4IJmpE3WI2yDhC89YCeN1dejdKe2PsRUyoddg7cKjoMPZvWVzOuPThBOUrxhBHQ4jYBVnbVshGxQf/SPLxSMUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjDup0Jo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241315; x=1797777315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GsZe3oYDGQQQdCIWN2VonPdTj7WIfct+WPUTYIxdLoo=;
  b=gjDup0JoCNn8cgVde1fg+HRVwkSbF77dVjtU6bodbOicImQK/mx4dsru
   GKRH46deQy2OJTkjuv3oEJzJ3eZ7oZdOKzTqaoJ+xSDVF0srVTXRBRYk1
   Wfv63pQMjPIsI/1t0NgWwMZA1wqMEM/oIjzTtEXr08n/mSHwIxjkbIQ87
   XvfeiAPL2SiWRP5QN6bxoiKUR6C/tvrTcTHEtXsx9OK+KdE3bYpagPots
   YdRGLxsKnGQ3OUFaFjuOgVE8bnnBlDl9R40JQ9VJnT+Oz7DDL+A/eAVAD
   APx8Yy5X3R+ne4WCqOQgJqOc9lQh0bRoYGAGWpZij/El9sbKqNmGR/1tq
   w==;
X-CSE-ConnectionGUID: +NdrpYCzQbC8nvIqcvGe6A==
X-CSE-MsgGUID: 1m7p9f0tSyGDbR90wtY/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93650042"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93650042"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:11 -0800
X-CSE-ConnectionGUID: NyNwaJ+vTy2l5No14hj0xg==
X-CSE-MsgGUID: bt6upZJbQYeISeMZTtOfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199023541"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004eD-05w0;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Subject: Re: [PATCH 05/13] pinctrl: eyeq5: Use match data
Message-ID: <202512202142.StvDXvbg-lkp@intel.com>
References: <20251217-eyeq6lplus-v1-5-e9cdbd3af4c2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217-eyeq6lplus-v1-5-e9cdbd3af4c2@bootlin.com>

Hi Benoît,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Beno-t-Monin/dt-bindings-mips-Add-Mobileye-EyeQ6Lplus-SoC/20251217-214926
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251217-eyeq6lplus-v1-5-e9cdbd3af4c2%40bootlin.com
patch subject: [PATCH 05/13] pinctrl: eyeq5: Use match data
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251220/202512202142.StvDXvbg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202142.StvDXvbg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202142.StvDXvbg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-eyeq5.c: In function 'eq5p_pinconf_set':
>> drivers/pinctrl/pinctrl-eyeq5.c:533:13: warning: 'offset' is used uninitialized [-Wuninitialized]
     533 |         u32 val = BIT(offset);
         |             ^~~
   drivers/pinctrl/pinctrl-eyeq5.c:532:22: note: 'offset' was declared here
     532 |         unsigned int offset;
         |                      ^~~~~~


vim +/offset +533 drivers/pinctrl/pinctrl-eyeq5.c

41795aa1f56a6e Théo Lebrun  2024-07-30  524  
41795aa1f56a6e Théo Lebrun  2024-07-30  525  static int eq5p_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
41795aa1f56a6e Théo Lebrun  2024-07-30  526  			    unsigned long *configs, unsigned int num_configs)
41795aa1f56a6e Théo Lebrun  2024-07-30  527  {
41795aa1f56a6e Théo Lebrun  2024-07-30  528  	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
41795aa1f56a6e Théo Lebrun  2024-07-30  529  	const char *pin_name = pctldev->desc->pins[pin].name;
41795aa1f56a6e Théo Lebrun  2024-07-30  530  	struct device *dev = pctldev->dev;
e3ba56038b97ee Benoît Monin 2025-12-17  531  	const struct eq5p_bank *bank;
e3ba56038b97ee Benoît Monin 2025-12-17  532  	unsigned int offset;
41795aa1f56a6e Théo Lebrun  2024-07-30 @533  	u32 val = BIT(offset);
41795aa1f56a6e Théo Lebrun  2024-07-30  534  	unsigned int i;
e3ba56038b97ee Benoît Monin 2025-12-17  535  	int ret;
e3ba56038b97ee Benoît Monin 2025-12-17  536  
e3ba56038b97ee Benoît Monin 2025-12-17  537  	ret = eq5p_pin_to_bank_offset(pctrl, pin, &bank, &offset);
e3ba56038b97ee Benoît Monin 2025-12-17  538  	if (ret)
e3ba56038b97ee Benoît Monin 2025-12-17  539  		return ret;
41795aa1f56a6e Théo Lebrun  2024-07-30  540  
41795aa1f56a6e Théo Lebrun  2024-07-30  541  	for (i = 0; i < num_configs; i++) {
41795aa1f56a6e Théo Lebrun  2024-07-30  542  		enum pin_config_param param = pinconf_to_config_param(configs[i]);
41795aa1f56a6e Théo Lebrun  2024-07-30  543  		u32 arg = pinconf_to_config_argument(configs[i]);
41795aa1f56a6e Théo Lebrun  2024-07-30  544  
41795aa1f56a6e Théo Lebrun  2024-07-30  545  		switch (param) {
41795aa1f56a6e Théo Lebrun  2024-07-30  546  		case PIN_CONFIG_BIAS_DISABLE:
41795aa1f56a6e Théo Lebrun  2024-07-30  547  			dev_dbg(dev, "pin=%s bias_disable\n", pin_name);
41795aa1f56a6e Théo Lebrun  2024-07-30  548  
41795aa1f56a6e Théo Lebrun  2024-07-30  549  			eq5p_update_bits(pctrl, bank, EQ5P_PD, val, 0);
41795aa1f56a6e Théo Lebrun  2024-07-30  550  			eq5p_update_bits(pctrl, bank, EQ5P_PU, val, 0);
41795aa1f56a6e Théo Lebrun  2024-07-30  551  			break;
41795aa1f56a6e Théo Lebrun  2024-07-30  552  
41795aa1f56a6e Théo Lebrun  2024-07-30  553  		case PIN_CONFIG_BIAS_PULL_DOWN:
41795aa1f56a6e Théo Lebrun  2024-07-30  554  			dev_dbg(dev, "pin=%s bias_pull_down arg=%u\n",
41795aa1f56a6e Théo Lebrun  2024-07-30  555  				pin_name, arg);
41795aa1f56a6e Théo Lebrun  2024-07-30  556  
41795aa1f56a6e Théo Lebrun  2024-07-30  557  			if (arg == 0) /* cannot connect to GND */
41795aa1f56a6e Théo Lebrun  2024-07-30  558  				return -ENOTSUPP;
41795aa1f56a6e Théo Lebrun  2024-07-30  559  
41795aa1f56a6e Théo Lebrun  2024-07-30  560  			eq5p_update_bits(pctrl, bank, EQ5P_PD, val, val);
41795aa1f56a6e Théo Lebrun  2024-07-30  561  			eq5p_update_bits(pctrl, bank, EQ5P_PU, val, 0);
41795aa1f56a6e Théo Lebrun  2024-07-30  562  			break;
41795aa1f56a6e Théo Lebrun  2024-07-30  563  
41795aa1f56a6e Théo Lebrun  2024-07-30  564  		case PIN_CONFIG_BIAS_PULL_UP:
41795aa1f56a6e Théo Lebrun  2024-07-30  565  			dev_dbg(dev, "pin=%s bias_pull_up arg=%u\n",
41795aa1f56a6e Théo Lebrun  2024-07-30  566  				pin_name, arg);
41795aa1f56a6e Théo Lebrun  2024-07-30  567  
41795aa1f56a6e Théo Lebrun  2024-07-30  568  			if (arg == 0) /* cannot connect to VDD */
41795aa1f56a6e Théo Lebrun  2024-07-30  569  				return -ENOTSUPP;
41795aa1f56a6e Théo Lebrun  2024-07-30  570  
41795aa1f56a6e Théo Lebrun  2024-07-30  571  			eq5p_update_bits(pctrl, bank, EQ5P_PD, val, 0);
41795aa1f56a6e Théo Lebrun  2024-07-30  572  			eq5p_update_bits(pctrl, bank, EQ5P_PU, val, val);
41795aa1f56a6e Théo Lebrun  2024-07-30  573  			break;
41795aa1f56a6e Théo Lebrun  2024-07-30  574  
41795aa1f56a6e Théo Lebrun  2024-07-30  575  		case PIN_CONFIG_DRIVE_STRENGTH:
41795aa1f56a6e Théo Lebrun  2024-07-30  576  			dev_dbg(dev, "pin=%s drive_strength arg=%u\n",
41795aa1f56a6e Théo Lebrun  2024-07-30  577  				pin_name, arg);
41795aa1f56a6e Théo Lebrun  2024-07-30  578  
41795aa1f56a6e Théo Lebrun  2024-07-30  579  			eq5p_pinconf_set_drive_strength(pctldev, pin, arg);
41795aa1f56a6e Théo Lebrun  2024-07-30  580  			break;
41795aa1f56a6e Théo Lebrun  2024-07-30  581  
41795aa1f56a6e Théo Lebrun  2024-07-30  582  		default:
41795aa1f56a6e Théo Lebrun  2024-07-30  583  			dev_err(dev, "Unsupported pinconf %u\n", param);
41795aa1f56a6e Théo Lebrun  2024-07-30  584  			return -ENOTSUPP;
41795aa1f56a6e Théo Lebrun  2024-07-30  585  		}
41795aa1f56a6e Théo Lebrun  2024-07-30  586  	}
41795aa1f56a6e Théo Lebrun  2024-07-30  587  
41795aa1f56a6e Théo Lebrun  2024-07-30  588  	return 0;
41795aa1f56a6e Théo Lebrun  2024-07-30  589  }
41795aa1f56a6e Théo Lebrun  2024-07-30  590  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

