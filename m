Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871A1138ECA
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 11:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgAMKPb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 05:15:31 -0500
Received: from forward104p.mail.yandex.net ([77.88.28.107]:45089 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725992AbgAMKPb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 05:15:31 -0500
Received: from mxback26j.mail.yandex.net (mxback26j.mail.yandex.net [IPv6:2a02:6b8:0:1619::226])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id A85684B017B8;
        Mon, 13 Jan 2020 13:15:28 +0300 (MSK)
Received: from myt4-ee976ce519ac.qloud-c.yandex.net (myt4-ee976ce519ac.qloud-c.yandex.net [2a02:6b8:c00:1da4:0:640:ee97:6ce5])
        by mxback26j.mail.yandex.net (mxback/Yandex) with ESMTP id RtLj1g0QAS-FSoSigND;
        Mon, 13 Jan 2020 13:15:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578910528;
        bh=dl05Lu4rqMTLJMcFbbsz5EjIcR+RQTMwhnmqd8fIVLc=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=ZVwk3M7wKOilwtdAWc4nF3rwsFH4ktcK/XyjZWDNe95O7fJ8zUXsaPPjKCYy0xsMs
         3Ei8Ekp+y9CZCHy+2ZoOLl2fjDB4fmS3YuEPVgTzclPsea8GHHufbEgNX7CnKUvgFl
         Xbp1gKUCXU7DmGs9WnDmjvuTuP2NYIYq0d2nVDjc=
Authentication-Results: mxback26j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt4-ee976ce519ac.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 2dzM4Y3ZVr-FMWKirli;
        Mon, 13 Jan 2020 13:15:26 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/3] MIPS: Loongson64: Bump ISA level to MIPSR2
Date:   Mon, 13 Jan 2020 18:15:00 +0800
Message-Id: <20200113101501.37985-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113101501.37985-1-jiaxun.yang@flygoat.com>
References: <20200113101501.37985-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Despite early sample of Loongson-3A1000, the whole Loongson64 family have
implemented all the features required by MIPS64 Release2. Thus we decide to
bump the ISA option to R2.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig               | 6 ++++--
 arch/mips/include/asm/hazards.h | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c3103f4eeafa..d0b727daddb3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1443,11 +1443,15 @@ config CPU_LOONGSON64
 	bool "Loongson 64-bit CPU"
 	depends on SYS_HAS_CPU_LOONGSON64
 	select ARCH_HAS_PHYS_TO_DMA
+	select CPU_MIPSR2
+	select CPU_HAS_PREFETCH
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
 	select CPU_SUPPORTS_MSA
 	select CPU_HAS_LOAD_STORE_LR
+	select CPU_DIEI_BROKEN if !LOONGSON3_ENHANCEMENT
+	select CPU_MIPSR2_IRQ_VI
 	select WEAK_ORDERING
 	select WEAK_REORDERING_BEYOND_LLSC
 	select MIPS_ASID_BITS_VARIABLE
@@ -1465,8 +1469,6 @@ config CPU_LOONGSON64
 config LOONGSON3_ENHANCEMENT
 	bool "New Loongson-3 CPU Enhancements"
 	default n
-	select CPU_MIPSR2
-	select CPU_HAS_PREFETCH
 	depends on CPU_LOONGSON64
 	help
 	  New Loongson-3 cores (since Loongson-3A R2, as opposed to Loongson-3A
diff --git a/arch/mips/include/asm/hazards.h b/arch/mips/include/asm/hazards.h
index a4f48b0f5541..a0b92205f933 100644
--- a/arch/mips/include/asm/hazards.h
+++ b/arch/mips/include/asm/hazards.h
@@ -23,7 +23,7 @@
  * TLB hazards
  */
 #if (defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)) && \
-	!defined(CONFIG_CPU_CAVIUM_OCTEON) && !defined(CONFIG_LOONGSON3_ENHANCEMENT)
+	!defined(CONFIG_CPU_CAVIUM_OCTEON) && !defined(CONFIG_CPU_LOONGSON64)
 
 /*
  * MIPSR2 defines ehb for hazard avoidance
@@ -158,7 +158,7 @@ do {									\
 } while (0)
 
 #elif defined(CONFIG_MIPS_ALCHEMY) || defined(CONFIG_CPU_CAVIUM_OCTEON) || \
-	defined(CONFIG_CPU_LOONGSON2EF) || defined(CONFIG_LOONGSON3_ENHANCEMENT) || \
+	defined(CONFIG_CPU_LOONGSON2EF) || defined(CONFIG_CPU_LOONGSON64) || \
 	defined(CONFIG_CPU_R10000) || defined(CONFIG_CPU_R5500) || defined(CONFIG_CPU_XLR)
 
 /*
-- 
2.24.1

