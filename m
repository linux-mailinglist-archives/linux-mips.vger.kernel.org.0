Return-Path: <linux-mips+bounces-13084-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKcsDDj6f2m+0wIAu9opvQ
	(envelope-from <linux-mips+bounces-13084-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 02:13:28 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 938DAC7BB7
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 02:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28BA23003EA3
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 01:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A181DF742;
	Mon,  2 Feb 2026 01:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="av2TrAOJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8C61C01;
	Mon,  2 Feb 2026 01:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769994805; cv=none; b=gytyUNccIi6lw3BkK4TPSRDb//YW+mGIdYIDNV2GDKoUQ0rR89w/LYtdNUdytCRqEJrMArQVGWc4uXYNAbuNQO1XHtDb3v5kAcQd1eyXmsNtAo6FgHUZYFjKh0NtniCmMxD9ramVvwLkl5x1+ZyJ8XEsX7/v9TZk9gtCJxScVSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769994805; c=relaxed/simple;
	bh=0FQEYKF3ASkumQEIFc7hjtUJwRVsXd5mf+ZHiuszjMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDG9XuqcUOqdtLB7Xv++0Y/HHyZGehYs8puf/8khAeEuIYjC3/b4bhGBoOnmodn0tFkgpLI/KdrqWwBP6AVdymVTqGg3wDre8YMGOb8JAjz1pBX1TSHPpQJirh3Duysn+GfjA2uYT6CTCH5rcIQmyWhtYkHfSPvollel0sBzz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=av2TrAOJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769994803; x=1801530803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FQEYKF3ASkumQEIFc7hjtUJwRVsXd5mf+ZHiuszjMM=;
  b=av2TrAOJAINXFk6se3Pk4+TKDbameMnRSkQH/JMRMzjMVC5KIL6sK11m
   egg2ziBf67CiSin0wa5GQWjDFLqkjLqRHlRajq1oWGX31rACFx4Sp1CML
   hVXUzGNhB3hLwHTywzLwGGds1YYxaGC9bbO2aTDaQ/MsNJ9Cn+vcbFkpn
   uL30ltaNdP7AMhPL1L8MxuPFtuIc7H9lyoVVybX0DLNvYTHo5P4T3Lv1U
   8sVbAUPiFp233WLNZ7cyZeJ22/mN8GW11oiAN/Qxrqhw48pjIq5Q563aZ
   NJTsep4hZ8Pi4K/vB0jDBuBpg1L+iK0KZiz5fbipdNQkzHNAsQYse9S/V
   g==;
X-CSE-ConnectionGUID: VAhX1BSdSuSjUaO/gqiFuQ==
X-CSE-MsgGUID: eGlKOr8DQGKvdMu4sPnSfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71133640"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="71133640"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 17:13:22 -0800
X-CSE-ConnectionGUID: iPC34twEQFKX2q/tLNnbIA==
X-CSE-MsgGUID: QW50PqJuTDaKzQzoTazkwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209688047"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Feb 2026 17:13:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmiVA-00000000f9s-3qC4;
	Mon, 02 Feb 2026 01:13:16 +0000
Date: Mon, 2 Feb 2026 09:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
Message-ID: <202602020835.BnVM9ELe-lkp@intel.com>
References: <20260131094547.455916-6-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131094547.455916-6-zhengxingda@iscas.ac.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13084-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 938DAC7BB7
X-Rspamd-Action: no action

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.19-rc7 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/genirq-reserve-NR_IRQS_LEGACY-IRQs-in-dynirq-by-default/20260131-175403
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260131094547.455916-6-zhengxingda%40iscas.ac.cn
patch subject: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
config: loongarch-randconfig-001-20260201 (https://download.01.org/0day-ci/archive/20260202/202602020835.BnVM9ELe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020835.BnVM9ELe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020835.BnVM9ELe-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: pch_lpc_of_init+0x7c (section: .text.pch_lpc_of_init) -> pch_lpc_init (section: .init.text)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

