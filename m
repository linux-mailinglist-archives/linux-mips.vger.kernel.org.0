Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC57B1CA725
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 11:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgEHJaD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 05:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgEHJaC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 May 2020 05:30:02 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B0CC05BD43
        for <linux-mips@vger.kernel.org>; Fri,  8 May 2020 02:30:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t40so3997681pjb.3
        for <linux-mips@vger.kernel.org>; Fri, 08 May 2020 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=aU/g92V8O2S/ZZdiz5NX1eAbv8iWTGUGsH8frvYwFaY=;
        b=obYWZ0DpM68ICVMRx7Bn7BuFDBig728Icxqm11JVftAigne8IlONDgrHEGd5ZPx13i
         Ozw2rNSOPNjyIbRZPRqYrX9ayGmsZ3NtQc3onpUTaziz7iJz3IdeqoOqtJ7RApISvcGi
         3Yv2UzYpkCA/t0i3/1f9QUqhFgjjByu6eTDrvug2BZzApaaNR6V2Q+B5+Jdr2Ai+I9J8
         vghddSh4Ni8uxNRbXA8h3yemorfWvcnBBi0x2hvZbKp90n8XIINHtt1FzV8unZV+sWKp
         ZMh2wYTfq7etkPV9k1cYI40iwsmsIa7QHdYh4BPH9a+hEzwykQpyDvMf2uqCFroKYOOj
         5CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=aU/g92V8O2S/ZZdiz5NX1eAbv8iWTGUGsH8frvYwFaY=;
        b=OXfMEiVrf0hit+0hiSNPo2IV2qxBYYLukdqZYY627P46GofeYwgp7dX1rtKu6JPYsQ
         TtUslXW9LK1QPKy5akmnnVKbO9CwRCJyZYUzHinfMU7dTWpA9Ua81jhC3MuzjYstfnZH
         74JskjaZKcnwUch0LFL0tQygvHFL+GqVr8IWZnsq5dfYF1RtRDyj5bJwRKGoCFHRxDnF
         q0gLYssOMJ2m97t0O1QBRvG2lh0URtB2n8xQCenQIFjmMqQwcknJqafP0OAhvkbfNLRN
         2YMvh+EfmSsWHvYXhAcVWpPB9Dx84R44lU7+ZqdcqaicN3uoDZWbBNi+fx+TtZLXFKi9
         A5pQ==
X-Gm-Message-State: AGi0Pub3ItD8r6iwlYY1rC8NE6Cc3QYJYefu6h3g3y649+zEIK3CQoNJ
        lND+17fouMz/7i1wr1re/HE=
X-Google-Smtp-Source: APiQypJZok/5phLARSS4GR0zmzd6eO62VWnIZCz2mw8m2ofYMypIlsbveuKoLpHQp7812OWoyuEhcA==
X-Received: by 2002:a17:902:6901:: with SMTP id j1mr1561878plk.255.1588930200662;
        Fri, 08 May 2020 02:30:00 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id s136sm1306539pfc.29.2020.05.08.02.29.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 May 2020 02:29:59 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: inst.h: Stop including asm.h to avoid various build failures
Date:   Fri,  8 May 2020 17:30:12 +0800
Message-Id: <1588930212-5255-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to
inst.h") causes a lot of build failures because macros in asm.h conflict
with various subsystems. Some of these conflictions has been fixed (such
as LONG, PANIC and PRINT) by adjusting asm.h, but some of them is nearly
impossible to fix (such as PTR and END). The only reason of including
asm.h in inst.h is that we need the PTR macro which is used by unaligned
load/store helpers. So in this patch we define a new PTR_STR macro and
use it to replace STR(PTR), then we can stop including asm.h to avoid
various build failures.

Fixes: d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to inst.h")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/inst.h | 184 ++++++++++++++++++++++---------------------
 1 file changed, 95 insertions(+), 89 deletions(-)

diff --git a/arch/mips/include/asm/inst.h b/arch/mips/include/asm/inst.h
index 8254545..6d74ba3 100644
--- a/arch/mips/include/asm/inst.h
+++ b/arch/mips/include/asm/inst.h
@@ -11,9 +11,15 @@
 #ifndef _ASM_INST_H
 #define _ASM_INST_H
 
-#include <asm/asm.h>
 #include <uapi/asm/inst.h>
 
+#if (_MIPS_SZPTR == 32)
+#define PTR_STR		".word"
+#endif
+#if (_MIPS_SZPTR == 64)
+#define PTR_STR		".dword"
+#endif
+
 /* HACHACHAHCAHC ...  */
 
 /* In case some other massaging is needed, keep MIPSInst as wrapper */
@@ -102,8 +108,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -123,8 +129,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -156,10 +162,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -184,8 +190,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -207,8 +213,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -227,8 +233,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -260,10 +266,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -305,14 +311,14 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
-		STR(PTR)"\t5b, 11b\n\t"		    \
-		STR(PTR)"\t6b, 11b\n\t"		    \
-		STR(PTR)"\t7b, 11b\n\t"		    \
-		STR(PTR)"\t8b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
+		PTR_STR"\t5b, 11b\n\t"		    \
+		PTR_STR"\t6b, 11b\n\t"		    \
+		PTR_STR"\t7b, 11b\n\t"		    \
+		PTR_STR"\t8b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -337,8 +343,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"              \
+		PTR_STR"\t2b, 4b\n\t"              \
 		".previous"                         \
 		: "=r" (res)                        \
 		: "r" (value), "r" (addr), "i" (-EFAULT));\
@@ -358,8 +364,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=r" (res)                                \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
@@ -378,8 +384,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=r" (res)                                \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
@@ -407,10 +413,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (res)				    \
 		: "r" (value), "r" (addr), "i" (-EFAULT)    \
@@ -447,14 +453,14 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
-		STR(PTR)"\t5b, 11b\n\t"		    \
-		STR(PTR)"\t6b, 11b\n\t"		    \
-		STR(PTR)"\t7b, 11b\n\t"		    \
-		STR(PTR)"\t8b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
+		PTR_STR"\t5b, 11b\n\t"		    \
+		PTR_STR"\t6b, 11b\n\t"		    \
+		PTR_STR"\t7b, 11b\n\t"		    \
+		PTR_STR"\t8b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (res)				    \
 		: "r" (value), "r" (addr), "i" (-EFAULT)    \
@@ -480,8 +486,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -501,8 +507,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -534,10 +540,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -563,8 +569,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -586,8 +592,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -606,8 +612,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -639,10 +645,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -684,14 +690,14 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
-		STR(PTR)"\t5b, 11b\n\t"		    \
-		STR(PTR)"\t6b, 11b\n\t"		    \
-		STR(PTR)"\t7b, 11b\n\t"		    \
-		STR(PTR)"\t8b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
+		PTR_STR"\t5b, 11b\n\t"		    \
+		PTR_STR"\t6b, 11b\n\t"		    \
+		PTR_STR"\t7b, 11b\n\t"		    \
+		PTR_STR"\t8b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -714,8 +720,8 @@ do {                                                 \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=r" (res)                        \
 		: "r" (value), "r" (addr), "i" (-EFAULT));\
@@ -735,8 +741,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=r" (res)                                \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
@@ -755,8 +761,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 4b\n\t"              \
-		STR(PTR)"\t2b, 4b\n\t"              \
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
 		".previous"                         \
 		: "=r" (res)                                \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
@@ -785,10 +791,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (res)				    \
 		: "r" (value), "r" (addr), "i" (-EFAULT)    \
@@ -825,14 +831,14 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		STR(PTR)"\t1b, 11b\n\t"		    \
-		STR(PTR)"\t2b, 11b\n\t"		    \
-		STR(PTR)"\t3b, 11b\n\t"		    \
-		STR(PTR)"\t4b, 11b\n\t"		    \
-		STR(PTR)"\t5b, 11b\n\t"		    \
-		STR(PTR)"\t6b, 11b\n\t"		    \
-		STR(PTR)"\t7b, 11b\n\t"		    \
-		STR(PTR)"\t8b, 11b\n\t"		    \
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
+		PTR_STR"\t5b, 11b\n\t"		    \
+		PTR_STR"\t6b, 11b\n\t"		    \
+		PTR_STR"\t7b, 11b\n\t"		    \
+		PTR_STR"\t8b, 11b\n\t"		    \
 		".previous"			    \
 		: "=&r" (res)				    \
 		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-- 
2.7.0

