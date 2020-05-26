Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC861A31EF
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 11:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgDIJjc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 05:39:32 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39995 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgDIJjb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 05:39:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so3643224plk.7
        for <linux-mips@vger.kernel.org>; Thu, 09 Apr 2020 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=2teNYyIM2QH09ARNj+72WH4lK6yBKWzoZCBoSsHnfNE=;
        b=CPKri+1Hqv6JRcx1umlMQ1qzbDn1qnSghfnZP8FBIX0oqONq64RF/HYtjs7G/p/2IX
         txXGF/oOlpSBp3E3jr21Q91n8XDoppumHsAX2MhgfN/QG6ZSunYk0UqbMYIEgiWBfvOb
         fy7fBYBJkn9U9oV2sbPKcC7J8O9yzs/9Gk1H6ST3nQd5n/6RCNSLWH847yeQh8qeDEPq
         5RNTWvVkLZv6ctc2oduL2TBS/Idw8igGX8uRnJVKpwHvOUAxDx98xRhV0DktQ7kONLHV
         HOoC5F+lJGpJBnF02elCrfPzzC/x/uQH3Bl1EGzWHqW1HNdoQonB3wBtW/hSBwcP5tf1
         SQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=2teNYyIM2QH09ARNj+72WH4lK6yBKWzoZCBoSsHnfNE=;
        b=kfrVPZLWFYku8SVcCOVNcNLptEeqBg7rzoszl4FABdCTPaC/blNRCELkxKcUwd+7Zh
         oCaaHN9VTa9lK4g5189Y6Hs99unqucoyEKFOEXaj0+CkRbY0gvLyDa5XcbDSErALUNsW
         KU9ehNl5Ya8BdNmv1biSmqjGvq1obmSVPzOLQ3udqkCQi8hYQnfis/gqVtpUnFQtaCBQ
         ZksqnpmhBZsJ04visx+K1/Nuenc2lpf00qjiUGtf+hD+3zzdXiBL+qjbkaaHkqomIXXv
         ny2rvIZVE3AsQb6xZDYU9n169803k3hTcJjLZZ6bMwbV05scUcf5ttC6BVC0vx4IhcpK
         w3ZA==
X-Gm-Message-State: AGi0PuaQJC05Q+fDrRDOZSeifH2vdnVpEoBrmdY4/BigU4fCD2Q3wvhk
        69h9NfiYlU+N11Un0dTSZKo=
X-Google-Smtp-Source: APiQypL0qzdLK48QInjcn7t/+Vio+/P1V2KE1n7PNqNgltItVJ03kU8JVC6e6iNaeIdOLQDer465jg==
X-Received: by 2002:a17:902:6a87:: with SMTP id n7mr11555968plk.80.1586425169364;
        Thu, 09 Apr 2020 02:39:29 -0700 (PDT)
Received: from software.domain.org ([104.207.149.93])
        by smtp.gmail.com with ESMTPSA id d17sm533526pgk.5.2020.04.09.02.39.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 02:39:28 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Pei Huang <huangpei@loongson.cn>,
        Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Subject: [PATCH] MIPS: Loongson-3: Add some unaligned instructions emulation
Date:   Thu,  9 Apr 2020 17:47:55 +0800
Message-Id: <1586425675-31860-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1, Add unaligned gslq, gssq, gslqc1, gssqc1 emulation;
2, Add unaligned gsl{h, w, d}x, gss{h, w, d}x emulation;
3, Add unaligned gslwxc1, gsswxc1, gsldxc1, gssdxc1 emulation.

Signed-off-by: Pei Huang <huangpei@loongson.cn>
Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/fpu_emulator.h |   2 -
 arch/mips/include/asm/inst.h         | 773 ++++++++++++++++++++++++++++++++++
 arch/mips/include/uapi/asm/inst.h    |  26 ++
 arch/mips/kernel/unaligned.c         | 775 -----------------------------------
 arch/mips/loongson64/cop2-ex.c       | 274 ++++++++++++-
 5 files changed, 1072 insertions(+), 778 deletions(-)

diff --git a/arch/mips/include/asm/fpu_emulator.h b/arch/mips/include/asm/fpu_emulator.h
index bb7c71f..9c68f9e 100644
--- a/arch/mips/include/asm/fpu_emulator.h
+++ b/arch/mips/include/asm/fpu_emulator.h
@@ -174,8 +174,6 @@ int process_fpemu_return(int sig, void __user *fault_addr,
 			 unsigned long fcr31);
 int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 		  unsigned long *contpc);
-int mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
-		     unsigned long *contpc);
 
 /*
  * Mask the FCSR Cause bits according to the Enable bits, observing
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
diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index eaa3a80..98f97c8 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -989,6 +989,30 @@ struct mm16_r5_format {		/* Load/store from stack pointer format */
 };
 
 /*
+ * Loongson-3 overridden COP2 instruction formats (32-bit length)
+ */
+struct loongson3_lswc2_format {	/* Loongson-3 overridden lwc2/swc2 Load/Store format */
+	__BITFIELD_FIELD(unsigned int opcode : 6,
+	__BITFIELD_FIELD(unsigned int base : 5,
+	__BITFIELD_FIELD(unsigned int rt : 5,
+	__BITFIELD_FIELD(unsigned int fr : 1,
+	__BITFIELD_FIELD(unsigned int offset : 9,
+	__BITFIELD_FIELD(unsigned int ls : 1,
+	__BITFIELD_FIELD(unsigned int rq : 5,
+	;)))))))
+};
+
+struct loongson3_lsdc2_format {	/* Loongson-3 overridden ldc2/sdc2 Load/Store format */
+	__BITFIELD_FIELD(unsigned int opcode : 6,
+	__BITFIELD_FIELD(unsigned int base : 5,
+	__BITFIELD_FIELD(unsigned int rt : 5,
+	__BITFIELD_FIELD(unsigned int index : 5,
+	__BITFIELD_FIELD(unsigned int offset : 8,
+	__BITFIELD_FIELD(unsigned int opcode1 : 3,
+	;))))))
+};
+
+/*
  * MIPS16e instruction formats (16-bit length)
  */
 struct m16e_rr {
@@ -1088,6 +1112,8 @@ union mips_instruction {
 	struct mm16_rb_format mm16_rb_format;
 	struct mm16_r3_format mm16_r3_format;
 	struct mm16_r5_format mm16_r5_format;
+	struct loongson3_lswc2_format loongson3_lswc2_format;
+	struct loongson3_lsdc2_format loongson3_lsdc2_format;
 };
 
 union mips16e_instruction {
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
diff --git a/arch/mips/loongson64/cop2-ex.c b/arch/mips/loongson64/cop2-ex.c
index 9efdfe4..2269dc5 100644
--- a/arch/mips/loongson64/cop2-ex.c
+++ b/arch/mips/loongson64/cop2-ex.c
@@ -14,17 +14,29 @@
 #include <linux/sched.h>
 #include <linux/notifier.h>
 #include <linux/ptrace.h>
+#include <linux/uaccess.h>
+#include <linux/sched/signal.h>
 
 #include <asm/fpu.h>
 #include <asm/cop2.h>
+#include <asm/inst.h>
+#include <asm/branch.h>
 #include <asm/current.h>
 #include <asm/mipsregs.h>
 
 static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 	void *data)
 {
-	int fpu_owned;
+	unsigned int res, fpu_owned;
+	unsigned long ra, value, value_next;
+	union mips_instruction insn;
 	int fr = !test_thread_flag(TIF_32BIT_FPREGS);
+	struct pt_regs *regs = (struct pt_regs *)data;
+	void __user *addr = (void __user *)regs->cp0_badvaddr;
+	unsigned int __user *pc = (unsigned int __user *)exception_epc(regs);
+
+	ra = regs->regs[31];
+	__get_user(insn.word, pc);
 
 	switch (action) {
 	case CU2_EXCEPTION:
@@ -49,9 +61,269 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 		preempt_enable();
 
 		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_LWC2_OP:
+		if(insn.loongson3_lswc2_format.ls == 0)
+			goto sigbus;
+
+		if (insn.loongson3_lswc2_format.fr == 0) {	/* gslq */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+
+			LoadDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			regs->regs[insn.loongson3_lswc2_format.rt] = value;
+			regs->regs[insn.loongson3_lswc2_format.rq] = value_next;
+			compute_return_epc(regs);
+		} else {					/* gslqc1 */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+			LoadDW(addr+8, value_next, res);
+			if (res)
+				goto fault;
+
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rt, value);
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rq, value_next);
+			compute_return_epc(regs);
+			own_fpu(1);
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_SWC2_OP:
+		if(insn.loongson3_lswc2_format.ls == 0)
+			goto sigbus;
+
+		if (insn.loongson3_lswc2_format.fr == 0) {	/* gssq */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			/* write upper 8 bytes first */
+			value_next = regs->regs[insn.loongson3_lswc2_format.rq];
+
+			StoreDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			value = regs->regs[insn.loongson3_lswc2_format.rt];
+
+			StoreDW(addr, value, res);
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+		} else {					/* gssqc1 */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			lose_fpu(1);
+			value_next = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rq);
+
+			StoreDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rt);
+
+			StoreDW(addr, value, res);
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_LDC2_OP:
+		switch (insn.loongson3_lsdc2_format.opcode1) {
+		/*
+		 * Loongson-3 overridden ldc2 instructions.
+		 * opcode1              instruction
+		 *   0x1          gslhx: load 2 bytes to GPR
+		 *   0x2          gslwx: load 4 bytes to GPR
+		 *   0x3          gsldx: load 8 bytes to GPR
+		 *   0x6	  gslwxc1: load 4 bytes to FPR
+		 *   0x7	  gsldxc1: load 8 bytes to FPR
+		 */
+		case 0x1:
+			if (!access_ok(addr, 2))
+				goto sigbus;
+
+			LoadHW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x2:
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			LoadW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x3:
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			LoadDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x6:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadW(addr, value, res);
+			if (res)
+				goto fault;
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt, value);
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		case 0x7:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt, value);
+			compute_return_epc(regs);
+			own_fpu(1);
+			break;
+
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_SDC2_OP:
+		switch (insn.loongson3_lsdc2_format.opcode1) {
+		/*
+		 * Loongson-3 overridden sdc2 instructions.
+		 * opcode1              instruction
+		 *   0x1          gsshx: store 2 bytes from GPR
+		 *   0x2          gsswx: store 4 bytes from GPR
+		 *   0x3          gssdx: store 8 bytes from GPR
+		 *   0x6          gsswxc1: store 4 bytes from FPR
+		 *   0x7          gssdxc1: store 8 bytes from FPR
+		 */
+		case 0x1:
+			if (!access_ok(addr, 2))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreHW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+		case 0x2:
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+		case 0x3:
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+
+		case 0x6:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			lose_fpu(1);
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt);
+
+			StoreW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		case 0x7:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			lose_fpu(1);
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt);
+
+			StoreDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
 	}
 
 	return NOTIFY_OK;		/* Let default notifier send signals */
+
+fault:
+	/* roll back jump/branch */
+	regs->regs[31] = ra;
+	regs->cp0_epc = (unsigned long)pc;
+	/* Did we have an exception handler installed? */
+	if (fixup_exception(regs))
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	die_if_kernel("Unhandled kernel unaligned access", regs);
+	force_sig(SIGSEGV);
+
+	return NOTIFY_STOP;	/* Don't call default notifier */
+
+sigbus:
+	die_if_kernel("Unhandled kernel unaligned access", regs);
+	force_sig(SIGBUS);
+
+	return NOTIFY_STOP;	/* Don't call default notifier */
 }
 
 static int __init loongson_cu2_setup(void)
-- 
2.7.0

