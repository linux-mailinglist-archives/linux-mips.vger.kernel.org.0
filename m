Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE7A413594C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730977AbgAIMe2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:38036 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730978AbgAIMeM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 859D9B2216;
        Thu,  9 Jan 2020 12:34:07 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] MIPS: SGI-IP27: No need for slice_map
Date:   Thu,  9 Jan 2020 13:33:51 +0100
Message-Id: <20200109123353.5656-15-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

per_cpu_init is called exactly once for every CPU. So there is no
need for protection via slice_map.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/mach-ip27/mmzone.h | 1 -
 arch/mips/sgi-ip27/ip27-init.c           | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
index 534a50f79147..08c36e50a860 100644
--- a/arch/mips/include/asm/mach-ip27/mmzone.h
+++ b/arch/mips/include/asm/mach-ip27/mmzone.h
@@ -13,7 +13,6 @@ struct hub_data {
 	kern_vars_t	kern_vars;
 	DECLARE_BITMAP(h_bigwin_used, HUB_NUM_BIG_WINDOW);
 	cpumask_t	h_cpus;
-	unsigned long slice_map;
 };
 
 struct node_data {
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 84a78bd1386a..32bcb8d1dd88 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -72,12 +72,7 @@ static void per_hub_init(nasid_t nasid)
 void per_cpu_init(void)
 {
 	int cpu = smp_processor_id();
-	int slice = LOCAL_HUB_L(PI_CPU_NUM);
 	nasid_t nasid = get_nasid();
-	struct hub_data *hub = hub_data(nasid);
-
-	if (test_and_set_bit(slice, &hub->slice_map))
-		return;
 
 	clear_c0_status(ST0_IM);
 
-- 
2.24.1

