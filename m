Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BE01B3B61
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 11:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgDVJcE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 05:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725810AbgDVJcE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Apr 2020 05:32:04 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4951EC03C1A8
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2020 02:32:04 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mq3so650999pjb.1
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2020 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I7U9rm/i7hI41GiremX7iqxLl4Qsn2guN5z9esWivYY=;
        b=mDqsyamyFlRHLVktACASUEpMfgh3Aj2QRiVDpj9eNzH1zdbxjjjbVlXNBek7fyWope
         FNo8sod0UqSpVb/2CadFsWAQ4Hvf9KVU3A387PI1ujgK9dFDe/5FMggLqQX2F1Qx6eSF
         9kHfjZMQVSraW3QyIP2m+aZ9BQaa0P7XfTSJjktkp4AS5bDC9FfbYaW2zocBYVZLzxDB
         sDAwrBm12XclZPTL8Tgerwi+lZ19J7GpKJxL4JDmLtxv/VlIA3FAqcJq/gnfB7l4LcH2
         CCJHs0JrW8zYqdnY2ENMHMNp0xWcawbrNdsGLt414p5u3++/TJZqpOu0e4lHxBnRP8ms
         hhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=I7U9rm/i7hI41GiremX7iqxLl4Qsn2guN5z9esWivYY=;
        b=fHkey/NPvTo7+nQ+K7vV2s0bDE4DwkkkDG/pbwQlK+q8XJa1OO5fBQRwiwOtiouAyN
         XtEYr490z8fWW44WrPJKPfNqM19wK+4W88CG+2ntWh7n70LTsVByCx6RQsZtjYR/kDAg
         x4a6vCc2uH67ZQUsCDtaHe28ofdbpasbox3nky1ZzD6U2y12y0+5rKYQqBuSzksTxqAw
         V+KVS23NHkD5zVTQk84dH7dicFEI5ZBaHzuFCh1miAm+Ml1AISb7UZ4gdx6Q+fhbBU+k
         amt+ZTYGBb96iztFQdgIZKmHyolO5h4ZtVjoY5ijSs5SvnTrUViSbag7P25ss1PJoxrK
         uBJQ==
X-Gm-Message-State: AGi0PubY0cjLl1Hggah+KRIMDYrz47lPYgIM/7b3RZa5aM3ohYuC2vK8
        xGPXlGVeHKiW/6+j+XyCDffAgaM4WXc=
X-Google-Smtp-Source: APiQypJ4pmDMcX0Y9Q+6Y+WAso0d4TgfNt7hspo1TE+D745P/kC7BC3uFJUTP8d6MAt65YYEh5qgcw==
X-Received: by 2002:a17:90a:8d02:: with SMTP id c2mr10576159pjo.113.1587547922764;
        Wed, 22 Apr 2020 02:32:02 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id n69sm4957772pjc.8.2020.04.22.02.32.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 02:32:02 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Pei Huang <huangpei@loongson.cn>,
        Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Subject: [PATCH V2 2/3] MIPS: Move unaligned load/store helpers to inst.h
Date:   Wed, 22 Apr 2020 17:40:21 +0800
Message-Id: <1587548422-10707-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1587548422-10707-1-git-send-email-chenhc@lemote.com>
References: <1587548422-10707-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move unaligned load/store helpers from unaligned.c to inst.h, then
other parts of the kernel can use these helpers.

Signed-off-by: Pei Huang <huangpei@loongson.cn>
Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/inst.h | 773 ++++++++++++++++++++++++++++++++++++++++++
 arch/mips/kernel/unaligned.c | 775 -------------------------------------------
 2 files changed, 773 insertions(+), 775 deletions(-)

diff --git a/arch/mips/include/asm/inst.h b/arch/mips/include/asm/inst.h
index 22912f7..9fc583c 100644
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
+#define     _LoadHW(addr, value, res, type)  \
+do {                                                        \
+		__asm__ __volatile__ (".set\tnoat\n"        \
+			"1:\t"type##_lb("%0", "0(%2)")"\n"  \
+			"2:\t"type##_lbu("$1", "1(%2)")"\n\t"\
+			"sll\t%0, 0x8\n\t"                  \
+			"or\t%0, $1\n\t"                    \
+			"li\t%1, 0\n"                       \
+			"3:\t.set\tat\n\t"                  \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define     _LoadW(addr, value, res, type)   \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\t"type##_lwl("%0", "(%2)")"\n"   \
+			"2:\t"type##_lwr("%0", "3(%2)")"\n\t"\
+			"li\t%1, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without lwl instruction */
+#define     _LoadW(addr, value, res, type) \
+do {                                                        \
+		__asm__ __volatile__ (			    \
+			".set\tpush\n"			    \
+			".set\tnoat\n\t"		    \
+			"1:"type##_lb("%0", "0(%2)")"\n\t"  \
+			"2:"type##_lbu("$1", "1(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"3:"type##_lbu("$1", "2(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"4:"type##_lbu("$1", "3(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"li\t%1, 0\n"			    \
+			".set\tpop\n"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%1, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			".previous"			    \
+			: "=&r" (value), "=r" (res)	    \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+#define     _LoadHWU(addr, value, res, type) \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			".set\tnoat\n"                      \
+			"1:\t"type##_lbu("%0", "0(%2)")"\n" \
+			"2:\t"type##_lbu("$1", "1(%2)")"\n\t"\
+			"sll\t%0, 0x8\n\t"                  \
+			"or\t%0, $1\n\t"                    \
+			"li\t%1, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".set\tat\n\t"                      \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define     _LoadWU(addr, value, res, type)  \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\t"type##_lwl("%0", "(%2)")"\n"  \
+			"2:\t"type##_lwr("%0", "3(%2)")"\n\t"\
+			"dsll\t%0, %0, 32\n\t"              \
+			"dsrl\t%0, %0, 32\n\t"              \
+			"li\t%1, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			"\t.section\t.fixup,\"ax\"\n\t"     \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#define     _LoadDW(addr, value, res)  \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\tldl\t%0, (%2)\n"               \
+			"2:\tldr\t%0, 7(%2)\n\t"            \
+			"li\t%1, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			"\t.section\t.fixup,\"ax\"\n\t"     \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without lwl and ldl instructions */
+#define	    _LoadWU(addr, value, res, type) \
+do {                                                        \
+		__asm__ __volatile__ (			    \
+			".set\tpush\n\t"		    \
+			".set\tnoat\n\t"		    \
+			"1:"type##_lbu("%0", "0(%2)")"\n\t" \
+			"2:"type##_lbu("$1", "1(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"3:"type##_lbu("$1", "2(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"4:"type##_lbu("$1", "3(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"li\t%1, 0\n"			    \
+			".set\tpop\n"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%1, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			".previous"			    \
+			: "=&r" (value), "=r" (res)	    \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#define     _LoadDW(addr, value, res)  \
+do {                                                        \
+		__asm__ __volatile__ (			    \
+			".set\tpush\n\t"		    \
+			".set\tnoat\n\t"		    \
+			"1:lb\t%0, 0(%2)\n\t"    	    \
+			"2:lbu\t $1, 1(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"3:lbu\t$1, 2(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"4:lbu\t$1, 3(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"5:lbu\t$1, 4(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"6:lbu\t$1, 5(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"7:lbu\t$1, 6(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"8:lbu\t$1, 7(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"li\t%1, 0\n"			    \
+			".set\tpop\n\t"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%1, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			STR(PTR)"\t5b, 11b\n\t"		    \
+			STR(PTR)"\t6b, 11b\n\t"		    \
+			STR(PTR)"\t7b, 11b\n\t"		    \
+			STR(PTR)"\t8b, 11b\n\t"		    \
+			".previous"			    \
+			: "=&r" (value), "=r" (res)	    \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+
+#define     _StoreHW(addr, value, res, type) \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			".set\tnoat\n"                      \
+			"1:\t"type##_sb("%1", "1(%2)")"\n"  \
+			"srl\t$1, %1, 0x8\n"                \
+			"2:\t"type##_sb("$1", "0(%2)")"\n"  \
+			".set\tat\n\t"                      \
+			"li\t%0, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%0, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=r" (res)                        \
+			: "r" (value), "r" (addr), "i" (-EFAULT));\
+} while(0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define     _StoreW(addr, value, res, type)  \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\t"type##_swl("%1", "(%2)")"\n"  \
+			"2:\t"type##_swr("%1", "3(%2)")"\n\t"\
+			"li\t%0, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%0, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+		: "=r" (res)                                \
+		: "r" (value), "r" (addr), "i" (-EFAULT));  \
+} while(0)
+
+#define     _StoreDW(addr, value, res) \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\tsdl\t%1,(%2)\n"                \
+			"2:\tsdr\t%1, 7(%2)\n\t"            \
+			"li\t%0, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%0, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+		: "=r" (res)                                \
+		: "r" (value), "r" (addr), "i" (-EFAULT));  \
+} while(0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+#define     _StoreW(addr, value, res, type)  \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			".set\tpush\n\t"		    \
+			".set\tnoat\n\t"		    \
+			"1:"type##_sb("%1", "3(%2)")"\n\t"  \
+			"srl\t$1, %1, 0x8\n\t"		    \
+			"2:"type##_sb("$1", "2(%2)")"\n\t"  \
+			"srl\t$1, $1,  0x8\n\t"		    \
+			"3:"type##_sb("$1", "1(%2)")"\n\t"  \
+			"srl\t$1, $1, 0x8\n\t"		    \
+			"4:"type##_sb("$1", "0(%2)")"\n\t"  \
+			".set\tpop\n\t"			    \
+			"li\t%0, 0\n"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%0, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			".previous"			    \
+		: "=&r" (res)			    	    \
+		: "r" (value), "r" (addr), "i" (-EFAULT)    \
+		: "memory");                                \
+} while(0)
+
+#define     _StoreDW(addr, value, res) \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			".set\tpush\n\t"		    \
+			".set\tnoat\n\t"		    \
+			"1:sb\t%1, 7(%2)\n\t"    	    \
+			"dsrl\t$1, %1, 0x8\n\t"		    \
+			"2:sb\t$1, 6(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"3:sb\t$1, 5(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"4:sb\t$1, 4(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"5:sb\t$1, 3(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"6:sb\t$1, 2(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"7:sb\t$1, 1(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"8:sb\t$1, 0(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			".set\tpop\n\t"			    \
+			"li\t%0, 0\n"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%0, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			STR(PTR)"\t5b, 11b\n\t"		    \
+			STR(PTR)"\t6b, 11b\n\t"		    \
+			STR(PTR)"\t7b, 11b\n\t"		    \
+			STR(PTR)"\t8b, 11b\n\t"		    \
+			".previous"			    \
+		: "=&r" (res)			    	    \
+		: "r" (value), "r" (addr), "i" (-EFAULT)    \
+		: "memory");                                \
+} while(0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+#else /* __BIG_ENDIAN */
+
+#define     _LoadHW(addr, value, res, type)  \
+do {                                                        \
+		__asm__ __volatile__ (".set\tnoat\n"        \
+			"1:\t"type##_lb("%0", "1(%2)")"\n"  \
+			"2:\t"type##_lbu("$1", "0(%2)")"\n\t"\
+			"sll\t%0, 0x8\n\t"                  \
+			"or\t%0, $1\n\t"                    \
+			"li\t%1, 0\n"                       \
+			"3:\t.set\tat\n\t"                  \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define     _LoadW(addr, value, res, type)   \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\t"type##_lwl("%0", "3(%2)")"\n" \
+			"2:\t"type##_lwr("%0", "(%2)")"\n\t"\
+			"li\t%1, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without lwl instruction */
+#define     _LoadW(addr, value, res, type) \
+do {                                                        \
+		__asm__ __volatile__ (			    \
+			".set\tpush\n"			    \
+			".set\tnoat\n\t"		    \
+			"1:"type##_lb("%0", "3(%2)")"\n\t"  \
+			"2:"type##_lbu("$1", "2(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"3:"type##_lbu("$1", "1(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"4:"type##_lbu("$1", "0(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"li\t%1, 0\n"			    \
+			".set\tpop\n"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%1, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			".previous"			    \
+			: "=&r" (value), "=r" (res)	    \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+
+#define     _LoadHWU(addr, value, res, type) \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			".set\tnoat\n"                      \
+			"1:\t"type##_lbu("%0", "1(%2)")"\n" \
+			"2:\t"type##_lbu("$1", "0(%2)")"\n\t"\
+			"sll\t%0, 0x8\n\t"                  \
+			"or\t%0, $1\n\t"                    \
+			"li\t%1, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".set\tat\n\t"                      \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define     _LoadWU(addr, value, res, type)  \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\t"type##_lwl("%0", "3(%2)")"\n" \
+			"2:\t"type##_lwr("%0", "(%2)")"\n\t"\
+			"dsll\t%0, %0, 32\n\t"              \
+			"dsrl\t%0, %0, 32\n\t"              \
+			"li\t%1, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			"\t.section\t.fixup,\"ax\"\n\t"     \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#define     _LoadDW(addr, value, res)  \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\tldl\t%0, 7(%2)\n"              \
+			"2:\tldr\t%0, (%2)\n\t"             \
+			"li\t%1, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			"\t.section\t.fixup,\"ax\"\n\t"     \
+			"4:\tli\t%1, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=&r" (value), "=r" (res)         \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without lwl and ldl instructions */
+#define	    _LoadWU(addr, value, res, type) \
+do {                                                        \
+		__asm__ __volatile__ (			    \
+			".set\tpush\n\t"		    \
+			".set\tnoat\n\t"		    \
+			"1:"type##_lbu("%0", "3(%2)")"\n\t" \
+			"2:"type##_lbu("$1", "2(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"3:"type##_lbu("$1", "1(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"4:"type##_lbu("$1", "0(%2)")"\n\t" \
+			"sll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"li\t%1, 0\n"			    \
+			".set\tpop\n"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%1, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			".previous"			    \
+			: "=&r" (value), "=r" (res)	    \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+
+#define     _LoadDW(addr, value, res)  \
+do {                                                        \
+		__asm__ __volatile__ (			    \
+			".set\tpush\n\t"		    \
+			".set\tnoat\n\t"		    \
+			"1:lb\t%0, 7(%2)\n\t"    	    \
+			"2:lbu\t$1, 6(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"3:lbu\t$1, 5(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"4:lbu\t$1, 4(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"5:lbu\t$1, 3(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"6:lbu\t$1, 2(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"7:lbu\t$1, 1(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"8:lbu\t$1, 0(%2)\n\t"   	    \
+			"dsll\t%0, 0x8\n\t"		    \
+			"or\t%0, $1\n\t"		    \
+			"li\t%1, 0\n"			    \
+			".set\tpop\n\t"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%1, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			STR(PTR)"\t5b, 11b\n\t"		    \
+			STR(PTR)"\t6b, 11b\n\t"		    \
+			STR(PTR)"\t7b, 11b\n\t"		    \
+			STR(PTR)"\t8b, 11b\n\t"		    \
+			".previous"			    \
+			: "=&r" (value), "=r" (res)	    \
+			: "r" (addr), "i" (-EFAULT));       \
+} while(0)
+#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
+
+#define     _StoreHW(addr, value, res, type) \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			".set\tnoat\n"                      \
+			"1:\t"type##_sb("%1", "0(%2)")"\n"  \
+			"srl\t$1,%1, 0x8\n"                 \
+			"2:\t"type##_sb("$1", "1(%2)")"\n"  \
+			".set\tat\n\t"                      \
+			"li\t%0, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%0, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+			: "=r" (res)                        \
+			: "r" (value), "r" (addr), "i" (-EFAULT));\
+} while(0)
+
+#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
+#define     _StoreW(addr, value, res, type)  \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\t"type##_swl("%1", "3(%2)")"\n" \
+			"2:\t"type##_swr("%1", "(%2)")"\n\t"\
+			"li\t%0, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%0, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+		: "=r" (res)                                \
+		: "r" (value), "r" (addr), "i" (-EFAULT));  \
+} while(0)
+
+#define     _StoreDW(addr, value, res) \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			"1:\tsdl\t%1, 7(%2)\n"              \
+			"2:\tsdr\t%1, (%2)\n\t"             \
+			"li\t%0, 0\n"                       \
+			"3:\n\t"                            \
+			".insn\n\t"                         \
+			".section\t.fixup,\"ax\"\n\t"       \
+			"4:\tli\t%0, %3\n\t"                \
+			"j\t3b\n\t"                         \
+			".previous\n\t"                     \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 4b\n\t"              \
+			STR(PTR)"\t2b, 4b\n\t"              \
+			".previous"                         \
+		: "=r" (res)                                \
+		: "r" (value), "r" (addr), "i" (-EFAULT));  \
+} while(0)
+
+#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
+/* For CPUs without swl and sdl instructions */
+#define     _StoreW(addr, value, res, type)  \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			".set\tpush\n\t"		    \
+			".set\tnoat\n\t"		    \
+			"1:"type##_sb("%1", "0(%2)")"\n\t"  \
+			"srl\t$1, %1, 0x8\n\t"		    \
+			"2:"type##_sb("$1", "1(%2)")"\n\t"  \
+			"srl\t$1, $1,  0x8\n\t"		    \
+			"3:"type##_sb("$1", "2(%2)")"\n\t"  \
+			"srl\t$1, $1, 0x8\n\t"		    \
+			"4:"type##_sb("$1", "3(%2)")"\n\t"  \
+			".set\tpop\n\t"			    \
+			"li\t%0, 0\n"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%0, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			".previous"			    \
+		: "=&r" (res)			    	    \
+		: "r" (value), "r" (addr), "i" (-EFAULT)    \
+		: "memory");                                \
+} while(0)
+
+#define     _StoreDW(addr, value, res) \
+do {                                                        \
+		__asm__ __volatile__ (                      \
+			".set\tpush\n\t"		    \
+			".set\tnoat\n\t"		    \
+			"1:sb\t%1, 0(%2)\n\t"    	    \
+			"dsrl\t$1, %1, 0x8\n\t"		    \
+			"2:sb\t$1, 1(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"3:sb\t$1, 2(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"4:sb\t$1, 3(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"5:sb\t$1, 4(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"6:sb\t$1, 5(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"7:sb\t$1, 6(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			"8:sb\t$1, 7(%2)\n\t"    	    \
+			"dsrl\t$1, $1, 0x8\n\t"		    \
+			".set\tpop\n\t"			    \
+			"li\t%0, 0\n"			    \
+			"10:\n\t"			    \
+			".insn\n\t"			    \
+			".section\t.fixup,\"ax\"\n\t"	    \
+			"11:\tli\t%0, %3\n\t"		    \
+			"j\t10b\n\t"			    \
+			".previous\n\t"			    \
+			".section\t__ex_table,\"a\"\n\t"    \
+			STR(PTR)"\t1b, 11b\n\t"		    \
+			STR(PTR)"\t2b, 11b\n\t"		    \
+			STR(PTR)"\t3b, 11b\n\t"		    \
+			STR(PTR)"\t4b, 11b\n\t"		    \
+			STR(PTR)"\t5b, 11b\n\t"		    \
+			STR(PTR)"\t6b, 11b\n\t"		    \
+			STR(PTR)"\t7b, 11b\n\t"		    \
+			STR(PTR)"\t8b, 11b\n\t"		    \
+			".previous"			    \
+		: "=&r" (res)			    	    \
+		: "r" (value), "r" (addr), "i" (-EFAULT)    \
+		: "memory");                                \
+} while(0)
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

