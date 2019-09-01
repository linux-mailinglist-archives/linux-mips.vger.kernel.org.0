Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A696FA4A3A
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbfIAPv6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:51:58 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56976 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIAPv5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:51:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 9ABD240835
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:43:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WDPM5NQnHydy for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:43:17 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id DC6A1405B8
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:43:17 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:43:17 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 021/120] MIPS: R5900: Workaround for CACHE instruction near
 branch delay slot
Message-ID: <f2c939e386e0cacedc7e4b84b2c6499a4cd7a447.1567326213.git.noring@nocrew.org>
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
The Linux 2.6 port to the PlayStation 2 has this remark. I don't know
where it comes from.
---
 arch/mips/kernel/traps.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 9c98475c7dc6..647a1990163a 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1967,6 +1967,17 @@ void __init *set_except_vector(int n, void *addr)
 			uasm_i_jr(&buf, k0);
 			uasm_i_nop(&buf);
 		}
+#ifdef CONFIG_CPU_R5900
+		/*
+		 * Data that could be interpreted as cache instructions
+		 * is not allowed after the jump.
+		 */
+		uasm_i_nop(&buf);
+		uasm_i_nop(&buf);
+		uasm_i_nop(&buf);
+		uasm_i_nop(&buf);
+		uasm_i_nop(&buf);
+#endif
 		local_flush_icache_range(ebase + 0x200, (unsigned long)buf);
 	}
 	return (void *)old_handler;
-- 
2.21.0

