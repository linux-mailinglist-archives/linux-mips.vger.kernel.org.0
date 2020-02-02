Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD97B14FB42
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2020 03:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgBBCiT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Feb 2020 21:38:19 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:40196 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbgBBCiS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Feb 2020 21:38:18 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id 0CC5929AFD; Sat,  1 Feb 2020 21:38:16 -0500 (EST)
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <a39b20bfa8ee493a9fd26a5f7a8ce0bf3aa20ed7.1580610812.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1580610812.git.fthain@telegraphics.com.au>
References: <cover.1580610812.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 3/3] mips/jazz: Update jazz_defconfig for MIPS Magnum
Date:   Sun, 02 Feb 2020 13:33:32 +1100
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable some options for machine type, framebuffer, serial controller and
ATA interfaces.

This allows a jazz_defconfig build to work on the emulated MIPS Magnum
machine provided by qemu-system-mips64el.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
This patch enables CONFIG_FB_G364. This depends upon the build fix at
the beginning of this patch series.
---
 arch/mips/configs/jazz_defconfig | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/mips/configs/jazz_defconfig b/arch/mips/configs/jazz_defconfig
index b13b2396a8a9..92085df3e367 100644
--- a/arch/mips/configs/jazz_defconfig
+++ b/arch/mips/configs/jazz_defconfig
@@ -1,5 +1,7 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
@@ -8,6 +10,8 @@ CONFIG_EXPERT=y
 CONFIG_SLAB=y
 CONFIG_MACH_JAZZ=y
 CONFIG_OLIVETTI_M700=y
+CONFIG_MIPS_MAGNUM_4000=y
+CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
@@ -25,6 +29,7 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_PARPORT=m
 CONFIG_PARPORT_PC=m
 CONFIG_PARPORT_1284=y
+CONFIG_DEVTMPFS=y
 CONFIG_BLK_DEV_FD=m
 CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_CRYPTOLOOP=m
@@ -44,6 +49,8 @@ CONFIG_ISCSI_TCP=m
 CONFIG_SCSI_PPA=m
 CONFIG_SCSI_IMM=m
 CONFIG_JAZZ_ESP=y
+CONFIG_ATA=y
+CONFIG_PATA_LEGACY=y
 CONFIG_NETDEVICES=y
 CONFIG_BONDING=m
 CONFIG_DUMMY=m
@@ -54,11 +61,15 @@ CONFIG_NE2000=m
 CONFIG_SERIO_PARKBD=m
 CONFIG_SERIO_RAW=m
 CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_DETECT_IRQ=y
 CONFIG_SERIAL_8250_RSA=y
+CONFIG_FB=y
+CONFIG_FB_G364=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
 # CONFIG_HWMON is not set
 CONFIG_EXT2_FS=m
 CONFIG_EXT3_FS=y
-- 
2.24.1

