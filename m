Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFCE110E030
	for <lists+linux-mips@lfdr.de>; Sun,  1 Dec 2019 04:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfLADI7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 Nov 2019 22:08:59 -0500
Received: from mga03.intel.com ([134.134.136.65]:51345 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbfLADI7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 Nov 2019 22:08:59 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Nov 2019 19:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,263,1571727600"; 
   d="gz'50?scan'50,208,50";a="212651246"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Nov 2019 19:08:55 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ibFbT-000ImT-21; Sun, 01 Dec 2019 11:08:55 +0800
Date:   Sun, 1 Dec 2019 11:08:10 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     kbuild-all@lists.01.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Maarten ter Huurne <maarten@treewalker.org>,
        mips-creator-ci20-dev@googlegroups.com,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] Mips32 gettimeofday fix
Message-ID: <201912010955.BNDLHh9b%lkp@intel.com>
References: <04b509b4-b1ef-3bcb-433e-8eed5772288f@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d7z3l3uvn5ds3azs"
Content-Disposition: inline
In-Reply-To: <04b509b4-b1ef-3bcb-433e-8eed5772288f@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--d7z3l3uvn5ds3azs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincenzo,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.4 next-20191129]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Vincenzo-Frascino/Mips32-gettimeofday-fix/20191129-022306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a6ed68d6468bd5a3da78a103344ded1435fed57a
config: mips-jmr3927_defconfig (attached as .config)
compiler: mips-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   lib/vdso/gettimeofday.c: In function '__cvdso_gettimeofday':
>> lib/vdso/gettimeofday.c:152:11: error: implicit declaration of function 'gettimeofday_fallback'; did you mean 'clock_gettime32_fallback'? [-Werror=implicit-function-declaration]
       return gettimeofday_fallback(tv, tz);
              ^~~~~~~~~~~~~~~~~~~~~
              clock_gettime32_fallback
   cc1: all warnings being treated as errors

vim +152 lib/vdso/gettimeofday.c

00b26474c2f161 Vincenzo Frascino 2019-06-21  142  
00b26474c2f161 Vincenzo Frascino 2019-06-21  143  static __maybe_unused int
00b26474c2f161 Vincenzo Frascino 2019-06-21  144  __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
00b26474c2f161 Vincenzo Frascino 2019-06-21  145  {
00b26474c2f161 Vincenzo Frascino 2019-06-21  146  	const struct vdso_data *vd = __arch_get_vdso_data();
00b26474c2f161 Vincenzo Frascino 2019-06-21  147  
00b26474c2f161 Vincenzo Frascino 2019-06-21  148  	if (likely(tv != NULL)) {
00b26474c2f161 Vincenzo Frascino 2019-06-21  149  		struct __kernel_timespec ts;
00b26474c2f161 Vincenzo Frascino 2019-06-21  150  
00b26474c2f161 Vincenzo Frascino 2019-06-21  151  		if (do_hres(&vd[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
00b26474c2f161 Vincenzo Frascino 2019-06-21 @152  			return gettimeofday_fallback(tv, tz);
00b26474c2f161 Vincenzo Frascino 2019-06-21  153  
00b26474c2f161 Vincenzo Frascino 2019-06-21  154  		tv->tv_sec = ts.tv_sec;
00b26474c2f161 Vincenzo Frascino 2019-06-21  155  		tv->tv_usec = (u32)ts.tv_nsec / NSEC_PER_USEC;
00b26474c2f161 Vincenzo Frascino 2019-06-21  156  	}
00b26474c2f161 Vincenzo Frascino 2019-06-21  157  
00b26474c2f161 Vincenzo Frascino 2019-06-21  158  	if (unlikely(tz != NULL)) {
00b26474c2f161 Vincenzo Frascino 2019-06-21  159  		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
00b26474c2f161 Vincenzo Frascino 2019-06-21  160  		tz->tz_dsttime = vd[CS_HRES_COARSE].tz_dsttime;
00b26474c2f161 Vincenzo Frascino 2019-06-21  161  	}
00b26474c2f161 Vincenzo Frascino 2019-06-21  162  
00b26474c2f161 Vincenzo Frascino 2019-06-21  163  	return 0;
00b26474c2f161 Vincenzo Frascino 2019-06-21  164  }
00b26474c2f161 Vincenzo Frascino 2019-06-21  165  

:::::: The code at line 152 was first introduced by commit
:::::: 00b26474c2f1613d7ab894c525f775c67c8a9e8f lib/vdso: Provide generic VDSO implementation

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--d7z3l3uvn5ds3azs
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--d7z3l3uvn5ds3azs--
