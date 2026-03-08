Return-Path: <linux-mips+bounces-13408-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uYDdFbTZrGlovQEAu9opvQ
	(envelope-from <linux-mips+bounces-13408-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 08 Mar 2026 03:06:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA822E4F4
	for <lists+linux-mips@lfdr.de>; Sun, 08 Mar 2026 03:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3D2C300F10D
	for <lists+linux-mips@lfdr.de>; Sun,  8 Mar 2026 02:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1EE35BDB2;
	Sun,  8 Mar 2026 02:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mgbz/zYw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1A35B634;
	Sun,  8 Mar 2026 02:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772935599; cv=none; b=HPE/XRI0nukzFG+wL+4T5qQ6kOiRJxI/UFweUi1XDbwzOdNCrJLG3UK0aOW9VqqPo4Pa9ki3xgoOdYRReyeNEtZT4Kb/Ktn+wRSuoCmXzcCc8j7ahKU9ZZ9LNE4k/KgNMIFUO8OL2ZP0r7gLGD23zX005WeCpweh63DXJ0sd0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772935599; c=relaxed/simple;
	bh=giRqWk7pth7htlw/kAdoXs6485fAk6mlmbYY0pBBaUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoJFplEewIeQIhqtVhjba/xB2WQkgn8ThhsEEqk++F8/3R7YrYJBGy1AZKAYj79D17TJJqjijGvd+BP2/EEPRCE18MWh+l8T/jIhB0ZShBmofAIEHQkUWTUL0vE9aNGsQfdnYHY6q+e8Tth0BHDFjDXmgvhGvKv9i4GI+AYW0Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mgbz/zYw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772935598; x=1804471598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=giRqWk7pth7htlw/kAdoXs6485fAk6mlmbYY0pBBaUw=;
  b=Mgbz/zYwqrnMwHY7d7rWuTMv5HN7w8mSPYQ9PRZshOyJdJtSsmvLL6Hy
   TZ/oi2Zn97NuiWqfaTEQbCP39fjEI2zNK1olWomzHfKrjErWPsYHU8EwE
   kuCPwN8TPJ4SXHy/YGktKVX8IR56FzIKOuxPPaZ8C/XdRsbwH2SWNprkV
   XQDJ6Ererybs42qcvBQFLX4IcQs38LESsm87ZZBIf2MDSUQgj2A1rh1qk
   JUBm+7OjeLyWBnKRLJ0B2XzO/Sa7P0AgCKTQcJiqpfqvaGZb3jEEt90+A
   YUA1jSa6fyg6/xZrycB7p8OD1k3RUgVGN1a6gdYHlK7kenEHXJw3E74P5
   g==;
X-CSE-ConnectionGUID: 66OGJ/3nRSqI52iscPptiw==
X-CSE-MsgGUID: 0/Hht5UiRN64iQfXOqnBrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73698370"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="73698370"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 18:06:37 -0800
X-CSE-ConnectionGUID: twwjLKsfTKSm1fOsBzm82g==
X-CSE-MsgGUID: hS775U/kQ0qL7q9xVa9jcA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Mar 2026 18:06:34 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz3XL-000000002pF-1fGw;
	Sun, 08 Mar 2026 02:06:31 +0000
Date: Sun, 8 Mar 2026 10:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v8] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Message-ID: <202603081000.NLJ9u8XA-lkp@intel.com>
References: <20260306-macb-phy-v8-1-b5c48ee61402@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306-macb-phy-v8-1-b5c48ee61402@bootlin.com>
X-Rspamd-Queue-Id: AABA822E4F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13408-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.952];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Théo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260305]
[cannot apply to linus/master v7.0-rc2 v7.0-rc1 v6.19 v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Th-o-Lebrun/phy-Add-driver-for-EyeQ5-Ethernet-PHY-wrapper/20260307-034032
base:   next-20260305
patch link:    https://lore.kernel.org/r/20260306-macb-phy-v8-1-b5c48ee61402%40bootlin.com
patch subject: [PATCH v8] phy: Add driver for EyeQ5 Ethernet PHY wrapper
config: arm-randconfig-r111-20260308 (https://download.01.org/0day-ci/archive/20260308/202603081000.NLJ9u8XA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081000.NLJ9u8XA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081000.NLJ9u8XA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-eyeq5-eth.c:246:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@
   drivers/phy/phy-eyeq5-eth.c:246:14: sparse:     expected void [noderef] __iomem *base
   drivers/phy/phy-eyeq5-eth.c:246:14: sparse:     got void *

vim +246 drivers/phy/phy-eyeq5-eth.c

   230	
   231	static int eq5_phy_probe(struct auxiliary_device *adev,
   232				 const struct auxiliary_device_id *id)
   233	{
   234		struct device *dev = &adev->dev;
   235		struct phy_provider *provider;
   236		struct eq5_phy_private *priv;
   237		void __iomem *base;
   238		int ret;
   239	
   240		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   241		if (!priv)
   242			return -ENOMEM;
   243	
   244		dev_set_drvdata(dev, priv);
   245	
 > 246		base = dev_get_platdata(dev);
   247	
   248		ret = eq5_phy_probe_phy(dev, priv, 0, base, EQ5_PHY0_GP,
   249					EQ5_PHY0_SGMII, true);
   250		if (ret)
   251			return ret;
   252	
   253		ret = eq5_phy_probe_phy(dev, priv, 1, base, EQ5_PHY1_GP,
   254					EQ5_PHY1_SGMII, false);
   255		if (ret)
   256			return ret;
   257	
   258		provider = devm_of_phy_provider_register(dev, eq5_phy_xlate);
   259		if (IS_ERR(provider))
   260			return dev_err_probe(dev, PTR_ERR(provider),
   261					     "registering provider failed\n");
   262	
   263		return 0;
   264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

