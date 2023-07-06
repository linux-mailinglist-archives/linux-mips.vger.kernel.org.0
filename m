Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D3974A18D
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jul 2023 17:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbjGFPwJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Jul 2023 11:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbjGFPwF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Jul 2023 11:52:05 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6A8269F
        for <linux-mips@vger.kernel.org>; Thu,  6 Jul 2023 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688658693; x=1720194693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWMkyfakeRwB/SZ6JDQreE3pvO3DpeBVL6rK3NWtM24=;
  b=TQ3SUmG6zMIyMqNaquB1hPePhKEV61v330avx4xr40CNcq2MRTsMwoq4
   277k2Kg6Bjwf5cbaQqhJV+3m2+K1GveLyxAW8ze6hnu742Kt89d5VBmdy
   0fmqxUvTqD0Et18DQPbm9YzKZSSm8tkRbGIh32VBGUPb7kbxe8FXI4/4e
   UXosktINknXb0QVBfiDF58Y65tVodxPYUNa1MqrAL/pZt8qeDz/CFjQU/
   h2zWeEB8ulhy26eOkzS2h1ZJQWLbWXDdJyVvm78mDxwf6Owd9/vSJ6WyM
   W2xZs9DO2zfQVEOI7xQQRKRZXZLlqJt6ksfnmHNphtv+w6E5UzCqRwtIG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="362507729"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="362507729"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 08:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="754805151"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="754805151"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jul 2023 08:50:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qHRFc-0001QM-27;
        Thu, 06 Jul 2023 15:50:36 +0000
Date:   Thu, 6 Jul 2023 23:50:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Huacai Chen <chenhuacai@loongson.cn>
Cc:     oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: [mips-linux:mips-next 61/63] arch/mips/kvm/stats.c:57:44: error:
 invalid type argument of '->' (have 'struct mips_coproc')
Message-ID: <202307062346.qFQwcnAo-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   826eeaf68b03e5b96bdbc11e3e796f8b562bc0e3
commit: e4de2057698636c0ee709e545d19b169d2069fa3 [61/63] MIPS: KVM: Fix NULL pointer dereference
config: mips-randconfig-r003-20230706 (https://download.01.org/0day-ci/archive/20230706/202307062346.qFQwcnAo-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307062346.qFQwcnAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307062346.qFQwcnAo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kvm/stats.c: In function 'kvm_mips_dump_stats':
>> arch/mips/kvm/stats.c:57:44: error: invalid type argument of '->' (have 'struct mips_coproc')
      57 |                         if (vcpu->arch.cop0->stat[i][j])
         |                                            ^~
   In file included from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/mips/kvm/stats.c:12:
   arch/mips/kvm/stats.c:59:57: error: invalid type argument of '->' (have 'struct mips_coproc')
      59 |                                          vcpu->arch.cop0->stat[i][j]);
         |                                                         ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kvm_host.h:814:9: note: in expansion of macro 'pr_info'
     814 |         pr_info("kvm [%i]: " fmt, task_pid_nr(current), ## __VA_ARGS__)
         |         ^~~~~~~
   arch/mips/kvm/stats.c:58:33: note: in expansion of macro 'kvm_info'
      58 |                                 kvm_info("%s[%d]: %lu\n", kvm_cop0_str[i], j,
         |                                 ^~~~~~~~


vim +57 arch/mips/kvm/stats.c

3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  48  
d98403a525fe16 arch/mips/kvm/kvm_mips_stats.c Dengcheng Zhu 2014-06-26  49  void kvm_mips_dump_stats(struct kvm_vcpu *vcpu)
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  50  {
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  51  #ifdef CONFIG_KVM_MIPS_DEBUG_COP0_COUNTERS
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  52  	int i, j;
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  53  
6ad78a5c75c5bc arch/mips/kvm/kvm_mips_stats.c Dengcheng Zhu 2014-06-26  54  	kvm_info("\nKVM VCPU[%d] COP0 Access Profile:\n", vcpu->vcpu_id);
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  55  	for (i = 0; i < N_MIPS_COPROC_REGS; i++) {
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21  56  		for (j = 0; j < N_MIPS_COPROC_SEL; j++) {
3c20ef526253da arch/mips/kvm/kvm_mips_stats.c Sanjay Lal    2012-11-21 @57  			if (vcpu->arch.cop0->stat[i][j])

:::::: The code at line 57 was first introduced by commit
:::::: 3c20ef526253da02348ec45768d5a90813577d88 KVM/MIPS32: COP0 accesses profiling.

:::::: TO: Sanjay Lal <sanjayl@kymasys.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
