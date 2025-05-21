Return-Path: <linux-mips+bounces-9048-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6BBABED27
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 09:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 547A93B8AC4
	for <lists+linux-mips@lfdr.de>; Wed, 21 May 2025 07:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B80F1FF7B3;
	Wed, 21 May 2025 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdemV5we"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8009A22B5AB
	for <linux-mips@vger.kernel.org>; Wed, 21 May 2025 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812934; cv=none; b=faNI55X/w4Twhzbh2DUKQX8L4DWNGGFnO8k0y/75vs+ZUdu9QZQHGJ4e/HsoWfotUIgOIBSCGnjFXJyfZkATqvDvntOkmzBQK1/CxMaqDFJ9P0XgdjdFzr6gZuMKGlYH3SKbVjKkVw4QFPVxgf6koxGGESYfrN4KLUWy+n9xcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812934; c=relaxed/simple;
	bh=BgBSXeJVvimE5/HYUqHfTSY1rH0cCJnUKKQcj1P+P/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0KcghjAaWpx75kV51UweCWbf3tEmA9uEDgrHZ2qVzNqjwx3BI9RfjqLItaitWlWlbF/iPOGRzr9dMDJeItW90CLMOBFRlYvV8urtGM5C6YFRdeoMU0rnAyCYIBT6LUYKtsxNSiJxJXMmO2v5pt0RfXLPjuBSLZ6L52k0LG/WQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdemV5we; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747812932; x=1779348932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BgBSXeJVvimE5/HYUqHfTSY1rH0cCJnUKKQcj1P+P/E=;
  b=HdemV5we/2jTxioPWD1pt96IdYZfuoVLioQhxqAy7Vg6f8/vLtB+6N4D
   X5wWu7ZRQ3wnaRkfoJG07ef0yRqfiTVAKPuHQhoEqOyMomiYsCT5RroZm
   Y/bLeERBWkLfgReoJ5xFu/90PrmjivqZak0toDgwPgCi2qpN+vdqwWSf7
   qqbUTg8EQvXzQSo3PLLcSHt9dJiDMnP2BMubadCvGo0sHOiGlhs+K/4ax
   gMIcaH8xAFM9AZfQ0WdFWYrgXAO048ZUtvVY568FC1WPdnEZbqGlhRAhy
   6MvMJQOStbyBphGAVkcgiFdpPp/ZRNNt/PmtFJV+XKrNSKuotDOY/j+qB
   w==;
X-CSE-ConnectionGUID: 0mxhPDz4Rt+bd0xhi03KyA==
X-CSE-MsgGUID: COsB9AbXQCaf1P50Db4/IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52403329"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="52403329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 00:35:31 -0700
X-CSE-ConnectionGUID: Jqm2kfVnTn6Ob/rpwV4NVw==
X-CSE-MsgGUID: rzXRQQfPTXmGK5f1rfZMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144680135"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2025 00:35:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHdz5-000NzU-2H;
	Wed, 21 May 2025 07:35:27 +0000
Date: Wed, 21 May 2025 15:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 16/19] kismet: WARNING: unmet direct
 dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202505211540.RlACNglM-lkp@intel.com>
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
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250521/202505211540.RlACNglM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250521/202505211540.RlACNglM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211540.RlACNglM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
     Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

