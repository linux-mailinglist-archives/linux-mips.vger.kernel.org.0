Return-Path: <linux-mips+bounces-6931-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB889EB3D4
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 15:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BB5E168F5E
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 14:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5158719ADA2;
	Tue, 10 Dec 2024 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMBXDUUG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF491A01D4;
	Tue, 10 Dec 2024 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842013; cv=none; b=CQnvWpGRlp9h/vytl/UyYjX4MvZDEwVSD6pyyWtzZSJQsXH6vVE6orPdfZkfteKAJV1uBWLXgTB5VjbTh/V4UA39vtwUQLSEQsiV683tjGOGa/2QpjcLOAS1HDE/c/xBnQXyPcsZWlqNde0uGfK6kIXaQqAPifvpBP55Vr1WfKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842013; c=relaxed/simple;
	bh=zCVNItat7KAJZV5fl9f36Lgf1b8uI6A148fvl6A9d1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIQlRovUrBssmg5AKhVn0/kJ9CDBUD954osPu09/95kg9VnM5pwluvJBqx9vjoCNtxxgJtlPAtnBQTmSRM5sv7IIa+crRelMWZ5fUiYtZ4O5kTP5fpy2lfIu7Ig/a4j9XjJLlwCFqdBJfoDtZh0FP7VOXwGNjAsBYnu+5lXlLck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMBXDUUG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733842011; x=1765378011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zCVNItat7KAJZV5fl9f36Lgf1b8uI6A148fvl6A9d1U=;
  b=jMBXDUUG6jvk5mjQ9QLt5TzA/RqQZHdQlx5/L81Ho9I+IQKG/Qevpjpy
   xj2CYHGrgx1TFG5m6Yr+TmgxkRWKLd8V3oYBSUUaOcUFfonaYVqwOylcj
   S5AIZ0atueN2mpd1GjIaecAxl79dVXMUalcFVZynmHRt/FlsTbeAu39BM
   V8pON+vIS9yiT4bNHZxqEM7PYQEGnOUh9Lj7RieSaN3M4LPS/04L5CjXO
   yq4mM0rSnVQOumMgBaho909SzrvE1DecmKqRqyR/x0NZl+jTg0D/AzP/0
   844fUkP/umWM1ARZu1w+wd1d/NT/XqXlU8dj/ZQC6DVcJuQDUqlPD0j9U
   A==;
X-CSE-ConnectionGUID: DtB3lTw0R+2z3qbR5SV8Jw==
X-CSE-MsgGUID: UeHO0CSNQr6nTHfThLPygQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33918606"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33918606"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:46:51 -0800
X-CSE-ConnectionGUID: orNCXP5iSfORxIjovRQcxQ==
X-CSE-MsgGUID: EY2JQNdjRmSVxx2IfMJGSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95264822"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 06:46:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL1VZ-0005fr-2R;
	Tue, 10 Dec 2024 14:46:41 +0000
Date: Tue, 10 Dec 2024 22:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
	vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com,
	david@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux@armlinux.org.uk,
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, davem@davemloft.net,
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
	leitao@debian.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH mm-unstable 13/17] mm: sparc64: Introduce arch_mmap_hint()
Message-ID: <202412102215.fF34r4Uo-lkp@intel.com>
References: <20241210024119.2488608-14-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210024119.2488608-14-kaleshsingh@google.com>

Hi Kalesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-Introduce-generic_mmap_hint/20241210-104424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241210024119.2488608-14-kaleshsingh%40google.com
patch subject: [PATCH mm-unstable 13/17] mm: sparc64: Introduce arch_mmap_hint()
config: sparc-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241210/202412102215.fF34r4Uo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102215.fF34r4Uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102215.fF34r4Uo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/kernel/sys_sparc_64.c: In function 'arch_get_unmapped_area':
>> arch/sparc/kernel/sys_sparc_64.c:135:13: warning: variable 'do_color_align' set but not used [-Wunused-but-set-variable]
     135 |         int do_color_align;
         |             ^~~~~~~~~~~~~~


vim +/do_color_align +135 arch/sparc/kernel/sys_sparc_64.c

aef9ae8eac4116 arch/sparc/kernel/sys_sparc_64.c Kalesh Singh      2024-12-09  131  
25d4054cc97484 arch/sparc/kernel/sys_sparc_64.c Mark Brown        2024-09-04  132  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  133  {
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  134  	unsigned long task_size = TASK_SIZE;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16 @135  	int do_color_align;
b80fa3cbb78c0f arch/sparc/kernel/sys_sparc_64.c Rick Edgecombe    2024-03-25  136  	struct vm_unmapped_area_info info = {};
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  137  	bool file_hugepage = false;
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  138  
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  139  	if (filp && is_file_hugepages(filp))
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  140  		file_hugepage = true;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  141  
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  142  	if (flags & MAP_FIXED) {
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  143  		/* We do not accept a shared mapping if it would violate
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  144  		 * cache aliasing constraints.
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  145  		 */
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  146  		if (!file_hugepage && (flags & MAP_SHARED) &&
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  147  		    ((addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1)))
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  148  			return -EINVAL;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  149  		return addr;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  150  	}
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  151  
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  152  	if (test_thread_flag(TIF_32BIT))
d61e16df940e02 arch/sparc64/kernel/sys_sparc.c  David S. Miller   2006-03-17  153  		task_size = STACK_TOP32;
a91690ddd05ab0 arch/sparc64/kernel/sys_sparc.c  David S. Miller   2006-03-17  154  	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  155  		return -ENOMEM;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  156  
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  157  	do_color_align = 0;
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  158  	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  159  		do_color_align = 1;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  160  
aef9ae8eac4116 arch/sparc/kernel/sys_sparc_64.c Kalesh Singh      2024-12-09  161  	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
aef9ae8eac4116 arch/sparc/kernel/sys_sparc_64.c Kalesh Singh      2024-12-09  162  	if (addr)
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  163  		return addr;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  164  
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  165  	info.length = len;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  166  	info.low_limit = TASK_UNMAPPED_BASE;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  167  	info.high_limit = min(task_size, VA_EXCLUDE_START);
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  168  	info.align_mask = get_align_mask(filp, flags);
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  169  	if (!file_hugepage)
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  170  		info.align_offset = pgoff << PAGE_SHIFT;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  171  	addr = vm_unmapped_area(&info);
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  172  
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  173  	if ((addr & ~PAGE_MASK) && task_size > VA_EXCLUDE_END) {
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  174  		VM_BUG_ON(addr != -ENOMEM);
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  175  		info.low_limit = VA_EXCLUDE_END;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  176  		info.high_limit = task_size;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  177  		addr = vm_unmapped_area(&info);
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  178  	}
1363c3cd8603a9 arch/sparc64/kernel/sys_sparc.c  Wolfgang Wander   2005-06-21  179  
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  180  	return addr;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  181  }
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

