Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A009145351
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 12:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgAVLAZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 06:00:25 -0500
Received: from mail.dlink.ru ([178.170.168.18]:55596 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgAVLAZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 06:00:25 -0500
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id 677201B217DC; Wed, 22 Jan 2020 14:00:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 677201B217DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1579690822; bh=E2dXwvQfR3it5MyIm/cP9a8wE1o/rgxNa0wXkLbsxxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Qe300mp5igW6uIUUeaKKePxa+vVeOPPyZH8Kttfq+oMpe2MW9TUvfWgGUk2XvKWc8
         zLIZ+zPF9AJVJK1Gmy9VgcO48or5brmys8tWNDX+MnAWXeFGL+/Jo0VgMwIPZSGVvc
         4zoNnevpUkLuH7WTaclPY23SsM9QIyEhZIBQ1ACg=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,URIBL_BLOCKED,
        USER_IN_WHITELIST autolearn=disabled version=3.4.2
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id 044FB1B21777;
        Wed, 22 Jan 2020 13:59:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 044FB1B21777
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTP id D7DE01B217EA;
        Wed, 22 Jan 2020 13:59:24 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA;
        Wed, 22 Jan 2020 13:59:24 +0300 (MSK)
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Michal Simek <michal.simek@xilinx.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH mips-next 5/5] Revert "MIPS: Add custom serial.h with BASE_BAUD override for generic kernel"
Date:   Wed, 22 Jan 2020 13:58:52 +0300
Message-Id: <20200122105852.8788-6-alobakin@dlink.ru>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122105852.8788-1-alobakin@dlink.ru>
References: <20200122105852.8788-1-alobakin@dlink.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit c8ec2041f549e7f2dee0c34d25381be6f7805f99.

There's no more need to set BASE_BAUD to 0 to make earlycon work
properly on DTS-based boards since such cases were handled in commit
182ead3e418a ("earlycon: Remove hardcoded port->uartclk initialization
in of_setup_earlycon"). earlycon no longer initializes port->uartclk
with a value of BASE_BAUD * 16 when starting from FDT/OF.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 arch/mips/include/asm/Kbuild   |  1 +
 arch/mips/include/asm/serial.h | 18 ------------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 arch/mips/include/asm/serial.h

diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 61b0fc2026e6..16d1eb4c8fe6 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -19,6 +19,7 @@ generic-y += preempt.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
 generic-y += sections.h
+generic-y += serial.h
 generic-y += trace_clock.h
 generic-y += unaligned.h
 generic-y += user.h
diff --git a/arch/mips/include/asm/serial.h b/arch/mips/include/asm/serial.h
deleted file mode 100644
index 2777148dbfc5..000000000000
--- a/arch/mips/include/asm/serial.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2017 MIPS Tech, LLC
- */
-#ifndef __ASM__SERIAL_H
-#define __ASM__SERIAL_H
-
-#ifdef CONFIG_MIPS_GENERIC
-/*
- * Generic kernels cannot know a correct value for all platforms at
- * compile time. Set it to 0 to prevent 8250_early using it
- */
-#define BASE_BAUD 0
-#else
-#include <asm-generic/serial.h>
-#endif
-
-#endif /* __ASM__SERIAL_H */
-- 
2.25.0

