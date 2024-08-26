Return-Path: <linux-mips+bounces-5107-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AF095F2EB
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 15:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868971F254DD
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 13:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B871862B9;
	Mon, 26 Aug 2024 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfGAmYpz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F9216F908;
	Mon, 26 Aug 2024 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679011; cv=none; b=qddf7pHOEz0Mo4I/LMlzilu3BU69/D01GDyL66rAnYfmQE0DCl18HlSnhUjbybKbn1H1WIX+zncXxrPWmUv+HaFV1TAHExz7DNwD7kEkEgsr75jr618NEMqPsIeU1LgqCVE+aGhfQ4lqGYtIBsJQDnTANdb2wKg44q+O7B/Yz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679011; c=relaxed/simple;
	bh=OxXpckFXtIJTdXwF/Ee9oAJfvLLzhU8EiUb05bfLQBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lycwD45611NuRG0g891PMefZijOs7xFE8LPNzIuEgOkiygZDmpONHOKkLxwjGPtX78B2PcYnLHIpSf0flJwfCS1wicMKfL0d20miI4gARK8FxNiUC5A9T8H9lJHXiKLic0uOFVbWXnOfkJ2FRcOu1dD2ZIO5JE8BJsAL4IcZulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfGAmYpz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724679009; x=1756215009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OxXpckFXtIJTdXwF/Ee9oAJfvLLzhU8EiUb05bfLQBk=;
  b=JfGAmYpzkKUUpq+hAQ0NK1XAC7jxx6j1GERf3hLAG4UbPpZl4CCPy1L8
   rBRuKoTYE7/MmLtwLtXnLXEYKcFPydZja62Rwuw7ll+I8taO0l6u/Acpp
   YPHyyz5r1gWIkGmguy+jJkorT49UieNgIgv+jv1n/9MB5vm9JU4l4hpd1
   dXuUqHmCLhLtiQMxCTwhXFwue4LXsCXExSHkvU/e0pJKRVarcr3GE9H1y
   cTcyRLJ0LScr9dRib7hXlUYjhtvFliu9V92cFG4uMMjoi6CwRQZYmhQPC
   BNXAspqeCkcdVFq5rIGtIu/bbLT+3eYhqVP4WkR/8PtiQw/SNbdW2Xmbr
   w==;
X-CSE-ConnectionGUID: hQWtRvDJQ3u9BaGQqYrmLQ==
X-CSE-MsgGUID: W8WvAbUPTaSYVMeJhm0OtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22694687"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="22694687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:30:08 -0700
X-CSE-ConnectionGUID: XKSV/4w3RmG7+vfqrR8lVQ==
X-CSE-MsgGUID: lxTYJ1q7TpuCyxQCeC7IQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="67407584"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2024 06:30:06 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siZnH-000H7h-34;
	Mon, 26 Aug 2024 13:30:03 +0000
Date: Mon, 26 Aug 2024 21:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Wu Bo <bo.wu@vivo.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org,
	Wu Bo <wubo.oduw@gmail.com>
Subject: Re: [PATCH] bus: bt1-axi: change to use devm_clk_get_enabled()
 helpers
Message-ID: <202408262130.M4pjxUDC-lkp@intel.com>
References: <20240823023103.1984437-1-bo.wu@vivo.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823023103.1984437-1-bo.wu@vivo.com>

Hi Wu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wu-Bo/bus-bt1-axi-change-to-use-devm_clk_get_enabled-helpers/20240826-122401
base:   linus/master
patch link:    https://lore.kernel.org/r/20240823023103.1984437-1-bo.wu%40vivo.com
patch subject: [PATCH] bus: bt1-axi: change to use devm_clk_get_enabled() helpers
config: arm-randconfig-002-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262130.M4pjxUDC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262130.M4pjxUDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262130.M4pjxUDC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/bt1-axi.c:158:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     158 |         return ret;
         |                ^~~
   drivers/bus/bt1-axi.c:151:9: note: initialize the variable 'ret' to silence this warning
     151 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +158 drivers/bus/bt1-axi.c

63cb77136e04ff Serge Semin 2020-05-26  148  
63cb77136e04ff Serge Semin 2020-05-26  149  static int bt1_axi_request_clk(struct bt1_axi *axi)
63cb77136e04ff Serge Semin 2020-05-26  150  {
63cb77136e04ff Serge Semin 2020-05-26  151  	int ret;
63cb77136e04ff Serge Semin 2020-05-26  152  
6ac8fb96f7dfde Wu Bo       2024-08-22  153  	axi->aclk = devm_clk_get_enabled(axi->dev, "aclk");
5e93207e962a6d Serge Semin 2022-06-10  154  	if (IS_ERR(axi->aclk))
5e93207e962a6d Serge Semin 2022-06-10  155  		return dev_err_probe(axi->dev, PTR_ERR(axi->aclk),
5e93207e962a6d Serge Semin 2022-06-10  156  				     "Couldn't get AXI Interconnect clock\n");
63cb77136e04ff Serge Semin 2020-05-26  157  
7f57416f2aebe6 Serge Semin 2020-05-28 @158  	return ret;
63cb77136e04ff Serge Semin 2020-05-26  159  }
63cb77136e04ff Serge Semin 2020-05-26  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

