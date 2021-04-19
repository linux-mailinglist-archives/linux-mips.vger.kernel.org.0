Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD85363B24
	for <lists+linux-mips@lfdr.de>; Mon, 19 Apr 2021 07:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhDSFwf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Apr 2021 01:52:35 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:39966 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhDSFwe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Apr 2021 01:52:34 -0400
Received: from localhost (unknown [192.168.167.69])
        by lucky1.263xmail.com (Postfix) with ESMTP id 5D0AEC81A0;
        Mon, 19 Apr 2021 13:51:59 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P19994T140047279048448S1618811517751852_;
        Mon, 19 Apr 2021 13:51:59 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a84b687c562d53533b533d431d57a1fd>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: tsbogend@alpha.franken.de
X-RCPT-COUNT: 17
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     tsbogend@alpha.franken.de, jiaxun.yang@flygoat.com,
        chenhuacai@kernel.org, viro@zeniv.linux.org.uk, morbo@google.com
Cc:     paul@crapouillou.net, alobakin@pm.me, suxingxing@loongson.cn,
        tangyouling@loongson.cn, yangtiezhu@loongson.cn,
        ralf@linux-mips.org, nathan@kernel.org, masahiroy@kernel.org,
        keescook@chromium.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH v2] MIPS: Makefile: Replace -pg with CC_FLAGS_FTRACE
Date:   Mon, 19 Apr 2021 13:51:56 +0800
Message-Id: <20210419055156.22195-1-zhaoxiao@uniontech.com>
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
v2:add this same change be appropriate to all of the below Makefile. 
 arch/mips/boot/compressed/Makefile | 2 +-
 arch/mips/kernel/Makefile          | 8 ++++----
 arch/mips/vdso/Makefile            | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index f93f72bcba97..e4b7839293e1 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -18,7 +18,7 @@ include $(srctree)/arch/mips/Kbuild.platforms
 BOOT_HEAP_SIZE := 0x400000
 
 # Disable Function Tracer
-KBUILD_CFLAGS := $(filter-out -pg, $(KBUILD_CFLAGS))
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE), $(KBUILD_CFLAGS))
 
 KBUILD_CFLAGS := $(filter-out -fstack-protector, $(KBUILD_CFLAGS))
 
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index b4a57f1de772..814b3da30501 100644
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
+CFLAGS_REMOVE_early_printk.o =  $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_perf_event.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_perf_event_mipsxx.o = $(CC_FLAGS_FTRACE)
 endif
 
 obj-$(CONFIG_CEVT_BCM1480)	+= cevt-bcm1480.o
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 2131d3fd7333..1b2ea34c3d3b 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -46,7 +46,7 @@ CFLAGS_vgettimeofday-o32.o = -include $(srctree)/$(src)/config-n32-o32-env.c -in
 CFLAGS_vgettimeofday-n32.o = -include $(srctree)/$(src)/config-n32-o32-env.c -include $(c-gettimeofday-y)
 endif
 
-CFLAGS_REMOVE_vgettimeofday.o = -pg
+CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
 
 ifdef CONFIG_MIPS_DISABLE_VDSO
   ifndef CONFIG_MIPS_LD_CAN_LINK_VDSO
@@ -60,7 +60,7 @@ ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
 	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
 	-G 0 --eh-frame-hdr --hash-style=sysv --build-id=sha1 -T
 
-CFLAGS_REMOVE_vdso.o = -pg
+CFLAGS_REMOVE_vdso.o = $(CC_FLAGS_FTRACE)
 
 GCOV_PROFILE := n
 UBSAN_SANITIZE := n
-- 
2.20.1



