Return-Path: <linux-mips+bounces-6930-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 436049EB115
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 13:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D739216AF78
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 12:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B2F1A76BC;
	Tue, 10 Dec 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEGMHE8N"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0071A76B6;
	Tue, 10 Dec 2024 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834567; cv=none; b=g2gA4qz0mERJ2MVllFs3uYnfr1d0GwGZmeG4yp399cvuyCtPoSOVvkYPACEClqh4ff63n1oLcqYNjS+25BL7hBU+PKmRUUu7ZBAvCPhSUNbMD1VvKJedGGFM0jfVB7BrXsYy7L5hzJT4NDG+gO7h14I0xRXFwoExDyzjFGCXnXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834567; c=relaxed/simple;
	bh=2XWkD/yfjEhuZbsTfBejcrrLVZU1NcZkJQDTuM2rIMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOF3YNdVfbUu4QacI8+9a1wPuL3ad+DhvcjKBsiKj219XVzdW33zGswqfvHH02SLSydhxC1kFUJNT9HqL31uXqbrR6Kzk2GiOLNDtrzbIMEuTYHoq0u206+BB4f9sLSC328z51q0gwPG+1PK3pQ/EYnlvRmBXZNT53u+z1SpjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEGMHE8N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733834566; x=1765370566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2XWkD/yfjEhuZbsTfBejcrrLVZU1NcZkJQDTuM2rIMc=;
  b=TEGMHE8Nkzj8JesDi2kzRP5L0DOsX/rolAtv8j8MBnlX9LZ6wv4ATNoB
   VJnuMDwlxMrOPrxhXY6a0LgI54tTH2QsYNY5B3s6tmpoX6Y2H+hwA/R4b
   2nesEHhzhHGrVHLH/e2mnSvjt1XYrfbZOQYva5XCuHcm3XRlhZOqiLNnN
   pI5w6omgDEayJK4rjhm57eZXf5bjK6Mu4b4rFB8eoCUMrN0+JNIRZ/I/7
   TACX9R7l0gGnsSL4AzBy+elRVcOaTsWRElSPpcDwZ4C/8BuaqejDLLvOY
   RnP5XXzW2nVnhij5Rq+qqJ98YrMbTmdys0tzapkEU4j/8vz+svuXOL2lb
   w==;
X-CSE-ConnectionGUID: 6zLH929YRdyL39hDOSKkug==
X-CSE-MsgGUID: YNR8bQLmSZWkuQ7w7voVpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45557333"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45557333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:42:45 -0800
X-CSE-ConnectionGUID: PNJK2U7TRI6GrhJMzjBjFw==
X-CSE-MsgGUID: 1gEgitiCTumWExA1EmlaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95741297"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2024 04:42:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKzZT-0005Xl-2l;
	Tue, 10 Dec 2024 12:42:35 +0000
Date: Tue, 10 Dec 2024 20:41:53 +0800
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
Subject: Re: [PATCH mm-unstable 11/17] mm: sh: Introduce arch_mmap_hint()
Message-ID: <202412102044.uIAN0clk-lkp@intel.com>
References: <20241210024119.2488608-12-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210024119.2488608-12-kaleshsingh@google.com>

Hi Kalesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-Introduce-generic_mmap_hint/20241210-104424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241210024119.2488608-12-kaleshsingh%40google.com
patch subject: [PATCH mm-unstable 11/17] mm: sh: Introduce arch_mmap_hint()
config: sh-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412102044.uIAN0clk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102044.uIAN0clk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102044.uIAN0clk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/mm/mmap.c: In function 'arch_get_unmapped_area':
>> arch/sh/mm/mmap.c:79:32: warning: unused variable 'vma' [-Wunused-variable]
      79 |         struct vm_area_struct *vma;
         |                                ^~~
>> arch/sh/mm/mmap.c:78:27: warning: unused variable 'mm' [-Wunused-variable]
      78 |         struct mm_struct *mm = current->mm;
         |                           ^~
   arch/sh/mm/mmap.c: In function 'arch_get_unmapped_area_topdown':
   arch/sh/mm/mmap.c:117:32: warning: unused variable 'vma' [-Wunused-variable]
     117 |         struct vm_area_struct *vma;
         |                                ^~~


vim +/vma +79 arch/sh/mm/mmap.c

2261b9c7c2357a0 Kalesh Singh      2024-12-09   73  
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   74  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
25d4054cc97484f Mark Brown        2024-09-04   75  	unsigned long len, unsigned long pgoff, unsigned long flags,
25d4054cc97484f Mark Brown        2024-09-04   76  	vm_flags_t vm_flags)
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   77  {
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  @78  	struct mm_struct *mm = current->mm;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  @79  	struct vm_area_struct *vma;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   80  	int do_colour_align;
b80fa3cbb78c0fb Rick Edgecombe    2024-03-25   81  	struct vm_unmapped_area_info info = {};
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   82  
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   83  	if (flags & MAP_FIXED) {
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   84  		/* We do not accept a shared mapping if it would violate
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   85  		 * cache aliasing constraints.
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   86  		 */
e77414e0aad6a1b Al Viro           2009-12-05   87  		if ((flags & MAP_SHARED) &&
e77414e0aad6a1b Al Viro           2009-12-05   88  		    ((addr - (pgoff << PAGE_SHIFT)) & shm_align_mask))
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   89  			return -EINVAL;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   90  		return addr;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   91  	}
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   92  
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   93  	if (unlikely(len > TASK_SIZE))
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   94  		return -ENOMEM;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   95  
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   96  	do_colour_align = 0;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   97  	if (filp || (flags & MAP_SHARED))
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   98  		do_colour_align = 1;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   99  
2261b9c7c2357a0 Kalesh Singh      2024-12-09  100  	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
2261b9c7c2357a0 Kalesh Singh      2024-12-09  101  	if (addr)
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  102  		return addr;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  103  
b4265f12340f809 Michel Lespinasse 2012-12-11  104  	info.length = len;
b4265f12340f809 Michel Lespinasse 2012-12-11  105  	info.low_limit = TASK_UNMAPPED_BASE;
b4265f12340f809 Michel Lespinasse 2012-12-11  106  	info.high_limit = TASK_SIZE;
b4265f12340f809 Michel Lespinasse 2012-12-11  107  	info.align_mask = do_colour_align ? (PAGE_MASK & shm_align_mask) : 0;
b4265f12340f809 Michel Lespinasse 2012-12-11  108  	info.align_offset = pgoff << PAGE_SHIFT;
b4265f12340f809 Michel Lespinasse 2012-12-11  109  	return vm_unmapped_area(&info);
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  110  }
ee1acbfabd5270b Paul Mundt        2009-05-07  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

