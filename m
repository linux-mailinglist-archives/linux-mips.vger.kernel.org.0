Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1EE179A3C
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 21:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387762AbgCDUjE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Mar 2020 15:39:04 -0500
Received: from mga07.intel.com ([134.134.136.100]:5326 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728512AbgCDUjE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Mar 2020 15:39:04 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 12:39:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,515,1574150400"; 
   d="gz'50?scan'50,208,50";a="232735816"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Mar 2020 12:38:58 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j9anB-0005Ty-D4; Thu, 05 Mar 2020 04:38:57 +0800
Date:   Thu, 5 Mar 2020 04:38:41 +0800
From:   kbuild test robot <lkp@intel.com>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v3] MIPS: Replace setup_irq() by request_irq()
Message-ID: <202003050401.dhTosR9T%lkp@intel.com>
References: <20200304005549.5832-1-afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20200304005549.5832-1-afzal.mohd.ma@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi afzal,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on arm-soc/for-next linus/master v5.6-rc4 next-20200304]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/afzal-mohammed/MIPS-Replace-setup_irq-by-request_irq/20200304-150513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f5ae2ea6347a308cfe91f53b53682ce635497d0d
config: mips-rm200_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 5.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=5.5.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/sni/reset.c:11:0:
>> arch/mips/include/asm/sni.h:242:8: error: unknown type name 'irqreturn_t'
    extern irqreturn_t sni_isa_irq_handler(int dummy, void *p);
           ^
--
   arch/mips/sni/time.c: In function 'sni_a20r_timer_setup':
>> arch/mips/sni/time.c:65:30: error: 'a20r_irqaction' undeclared (first use in this function)
     struct irqaction *action = &a20r_irqaction;
                                 ^
   arch/mips/sni/time.c:65:30: note: each undeclared identifier is reported only once for each function it appears in

vim +/irqreturn_t +242 arch/mips/include/asm/sni.h

   239	
   240	/* common irq stuff */
   241	extern void (*sni_hwint)(void);
 > 242	extern irqreturn_t sni_isa_irq_handler(int dummy, void *p);
   243	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--45Z9DzgjV8m4Oswq
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
FfEtAQA=

--45Z9DzgjV8m4Oswq--
