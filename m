Return-Path: <linux-mips+bounces-13397-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCRLNfsQq2kRZwEAu9opvQ
	(envelope-from <linux-mips+bounces-13397-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 18:38:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36920226533
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 18:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 215123067583
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2026 17:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D493ECBDA;
	Fri,  6 Mar 2026 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TR9A1LQF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABAD35AC03;
	Fri,  6 Mar 2026 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818233; cv=none; b=A3q699jNtWrX3wVcpn5urPYTrkvxFraal8TnDjVLrUaQ2w5gwZeNYGOY6UEAbRS6MkRGRN8yVQ92QI97h6Q7bgBRnEi+kBSsjbNSNbKjx/ghUSABuaZ0ARgqKyI9EyeyFLQAfD9XvRPTIvCvdcN9ahSQZvg17JBxAiBlJKCWX2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818233; c=relaxed/simple;
	bh=8VmuFnYbiOKgaR+BBAUnY6HUkEujulh2Twpm6HK6CSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DblmVhaPwqGaYbvcaTJexbldGUFIC7LZGRGp9weGb6VGXmTrUWG4dfIfPimH2HuFKedUA9m3NQ7xdzvpMt+eqIhTEuKxd4FO66mtmUaOQvAVHGzxARTglIOb7mXzDu3oCUdNapNrprk94eDIxc4LpOUEw14SmpLLMSLMvDZKvAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TR9A1LQF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772818232; x=1804354232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8VmuFnYbiOKgaR+BBAUnY6HUkEujulh2Twpm6HK6CSU=;
  b=TR9A1LQFCB7FJdOsC/QlqG1tp9S3imY7FgXorPbA/TAErCNXmG8vm2UY
   Ix+Ll1Wghw4pG/WYOVHShBso6SAhs2Z20tDpz8MvgM8QCPa1uTpGawGB8
   X9+L0waSJGhXkwZ99c0K3vaj9dyhzi5BfIMp0i0E21JoexM3bnq9s+xyD
   lULbp4q25pOtlu30yxwhAv8GNsytFtFreYN2ZeqQggmFmK7+0JV+cXpa1
   OTC6zaeIIUk2GONPAj63oaI6PP9SYhYtC87Qd3dgiG6A8w7VI7f+80lhY
   CsuvPYGhhmGKlUbs9WmeRKmtqG3ssqssh1ISsVK6W3UR8ndC8zLIHGH4J
   g==;
X-CSE-ConnectionGUID: Rxhue+gHTwWMtUCeQT8oig==
X-CSE-MsgGUID: oef6U4QAQImISudFb1opsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="76536359"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="76536359"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 09:30:32 -0800
X-CSE-ConnectionGUID: 0bx+XxIITUy/ALxxQyoj5Q==
X-CSE-MsgGUID: qc/tcyJERO+MUV1m2NxX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="218305101"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2026 09:30:26 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyZ0H-00000000197-44lO;
	Fri, 06 Mar 2026 17:30:21 +0000
Date: Sat, 7 Mar 2026 01:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, naseefkm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, cjd@cjdns.fr,
	tsbogend@alpha.franken.de, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
	vkoul@kernel.org, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <202603070131.ufbXMWzw-lkp@intel.com>
References: <20260303190948.694783-7-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303190948.694783-7-cjd@cjdns.fr>
X-Rspamd-Queue-Id: 36920226533
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,baylibre.com,kernel.org,cjdns.fr,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13397-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Caleb,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3fa5e5702a82d259897bd7e209469bc06368bf31]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/dt-bindings-clock-reset-Add-econet-EN751221-bindings/20260304-031451
base:   3fa5e5702a82d259897bd7e209469bc06368bf31
patch link:    https://lore.kernel.org/r/20260303190948.694783-7-cjd%40cjdns.fr
patch subject: [PATCH 6/8] PCI: mediatek: Add support for EcoNet EN7528 SoC
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603070131.ufbXMWzw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070131.ufbXMWzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070131.ufbXMWzw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pcie_retrain_link" [drivers/pci/controller/pcie-mediatek.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

