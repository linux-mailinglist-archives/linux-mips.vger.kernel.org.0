Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0F0299F03
	for <lists+linux-mips@lfdr.de>; Tue, 27 Oct 2020 01:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394887AbgJ0ATe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 20:19:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:58424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411507AbgJ0AJz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Oct 2020 20:09:55 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D32FF20709;
        Tue, 27 Oct 2020 00:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603757395;
        bh=B/CcbqpL7Ru/FtwNwUeyKnuBru5kdIAIToRsNgXwcd8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QjGeapZDZvyhuHrDP7pwwcdYsN27qC6rKR48nqMjfTf4ollMDI4q7bIxyWl5JoU/7
         vnE63/+eYsgXQ3haPFzqqs9w3qeXjUe5H2lSv9ZhVMOlBZgyC46rCx//28SMymvhYl
         wgoaPgvpR9wmqC5y3jL+T23A/8A/AbLLmPEknBjg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zejiang Tang <tangzejiang@loongson.cn>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 07/46] MIPS: ftrace: Remove redundant #ifdef CONFIG_DYNAMIC_FTRACE
Date:   Mon, 26 Oct 2020 20:09:06 -0400
Message-Id: <20201027000946.1026923-7-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000946.1026923-1-sashal@kernel.org>
References: <20201027000946.1026923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Zejiang Tang <tangzejiang@loongson.cn>

[ Upstream commit 39116103a7345927fa99644d08bc0cc9d45fea6f ]

There exists redundant #ifdef CONFIG_DYNAMIC_FTRACE in ftrace.c, remove it.

Signed-off-by: Zejiang Tang <tangzejiang@loongson.cn>
Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/ftrace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index 99285be0e0884..386f8dd0d703a 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -37,10 +37,6 @@ void arch_ftrace_update_code(int command)
 	ftrace_modify_all_code(command);
 }
 
-#endif
-
-#ifdef CONFIG_DYNAMIC_FTRACE
-
 #define JAL 0x0c000000		/* jump & link: ip --> ra, jump to target */
 #define ADDR_MASK 0x03ffffff	/*  op_code|addr : 31...26|25 ....0 */
 #define JUMP_RANGE_MASK ((1UL << 28) - 1)
-- 
2.25.1

