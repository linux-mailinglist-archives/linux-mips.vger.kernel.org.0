Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3194E6CCE
	for <lists+linux-mips@lfdr.de>; Fri, 25 Mar 2022 04:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbiCYDRQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Mar 2022 23:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358185AbiCYDRP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Mar 2022 23:17:15 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36D9C559F
        for <linux-mips@vger.kernel.org>; Thu, 24 Mar 2022 20:15:42 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id bc27so5397180pgb.4
        for <linux-mips@vger.kernel.org>; Thu, 24 Mar 2022 20:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PaMmenoXhvYnS6M3WdeNwgolfRDcJpOHI13Au9iL+Eo=;
        b=L68CQGZCsahfg7c4Yo9Moxi7chtogDzNjQqLUTVyhY3gG+EclAbDE2cOLGvgiNXJjR
         pqNomuWLneKK+EVUz97NyKx/elVvEAQnor6LlocXk4AOPxbTEe35Brze9Q3vV7Wq4P5i
         bEHXt7uhpGZJztZyE74LZk2RjMiFTJDhdK+/rbb86QYyywPV3iQAKmfCCbW/SWTGzzH9
         H7tQbWfsIJn9cOTHQ2NYpWZ4xumLcQ7IIARPh+Wf+tc3VV3P9b1M0vrnR6zGS4CJUJhr
         UIF/Gx5PMO3u2FtR32myrLrUeNVFcRN3GED9HVq0Kjan/dcqtlJruWfuc7/wGaKkyVKU
         mTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PaMmenoXhvYnS6M3WdeNwgolfRDcJpOHI13Au9iL+Eo=;
        b=FDMiooc1LVS9fvk00quIecuEpHWgaStCJyFVi5J3ur7gc6jHzN0HsB+E4BdLKqItFZ
         0rjAEeooAO2CVwp2lyTUPRdDNzeh90lfhQn/ssKIgAQlcEvQQjSllpoeAuKM2j4k7+76
         p5qSXa+NLnpODhOU86LGBx/g19DYC5ugqiBWFg7MH3FU8c8DtcKCPfZxsR2i068L6Xco
         Nwc4ZxR63ImkykGz/xEqx1zWKhVeHRws4tg56wKuQ7nGlDw8Yg5zgAQzeq+bwqSY4ycq
         Ht58/AbW59vJ6dYXBvfylAPTu2NGxHo7dd3LmiIAtMQx2CYuANPumu8lpQyOW/Gnba7r
         De4w==
X-Gm-Message-State: AOAM530ulrpplEl+PxzDyKLcRCx9zrr2vpRoWWjABdNaXnJUWeJWB3+t
        rHTH+Q5Kq7/8l4gbO5bJSWM=
X-Google-Smtp-Source: ABdhPJxBhfdnCg0Q+eGTG8dOLW/YqSM4+heklSAMU6BQok20lysghLL4/pKvI1zdUCX2UIwCpzElOQ==
X-Received: by 2002:a05:6a00:a1d:b0:4f6:5051:6183 with SMTP id p29-20020a056a000a1d00b004f650516183mr7936363pfh.42.1648178142077;
        Thu, 24 Mar 2022 20:15:42 -0700 (PDT)
Received: from localhost.localdomain ([192.161.177.252])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090aa58100b001bcb7bad374sm10708795pjq.17.2022.03.24.20.15.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Mar 2022 20:15:41 -0700 (PDT)
From:   Feiyang Chen <chris.chenfeiyang@gmail.com>
X-Google-Original-From: Feiyang Chen <chenfeiyang@loongson.cn>
To:     tsbogend@alpha.franken.de
Cc:     Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, chris.chenfeiyang@gmail.com,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: Fix inline assembly in uaccess.h
Date:   Fri, 25 Mar 2022 11:15:32 +0800
Message-Id: <19656f7bfbc17f90ca4e2f2d576171d7151d6684.1648178000.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The inline assembly of __put_data_asm() and __put_data_asm_ll32()
treat memory addresses to be written as input operands, which may
cause the compiler to incorrectly optimize.

Treat these addresses as output operands. BTW, rewrite the inline
assembly to improve readability.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 arch/mips/include/asm/uaccess.h | 38 +++++++++++++++++----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index c0cede273c7c..dc5bca09f39a 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -207,19 +207,19 @@ struct __large_struct { unsigned long buf[100]; };
 	long __gu_tmp;							\
 									\
 	__asm__ __volatile__(						\
-	"1:	"insn("%1", "%3")"				\n"	\
+	"1:	"insn("%1", "%2")"				\n"	\
 	"2:							\n"	\
 	"	.insn						\n"	\
 	"	.section .fixup,\"ax\"				\n"	\
-	"3:	li	%0, %4					\n"	\
+	"3:	li	%0, %3					\n"	\
 	"	move	%1, $0					\n"	\
 	"	j	2b					\n"	\
 	"	.previous					\n"	\
 	"	.section __ex_table,\"a\"			\n"	\
 	"	"__UA_ADDR "\t1b, 3b				\n"	\
 	"	.previous					\n"	\
-	: "=r" (__gu_err), "=r" (__gu_tmp)				\
-	: "0" (0), "o" (__m(addr)), "i" (-EFAULT));			\
+	: "+r" (__gu_err), "=r" (__gu_tmp)				\
+	: "m" (__m(addr)), "i" (-EFAULT));				\
 									\
 	(val) = (__typeof__(*(addr))) __gu_tmp;				\
 }
@@ -234,9 +234,11 @@ struct __large_struct { unsigned long buf[100]; };
 		__typeof__(*(addr))	t;				\
 	} __gu_tmp;							\
 									\
+	void *__addr = (void *)addr;					\
+									\
 	__asm__ __volatile__(						\
-	"1:	" insn("%1", "(%3)")"				\n"	\
-	"2:	" insn("%D1", "4(%3)")"				\n"	\
+	"1:	" insn("%1", "%2")"				\n"	\
+	"2:	" insn("%D1", "%3")"				\n"	\
 	"3:							\n"	\
 	"	.insn						\n"	\
 	"	.section	.fixup,\"ax\"			\n"	\
@@ -249,8 +251,8 @@ struct __large_struct { unsigned long buf[100]; };
 	"	" __UA_ADDR "	1b, 4b				\n"	\
 	"	" __UA_ADDR "	2b, 4b				\n"	\
 	"	.previous					\n"	\
-	: "=r" (__gu_err), "=&r" (__gu_tmp.l)				\
-	: "0" (0), "r" (addr), "i" (-EFAULT));				\
+	: "+r" (__gu_err), "=&r" (__gu_tmp.l)				\
+	: "m" (__m(__addr)), "m" (__m(__addr + 4)), "i" (-EFAULT));	\
 									\
 	(val) = __gu_tmp.t;						\
 }
@@ -298,26 +300,27 @@ do {									\
 #define __put_data_asm(insn, ptr)					\
 {									\
 	__asm__ __volatile__(						\
-	"1:	"insn("%z2", "%3")"	# __put_data_asm	\n"	\
+	"1:	"insn("%z2", "%1")"	# __put_data_asm	\n"	\
 	"2:							\n"	\
 	"	.insn						\n"	\
 	"	.section	.fixup,\"ax\"			\n"	\
-	"3:	li	%0, %4					\n"	\
+	"3:	li	%0, %3					\n"	\
 	"	j	2b					\n"	\
 	"	.previous					\n"	\
 	"	.section	__ex_table,\"a\"		\n"	\
 	"	" __UA_ADDR "	1b, 3b				\n"	\
 	"	.previous					\n"	\
-	: "=r" (__pu_err)						\
-	: "0" (0), "Jr" (__pu_val), "o" (__m(ptr)),			\
-	  "i" (-EFAULT));						\
+	: "+r" (__pu_err), "=m" (__m(ptr))				\
+	: "Jr" (__pu_val), "i" (-EFAULT));				\
 }
 
 #define __put_data_asm_ll32(insn, ptr)					\
 {									\
+	void *__ptr = (void *)ptr;					\
+									\
 	__asm__ __volatile__(						\
-	"1:	"insn("%2", "(%3)")"	# __put_data_asm_ll32	\n"	\
-	"2:	"insn("%D2", "4(%3)")"				\n"	\
+	"1:	"insn("%3", "%1")"	# __put_data_asm_ll32	\n"	\
+	"2:	"insn("%D3", "%2")"				\n"	\
 	"3:							\n"	\
 	"	.insn						\n"	\
 	"	.section	.fixup,\"ax\"			\n"	\
@@ -328,9 +331,8 @@ do {									\
 	"	" __UA_ADDR "	1b, 4b				\n"	\
 	"	" __UA_ADDR "	2b, 4b				\n"	\
 	"	.previous"						\
-	: "=r" (__pu_err)						\
-	: "0" (0), "r" (__pu_val), "r" (ptr),				\
-	  "i" (-EFAULT));						\
+	: "+r" (__pu_err), "=m" (__m(__ptr)), "=m" (__m(__ptr + 4))	\
+	: "r" (__pu_val),  "i" (-EFAULT));				\
 }
 
 #define __put_kernel_nofault(dst, src, type, err_label)			\
-- 
2.27.0

