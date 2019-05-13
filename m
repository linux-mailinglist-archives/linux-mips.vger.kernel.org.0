Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58EF11B4B5
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2019 13:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbfEMLQW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 May 2019 07:16:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:49324 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729433AbfEMLQU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 May 2019 07:16:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 19A45AD7C;
        Mon, 13 May 2019 11:16:19 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP22: provide missing dma_mask/coherent_dma_mask
Date:   Mon, 13 May 2019 13:16:08 +0200
Message-Id: <20190513111609.14855-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.13.7
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Set dma_masks for SGIWD93 and SGISEEQ otherwise DMA allocations fails
and causes not working SCSI/ethernet.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip22/ip22-platform.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/sgi-ip22/ip22-platform.c b/arch/mips/sgi-ip22/ip22-platform.c
index 37ad26716579..0b2002e02a47 100644
--- a/arch/mips/sgi-ip22/ip22-platform.c
+++ b/arch/mips/sgi-ip22/ip22-platform.c
@@ -3,6 +3,7 @@
 #include <linux/if_ether.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/paccess.h>
 #include <asm/sgi/ip22.h>
@@ -25,6 +26,8 @@ static struct sgiwd93_platform_data sgiwd93_0_pd = {
 	.irq	= SGI_WD93_0_IRQ,
 };
 
+static u64 sgiwd93_0_dma_mask = DMA_BIT_MASK(32);
+
 static struct platform_device sgiwd93_0_device = {
 	.name		= "sgiwd93",
 	.id		= 0,
@@ -32,6 +35,8 @@ static struct platform_device sgiwd93_0_device = {
 	.resource	= sgiwd93_0_resources,
 	.dev = {
 		.platform_data = &sgiwd93_0_pd,
+		.dma_mask = &sgiwd93_0_dma_mask,
+		.coherent_dma_mask = DMA_BIT_MASK(32),
 	},
 };
 
@@ -49,6 +54,8 @@ static struct sgiwd93_platform_data sgiwd93_1_pd = {
 	.irq	= SGI_WD93_1_IRQ,
 };
 
+static u64 sgiwd93_1_dma_mask = DMA_BIT_MASK(32);
+
 static struct platform_device sgiwd93_1_device = {
 	.name		= "sgiwd93",
 	.id		= 1,
@@ -56,6 +63,8 @@ static struct platform_device sgiwd93_1_device = {
 	.resource	= sgiwd93_1_resources,
 	.dev = {
 		.platform_data = &sgiwd93_1_pd,
+		.dma_mask = &sgiwd93_1_dma_mask,
+		.coherent_dma_mask = DMA_BIT_MASK(32),
 	},
 };
 
@@ -96,6 +105,8 @@ static struct resource sgiseeq_0_resources[] = {
 
 static struct sgiseeq_platform_data eth0_pd;
 
+static u64 sgiseeq_dma_mask = DMA_BIT_MASK(32);
+
 static struct platform_device eth0_device = {
 	.name		= "sgiseeq",
 	.id		= 0,
@@ -103,6 +114,8 @@ static struct platform_device eth0_device = {
 	.resource	= sgiseeq_0_resources,
 	.dev = {
 		.platform_data = &eth0_pd,
+		.dma_mask = &sgiseeq_dma_mask,
+		.coherent_dma_mask = DMA_BIT_MASK(32),
 	},
 };
 
-- 
2.13.7

