Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97F829A0C2
	for <lists+linux-mips@lfdr.de>; Tue, 27 Oct 2020 01:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408734AbgJZXtb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 19:49:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:47534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408720AbgJZXta (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Oct 2020 19:49:30 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DDD820773;
        Mon, 26 Oct 2020 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756170;
        bh=K+pXON+EpeZwcukcdCKp2fT/ruRvzTT1E/1PKb+EpGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F7GB5vJs3mlYXdSWeIAV+jFCYP7OcQ9uhO7MQ3w9Q6gemMkPUdmH+2CtAOHykvbbH
         UWimNqvFCRV1WxSDJ2Pv59oOqB/QSqbKVRE5wPZNUQzd2tTD2QIKmX+X58RX+YeKjg
         zi1snuzVCxHKF4rSAYqF5fsK3/wX6kgZOYYdKRDI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zejiang Tang <tangzejiang@loongson.cn>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 019/147] MIPS: ftrace: Remove redundant #ifdef CONFIG_DYNAMIC_FTRACE
Date:   Mon, 26 Oct 2020 19:46:57 -0400
Message-Id: <20201026234905.1022767-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
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
index 2625232bfe526..f57e68f40a348 100644
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

