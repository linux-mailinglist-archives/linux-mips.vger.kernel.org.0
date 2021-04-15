Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38D736052F
	for <lists+linux-mips@lfdr.de>; Thu, 15 Apr 2021 11:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbhDOJEH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Apr 2021 05:04:07 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:34484 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbhDOJEF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Apr 2021 05:04:05 -0400
Received: from localhost (unknown [192.168.167.69])
        by lucky1.263xmail.com (Postfix) with ESMTP id 7CB8BC82DB;
        Thu, 15 Apr 2021 17:03:24 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P13171T139812371683072S1618477404344929_;
        Thu, 15 Apr 2021 17:03:24 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <820a1f75bc7e53e62c16055c5e259f9c>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: tsbogend@alpha.franken.de
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     tsbogend@alpha.franken.de
Cc:     yangtiezhu@loongson.cn, jiaxun.yang@flygoat.com,
        viro@zeniv.linux.org.uk, paul@crapouillou.net,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] MIPS: Makefile: Replace -pg with CC_FLAGS_FTRACE
Date:   Thu, 15 Apr 2021 17:03:22 +0800
Message-Id: <20210415090322.17519-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In preparation for mips supporting ftrace built on other compiler
options, let's have the mips Makefiles remove the $(CC_FLAGS_FTRACE)
flags, whatever these may be, rather than assuming '-pg'.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 arch/mips/kernel/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index b4a57f1de772..77b9ec938ad8 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -17,10 +17,10 @@ obj-y		+= cpu-probe.o
 endif
 
 ifdef CONFIG_FUNCTION_TRACER
-CFLAGS_REMOVE_ftrace.o = -pg
-CFLAGS_REMOVE_early_printk.o = -pg
-CFLAGS_REMOVE_perf_event.o = -pg
-CFLAGS_REMOVE_perf_event_mipsxx.o = -pg
+CFLAGS_REMOVE_ftrace.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_early_printk.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_perf_event.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_perf_event_mipsxx.o = $(CC_FLAGS_FTRACE)
 endif
 
 obj-$(CONFIG_CEVT_BCM1480)	+= cevt-bcm1480.o
-- 
2.20.1



