Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1028D488FBF
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jan 2022 06:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238712AbiAJF0O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Jan 2022 00:26:14 -0500
Received: from mga09.intel.com ([134.134.136.24]:54947 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230407AbiAJF0L (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 10 Jan 2022 00:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641792371; x=1673328371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04XjPUd5I3uXPOgfXYDSNAJy4WDjy994czFo7/wAE5E=;
  b=Yu05MZP3h/8AuoW4ri4ov+MR6XqVllqlGVn/UseY0XGw8cwqaUVn8TeW
   1j0MlFQljWUXWWd3BV+5Z8+9Rm1ZueB3zfOT+YuUEvEOPCnfbu9IJJBSB
   d3cDkoMGzPTxTNokLxQgyN47nZ8ESGM/aFva8i/oT+Vnqr6P60tvbHDXd
   +BmnEOO0kRK8qkRLh9VXKFP+qD8Q38Nas4iyUBEqvav/SframwMnooi5Q
   w81rnobUv+0wT4vLptwxIy73T0wI6k9aR4kK+tGpgbYJ3l9sqpfyC0dF9
   xI3Jk/t3VW84MMO/DibHYi6vQjdSxfGStF+S+YhdMbwj/UYth5UeL1eEe
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="242952666"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="242952666"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 21:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="575709888"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jan 2022 21:26:07 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n6nC3-0002Ge-72; Mon, 10 Jan 2022 05:26:07 +0000
Date:   Mon, 10 Jan 2022 13:25:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 47/54] sound/pci/ca0106/ca0106.h:62:9:
 warning: 'PTR' macro redefined
Message-ID: <202201101327.4yt7VUmE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   c5c7440fe7f74645940d5c9e2c49cd7efb706a4f
commit: f0b7ddbd794bdffade370f22bb7a774002208ef4 [47/54] MIPS: retire "asm/llsc.h"
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20220110/202201101327.4yt7VUmE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=f0b7ddbd794bdffade370f22bb7a774002208ef4
        git remote add mips-linux https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
        git fetch --no-tags mips-linux mips-next
        git checkout f0b7ddbd794bdffade370f22bb7a774002208ef4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/pci/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from sound/pci/ca0106/ca0106_main.c:156:
>> sound/pci/ca0106/ca0106.h:62:9: warning: 'PTR' macro redefined [-Wmacro-redefined]
   #define PTR                     0x00            /* Indexed register set pointer register        */
           ^
   arch/mips/include/asm/asm.h:288:9: note: previous definition is here
   #define PTR             .word
           ^
   1 warning generated.


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
