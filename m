Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872BE1B7273
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 12:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgDXKr6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 06:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbgDXKr6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Apr 2020 06:47:58 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A0BC09B045
        for <linux-mips@vger.kernel.org>; Fri, 24 Apr 2020 03:47:57 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s18so1786093pgl.12
        for <linux-mips@vger.kernel.org>; Fri, 24 Apr 2020 03:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a8dr9quHc2soVWeNmeyQn2akvR5hb7XlBxZVVdGvMI4=;
        b=lyOOEZD2OZq+CUATMstrSRZXWijikonS8nDBwR6Zqhph9GfHR1oyfVFijbTAmTNvHZ
         S9ZRe4c0a0LIwvnD50EgJIy6vxpWzPFfB14tLcaWbhTVPCgX5BLom+0VfjY6U7Kx0kWO
         WKToRF84AEnOYHIJCuZ0R8Jo1pW3XNq2DjEsWUDR2aRv9c7NsYhs+LhlqkV1Pxy8RMdp
         usLIYnR7+uq4QQSuMk3za/eUzmF2rrLic35pAKKnVoDbUYxqpoDfEVJKEArErHvzr4cn
         w5c/OQ2Gq+VCgWhlOY3xfBqWvLJ9s5iFx7UFaVJU1ZEKF+1SCHeA0jkCtqS5N/Dqk7w2
         S4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=a8dr9quHc2soVWeNmeyQn2akvR5hb7XlBxZVVdGvMI4=;
        b=Lurf2eI6Ub/KTNIZ3C8bWn8QOi1pZgTRgMkOsx03NVNEIrssxDNUnhxvqtj0lU3m5i
         LM0YZfooTvURHPCwn8becSVEXMgMvIHaKgdx9wFd1Ar1E8W2MJF9Lt6pBgcvfbwWPe9g
         K6yek5YgP2hQAi6iC62JQgqFpxSoCThCsgUDi/729PFweEn3/QUX9ntbSZbfe7F72tMI
         jWG2mfc7/16PPAoMFDA80YeRhDG0ikiQOS2UyUnw7QQoyzzw+r1vVG+hpPEPpgp97u4h
         W7f9UN/lk+ulyKnPlHmo/No/PZmcVimifqnTuGOPfWRHwe0nrqBq6gDX3ao6UrlUiBjP
         mOxQ==
X-Gm-Message-State: AGi0PubKyv9aI8i4OOa/9ZwoeGQMIQ0ghOJKd1DZLzW9KcPS1IQqXjQQ
        gDsEnr+jteT4l/hFf/ZMPXE=
X-Google-Smtp-Source: APiQypIXzv7ZcDrDy9XQbdu4MW0ci4xAdtuIAEmcaXwsDtWpv94nv7r6mj6odErPaDGzSVsQqrcaLg==
X-Received: by 2002:a65:4846:: with SMTP id i6mr8338450pgs.75.1587725275382;
        Fri, 24 Apr 2020 03:47:55 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id j2sm5511988pfb.73.2020.04.24.03.47.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2020 03:47:54 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Pei Huang <huangpei@loongson.cn>
Subject: [PATCH V3 2/3] MIPS: Move unaligned load/store helpers to inst.h
Date:   Fri, 24 Apr 2020 18:56:45 +0800
Message-Id: <1587725806-4529-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1587725806-4529-1-git-send-email-chenhc@lemote.com>
References: <1587725806-4529-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move unaligned load/store helpers from unaligned.c to inst.h, then
other parts of the kernel can use these helpers.

Use __ASSEMBLY__ to guard the definition of "LONG" in asm.h to avoid
build error on IPxx platforms.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Pei Huang <huangpei@loongson.cn>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/asm.h  |   4 +
 arch/mips/include/asm/inst.h | 773 ++++++++++++++++++++++++++++++++++++++++++
 arch/mips/kernel/unaligned.c | 775 -------------------------------------------
 3 files changed, 777 insertions(+), 775 deletions(-)

diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index c23527b..934465d 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -202,7 +202,9 @@ symbol		=	value
 #define LONG_SRA	sra
 #define LONG_SRAV	srav
 
+#ifdef __ASSEMBLY__
 #define LONG		.word
+#endif
 #define LONGSIZE	4
 #define LONGMASK	3
 #define LONGLOG		2
@@ -225,7 +227,9 @@ symbol		=	value
 #define LONG_SRA	dsra
 #define LONG_SRAV	dsrav
 
+#ifdef __ASSEMBLY__
 #define LONG		.dword
+#endif
 #define LONGSIZE	8
 #define LONGMASK	7
 #define LONGLOG		3
diff --git a/arch/mips/include/asm/inst.h b/arch/mips/include/asm/inst.h
index 22912f7..8254545 100644
--- a/arch/mips/include/asm/inst.h
+++ b/arch/mips/include/asm/inst.h
@@ -11,6 +11,7 @@
 #ifndef _ASM_INST_H
 #define _ASM_INST_H
 
+#include <asm/asm.h>
 #include <uapi/asm/inst.h>
 
 /* HACHACHAHCAHC ...  */
@@ -85,4 +86,776 @@ struct mm_decoded_insn {
 /* Recode table from 16-bit register notation to 32-bit GPR. Do NOT export!!! */
 extern const int reg16to32[];
 
+#ifdef __BIG_ENDIAN
+#define  _LoadHW(addr, value, res, type)  \
+do {                                                \
+	__asm__ __volatile__ (".set\tnoat\n"        \
+		"1:\t"type##_lb("%0", "0(%2)")"\n"  \
+		"2:\t"type##_lbu("$1", "1(%2)")"\n\t"\
+		"sll\t%0, 0x8\n\t"                  \
+		"or\t%0, $1\n\t"                    \
+		"li\t%1, 0\n"                       \
+		"3:\t.set\tat\n\t"                  \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define  _LoadW(addr, value, res, type)   \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\t"type##_lwl("%0", "(%2)")"\n"   \
+		"2:\t"type##_lwr("%0", "3(%2)")"\n\t"\
+		"li\t%1, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without lwl instruction */
+#define  _LoadW(addr, value, res, type) \
+do {                                                \
+	__asm__ __volatile__ (			    \
+		".set\tpush\n"			    \
+		".set\tnoat\n\t"		    \
+		"1:"type##_lb("%0", "0(%2)")"\n\t"  \
+		"2:"type##_lbu("$1", "1(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"3:"type##_lbu("$1", "2(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"4:"type##_lbu("$1", "3(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"li\t%1, 0\n"			    \
+		".set\tpop\n"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%1, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (value), "=r" (res)	    \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+#define  _LoadHWU(addr, value, res, type) \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		".set\tnoat\n"                      \
+		"1:\t"type##_lbu("%0", "0(%2)")"\n" \
+		"2:\t"type##_lbu("$1", "1(%2)")"\n\t"\
+		"sll\t%0, 0x8\n\t"                  \
+		"or\t%0, $1\n\t"                    \
+		"li\t%1, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".set\tat\n\t"                      \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define  _LoadWU(addr, value, res, type)  \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\t"type##_lwl("%0", "(%2)")"\n"  \
+		"2:\t"type##_lwr("%0", "3(%2)")"\n\t"\
+		"dsll\t%0, %0, 32\n\t"              \
+		"dsrl\t%0, %0, 32\n\t"              \
+		"li\t%1, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		"\t.section\t.fixup,\"ax\"\n\t"     \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#define  _LoadDW(addr, value, res)  \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\tldl\t%0, (%2)\n"               \
+		"2:\tldr\t%0, 7(%2)\n\t"            \
+		"li\t%1, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		"\t.section\t.fixup,\"ax\"\n\t"     \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without lwl and ldl instructions */
+#define  _LoadWU(addr, value, res, type) \
+do {                                                \
+	__asm__ __volatile__ (			    \
+		".set\tpush\n\t"		    \
+		".set\tnoat\n\t"		    \
+		"1:"type##_lbu("%0", "0(%2)")"\n\t" \
+		"2:"type##_lbu("$1", "1(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"3:"type##_lbu("$1", "2(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"4:"type##_lbu("$1", "3(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"li\t%1, 0\n"			    \
+		".set\tpop\n"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%1, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (value), "=r" (res)	    \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#define  _LoadDW(addr, value, res)  \
+do {                                                \
+	__asm__ __volatile__ (			    \
+		".set\tpush\n\t"		    \
+		".set\tnoat\n\t"		    \
+		"1:lb\t%0, 0(%2)\n\t"		    \
+		"2:lbu\t $1, 1(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"3:lbu\t$1, 2(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"4:lbu\t$1, 3(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"5:lbu\t$1, 4(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"6:lbu\t$1, 5(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"7:lbu\t$1, 6(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"8:lbu\t$1, 7(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"li\t%1, 0\n"			    \
+		".set\tpop\n\t"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%1, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		STR(PTR)"\t5b, 11b\n\t"		    \
+		STR(PTR)"\t6b, 11b\n\t"		    \
+		STR(PTR)"\t7b, 11b\n\t"		    \
+		STR(PTR)"\t8b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (value), "=r" (res)	    \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+
+#define  _StoreHW(addr, value, res, type) \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		".set\tnoat\n"                      \
+		"1:\t"type##_sb("%1", "1(%2)")"\n"  \
+		"srl\t$1, %1, 0x8\n"                \
+		"2:\t"type##_sb("$1", "0(%2)")"\n"  \
+		".set\tat\n\t"                      \
+		"li\t%0, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%0, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=r" (res)                        \
+		: "r" (value), "r" (addr), "i" (-EFAULT));\
+} while (0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define  _StoreW(addr, value, res, type)  \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\t"type##_swl("%1", "(%2)")"\n"  \
+		"2:\t"type##_swr("%1", "3(%2)")"\n\t"\
+		"li\t%0, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%0, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=r" (res)                                \
+		: "r" (value), "r" (addr), "i" (-EFAULT));  \
+} while (0)
+
+#define  _StoreDW(addr, value, res) \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\tsdl\t%1,(%2)\n"                \
+		"2:\tsdr\t%1, 7(%2)\n\t"            \
+		"li\t%0, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%0, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=r" (res)                                \
+		: "r" (value), "r" (addr), "i" (-EFAULT));  \
+} while (0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+#define  _StoreW(addr, value, res, type)  \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		".set\tpush\n\t"		    \
+		".set\tnoat\n\t"		    \
+		"1:"type##_sb("%1", "3(%2)")"\n\t"  \
+		"srl\t$1, %1, 0x8\n\t"		    \
+		"2:"type##_sb("$1", "2(%2)")"\n\t"  \
+		"srl\t$1, $1,  0x8\n\t"		    \
+		"3:"type##_sb("$1", "1(%2)")"\n\t"  \
+		"srl\t$1, $1, 0x8\n\t"		    \
+		"4:"type##_sb("$1", "0(%2)")"\n\t"  \
+		".set\tpop\n\t"			    \
+		"li\t%0, 0\n"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%0, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (res)				    \
+		: "r" (value), "r" (addr), "i" (-EFAULT)    \
+		: "memory");                                \
+} while (0)
+
+#define  _StoreDW(addr, value, res) \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		".set\tpush\n\t"		    \
+		".set\tnoat\n\t"		    \
+		"1:sb\t%1, 7(%2)\n\t"		    \
+		"dsrl\t$1, %1, 0x8\n\t"		    \
+		"2:sb\t$1, 6(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"3:sb\t$1, 5(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"4:sb\t$1, 4(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"5:sb\t$1, 3(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"6:sb\t$1, 2(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"7:sb\t$1, 1(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"8:sb\t$1, 0(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		".set\tpop\n\t"			    \
+		"li\t%0, 0\n"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%0, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		STR(PTR)"\t5b, 11b\n\t"		    \
+		STR(PTR)"\t6b, 11b\n\t"		    \
+		STR(PTR)"\t7b, 11b\n\t"		    \
+		STR(PTR)"\t8b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (res)				    \
+		: "r" (value), "r" (addr), "i" (-EFAULT)    \
+		: "memory");                                \
+} while (0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+#else /* __BIG_ENDIAN */
+
+#define  _LoadHW(addr, value, res, type)  \
+do {                                                \
+	__asm__ __volatile__ (".set\tnoat\n"        \
+		"1:\t"type##_lb("%0", "1(%2)")"\n"  \
+		"2:\t"type##_lbu("$1", "0(%2)")"\n\t"\
+		"sll\t%0, 0x8\n\t"                  \
+		"or\t%0, $1\n\t"                    \
+		"li\t%1, 0\n"                       \
+		"3:\t.set\tat\n\t"                  \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define  _LoadW(addr, value, res, type)   \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\t"type##_lwl("%0", "3(%2)")"\n" \
+		"2:\t"type##_lwr("%0", "(%2)")"\n\t"\
+		"li\t%1, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without lwl instruction */
+#define  _LoadW(addr, value, res, type) \
+do {                                                \
+	__asm__ __volatile__ (			    \
+		".set\tpush\n"			    \
+		".set\tnoat\n\t"		    \
+		"1:"type##_lb("%0", "3(%2)")"\n\t"  \
+		"2:"type##_lbu("$1", "2(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"3:"type##_lbu("$1", "1(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"4:"type##_lbu("$1", "0(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"li\t%1, 0\n"			    \
+		".set\tpop\n"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%1, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (value), "=r" (res)	    \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+
+#define  _LoadHWU(addr, value, res, type) \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		".set\tnoat\n"                      \
+		"1:\t"type##_lbu("%0", "1(%2)")"\n" \
+		"2:\t"type##_lbu("$1", "0(%2)")"\n\t"\
+		"sll\t%0, 0x8\n\t"                  \
+		"or\t%0, $1\n\t"                    \
+		"li\t%1, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".set\tat\n\t"                      \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define  _LoadWU(addr, value, res, type)  \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\t"type##_lwl("%0", "3(%2)")"\n" \
+		"2:\t"type##_lwr("%0", "(%2)")"\n\t"\
+		"dsll\t%0, %0, 32\n\t"              \
+		"dsrl\t%0, %0, 32\n\t"              \
+		"li\t%1, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		"\t.section\t.fixup,\"ax\"\n\t"     \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#define  _LoadDW(addr, value, res)  \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\tldl\t%0, 7(%2)\n"              \
+		"2:\tldr\t%0, (%2)\n\t"             \
+		"li\t%1, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		"\t.section\t.fixup,\"ax\"\n\t"     \
+		"4:\tli\t%1, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=&r" (value), "=r" (res)         \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without lwl and ldl instructions */
+#define  _LoadWU(addr, value, res, type) \
+do {                                                \
+	__asm__ __volatile__ (			    \
+		".set\tpush\n\t"		    \
+		".set\tnoat\n\t"		    \
+		"1:"type##_lbu("%0", "3(%2)")"\n\t" \
+		"2:"type##_lbu("$1", "2(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"3:"type##_lbu("$1", "1(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"4:"type##_lbu("$1", "0(%2)")"\n\t" \
+		"sll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"li\t%1, 0\n"			    \
+		".set\tpop\n"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%1, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (value), "=r" (res)	    \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+
+#define  _LoadDW(addr, value, res)  \
+do {                                                \
+	__asm__ __volatile__ (			    \
+		".set\tpush\n\t"		    \
+		".set\tnoat\n\t"		    \
+		"1:lb\t%0, 7(%2)\n\t"		    \
+		"2:lbu\t$1, 6(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"3:lbu\t$1, 5(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"4:lbu\t$1, 4(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"5:lbu\t$1, 3(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"6:lbu\t$1, 2(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"7:lbu\t$1, 1(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"8:lbu\t$1, 0(%2)\n\t"		    \
+		"dsll\t%0, 0x8\n\t"		    \
+		"or\t%0, $1\n\t"		    \
+		"li\t%1, 0\n"			    \
+		".set\tpop\n\t"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%1, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		STR(PTR)"\t5b, 11b\n\t"		    \
+		STR(PTR)"\t6b, 11b\n\t"		    \
+		STR(PTR)"\t7b, 11b\n\t"		    \
+		STR(PTR)"\t8b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (value), "=r" (res)	    \
+		: "r" (addr), "i" (-EFAULT));       \
+} while (0)
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+#define  _StoreHW(addr, value, res, type) \
+do {                                                 \
+	__asm__ __volatile__ (                      \
+		".set\tnoat\n"                      \
+		"1:\t"type##_sb("%1", "0(%2)")"\n"  \
+		"srl\t$1,%1, 0x8\n"                 \
+		"2:\t"type##_sb("$1", "1(%2)")"\n"  \
+		".set\tat\n\t"                      \
+		"li\t%0, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%0, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=r" (res)                        \
+		: "r" (value), "r" (addr), "i" (-EFAULT));\
+} while (0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define  _StoreW(addr, value, res, type)  \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\t"type##_swl("%1", "3(%2)")"\n" \
+		"2:\t"type##_swr("%1", "(%2)")"\n\t"\
+		"li\t%0, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%0, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=r" (res)                                \
+		: "r" (value), "r" (addr), "i" (-EFAULT));  \
+} while (0)
+
+#define  _StoreDW(addr, value, res) \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		"1:\tsdl\t%1, 7(%2)\n"              \
+		"2:\tsdr\t%1, (%2)\n\t"             \
+		"li\t%0, 0\n"                       \
+		"3:\n\t"                            \
+		".insn\n\t"                         \
+		".section\t.fixup,\"ax\"\n\t"       \
+		"4:\tli\t%0, %3\n\t"                \
+		"j\t3b\n\t"                         \
+		".previous\n\t"                     \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 4b\n\t"              \
+		STR(PTR)"\t2b, 4b\n\t"              \
+		".previous"                         \
+		: "=r" (res)                                \
+		: "r" (value), "r" (addr), "i" (-EFAULT));  \
+} while (0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without swl and sdl instructions */
+#define  _StoreW(addr, value, res, type)  \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		".set\tpush\n\t"		    \
+		".set\tnoat\n\t"		    \
+		"1:"type##_sb("%1", "0(%2)")"\n\t"  \
+		"srl\t$1, %1, 0x8\n\t"		    \
+		"2:"type##_sb("$1", "1(%2)")"\n\t"  \
+		"srl\t$1, $1,  0x8\n\t"		    \
+		"3:"type##_sb("$1", "2(%2)")"\n\t"  \
+		"srl\t$1, $1, 0x8\n\t"		    \
+		"4:"type##_sb("$1", "3(%2)")"\n\t"  \
+		".set\tpop\n\t"			    \
+		"li\t%0, 0\n"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%0, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (res)				    \
+		: "r" (value), "r" (addr), "i" (-EFAULT)    \
+		: "memory");                                \
+} while (0)
+
+#define  _StoreDW(addr, value, res) \
+do {                                                \
+	__asm__ __volatile__ (                      \
+		".set\tpush\n\t"		    \
+		".set\tnoat\n\t"		    \
+		"1:sb\t%1, 0(%2)\n\t"		    \
+		"dsrl\t$1, %1, 0x8\n\t"		    \
+		"2:sb\t$1, 1(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"3:sb\t$1, 2(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"4:sb\t$1, 3(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"5:sb\t$1, 4(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"6:sb\t$1, 5(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"7:sb\t$1, 6(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		"8:sb\t$1, 7(%2)\n\t"		    \
+		"dsrl\t$1, $1, 0x8\n\t"		    \
+		".set\tpop\n\t"			    \
+		"li\t%0, 0\n"			    \
+		"10:\n\t"			    \
+		".insn\n\t"			    \
+		".section\t.fixup,\"ax\"\n\t"	    \
+		"11:\tli\t%0, %3\n\t"		    \
+		"j\t10b\n\t"			    \
+		".previous\n\t"			    \
+		".section\t__ex_table,\"a\"\n\t"    \
+		STR(PTR)"\t1b, 11b\n\t"		    \
+		STR(PTR)"\t2b, 11b\n\t"		    \
+		STR(PTR)"\t3b, 11b\n\t"		    \
+		STR(PTR)"\t4b, 11b\n\t"		    \
+		STR(PTR)"\t5b, 11b\n\t"		    \
+		STR(PTR)"\t6b, 11b\n\t"		    \
+		STR(PTR)"\t7b, 11b\n\t"		    \
+		STR(PTR)"\t8b, 11b\n\t"		    \
+		".previous"			    \
+		: "=&r" (res)				    \
+		: "r" (value), "r" (addr), "i" (-EFAULT)    \
+		: "memory");                                \
+} while (0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+#endif
+
+#define LoadHWU(addr, value, res)	_LoadHWU(addr, value, res, kernel)
+#define LoadHWUE(addr, value, res)	_LoadHWU(addr, value, res, user)
+#define LoadWU(addr, value, res)	_LoadWU(addr, value, res, kernel)
+#define LoadWUE(addr, value, res)	_LoadWU(addr, value, res, user)
+#define LoadHW(addr, value, res)	_LoadHW(addr, value, res, kernel)
+#define LoadHWE(addr, value, res)	_LoadHW(addr, value, res, user)
+#define LoadW(addr, value, res)		_LoadW(addr, value, res, kernel)
+#define LoadWE(addr, value, res)	_LoadW(addr, value, res, user)
+#define LoadDW(addr, value, res)	_LoadDW(addr, value, res)
+
+#define StoreHW(addr, value, res)	_StoreHW(addr, value, res, kernel)
+#define StoreHWE(addr, value, res)	_StoreHW(addr, value, res, user)
+#define StoreW(addr, value, res)	_StoreW(addr, value, res, kernel)
+#define StoreWE(addr, value, res)	_StoreW(addr, value, res, user)
+#define StoreDW(addr, value, res)	_StoreDW(addr, value, res)
+
 #endif /* _ASM_INST_H */
diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index ca6fc47..19b906a 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -92,9 +92,6 @@
 #include <asm/mmu_context.h>
 #include <linux/uaccess.h>
 
-#define STR(x)	__STR(x)
-#define __STR(x)  #x
-
 enum {
 	UNALIGNED_ACTION_QUIET,
 	UNALIGNED_ACTION_SIGNAL,
@@ -108,778 +105,6 @@ static u32 unaligned_action;
 #endif
 extern void show_registers(struct pt_regs *regs);
 
-#ifdef __BIG_ENDIAN
-#define     _LoadHW(addr, value, res, type)  \
-do {                                                        \
-		__asm__ __volatile__ (".set\tnoat\n"        \
-			"1:\t"type##_lb("%0", "0(%2)")"\n"  \
-			"2:\t"type##_lbu("$1", "1(%2)")"\n\t"\
-			"sll\t%0, 0x8\n\t"                  \
-			"or\t%0, $1\n\t"                    \
-			"li\t%1, 0\n"                       \
-			"3:\t.set\tat\n\t"                  \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define     _LoadW(addr, value, res, type)   \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\t"type##_lwl("%0", "(%2)")"\n"   \
-			"2:\t"type##_lwr("%0", "3(%2)")"\n\t"\
-			"li\t%1, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without lwl instruction */
-#define     _LoadW(addr, value, res, type) \
-do {                                                        \
-		__asm__ __volatile__ (			    \
-			".set\tpush\n"			    \
-			".set\tnoat\n\t"		    \
-			"1:"type##_lb("%0", "0(%2)")"\n\t"  \
-			"2:"type##_lbu("$1", "1(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"3:"type##_lbu("$1", "2(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"4:"type##_lbu("$1", "3(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"li\t%1, 0\n"			    \
-			".set\tpop\n"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%1, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			".previous"			    \
-			: "=&r" (value), "=r" (res)	    \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-#define     _LoadHWU(addr, value, res, type) \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			".set\tnoat\n"                      \
-			"1:\t"type##_lbu("%0", "0(%2)")"\n" \
-			"2:\t"type##_lbu("$1", "1(%2)")"\n\t"\
-			"sll\t%0, 0x8\n\t"                  \
-			"or\t%0, $1\n\t"                    \
-			"li\t%1, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".set\tat\n\t"                      \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define     _LoadWU(addr, value, res, type)  \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\t"type##_lwl("%0", "(%2)")"\n"  \
-			"2:\t"type##_lwr("%0", "3(%2)")"\n\t"\
-			"dsll\t%0, %0, 32\n\t"              \
-			"dsrl\t%0, %0, 32\n\t"              \
-			"li\t%1, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			"\t.section\t.fixup,\"ax\"\n\t"     \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#define     _LoadDW(addr, value, res)  \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\tldl\t%0, (%2)\n"               \
-			"2:\tldr\t%0, 7(%2)\n\t"            \
-			"li\t%1, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			"\t.section\t.fixup,\"ax\"\n\t"     \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without lwl and ldl instructions */
-#define	    _LoadWU(addr, value, res, type) \
-do {                                                        \
-		__asm__ __volatile__ (			    \
-			".set\tpush\n\t"		    \
-			".set\tnoat\n\t"		    \
-			"1:"type##_lbu("%0", "0(%2)")"\n\t" \
-			"2:"type##_lbu("$1", "1(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"3:"type##_lbu("$1", "2(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"4:"type##_lbu("$1", "3(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"li\t%1, 0\n"			    \
-			".set\tpop\n"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%1, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			".previous"			    \
-			: "=&r" (value), "=r" (res)	    \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#define     _LoadDW(addr, value, res)  \
-do {                                                        \
-		__asm__ __volatile__ (			    \
-			".set\tpush\n\t"		    \
-			".set\tnoat\n\t"		    \
-			"1:lb\t%0, 0(%2)\n\t"    	    \
-			"2:lbu\t $1, 1(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"3:lbu\t$1, 2(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"4:lbu\t$1, 3(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"5:lbu\t$1, 4(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"6:lbu\t$1, 5(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"7:lbu\t$1, 6(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"8:lbu\t$1, 7(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"li\t%1, 0\n"			    \
-			".set\tpop\n\t"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%1, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			STR(PTR)"\t5b, 11b\n\t"		    \
-			STR(PTR)"\t6b, 11b\n\t"		    \
-			STR(PTR)"\t7b, 11b\n\t"		    \
-			STR(PTR)"\t8b, 11b\n\t"		    \
-			".previous"			    \
-			: "=&r" (value), "=r" (res)	    \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-
-#define     _StoreHW(addr, value, res, type) \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			".set\tnoat\n"                      \
-			"1:\t"type##_sb("%1", "1(%2)")"\n"  \
-			"srl\t$1, %1, 0x8\n"                \
-			"2:\t"type##_sb("$1", "0(%2)")"\n"  \
-			".set\tat\n\t"                      \
-			"li\t%0, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%0, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=r" (res)                        \
-			: "r" (value), "r" (addr), "i" (-EFAULT));\
-} while(0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define     _StoreW(addr, value, res, type)  \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\t"type##_swl("%1", "(%2)")"\n"  \
-			"2:\t"type##_swr("%1", "3(%2)")"\n\t"\
-			"li\t%0, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%0, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-		: "=r" (res)                                \
-		: "r" (value), "r" (addr), "i" (-EFAULT));  \
-} while(0)
-
-#define     _StoreDW(addr, value, res) \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\tsdl\t%1,(%2)\n"                \
-			"2:\tsdr\t%1, 7(%2)\n\t"            \
-			"li\t%0, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%0, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-		: "=r" (res)                                \
-		: "r" (value), "r" (addr), "i" (-EFAULT));  \
-} while(0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-#define     _StoreW(addr, value, res, type)  \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			".set\tpush\n\t"		    \
-			".set\tnoat\n\t"		    \
-			"1:"type##_sb("%1", "3(%2)")"\n\t"  \
-			"srl\t$1, %1, 0x8\n\t"		    \
-			"2:"type##_sb("$1", "2(%2)")"\n\t"  \
-			"srl\t$1, $1,  0x8\n\t"		    \
-			"3:"type##_sb("$1", "1(%2)")"\n\t"  \
-			"srl\t$1, $1, 0x8\n\t"		    \
-			"4:"type##_sb("$1", "0(%2)")"\n\t"  \
-			".set\tpop\n\t"			    \
-			"li\t%0, 0\n"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%0, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			".previous"			    \
-		: "=&r" (res)			    	    \
-		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-		: "memory");                                \
-} while(0)
-
-#define     _StoreDW(addr, value, res) \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			".set\tpush\n\t"		    \
-			".set\tnoat\n\t"		    \
-			"1:sb\t%1, 7(%2)\n\t"    	    \
-			"dsrl\t$1, %1, 0x8\n\t"		    \
-			"2:sb\t$1, 6(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"3:sb\t$1, 5(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"4:sb\t$1, 4(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"5:sb\t$1, 3(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"6:sb\t$1, 2(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"7:sb\t$1, 1(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"8:sb\t$1, 0(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			".set\tpop\n\t"			    \
-			"li\t%0, 0\n"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%0, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			STR(PTR)"\t5b, 11b\n\t"		    \
-			STR(PTR)"\t6b, 11b\n\t"		    \
-			STR(PTR)"\t7b, 11b\n\t"		    \
-			STR(PTR)"\t8b, 11b\n\t"		    \
-			".previous"			    \
-		: "=&r" (res)			    	    \
-		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-		: "memory");                                \
-} while(0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-#else /* __BIG_ENDIAN */
-
-#define     _LoadHW(addr, value, res, type)  \
-do {                                                        \
-		__asm__ __volatile__ (".set\tnoat\n"        \
-			"1:\t"type##_lb("%0", "1(%2)")"\n"  \
-			"2:\t"type##_lbu("$1", "0(%2)")"\n\t"\
-			"sll\t%0, 0x8\n\t"                  \
-			"or\t%0, $1\n\t"                    \
-			"li\t%1, 0\n"                       \
-			"3:\t.set\tat\n\t"                  \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define     _LoadW(addr, value, res, type)   \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\t"type##_lwl("%0", "3(%2)")"\n" \
-			"2:\t"type##_lwr("%0", "(%2)")"\n\t"\
-			"li\t%1, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without lwl instruction */
-#define     _LoadW(addr, value, res, type) \
-do {                                                        \
-		__asm__ __volatile__ (			    \
-			".set\tpush\n"			    \
-			".set\tnoat\n\t"		    \
-			"1:"type##_lb("%0", "3(%2)")"\n\t"  \
-			"2:"type##_lbu("$1", "2(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"3:"type##_lbu("$1", "1(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"4:"type##_lbu("$1", "0(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"li\t%1, 0\n"			    \
-			".set\tpop\n"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%1, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			".previous"			    \
-			: "=&r" (value), "=r" (res)	    \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-
-#define     _LoadHWU(addr, value, res, type) \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			".set\tnoat\n"                      \
-			"1:\t"type##_lbu("%0", "1(%2)")"\n" \
-			"2:\t"type##_lbu("$1", "0(%2)")"\n\t"\
-			"sll\t%0, 0x8\n\t"                  \
-			"or\t%0, $1\n\t"                    \
-			"li\t%1, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".set\tat\n\t"                      \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define     _LoadWU(addr, value, res, type)  \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\t"type##_lwl("%0", "3(%2)")"\n" \
-			"2:\t"type##_lwr("%0", "(%2)")"\n\t"\
-			"dsll\t%0, %0, 32\n\t"              \
-			"dsrl\t%0, %0, 32\n\t"              \
-			"li\t%1, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			"\t.section\t.fixup,\"ax\"\n\t"     \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#define     _LoadDW(addr, value, res)  \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\tldl\t%0, 7(%2)\n"              \
-			"2:\tldr\t%0, (%2)\n\t"             \
-			"li\t%1, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			"\t.section\t.fixup,\"ax\"\n\t"     \
-			"4:\tli\t%1, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=&r" (value), "=r" (res)         \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without lwl and ldl instructions */
-#define	    _LoadWU(addr, value, res, type) \
-do {                                                        \
-		__asm__ __volatile__ (			    \
-			".set\tpush\n\t"		    \
-			".set\tnoat\n\t"		    \
-			"1:"type##_lbu("%0", "3(%2)")"\n\t" \
-			"2:"type##_lbu("$1", "2(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"3:"type##_lbu("$1", "1(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"4:"type##_lbu("$1", "0(%2)")"\n\t" \
-			"sll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"li\t%1, 0\n"			    \
-			".set\tpop\n"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%1, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			".previous"			    \
-			: "=&r" (value), "=r" (res)	    \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-
-#define     _LoadDW(addr, value, res)  \
-do {                                                        \
-		__asm__ __volatile__ (			    \
-			".set\tpush\n\t"		    \
-			".set\tnoat\n\t"		    \
-			"1:lb\t%0, 7(%2)\n\t"    	    \
-			"2:lbu\t$1, 6(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"3:lbu\t$1, 5(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"4:lbu\t$1, 4(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"5:lbu\t$1, 3(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"6:lbu\t$1, 2(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"7:lbu\t$1, 1(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"8:lbu\t$1, 0(%2)\n\t"   	    \
-			"dsll\t%0, 0x8\n\t"		    \
-			"or\t%0, $1\n\t"		    \
-			"li\t%1, 0\n"			    \
-			".set\tpop\n\t"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%1, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			STR(PTR)"\t5b, 11b\n\t"		    \
-			STR(PTR)"\t6b, 11b\n\t"		    \
-			STR(PTR)"\t7b, 11b\n\t"		    \
-			STR(PTR)"\t8b, 11b\n\t"		    \
-			".previous"			    \
-			: "=&r" (value), "=r" (res)	    \
-			: "r" (addr), "i" (-EFAULT));       \
-} while(0)
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-#define     _StoreHW(addr, value, res, type) \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			".set\tnoat\n"                      \
-			"1:\t"type##_sb("%1", "0(%2)")"\n"  \
-			"srl\t$1,%1, 0x8\n"                 \
-			"2:\t"type##_sb("$1", "1(%2)")"\n"  \
-			".set\tat\n\t"                      \
-			"li\t%0, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%0, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-			: "=r" (res)                        \
-			: "r" (value), "r" (addr), "i" (-EFAULT));\
-} while(0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define     _StoreW(addr, value, res, type)  \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\t"type##_swl("%1", "3(%2)")"\n" \
-			"2:\t"type##_swr("%1", "(%2)")"\n\t"\
-			"li\t%0, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%0, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-		: "=r" (res)                                \
-		: "r" (value), "r" (addr), "i" (-EFAULT));  \
-} while(0)
-
-#define     _StoreDW(addr, value, res) \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			"1:\tsdl\t%1, 7(%2)\n"              \
-			"2:\tsdr\t%1, (%2)\n\t"             \
-			"li\t%0, 0\n"                       \
-			"3:\n\t"                            \
-			".insn\n\t"                         \
-			".section\t.fixup,\"ax\"\n\t"       \
-			"4:\tli\t%0, %3\n\t"                \
-			"j\t3b\n\t"                         \
-			".previous\n\t"                     \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 4b\n\t"              \
-			STR(PTR)"\t2b, 4b\n\t"              \
-			".previous"                         \
-		: "=r" (res)                                \
-		: "r" (value), "r" (addr), "i" (-EFAULT));  \
-} while(0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without swl and sdl instructions */
-#define     _StoreW(addr, value, res, type)  \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			".set\tpush\n\t"		    \
-			".set\tnoat\n\t"		    \
-			"1:"type##_sb("%1", "0(%2)")"\n\t"  \
-			"srl\t$1, %1, 0x8\n\t"		    \
-			"2:"type##_sb("$1", "1(%2)")"\n\t"  \
-			"srl\t$1, $1,  0x8\n\t"		    \
-			"3:"type##_sb("$1", "2(%2)")"\n\t"  \
-			"srl\t$1, $1, 0x8\n\t"		    \
-			"4:"type##_sb("$1", "3(%2)")"\n\t"  \
-			".set\tpop\n\t"			    \
-			"li\t%0, 0\n"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%0, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			".previous"			    \
-		: "=&r" (res)			    	    \
-		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-		: "memory");                                \
-} while(0)
-
-#define     _StoreDW(addr, value, res) \
-do {                                                        \
-		__asm__ __volatile__ (                      \
-			".set\tpush\n\t"		    \
-			".set\tnoat\n\t"		    \
-			"1:sb\t%1, 0(%2)\n\t"    	    \
-			"dsrl\t$1, %1, 0x8\n\t"		    \
-			"2:sb\t$1, 1(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"3:sb\t$1, 2(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"4:sb\t$1, 3(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"5:sb\t$1, 4(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"6:sb\t$1, 5(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"7:sb\t$1, 6(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			"8:sb\t$1, 7(%2)\n\t"    	    \
-			"dsrl\t$1, $1, 0x8\n\t"		    \
-			".set\tpop\n\t"			    \
-			"li\t%0, 0\n"			    \
-			"10:\n\t"			    \
-			".insn\n\t"			    \
-			".section\t.fixup,\"ax\"\n\t"	    \
-			"11:\tli\t%0, %3\n\t"		    \
-			"j\t10b\n\t"			    \
-			".previous\n\t"			    \
-			".section\t__ex_table,\"a\"\n\t"    \
-			STR(PTR)"\t1b, 11b\n\t"		    \
-			STR(PTR)"\t2b, 11b\n\t"		    \
-			STR(PTR)"\t3b, 11b\n\t"		    \
-			STR(PTR)"\t4b, 11b\n\t"		    \
-			STR(PTR)"\t5b, 11b\n\t"		    \
-			STR(PTR)"\t6b, 11b\n\t"		    \
-			STR(PTR)"\t7b, 11b\n\t"		    \
-			STR(PTR)"\t8b, 11b\n\t"		    \
-			".previous"			    \
-		: "=&r" (res)			    	    \
-		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-		: "memory");                                \
-} while(0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-#endif
-
-#define LoadHWU(addr, value, res)	_LoadHWU(addr, value, res, kernel)
-#define LoadHWUE(addr, value, res)	_LoadHWU(addr, value, res, user)
-#define LoadWU(addr, value, res)	_LoadWU(addr, value, res, kernel)
-#define LoadWUE(addr, value, res)	_LoadWU(addr, value, res, user)
-#define LoadHW(addr, value, res)	_LoadHW(addr, value, res, kernel)
-#define LoadHWE(addr, value, res)	_LoadHW(addr, value, res, user)
-#define LoadW(addr, value, res)		_LoadW(addr, value, res, kernel)
-#define LoadWE(addr, value, res)	_LoadW(addr, value, res, user)
-#define LoadDW(addr, value, res)	_LoadDW(addr, value, res)
-
-#define StoreHW(addr, value, res)	_StoreHW(addr, value, res, kernel)
-#define StoreHWE(addr, value, res)	_StoreHW(addr, value, res, user)
-#define StoreW(addr, value, res)	_StoreW(addr, value, res, kernel)
-#define StoreWE(addr, value, res)	_StoreW(addr, value, res, user)
-#define StoreDW(addr, value, res)	_StoreDW(addr, value, res)
-
 static void emulate_load_store_insn(struct pt_regs *regs,
 	void __user *addr, unsigned int __user *pc)
 {
-- 
2.7.0

