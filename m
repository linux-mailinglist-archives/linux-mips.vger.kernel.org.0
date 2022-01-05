Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A4D485654
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jan 2022 16:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241754AbiAEP6t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jan 2022 10:58:49 -0500
Received: from mga02.intel.com ([134.134.136.20]:17711 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231191AbiAEP6r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 Jan 2022 10:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641398327; x=1672934327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spgCJrfjnvGFe0LO5iKxDl3fVWdzHePOc+gOClMAeKo=;
  b=Ilg+RxubpZ5ntZULR3hfO52zn4kAzqSKN0K+SeBc0NjH/wJmqpDJzUzb
   YSpfExX+xJsrnmvZVHoqOmiDfSAvxXkAqrWg4FokeRL8QUGaCI9l550Df
   ylWnuaGetdSNlG2mFO3oN/RnzkfyuWZgIDDr63yOgiCooIXadKmatOLUG
   XR5Ac/oBn3QkdUV8dqGnL7clLNZOcMRE/CGaja1oMhIioN9oypB3rsqH7
   Dj1ca8VlX7FMPzHWdHWQgQTYWqxd+krTDkhVTBG5B2/ajnGPkV357+gMO
   K6UXGqGT6qGzhtQ2rukyDw9TCt0Lumgy7yc62IB6GMsGfIt3eMj3dAeqF
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="229788061"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="229788061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 07:58:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="526581912"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jan 2022 07:58:45 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n58gX-000GpO-3O; Wed, 05 Jan 2022 15:58:45 +0000
Date:   Wed, 5 Jan 2022 23:58:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     kbuild-all@lists.01.org, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 47/47] sound/pci/ca0106/ca0106.h:62: warning:
 "PTR" redefined
Message-ID: <202201052319.tzeOWazm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   f0b7ddbd794bdffade370f22bb7a774002208ef4
commit: f0b7ddbd794bdffade370f22bb7a774002208ef4 [47/47] MIPS: retire "asm/llsc.h"
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20220105/202201052319.tzeOWazm-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=f0b7ddbd794bdffade370f22bb7a774002208ef4
        git remote add mips-linux https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
        git fetch --no-tags mips-linux mips-next
        git checkout f0b7ddbd794bdffade370f22bb7a774002208ef4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash lib/ sound/pci/ca0106/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from sound/pci/ca0106/ca0106_main.c:156:
>> sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined
      62 | #define PTR                     0x00            /* Indexed register set pointer register        */
         | 
   In file included from arch/mips/include/asm/bitops.h:19,
                    from include/linux/bitops.h:33,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/mips/include/asm/div64.h:89,
                    from include/linux/math.h:5,
                    from include/linux/delay.h:22,
                    from sound/pci/ca0106/ca0106_main.c:124:
   arch/mips/include/asm/asm.h:288: note: this is the location of the previous definition
     288 | #define PTR             .word
         | 
--
>> lib/test_printf.c:247: warning: "PTR" redefined
     247 | #define PTR ((void *)0x456789ab)
         | 
   In file included from arch/mips/include/asm/bitops.h:19,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:13,
                    from lib/test_printf.c:9:
   arch/mips/include/asm/asm.h:288: note: this is the location of the previous definition
     288 | #define PTR             .word
         | 


vim +/PTR +62 sound/pci/ca0106/ca0106.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  61  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @62  #define PTR			0x00		/* Indexed register set pointer register	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  						/* NOTE: The CHANNELNUM and ADDRESS words can	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  64  						/* be modified independently of each other.	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  						/* CNL[1:0], ADDR[27:16]                        */
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  

:::::: The code at line 62 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
