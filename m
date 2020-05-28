Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E631E6172
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 14:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389873AbgE1MwO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 08:52:14 -0400
Received: from mail-m974.mail.163.com ([123.126.97.4]:43186 "EHLO
        mail-m974.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389872AbgE1MwM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 08:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=rJIh2AejiX4PKP3jTj
        J9LO2IPzXQUYbqGWE95oZGZ7k=; b=MNIuw83YOgF2J3XpCvs+SlJyPlEG0fnFX6
        etbGZl6O6zQIDn4F7PYZHARsnGIoADaY8SZSxx2onQNntfYx/TKIVTR7J1aywPAu
        +fnRkXGw/6UtPW4A8I5DOzgwts3GnRUYlP0UiGIsFyzuasllO5wtoMMPwd+hu0XL
        yO3d0rcpU=
Received: from localhost.localdomain (unknown [124.64.18.22])
        by smtp4 (Coremail) with SMTP id HNxpCgB3FCBZsM9epnuaBA--.138S4;
        Thu, 28 May 2020 20:36:51 +0800 (CST)
From:   YuanJunQing <yuanjunqing66@163.com>
To:     tsbogend@alpha.franken.de
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn, YuanJunQing <yuanjunqing66@163.com>
Subject: [PATCH] function:stacktrace/mips: Fix function:stacktrace for mips
Date:   Thu, 28 May 2020 20:36:40 +0800
Message-Id: <20200528123640.4285-1-yuanjunqing66@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: HNxpCgB3FCBZsM9epnuaBA--.138S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyrKr13tF47ArW7urW3ZFb_yoW8Gw4Upr
        yqyF9rGrW8XFs0k3y3WF95ur15XrZ5J3y2vrW7Jrsak3Z8XFs3ZFn2y3Z8K34q9rWxGa4f
        uF18ur4UAr4kC37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRXzVnUUUUU=
X-Originating-IP: [124.64.18.22]
X-CM-SenderInfo: h1xd0ypxqtx0rjwwqiywtou0bp/1tbiQAMyXFSIfPOk7QAAs3
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ftrace_call as global symbol in ftrace_caller(), this
will cause function:stacktrace can not work well.
i.e. echo do_IRQ:stacktrace > set_ftrace_filte

Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
---
 arch/mips/kernel/mcount.S | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
index cff52b283e03..cd5545764e5f 100644
--- a/arch/mips/kernel/mcount.S
+++ b/arch/mips/kernel/mcount.S
@@ -87,8 +87,15 @@ EXPORT_SYMBOL(_mcount)
 	PTR_LA   t1, _etext
 	sltu     t3, t1, a0	/* t3 = (a0 > _etext) */
 	or       t1, t2, t3
+	PTR_LA	 t2, stlab-4 	/* t2: "function:stacktrace" return address */
+	move	 a1, AT		/* arg2: parent's return address */
 	beqz     t1, ftrace_call
-	 nop
+	 nop			/* "function:stacktrace" return address */
+stlab:
+	PTR_LA	t2, stlab-4
+	/* ftrace_call_end: ftrace_call return address */
+	beq	t2,ra, ftrace_call_end
+	nop
 #if defined(KBUILD_MCOUNT_RA_ADDRESS) && defined(CONFIG_32BIT)
 	PTR_SUBU a0, a0, 16	/* arg1: adjust to module's recorded callsite */
 #else
@@ -98,7 +105,9 @@ EXPORT_SYMBOL(_mcount)
 	.globl ftrace_call
 ftrace_call:
 	nop	/* a placeholder for the call to a real tracing function */
-	 move	a1, AT		/* arg2: parent's return address */
+	move	ra, t2		/* t2: "function:stacktrace" return address */
+
+ftrace_call_end:
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	.globl ftrace_graph_call
-- 
2.17.1

