Return-Path: <linux-mips+bounces-9047-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A4ABEBFA
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 08:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D1AE4E1F7F
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 06:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE6217BD3;
	Wed, 21 May 2025 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQujiOX8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1FE219EB
	for <linux-mips@vger.kernel.org>; Wed, 21 May 2025 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809089; cv=none; b=tBLwHLRURXbR9fn4VLObcHwQHSIq1Ny8c4jj1uOSc1CpgUhznB7Juk1sGUGbUBW/aDBiHL0iT7ovEwu2fsk3l+WJxT29+ia1CMDD6Icza99YzMcEosa2tuFFVX9YOlPWk46Rdj81JfQrtyn5DHVeEcXPfGfOwb3o0nxPSZMaZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809089; c=relaxed/simple;
	bh=gKIqUTPAzqATsN00/jM3CEVx85Zp2akccXki8US+XvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEqyLka0nDqtu8UvKaui/Te2MAEwfEgVjSiwQb/75/IlT21bZsA57eX2T2Da1xUwuuQPQihyR0Yv6jW4lWYn1PX0Bqih/YKYiMD/MTFzw/zckGJi1GuAMfsctYwYyVjQO7E5D83DaUs4wkEYrOU420ISKiiKDdyY4o96QySJRx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQujiOX8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747809087; x=1779345087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKIqUTPAzqATsN00/jM3CEVx85Zp2akccXki8US+XvU=;
  b=MQujiOX8RMHXWcPpEDXjY4eaoiUUGMQT2alnDup3i+TjzEVQo/o8aVBC
   KpW/LYdCkCDmrxlg10RSm6ZNHyh8GxmJgICTfh4WbnJKNErHjXwvohT12
   jekXq9hhTu1mW7YWVCtJA6iGpZwskFtHWVLR2arSkQYR41oBAQwnDr5Ly
   FnQqavkSG9QC71Cj4orLzuxlOX4PAFNY7HKuWhsux0sGonRDW4SRzNqVc
   6ILUaxmLr5EStUuBLm4XPr+DLCkBHqQZQGldxDIIk1ZiBMmxs2bsqM6IY
   +OH5Duv0Pxycdg38S9115d3tc1dVogIwlfBsvWEQuRXkvUMLeG637elUt
   Q==;
X-CSE-ConnectionGUID: +kZ/JQPLRhWl+js5TUMQZg==
X-CSE-MsgGUID: 2h+sCl2kS1OImMGjtzfzBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60426578"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60426578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 23:31:27 -0700
X-CSE-ConnectionGUID: gk1WQ6S/T1SEdiRfw5OoiA==
X-CSE-MsgGUID: 7Rv0VKx+RK6u2kyKxKgsYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144908120"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2025 23:31:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHcz4-000NxC-1q;
	Wed, 21 May 2025 06:31:22 +0000
Date: Wed, 21 May 2025 14:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 16/19] kismet: WARNING: unmet direct
 dependencies detected for DEBUG_ZBOOT when selected by ECONET
Message-ID: <202505211451.WRjyf3a9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 [16/19] mips: Add EcoNet MIPS platform support
config: mips-kismet-CONFIG_DEBUG_ZBOOT-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250521/202505211451.WRjyf3a9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250521/202505211451.WRjyf3a9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211451.WRjyf3a9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_ZBOOT when selected by ECONET
   WARNING: unmet direct dependencies detected for DEBUG_ZBOOT
     Depends on [n]: DEBUG_KERNEL [=n] && SYS_SUPPORTS_ZBOOT [=y]
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=y] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

