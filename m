Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0AA104452
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2019 20:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfKTT3K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Nov 2019 14:29:10 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40821 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfKTT3K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Nov 2019 14:29:10 -0500
Received: by mail-wr1-f66.google.com with SMTP id q15so1287938wrw.7
        for <linux-mips@vger.kernel.org>; Wed, 20 Nov 2019 11:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from:cc;
        bh=QxyFP12MhasoDGEo27BmT72GRY9o/OilHUn1uKLS9HU=;
        b=AQ78D3ZRNLMahPB9PLYA3e4sE4N9q+5ChyZl2cDRJqXhp63tI2Grew+i0MSG8cZGGc
         7aL3SQPyLKrfBnwgIX5O3qAM+KVGZeiEBkBZMNG2S7DIS43BIntqeUL4DbMxMALwVaKe
         KsJFdosov8WB73UXKPrgjOcuYjlJWXlSH+D7cy/umVMZeH28IVr4Xh5889Zfcc5U1x5Q
         rpZfEXC91hGXxIuoxg/t7ev+HEWGpJ9B6OokDVu/9oLhMu8mZPkockIRNk9ynalB4Smc
         rIkcLsvhYqEzyxiq87zoPj4+rI1MYetpckzMcFjmOShSZw/XOH5wnSdcw+5lt6DDGlzT
         X1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from:cc;
        bh=QxyFP12MhasoDGEo27BmT72GRY9o/OilHUn1uKLS9HU=;
        b=C0hmtN/BeL5jdPPIjqxmu0WKhdflWSh42vyLmq0MMR4gLskyK+1YG8eWWi26mhuG5e
         MVLfweJiIWtdpmS5jDka9vX60eq+jkz5A/nd4FrdcqlIIeVXMWUgGkcyZuSl9gSrikXj
         iMtDBfJ/H4bbpI94AMwe3dWfGBW9/uTzUKY4xRaQdxzHAxzccIRzIVoqPjJkWuFvhQYk
         MqbC8S8OY3LZgLavO3j2PqnsMUogNItH5hIwHXQlYWFeMQz6tBj8ePzDzt3Hlyd878jj
         TF3JpltdOdKzqg+G+B4yeZICZkSPL8egoH3S/IEngMQxG78oQHS+EQLj22ads73zreDK
         QQmg==
X-Gm-Message-State: APjAAAXmIVgvv6Ji3CN3kARGwkNH+fmhLRUxsshm9vMe3A3U6Iwlxxd9
        d+Rvlh1XotRuV56lasgOI6GUMA==
X-Google-Smtp-Source: APXvYqyeT8rwbaOzoRAJmIsh5JIQd1t8BEuHkQ7D784UqNRl377ltKmHmLhhDrkVy9KD5aHaXflfzw==
X-Received: by 2002:a5d:678f:: with SMTP id v15mr5464377wru.242.1574278148011;
        Wed, 20 Nov 2019 11:29:08 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a15sm301710wrx.81.2019.11.20.11.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 11:29:07 -0800 (PST)
Message-ID: <5dd59403.1c69fb81.f6a76.2143@mx.google.com>
Date:   Wed, 20 Nov 2019 11:29:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Lab-Name: lab-collabora
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: bisect
X-Kernelci-Kernel: next-20191120
Subject: next/master bisection: boot on peach-pi
To:     tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Christoph Hellwig <hch@lst.de>, broonie@kernel.org,
        khilman@baylibre.com, mgalka@collabora.com,
        enric.balletbo@collabora.com, Michael Ellerman <mpe@ellerman.id.au>
From:   "kernelci.org bot" <bot@kernelci.org>
Cc:     Paul Burton <paulburton@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Hogan <jhogan@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Paul Mackerras <paulus@samba.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linuxppc-dev@lists.ozlabs.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

next/master bisection: boot on peach-pi

Summary:
  Start:      1fef9976397f Add linux-next specific files for 20191120
  Details:    https://kernelci.org/boot/id/5dd5175059b514af0dcf54d0
  Plain log:  https://storage.kernelci.org//next/master/next-20191120/arm/e=
xynos_defconfig/gcc-8/lab-collabora/boot-exynos5800-peach-pi.txt
  HTML log:   https://storage.kernelci.org//next/master/next-20191120/arm/e=
xynos_defconfig/gcc-8/lab-collabora/boot-exynos5800-peach-pi.html
  Result:     b037b220e71d dma-direct: unify the dma_capable definitions

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       next
  URL:        git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  Branch:     master
  Target:     peach-pi
  CPU arch:   arm
  Lab:        lab-collabora
  Compiler:   gcc-8
  Config:     exynos_defconfig
  Test suite: boot

Breaking commit found:

---------------------------------------------------------------------------=
----
commit b037b220e71dcbb34cb710e00ffad2ec025b9163
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Nov 12 17:06:04 2019 +0100

    dma-direct: unify the dma_capable definitions
    =

    Currently each architectures that wants to override dma_to_phys and
    phys_to_dma also has to provide dma_capable.  But there isn't really
    any good reason for that.  powerpc and mips just have copies of the
    generic one minus the latests fix, and the arm one was the inspiration
    for said fix, but misses the bus_dma_mask handling.
    Make all architectures use the generic version instead.
    =

    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
    Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-d=
irect.h
index b67e5fc1fe43..7c3001a6a775 100644
--- a/arch/arm/include/asm/dma-direct.h
+++ b/arch/arm/include/asm/dma-direct.h
@@ -14,23 +14,4 @@ static inline phys_addr_t __dma_to_phys(struct device *d=
ev, dma_addr_t dev_addr)
 	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
 }
 =

-static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t=
 size)
-{
-	u64 limit, mask;
-
-	if (!dev->dma_mask)
-		return 0;
-
-	mask =3D *dev->dma_mask;
-
-	limit =3D (mask + 1) & ~mask;
-	if (limit && size > limit)
-		return 0;
-
-	if ((addr | (addr + size - 1)) & ~mask)
-		return 0;
-
-	return 1;
-}
-
 #endif /* ASM_ARM_DMA_DIRECT_H */
diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm/dma=
-direct.h
index b5c240806e1b..14e352651ce9 100644
--- a/arch/mips/include/asm/dma-direct.h
+++ b/arch/mips/include/asm/dma-direct.h
@@ -2,14 +2,6 @@
 #ifndef _MIPS_DMA_DIRECT_H
 #define _MIPS_DMA_DIRECT_H 1
 =

-static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t=
 size)
-{
-	if (!dev->dma_mask)
-		return false;
-
-	return addr + size - 1 <=3D *dev->dma_mask;
-}
-
 dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
 phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr);
 =

diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/a=
sm/dma-direct.h
index a2912b47102c..e29e8a236b8d 100644
--- a/arch/powerpc/include/asm/dma-direct.h
+++ b/arch/powerpc/include/asm/dma-direct.h
@@ -2,15 +2,6 @@
 #ifndef ASM_POWERPC_DMA_DIRECT_H
 #define ASM_POWERPC_DMA_DIRECT_H 1
 =

-static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t=
 size)
-{
-	if (!dev->dma_mask)
-		return false;
-
-	return addr + size - 1 <=3D
-		min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
-}
-
 static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t pad=
dr)
 {
 	if (!dev)
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 6db863c3eb93..991f8aa2676e 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -24,6 +24,7 @@ static inline phys_addr_t __dma_to_phys(struct device *de=
v, dma_addr_t dev_addr)
 =

 	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
 }
+#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 =

 static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t=
 size)
 {
@@ -38,7 +39,6 @@ static inline bool dma_capable(struct device *dev, dma_ad=
dr_t addr, size_t size)
 =

 	return end <=3D min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
 }
-#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 =

 #ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
 bool force_dma_unencrypted(struct device *dev);
---------------------------------------------------------------------------=
----


Git bisection log:

---------------------------------------------------------------------------=
----
git bisect start
# good: [fd8f64df95204951c3edd4c4a7817c909d55a100] mdio_bus: Fix init if CO=
NFIG_RESET_CONTROLLER=3Dn
git bisect good fd8f64df95204951c3edd4c4a7817c909d55a100
# bad: [1fef9976397fc9b951ee54467eccd65e0c508785] Add linux-next specific f=
iles for 20191120
git bisect bad 1fef9976397fc9b951ee54467eccd65e0c508785
# bad: [cf8226f5c44196785f624a89d4ecc0d37a497ea5] Merge remote-tracking bra=
nch 'crypto/master'
git bisect bad cf8226f5c44196785f624a89d4ecc0d37a497ea5
# bad: [74f00449ecd89d1239b6d0c0e7b0f2b6f8df7eca] Merge remote-tracking bra=
nch 'pstore/for-next/pstore'
git bisect bad 74f00449ecd89d1239b6d0c0e7b0f2b6f8df7eca
# bad: [56caf45711a6ab3efee14944a25b619241d8a8f1] Merge remote-tracking bra=
nch 'rockchip/for-next'
git bisect bad 56caf45711a6ab3efee14944a25b619241d8a8f1
# good: [ef9980578a06d184b95661a5de904d0d3d5d0c39] Merge branch 'arm/dt' in=
to for-next
git bisect good ef9980578a06d184b95661a5de904d0d3d5d0c39
# good: [e1351090dd4a172fb26317ae6fa846ab13c50199] ARM: Document merges
git bisect good e1351090dd4a172fb26317ae6fa846ab13c50199
# bad: [0ab68e0575be44525a043d048863a6078ab6ed0d] Merge remote-tracking bra=
nch 'arm/for-next'
git bisect bad 0ab68e0575be44525a043d048863a6078ab6ed0d
# good: [08504765f773b151ff96f75b36e6a7f1c3308ccf] Merge remote-tracking br=
anch 'spdx/spdx-linus'
git bisect good 08504765f773b151ff96f75b36e6a7f1c3308ccf
# bad: [ce154ead79b9a97e4376785dc7b3fe20b6d9a3ea] Merge remote-tracking bra=
nch 'dma-mapping/for-next'
git bisect bad ce154ead79b9a97e4376785dc7b3fe20b6d9a3ea
# good: [0241ea8cae19b49fc1b1459f7bbe9a77f4f9cc89] modpost: free ns_deps_bu=
f.p after writing ns_deps files
git bisect good 0241ea8cae19b49fc1b1459f7bbe9a77f4f9cc89
# good: [e380a0394c36a3a878c858418d5dd7f5f195b6fc] x86/PCI: sta2x11: use de=
fault DMA address translation
git bisect good e380a0394c36a3a878c858418d5dd7f5f195b6fc
# good: [fcbb8461fd2376ba3782b5b8bd440c929b8e4980] kbuild: remove header co=
mpile test
git bisect good fcbb8461fd2376ba3782b5b8bd440c929b8e4980
# bad: [e4d2bda544c7df90abed8aaa099b5daf1870bcf8] dma-direct: avoid a forwa=
rd declaration for phys_to_dma
git bisect bad e4d2bda544c7df90abed8aaa099b5daf1870bcf8
# bad: [b037b220e71dcbb34cb710e00ffad2ec025b9163] dma-direct: unify the dma=
_capable definitions
git bisect bad b037b220e71dcbb34cb710e00ffad2ec025b9163
# good: [9f0e56e96c7b2039edb4bda64410216c6e9fe93f] dma-mapping: drop the de=
v argument to arch_sync_dma_for_*
git bisect good 9f0e56e96c7b2039edb4bda64410216c6e9fe93f
# first bad commit: [b037b220e71dcbb34cb710e00ffad2ec025b9163] dma-direct: =
unify the dma_capable definitions
---------------------------------------------------------------------------=
----
