Return-Path: <linux-mips+bounces-13072-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJnuIWZffmliXwIAu9opvQ
	(envelope-from <linux-mips+bounces-13072-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 21:00:38 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A0C3C52
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 21:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF5E03005155
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 20:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1AD36C0D8;
	Sat, 31 Jan 2026 20:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9v+SoCl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90236B05A;
	Sat, 31 Jan 2026 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889632; cv=none; b=TtlItXxjv/W7xZ5OKXlqDB8mIgIRyA+0p23wkMMwkcmrStiD8A32ZTklv8339Y+AHrATpBYoWaco5vSdJG5NcPqhSCwwbtKuYp0VirtkPogQKe6X+LHU4FyPn+S+FDTCA5nEg0uLyoYnTwCu/RKjL825eFYof2IH8LmyOzVOqko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889632; c=relaxed/simple;
	bh=ol8unZvcrs7b+wmiigLrZH4qV/mo3pcnEn/GyeKvrcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2frZmdrd/mfyFeDn1HeEk2pyMM2oIOOOnCymOwUzSXt4A22AL4QqK991+XJkO8t5mA3yVzBu6CVafW/LwHxkyhTED5IxYNT3CIQHPT7aB6Ztz+YCaeg2UJuaZYWcZqaqMKtzKRi89peB3srlnuw8yFOd7pE1vyzMsU+m24O0o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9v+SoCl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769889630; x=1801425630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ol8unZvcrs7b+wmiigLrZH4qV/mo3pcnEn/GyeKvrcM=;
  b=i9v+SoCl//grpbPL2SSUCOacQweUHrK1apqsBOOvQqB/M5MWwOYUzJYn
   XkteVwy6t9S4Sckpm7u1/evVK/2yK5qbvmqpYlMRaldyPzoQGpigOt8tm
   95R9cEW6N7n7wi6GT0mSs6LWzv2h9MR+TUM2ReS8l4nLoCHSf67KUI2no
   mqyrUAd+xGJ2bk0U+jcTV0TdtKcOiQ6dNzHwfK11WvKYNms5XO75g50+t
   Fn/LrvjiIX5dzmimKYZzVoEtqp40MHDCK9dA4ri6YOsRLdr5mYEBMs82h
   Cr6TyXbZZBuH9qxnF9uYTJQyzDM16paZiMKKlnPhBcJFHVb+3K7xdNvm7
   Q==;
X-CSE-ConnectionGUID: 4/9eM2JdSr24KjHHDiEWbA==
X-CSE-MsgGUID: gSwZjoDPSLqLfi4l5YltnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="70826726"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="70826726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 12:00:30 -0800
X-CSE-ConnectionGUID: nIvlyUqkT6uIvcCzCmQ7JQ==
X-CSE-MsgGUID: 3i8mf/KwT0GpNNEu8pLXpA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2026 12:00:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmH8q-00000000eLE-1Y4x;
	Sat, 31 Jan 2026 20:00:24 +0000
Date: Sun, 1 Feb 2026 03:59:36 +0800
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
Message-ID: <202602010337.D6tyoDtw-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13072-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: AF5A0C3C52
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
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260201/202602010337.D6tyoDtw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010337.D6tyoDtw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010337.D6tyoDtw-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: pch_lpc_of_init+0xa8 (section: .text) -> pch_lpc_init (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

