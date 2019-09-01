Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE379A4AAD
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbfIAQhG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:37:06 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:33644 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbfIAQhG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:37:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7E7D83FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:37:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MUIoWlveRTL9 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:37:03 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id DDA2B3F52B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:37:03 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:37:03 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 120/120] MIPS: Fix name of BOOT_MEM_ROM_DATA
Message-ID: <54a08fcb41b12e715529148a6bc11bcb3e2adb4d.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/kernel/setup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ab349d2381c3..7d5bf8cb513b 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -870,14 +870,16 @@ static void __init resource_init(void)
 		switch (boot_mem_map.map[i].type) {
 		case BOOT_MEM_RAM:
 		case BOOT_MEM_INIT_RAM:
-		case BOOT_MEM_ROM_DATA:
 			res->name = "System RAM";
 			res->flags |= IORESOURCE_SYSRAM;
 			break;
+		case BOOT_MEM_ROM_DATA:
+			res->name = "System ROM";
+			break;
 		case BOOT_MEM_RESERVED:
 		case BOOT_MEM_NOMAP:
 		default:
-			res->name = "reserved";
+			res->name = "Reserved";
 		}
 
 		request_resource(&iomem_resource, res);
-- 
2.21.0

