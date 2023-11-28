Return-Path: <linux-mips+bounces-333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 262CF7FC9F8
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 23:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570F21C20EEC
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 22:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23BB44375;
	Tue, 28 Nov 2023 22:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgcZk9sW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3649F19B0;
	Tue, 28 Nov 2023 14:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701211932; x=1732747932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9i5I5hBO0MDHcxfVOfR0DRKjy4DDVCbRXS2YCjyFpTU=;
  b=SgcZk9sWKnu5HotPuxjFJ/KZ8EO2MVGOurcMJIuW6lDnzsAX9OBRQhmW
   y1lPdnGAsV6VzEhRJAMJ3RSAnBXfgVUHTHisQ2ZKM02twniyDodeuCZvS
   174Vdxx7/y6vgHsCrI8S+gHHLys+yahc+whfJ48FdP+JKymP9uS22UpD/
   jvuYHT2UVIU/IHxKykZWtQs7FrWPoHIVZU6chdQbPeECJP73dg7R75SKI
   N5QfRBTH+ZO8nhA1XNmTs+roVuybf5aehyPxiSQ5tWusDfpFhCAxSX/Yl
   77XzWHFh0a13aeLAzPWOB1GbvKxE5jLXw/Ok8Iggbnx7NsqQsS7WR1qjx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392797314"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="392797314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 14:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797718500"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797718500"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2023 14:52:10 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r86w3-0008EK-2a;
	Tue, 28 Nov 2023 22:52:07 +0000
Date: Wed, 29 Nov 2023 06:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Wujie Duan <wjduan@linx-info.com>, tsbogend@alpha.franken.de
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wujie Duan <wjduan@linx-info.com>
Subject: Re: [PATCH] Mark symbols static where possible for mips/kernel
Message-ID: <202311290441.DFJp34W7-lkp@intel.com>
References: <20231128071225.801111-1-wjduan@linx-info.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128071225.801111-1-wjduan@linx-info.com>

Hi Wujie,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wujie-Duan/Mark-symbols-static-where-possible-for-mips-kernel/20231128-152256
base:   linus/master
patch link:    https://lore.kernel.org/r/20231128071225.801111-1-wjduan%40linx-info.com
patch subject: [PATCH] Mark symbols static where possible for mips/kernel
config: mips-fuloong2e_defconfig (https://download.01.org/0day-ci/archive/20231129/202311290441.DFJp34W7-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311290441.DFJp34W7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290441.DFJp34W7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: arch/mips/kernel/signal_n32.o: in function `setup_rt_frame_n32':
>> signal_n32.c:(.text+0xe0): undefined reference to `setup_sigcontext'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

