Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32D91D8C00
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 02:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgESAD4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 20:03:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:15755 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgESAD4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 20:03:56 -0400
IronPort-SDR: 4o71gxn0tT7ufF7vpLhgmViSMEgrvunI93WOiA44dcTdLXeCDzUOvKIBfeAdVasaJ6xHThRanl
 OlChzB1FEWLg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 17:03:54 -0700
IronPort-SDR: CQuTQnTz1+JwZWX2d1WkK2LuNRFRtRrXIRjWbZwMShXh3iry4az0PRxvklanrFBM1Vj0az/yVj
 2Cp/II0Msphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,408,1583222400"; 
   d="scan'208";a="439413806"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga005.jf.intel.com with ESMTP; 18 May 2020 17:03:52 -0700
Date:   Mon, 18 May 2020 17:03:52 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200519000352.GF3025231@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
 <20200518042932.GA59205@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518042932.GA59205@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 17, 2020 at 09:29:32PM -0700, Guenter Roeck wrote:
> On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:
> > On Sat, May 16, 2020 at 03:33:06PM -0700, Guenter Roeck wrote:
> > > On Thu, May 07, 2020 at 07:59:55AM -0700, ira.weiny@intel.com wrote:
> > > > From: Ira Weiny <ira.weiny@intel.com>
> > > > 
> > > > Every single architecture (including !CONFIG_HIGHMEM) calls...
> > > > 
> > > > 	pagefault_enable();
> > > > 	preempt_enable();
> > > > 
> > > > ... before returning from __kunmap_atomic().  Lift this code into the
> > > > kunmap_atomic() macro.
> > > > 
> > > > While we are at it rename __kunmap_atomic() to kunmap_atomic_high() to
> > > > be consistent.
> > > > 
> > > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > > 
> > > This patch results in:
> > > 
> > > Starting init: /bin/sh exists but couldn't execute it (error -14)
> > > 
> > > when trying to boot microblazeel:petalogix-ml605 in qemu.
> > 
> > Thanks for the report.  I'm not readily seeing the issue.
> > 
> > Do you have a kernel config?  Specifically is CONFIG_HIGHMEM set?
> > 
> See below. Yes, CONFIG_HIGHMEM is set.
> 
> The scripts used to build and boot the image are at:
> 
> https://github.com/groeck/linux-build-test/tree/master/rootfs/microblazeel

Despite finding the obvious error earlier today I've still been trying to get
this to work.

I had to make some slight modifications to use the 0-day cross compile build
and my local qemu build.  But those were pretty minor modifications.  I'm
running on x86_64 host.

With those slight mods to the scripts I get the following error even without my
patch set on 5.7-rc4.  I have 1 cpu pegged at 100% while it is running...  Is
there anything I can do to get more debug output?  Perhaps I just need to let
it run longer?

Thanks,
Ira

16:46:54 > ../linux-build-test/rootfs/microblazeel/run-qemu-microblazeel.sh 
Build reference: v5.7-rc4-2-g7c2411d7fb6a

Building microblaze:petalogix-s3adsp1800:qemu_microblazeel_defconfig ...
running ................ failed (silent)
------------
qemu log:
qemu-system-microblazeel: terminating on signal 15 from pid 3277686 (/bin/bash)
------------
Building microblaze:petalogix-ml605:qemu_microblazeel_ml605_defconfig ...
running ................ failed (silent)
------------
qemu log:
qemu-system-microblazeel: terminating on signal 15 from pid 3277686 (/bin/bash)
------------

<env changes>
16:47:23 > git di
diff --git a/rootfs/microblazeel/run-qemu-microblazeel.sh b/rootfs/microblazeel/run-qemu-microblazeel.sh
index 68d4de39ab50..0d6a4f85308f 100755
--- a/rootfs/microblazeel/run-qemu-microblazeel.sh
+++ b/rootfs/microblazeel/run-qemu-microblazeel.sh
@@ -3,7 +3,8 @@
 dir=$(cd $(dirname $0); pwd)
 . ${dir}/../scripts/common.sh
 
-QEMU=${QEMU:-${QEMU_BIN}/qemu-system-microblazeel}
+#QEMU=${QEMU:-${QEMU_BIN}/qemu-system-microblazeel}
+QEMU=/home/iweiny/dev/qemu/microblazeel-softmmu/qemu-system-microblazeel
 PREFIX=microblazeel-linux-
 ARCH=microblaze
 PATH_MICROBLAZE=/opt/kernel/microblazeel/gcc-4.9.1/usr/bin
diff --git a/rootfs/scripts/common.sh b/rootfs/scripts/common.sh
index 8fa6a9be2b2f..c4550a27beaa 100644
--- a/rootfs/scripts/common.sh
+++ b/rootfs/scripts/common.sh
@@ -1,5 +1,9 @@
 #!/bin/bash
 
+# Set up make.cross
+export COMPILER_INSTALL_PATH=$HOME/0day
+export GCC_VERSION=6.5.0
+
 # Set the following variable to true to skip DC395/AM53C97 build tests
 __skip_dc395=0
 
@@ -569,7 +573,7 @@ doclean()
        then
                git clean -x -d -f -q
        else
-               make ARCH=${ARCH} mrproper >/dev/null 2>&1
+               make.cross ARCH=${ARCH} mrproper >/dev/null 2>&1
        fi
 }
 
@@ -669,7 +673,7 @@ __setup_config()
        cp ${__progdir}/${defconfig} arch/${arch}/configs
     fi
 
-    if ! make ARCH=${ARCH} CROSS_COMPILE=${PREFIX} ${defconfig} >/dev/null 2>&1 </dev/null; then
+    if ! make.cross ARCH=${ARCH} ${defconfig} >/dev/null 2>&1 </dev/null; then
        return 2
     fi
 
@@ -687,7 +691,7 @@ __setup_config()
        if [[ "${rel}" = "v3.16" ]]; then
            target="oldconfig"
        fi
-       if ! make ARCH=${ARCH} CROSS_COMPILE=${PREFIX} ${target} >/dev/null 2>&1 </dev/null; then
+       if ! make.cross ARCH=${ARCH} ${target} >/dev/null 2>&1 </dev/null; then
            return 1
        fi
     fi
@@ -1038,7 +1042,7 @@ dosetup()
     rootfs="$(setup_rootfs ${dynamic} ${rootfs})"
     __common_fixups "${fixups}" "${rootfs}"
 
-    make -j${maxload} ARCH=${ARCH} CROSS_COMPILE=${PREFIX} ${EXTRAS} </dev/null >/dev/null 2>${logfile}
+    make.cross -j${maxload} ARCH=${ARCH} ${EXTRAS} </dev/null >/dev/null 2>${logfile}
     rv=$?
     if [ ${rv} -ne 0 ]
     then

</env changes>
