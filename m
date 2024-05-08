Return-Path: <linux-mips+bounces-3160-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2438BF53E
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 06:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5819B1C2353E
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 04:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE1D14F68;
	Wed,  8 May 2024 04:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G96ozzc3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B20C156CF;
	Wed,  8 May 2024 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715142369; cv=none; b=a+l9KmQ1LbmdWVO5zipDmuqV57a1JO6YWfvomH3FnrdvYsdDDsijkF81fne9O70iKgEPReAbSvsPimg3p2JJ8Awo/pKGpUyrltBMk+zPWdAutzA9xIJmBcar6y/asgdJrqhCBGSqmtNvI8yxfFois6EwtyJloVLRU+s6DDkmPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715142369; c=relaxed/simple;
	bh=QZIT7iQDBVJZTbQ9mGbt5vp/UJcHZPLU5z2XdRKjGrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sd/McSe7FZs5acwlYXE3bjz3srC/CdZFjwS80eJYuGXg6KI8HYFC/Qb+cvj1MvAuU9qASU796TtSjLLagILbejthqtFtNtN6GrmgGWxXrBDUkSEQFfK0TLG2sjrHRo+qkUAvLOZ91Af5VKTG/6t4XhcDviy7v7lC4mjgjz2awyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G96ozzc3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715142368; x=1746678368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QZIT7iQDBVJZTbQ9mGbt5vp/UJcHZPLU5z2XdRKjGrw=;
  b=G96ozzc36j6JLdMfW+fG/N8+awyvefV4um7+I1Yy12k+2SN3G5xlUVUv
   jKDJ1OqWhKENjqYIgnDAN3zFaMU6tylkvIEz9NKwF5N45bvkqCH5ukDQe
   5YEXX/7MxPI07A0kwxTr6lQ0h2JFfMpfEr9oi+HNPh3OaW+ofCfkQz4Lj
   BIpLhYwJTrG0iJneE8imSTvb5bwFbj+B7kpssB4OMT9U8clWB+Ypt6oFH
   3ADuPKXe2sEuUH78aTox9WNStjkINFLfCdBZgTTd+lZMbP24Fd9Wj/n7A
   9NEOgZBIA9Yn1LMTU7XTTk5FOKtujhV1U8ko6g702zTHK4lv5kU4z07fd
   g==;
X-CSE-ConnectionGUID: MdY/CfEXSUiyhFYziWU1sA==
X-CSE-MsgGUID: wSUcUITGSP2ShWOIWDgAUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22387668"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="22387668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 21:26:07 -0700
X-CSE-ConnectionGUID: morbseBlRrybiPCWXseYsA==
X-CSE-MsgGUID: 6nyQMITXRUWHTlT9DnC3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="59599436"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2024 21:26:04 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4YsU-0002xq-18;
	Wed, 08 May 2024 04:26:02 +0000
Date: Wed, 8 May 2024 12:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 5/5] MIPS: cm: Probe GCR address from DeviceTree
Message-ID: <202405081255.MGvZEuuc-lkp@intel.com>
References: <20240507-cm_probe-v1-5-11dbfd598f3c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507-cm_probe-v1-5-11dbfd598f3c@flygoat.com>

Hi Jiaxun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2b84edefcad14934796fad37b16512b6a2ca467e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiaxun-Yang/MIPS-generic-Do-__dt_setup_arch-in-prom_init/20240507-170413
base:   2b84edefcad14934796fad37b16512b6a2ca467e
patch link:    https://lore.kernel.org/r/20240507-cm_probe-v1-5-11dbfd598f3c%40flygoat.com
patch subject: [PATCH 5/5] MIPS: cm: Probe GCR address from DeviceTree
config: mips-randconfig-r113-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081255.MGvZEuuc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce: (https://download.01.org/0day-ci/archive/20240508/202405081255.MGvZEuuc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081255.MGvZEuuc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/mips/kernel/mips-cm.c:193:13: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
     193 |         if (*cmgcr == OF_BAD_ADDR)
         |             ~~~~~~ ^  ~~~~~~~~~~~
   1 warning generated.


vim +193 arch/mips/kernel/mips-cm.c

   183	
   184	static int __init mips_cm_fdt_scan(unsigned long node, const char *uname,
   185			int depth, void *data)
   186	{
   187		unsigned long *cmgcr = data;
   188	
   189		if (!of_flat_dt_is_compatible(node, "mti,mips-cm"))
   190			return 0;
   191	
   192		*cmgcr = of_flat_dt_translate_address(node);
 > 193		if (*cmgcr == OF_BAD_ADDR)
   194			*cmgcr = 0;
   195	
   196		return 0;
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

