Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8624EFF21
	for <lists+linux-mips@lfdr.de>; Sat,  2 Apr 2022 08:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbiDBGVf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 Apr 2022 02:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiDBGVf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 Apr 2022 02:21:35 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DE1176640
        for <linux-mips@vger.kernel.org>; Fri,  1 Apr 2022 23:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648880383; x=1680416383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UjSUeGlmXpsPEBh2KODuoUS52M/OuM8DBv+VanaakrM=;
  b=AG2y8JSHxIJEt5iKc7GwH0fG0nLNxyFrioPgJODGz4qTsY0mrQJWwlj4
   DLCg+TMlQreOpDdtStR21ohR7g5YO9QutQRIIvKxkobKpu993A1SF/Asi
   cQ7f24wTH14miRxtFNyEA6xOXjoXxjsC7X8h554GafXlWFqHVatMHxhJk
   RVmoTQgpU2QUYj6FioZQBwXSvK8TYENAM298yy3JxhAr30KK+JOiJ85Zz
   wl9jzlF5/ic0K+dBvFoITjMSsJzETralxMafcQeNxlomtjLKiUzFa5Le4
   aUFfpmpWntktg8qRJ40sjh2z3UN6ilhZmFkX+Np0rZm6LiMArhc/Bp4qs
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="346719616"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="346719616"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 23:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="504401639"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 01 Apr 2022 23:19:38 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1naX6n-0001mu-JV;
        Sat, 02 Apr 2022 06:19:37 +0000
Date:   Sat, 2 Apr 2022 14:19:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     David Matlack <dmatlack@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kbuild-all@lists.01.org, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 16/23] KVM: x86/mmu: Cache the access bits of shadowed
 translations
Message-ID: <202204021419.Rh6Pgcl9-lkp@intel.com>
References: <20220401175554.1931568-17-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401175554.1931568-17-dmatlack@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi David,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 19164ad08bf668bca4f4bfbaacaa0a47c1b737a6]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Matlack/KVM-Extend-Eager-Page-Splitting-to-the-shadow-MMU/20220402-015911
base:   19164ad08bf668bca4f4bfbaacaa0a47c1b737a6
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20220402/202204021419.Rh6Pgcl9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5f7a06676291033d880081035c2efae13702a0c4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Matlack/KVM-Extend-Eager-Page-Splitting-to-the-shadow-MMU/20220402-015911
        git checkout 5f7a06676291033d880081035c2efae13702a0c4
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from arch/x86/kvm/mmu/mmu.c:18:
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_mmu_page_set_access':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:418:25: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:640:17: note: in expansion of macro 'printk'
     640 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:654:9: note: in expansion of macro 'printk_ratelimited'
     654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:654:28: note: in expansion of macro 'KERN_ERR'
     654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   arch/x86/kvm/mmu/mmu.c:763:17: note: in expansion of macro 'pr_err_ratelimited'
     763 |                 pr_err_ratelimited("access mismatch under direct page %llx "
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:418:25: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:640:17: note: in expansion of macro 'printk'
     640 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:654:9: note: in expansion of macro 'printk_ratelimited'
     654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:654:28: note: in expansion of macro 'KERN_ERR'
     654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   arch/x86/kvm/mmu/mmu.c:763:17: note: in expansion of macro 'pr_err_ratelimited'
     763 |                 pr_err_ratelimited("access mismatch under direct page %llx "
         |                 ^~~~~~~~~~~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
