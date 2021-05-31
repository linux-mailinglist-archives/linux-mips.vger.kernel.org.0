Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0DB395A93
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 14:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhEaMdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 08:33:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:38614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231562AbhEaMdD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 08:33:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DBDB610C9;
        Mon, 31 May 2021 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622464283;
        bh=2dnOTVI7zvTo/6jCrrAI5rKQuEMENUnjNWL7YAVd/TI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UAWkF05LhVrQJrPC2lEw2gMhfbIE1nUX/xsnFocDLULwsRSZMBTbzsCVHPl8oeKkb
         z2cMWXTTCLBjOEY1mQFiDLmuflFLMQRsM+jpmNmY2MW7WLyzkuQDAHSHGkdOebqCOd
         1nh/SXYPVn1zoLjUR5E0W9fj+kHf85Oe/XnmA3rL8+DGy/owxS1wb/rDeThw5jZxXv
         qwF8nptukaL2cJqVyew84MeoNKalyCfFkoMPbKicTvt4lSZXrdSADUU6FUqt1tN54e
         3kVF1vwHROoV9D+FXrxc0E7M0yg+L9Rm2SG0ELc+mdEp0Lq68OpMozWO3sm/VFX5P9
         YvR7V2ZRQB5fQ==
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: [RFC/RFT PATCH 3/5] arm: switch to generic memblock_setup_resources()
Date:   Mon, 31 May 2021 15:29:57 +0300
Message-Id: <20210531122959.23499-4-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210531122959.23499-1-rppt@kernel.org>
References: <20210531122959.23499-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

The registration of "System RAM" resources on arm is very similar to the
generic version.

The major differences are the registration of "System RAM (boot alias)"
areas and minor differences in the way kernel image resources are reserved.

Replace the open coded registration of the "System RAM" resource and the
requests for kernel image and data areas in the resource tree with the
generic implementation.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm/kernel/setup.c | 37 +------------------------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 1a5edf562e85..d14edf42815b 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -174,23 +174,9 @@ static struct resource mem_res[] = {
 		.end = 0,
 		.flags = IORESOURCE_MEM
 	},
-	{
-		.name = "Kernel code",
-		.start = 0,
-		.end = 0,
-		.flags = IORESOURCE_SYSTEM_RAM
-	},
-	{
-		.name = "Kernel data",
-		.start = 0,
-		.end = 0,
-		.flags = IORESOURCE_SYSTEM_RAM
-	}
 };
 
 #define video_ram   mem_res[0]
-#define kernel_code mem_res[1]
-#define kernel_data mem_res[2]
 
 static struct resource io_res[] = {
 	{
@@ -849,10 +835,7 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
 	struct resource *res;
 	u64 i;
 
-	kernel_code.start   = virt_to_phys(_text);
-	kernel_code.end     = virt_to_phys(__init_begin - 1);
-	kernel_data.start   = virt_to_phys(_sdata);
-	kernel_data.end     = virt_to_phys(_end - 1);
+	memblock_setup_resources();
 
 	for_each_mem_range(i, &start, &end) {
 		unsigned long boot_alias_start;
@@ -881,24 +864,6 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
 			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 			request_resource(&iomem_resource, res);
 		}
-
-		res = memblock_alloc(sizeof(*res), SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      sizeof(*res));
-		res->name  = "System RAM";
-		res->start = start;
-		res->end = res_end;
-		res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-
-		request_resource(&iomem_resource, res);
-
-		if (kernel_code.start >= res->start &&
-		    kernel_code.end <= res->end)
-			request_resource(res, &kernel_code);
-		if (kernel_data.start >= res->start &&
-		    kernel_data.end <= res->end)
-			request_resource(res, &kernel_data);
 	}
 
 	if (mdesc->video_start) {
-- 
2.28.0

