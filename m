Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9EC8102AF9
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2019 18:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfKSRvG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Nov 2019 12:51:06 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32858 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfKSRvF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Nov 2019 12:51:05 -0500
Received: by mail-wr1-f68.google.com with SMTP id w9so24959240wrr.0
        for <linux-mips@vger.kernel.org>; Tue, 19 Nov 2019 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from:cc;
        bh=HGunqTxsSVrmsqxuAQRNx41lItIocTvSzHu9usFa0ec=;
        b=DLlyXCBFgTcOzP3m56mvDuC1gid0j/57FTNBDJxQaHFBG+Mx73qzutr+HGMESEb3A5
         vuRsXpJCLZNNzVyQDQO/62U0ux+IrJ9sfX6QLgKQXmNbEb1I0cQlfSpYYRolt+G25giX
         Pjq4+dxzUkdmtju7EWJwH4ksQG4019NT+UMhBKBR5d1CcSgqV4ddqgCzXyG63G4ZN5yG
         rfj2+E41/H+NCa7PzXYtFM7QIbkhb4h5MtWnpxD1xAhSzN6+AtKToyw3ft4DGP05KN1v
         kELG90MeWObEexvWT74khnbgAHVy3/01ovV46ywzRKkbiiGMyhWNATDau6DdmSxCVcaZ
         5kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from:cc;
        bh=HGunqTxsSVrmsqxuAQRNx41lItIocTvSzHu9usFa0ec=;
        b=acJWnRCWPiijUdXeDCCVV5vIsc7I2ugvVhBLpmHfIBOHBI0X9GM2bUg9vDLVZzukow
         +dw/5QBcCWVlQeJx9v8dG6M7Bo18GyTjEQi7noP+NqPblAmUsrE0Pl0mNApUeh9NDr0I
         b8iGxmcNnuivYFN/e9j17Ht7fg49p2QILx4w3KnHCAUV70qLdP1UJgx5p7bNU2fLDpD8
         fnsxguvxzsiYspsjHJ16zs7ArdG2vwQqUL/ygnhLlUNrJLsJMJtpRTVSesqqvCMnn+X4
         wCBw7+xVQ74aX8aDc9Vtk9kNfQwnIP7kVzASR6yMK6mMiteOu/bZ2P+FhaMQsoqRtLRS
         I6CA==
X-Gm-Message-State: APjAAAUL1RJK7SxcMNcDL1rRBySByBySpvcKRV8mEfvhrBSU6kCwnxHc
        UJI1vJWQt0lafCa4VzdEQlLYfHK1uuhS5A==
X-Google-Smtp-Source: APXvYqxvHwtfcRuwAWPYF4jX+cThARsQRa6mXcf9IMifxx+BP/IyrbeuDGKqDEpRqWoAPCya8LiZ0g==
X-Received: by 2002:adf:e301:: with SMTP id b1mr4336744wrj.280.1574185862662;
        Tue, 19 Nov 2019 09:51:02 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l13sm3766223wmh.12.2019.11.19.09.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 09:51:01 -0800 (PST)
Message-ID: <5dd42b85.1c69fb81.36825.244a@mx.google.com>
Date:   Tue, 19 Nov 2019 09:51:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Lab-Name: lab-collabora
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: bisect
X-Kernelci-Kernel: next-20191119
Subject: next/master bisection: boot on peach-pi
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        mgalka@collabora.com, Christoph Hellwig <hch@lst.de>,
        broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com,
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
  Start:      5d1131b4d61e Add linux-next specific files for 20191119
  Details:    https://kernelci.org/boot/id/5dd3cc9559b5147f05cf54d1
  Plain log:  https://storage.kernelci.org//next/master/next-20191119/arm/e=
xynos_defconfig/gcc-8/lab-collabora/boot-exynos5800-peach-pi.txt
  HTML log:   https://storage.kernelci.org//next/master/next-20191119/arm/e=
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
# good: [af42d3466bdc8f39806b26f593604fdc54140bcb] Linux 5.4-rc8
git bisect good af42d3466bdc8f39806b26f593604fdc54140bcb
# bad: [5d1131b4d61e52e5702e0fa4bcbec81ac7d6ef52] Add linux-next specific f=
iles for 20191119
git bisect bad 5d1131b4d61e52e5702e0fa4bcbec81ac7d6ef52
# bad: [c5e9a8e6d8139cfdabb7774c9a39c5589b8d45d0] Merge remote-tracking bra=
nch 'crypto/master'
git bisect bad c5e9a8e6d8139cfdabb7774c9a39c5589b8d45d0
# bad: [cefecf6f6be345ac0e5c4f878e4d29787918adfb] Merge remote-tracking bra=
nch 'pstore/for-next/pstore'
git bisect bad cefecf6f6be345ac0e5c4f878e4d29787918adfb
# bad: [7b46e62e776e6a55199625b511d42518e4b98d8f] Merge remote-tracking bra=
nch 'reset/reset/next'
git bisect bad 7b46e62e776e6a55199625b511d42518e4b98d8f
# good: [5f1f15283419ded3e16617ac0b79abc6f2b73bba] Merge tag 'omap-for-v5.5=
/dt-late-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/li=
nux-omap into arm/dt
git bisect good 5f1f15283419ded3e16617ac0b79abc6f2b73bba
# good: [e1351090dd4a172fb26317ae6fa846ab13c50199] ARM: Document merges
git bisect good e1351090dd4a172fb26317ae6fa846ab13c50199
# bad: [9050eefca89eb3853d600a61e249fc9fdd8ba332] Merge remote-tracking bra=
nch 'arm/for-next'
git bisect bad 9050eefca89eb3853d600a61e249fc9fdd8ba332
# good: [0632e899eb046db54d3b1c993811e0b1b7b90b04] Merge remote-tracking br=
anch 'spdx/spdx-linus'
git bisect good 0632e899eb046db54d3b1c993811e0b1b7b90b04
# bad: [13fb7b3bb3e314cadfe6dec3132aac31d06950b5] Merge remote-tracking bra=
nch 'dma-mapping/for-next'
git bisect bad 13fb7b3bb3e314cadfe6dec3132aac31d06950b5
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
