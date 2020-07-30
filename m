Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73134233665
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 18:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgG3QMo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 12:12:44 -0400
Received: from crapouillou.net ([89.234.176.41]:46982 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgG3QMn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jul 2020 12:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596125561; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=4UC5bN4C11HykhL6jcWAyq2cNXGmAe0l6v/GKa5hpCM=;
        b=SFqwTAVXyt5/QqdVrTJJqTsoraPX+mj2SLqfbWIh9748jBha+th241DbIgs37ngAPh6W6x
        Eov0wNaCpN6UGlztkNMSt6q8xky2mTwpo82jhTM+DMII5ttFKAQKpLyJcgo3rDWwCVzEJR
        QdvCWO1Vkls7RRlJp/4MS9tQmAlExXE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/4] MIPS: head.S: Init fw_passed_dtb to builtin DTB
Date:   Thu, 30 Jul 2020 18:12:30 +0200
Message-Id: <20200730161233.61876-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Init the 'fw_passed_dtb' pointer to the buit-in Device Tree blob when it
has been compiled in with CONFIG_BUILTIN_DTB.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/kernel/head.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 3b02ffe46304..7dd234e788e6 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -111,6 +111,12 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 	move		t2, a1
 	beq		a0, t1, dtb_found
 
+#ifdef CONFIG_BUILTIN_DTB
+	PTR_LA	t2, __dtb_start
+	PTR_LA	t1, __dtb_end
+	bne		t1, t2, dtb_found
+#endif /* CONFIG_BUILTIN_DTB */
+
 	li		t2, 0
 dtb_found:
 #endif /* CONFIG_USE_OF */
-- 
2.27.0

