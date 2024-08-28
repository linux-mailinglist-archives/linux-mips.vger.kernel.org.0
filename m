Return-Path: <linux-mips+bounces-5173-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA82963477
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 00:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 531B01F241EF
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 22:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0231AB51F;
	Wed, 28 Aug 2024 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiKJsJp6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B916190C;
	Wed, 28 Aug 2024 22:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724883335; cv=none; b=eVNDHU/yzfmnsfzw4Nn+j20mPo5YnCkshSCjOyt9CkRUPO4DN0dBhPPcJIkK3Jud1L91JzyNdi7erhMyeJ4OJaTk7bZqpRwvHO2mTzPyL/VqTQ55cheLG5xC/GyizcDccMcvE5mAgFM1/6+w3wYjNNmpkxSdEYkZpdoyE3aXuGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724883335; c=relaxed/simple;
	bh=rhqvIMABotZZ07l2KzLn+tbXSguZ4R0dYkRhD/WDKKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEN3XQ+GJGcO2HYDlOgw4LNBc0v3/QeEQGXG7Php1RRTpAbT2NMUdNvbQ/TZNwXPrAAxjps73fe4LcUnhz+z4lK3v2pSFFpPRb496NG4s1Euqj7/E6dPoCgTbqjp697q6zdWYkgQkOr4Tko3aQMwLhzQ57JYyr1o9lFfScBfm8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiKJsJp6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724883334; x=1756419334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rhqvIMABotZZ07l2KzLn+tbXSguZ4R0dYkRhD/WDKKo=;
  b=XiKJsJp60wGTS/QXw7eR6bmtLyProeMeFMgYZEXE3LyVjAlfKX1ZQ7wd
   aNA9/9HpXMNrmwCw9VWtwxDGkG7nRmXMCJ7hgdBZ4JQEuqZ0XCDAirsnc
   7gpEFwMY/44iHp827isH7ycmD9tmHHxnIS00YZjix9mnRhCuuGg3GWkkY
   lAvzj5BvQkVs/3i7GmiBDsoCDW/te0/w0LA6YFG/VWDoyZzSEfVVClnB9
   NrdQlbSJu07+fmfjN565A8UpyD9YUJkJ+5QL9DpHTAHVEjov9PFsjz+f6
   wbCFJv4sdgGFF1x+TCby23NYgypC6LEM3dB2/Qv+kToIpCLmvN90AbfuU
   A==;
X-CSE-ConnectionGUID: r1NtxDE3QvOpK1oRtbdrWw==
X-CSE-MsgGUID: 2ooDiRhiR/Kl0CjGR9+kdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27321119"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="27321119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 15:15:34 -0700
X-CSE-ConnectionGUID: cQDv9/OjQS+GuMl4oxhG9Q==
X-CSE-MsgGUID: bib1Qo2iS7y9iPYIH5Wg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="67516172"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Aug 2024 15:15:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjQwr-000LPC-2I;
	Wed, 28 Aug 2024 22:15:29 +0000
Date: Thu, 29 Aug 2024 06:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven J . Hill" <Steven.Hill@imgtec.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
Message-ID: <202408290501.kTATRaBZ-lkp@intel.com>
References: <20240824144133.1464835-1-bjorn@mork.no>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240824144133.1464835-1-bjorn@mork.no>

Hi Bjørn,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc5 next-20240828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-Mork/MIPS-fw-Gracefully-handle-unknown-firmware-protocols/20240826-170643
base:   linus/master
patch link:    https://lore.kernel.org/r/20240824144133.1464835-1-bjorn%40mork.no
patch subject: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
config: mips-bigsur_defconfig (https://download.01.org/0day-ci/archive/20240829/202408290501.kTATRaBZ-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290501.kTATRaBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290501.kTATRaBZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/fw/lib/cmdline.c: In function 'fw_init_cmdline':
>> arch/mips/fw/lib/cmdline.c:25:65: error: 'CKSEG2' undeclared (first use in this function); did you mean 'CKSEG0'?
      25 |         if (fw_arg0 >= CKSEG0 || fw_arg1 < CKSEG0 || fw_arg1 >= CKSEG2) {
         |                                                                 ^~~~~~
         |                                                                 CKSEG0
   arch/mips/fw/lib/cmdline.c:25:65: note: each undeclared identifier is reported only once for each function it appears in


vim +25 arch/mips/fw/lib/cmdline.c

    18	
    19	#ifndef CONFIG_HAVE_PLAT_FW_INIT_CMDLINE
    20	void __init fw_init_cmdline(void)
    21	{
    22		int i;
    23	
    24		/* Validate command line parameters. */
  > 25		if (fw_arg0 >= CKSEG0 || fw_arg1 < CKSEG0 || fw_arg1 >= CKSEG2) {
    26			fw_argc = 0;
    27			_fw_argv = NULL;
    28		} else {
    29			fw_argc = (fw_arg0 & 0x0000ffff);
    30			_fw_argv = (int *)fw_arg1;
    31		}
    32	
    33		/* Validate environment pointer. */
    34		if (fw_arg2 < CKSEG0 || fw_arg2 >= CKSEG2)
    35			_fw_envp = NULL;
    36		else
    37			_fw_envp = (int *)fw_arg2;
    38	
    39		for (i = 1; i < fw_argc; i++) {
    40			strlcat(arcs_cmdline, fw_argv(i), COMMAND_LINE_SIZE);
    41			if (i < (fw_argc - 1))
    42				strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
    43		}
    44	}
    45	#endif
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

