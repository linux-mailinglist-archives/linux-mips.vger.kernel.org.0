Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D181730F4B6
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 15:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236381AbhBDOPB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 09:15:01 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:17018 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236558AbhBDOA1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Feb 2021 09:00:27 -0500
Date:   Thu, 04 Feb 2021 13:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1612447179; bh=rmmBjANsrPQKuDrbBEFPqO9DZ+qrmSLUVcFP//W9JMY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=mm4htUZOTZY1dDsuJF1AVE430nlfigwx7F231kg4S+Hg6lHSY1F5qiZWEoGiPvTit
         JXvjOW5G4pscwjHm579c3AGSBDnzGbCFuh2HOsAjcue3g3IcNEgmB7tFrfO2asqH4w
         SXTEp3dp4+jyr/0Yax/7MlLHnDr2dTun1UbYvLRgJX8X10yS1c+yn2ZbheZ+bdgcKJ
         ohoBqgUCFZlW6Zhc2nQSsav/jgXiguAvQ/qRz8ufEDk66knTaNF1jN779Cb+XwQeT5
         9cvE5+LAanB9sqWoqN76zPSmtg9V3SMG9utUqhmSp3L5kLZ8CrNCKKfR52bYxw4gq7
         SNuiLH9yN2OBA==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     James Hartley <james.hartley@sondrel.com>,
        bibo mao <maobibo@loongson.cn>,
        Alexander Lobakin <alobakin@pm.me>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next] MIPS: pistachio: remove obsolete include/asm/mach-pistachio
Message-ID: <20210204135902.10361-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since commit 02bd530f888c ("MIPS: generic: Increase NR_IRQS to 256")
include/asm/mach-pistachio/irq.h just does nothing.
Remove the file along with mach-pistachio folder and include compiler
directive.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 MAINTAINERS                                |  1 -
 arch/mips/include/asm/mach-pistachio/irq.h | 15 ---------------
 arch/mips/pistachio/Platform               |  2 --
 3 files changed, 18 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-pistachio/irq.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6add29cb2060..3e58787907d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14099,7 +14099,6 @@ L:=09linux-mips@vger.kernel.org
 S:=09Odd Fixes
 F:=09arch/mips/boot/dts/img/pistachio*
 F:=09arch/mips/configs/pistachio*_defconfig
-F:=09arch/mips/include/asm/mach-pistachio/
 F:=09arch/mips/pistachio/
=20
 PKTCDVD DRIVER
diff --git a/arch/mips/include/asm/mach-pistachio/irq.h b/arch/mips/include=
/asm/mach-pistachio/irq.h
deleted file mode 100644
index 74ac016503ad..000000000000
--- a/arch/mips/include/asm/mach-pistachio/irq.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Pistachio IRQ setup
- *
- * Copyright (C) 2014 Google, Inc.
- */
-
-#ifndef __ASM_MACH_PISTACHIO_IRQ_H
-#define __ASM_MACH_PISTACHIO_IRQ_H
-
-#define NR_IRQS 256
-
-#include <asm/mach-generic/irq.h>
-
-#endif /* __ASM_MACH_PISTACHIO_IRQ_H */
diff --git a/arch/mips/pistachio/Platform b/arch/mips/pistachio/Platform
index f73a1a929965..c59de86dbddf 100644
--- a/arch/mips/pistachio/Platform
+++ b/arch/mips/pistachio/Platform
@@ -1,8 +1,6 @@
 #
 # IMG Pistachio SoC
 #
-cflags-$(CONFIG_MACH_PISTACHIO)=09=09+=3D=09=09=09=09\
-=09=09-I$(srctree)/arch/mips/include/asm/mach-pistachio
 load-$(CONFIG_MACH_PISTACHIO)=09=09+=3D 0xffffffff80400000
 zload-$(CONFIG_MACH_PISTACHIO)=09=09+=3D 0xffffffff81000000
 all-$(CONFIG_MACH_PISTACHIO)=09=09:=3D uImage.gz
--=20
2.30.0


