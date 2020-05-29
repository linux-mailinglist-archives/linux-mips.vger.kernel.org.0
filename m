Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32711E7826
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 10:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgE2IVf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 04:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgE2IVe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 04:21:34 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09413C03E969
        for <linux-mips@vger.kernel.org>; Fri, 29 May 2020 01:21:34 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d3so834704pln.1
        for <linux-mips@vger.kernel.org>; Fri, 29 May 2020 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=CEBEEU+e27ufXBa/j9OyFHUVQyeBbIAmMWLFMK+7fpo=;
        b=MqecqHvcmp3b80bVIxl3Dix+BHKZSHF8XUXwzW3RGiSWhHcpjeN1zcK8OjF6cDHm5b
         pJ+6ONOoF6snXcIgtrKo2Qi23llFLJljEWW4vz5Fs1GXmawvf7wStNnA/upQMOZ11mrF
         4cwqiJZ4SmDiQecH0JEvpUoMQ4LMr5hkUGUp57VMWBoZiCXUebKuQnrOMyRXyW/TOMWY
         ado5jcLQBTk1NhvU9PDArJSUqhbHTDOW/xvb0gziztQQyivePwTN3DV67EQ0N/8M+wtc
         Av6Vdzpswj+bceE86avftS7mVMpNm/95RqBaZUry/Z/s2FletQSbL0bbSIArDu3zlnOP
         DOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=CEBEEU+e27ufXBa/j9OyFHUVQyeBbIAmMWLFMK+7fpo=;
        b=eV5ayHgBMb76qW0+7z1MX8ZnC6eSrWpGW+1riVUnK3VOp5IexMEahXEOvgmSe0na6G
         VXjww1EAoIoyJ/8W16A7Orulyldle+9+2pqyDBl95mUcmwfqqVXcdIvKJk1BdiDg+3Tu
         juMjXzrJQtYSZYa5SlWa8f387xzHu9MfnBNHfDu5pTmj9vmhZd9ks1LVFNBcC9HHdpLT
         UOXTekieyI9LFjV5nihMXwzMX6VWGRF3mhr42gU6JJw3A3OpvA1h7OWkMDMtKZWdQc/T
         r4zEjVdcvFnTZXC+gffsBq1wid7YEhVVxZCETTBmteJbqsJ8Klj4NeWjEgpAFc74D0am
         UoPw==
X-Gm-Message-State: AOAM530AlP5G5pqPTpjYNoF1AfItQU3ZwRJgUHR1tJgY3FMNBPnjZN5T
        FRm4lZ+UEic60J4qAftgRQiGSJJNDVzqMg==
X-Google-Smtp-Source: ABdhPJxz2BfiAH8sjdbS+EHh16mqzeZTN7Zk5dWb5hbSnod82qr8Q538zKNlOmcrcUz4POUVu/xA3Q==
X-Received: by 2002:a17:90a:be09:: with SMTP id a9mr7970678pjs.165.1590740492222;
        Fri, 29 May 2020 01:21:32 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id h17sm5950253pgv.41.2020.05.29.01.21.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 May 2020 01:21:31 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        "Maciej W . Rozycki " <macro@linux-mips.org>
Subject: [PATCH] MIPS: Fix build warning about "PTR_STR" redefinition
Date:   Fri, 29 May 2020 16:22:10 +0800
Message-Id: <1590740530-15649-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

PTR_STR is redefined when CONFIG_TEST_PRINTF is set. This causes the
following build warning:

  CC      lib/test_printf.o
lib/test_printf.c:214:0: warning: "PTR_STR" redefined
 #define PTR_STR "ffff0123456789ab"
 ^
In file included from ./arch/mips/include/asm/dsemul.h:11:0,
                 from ./arch/mips/include/asm/processor.h:22,
                 from ./arch/mips/include/asm/thread_info.h:16,
                 from ./include/linux/thread_info.h:38,
                 from ./include/asm-generic/preempt.h:5,
                 from ./arch/mips/include/generated/asm/preempt.h:1,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/seqlock.h:36,
                 from ./include/linux/time.h:6,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from lib/test_printf.c:10:
./arch/mips/include/asm/inst.h:20:0: note: this is the location of the previous definition
 #define PTR_STR  ".dword"
 ^

Instead of renaming PTR_STR again and again, it is better to move the
unaligned load/store helpers from inst.h to unaligned.h, suggested by
Maciej W. Rozycki.

Fixes: e701656ec4db ("MIPS: inst.h: Stop including asm.h to avoid various build failures")
Cc: Maciej W. Rozycki" <macro@linux-mips.org>
Reported-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/inst.h      | 779 ------------------------------------
 arch/mips/include/asm/unaligned.h | 802 ++++++++++++++++++++++++++++++++++++++
 arch/mips/kernel/unaligned.c      |   1 +
 arch/mips/loongson64/cop2-ex.c    |   1 +
 4 files changed, 804 insertions(+), 779 deletions(-)
 create mode 100644 arch/mips/include/asm/unaligned.h

diff --git a/arch/mips/include/asm/inst.h b/arch/mips/include/asm/inst.h
index 6d74ba3..22912f7 100644
--- a/arch/mips/include/asm/inst.h
+++ b/arch/mips/include/asm/inst.h
@@ -13,13 +13,6 @@
 
 #include <uapi/asm/inst.h>
 
-#if (_MIPS_SZPTR == 32)
-#define PTR_STR		".word"
-#endif
-#if (_MIPS_SZPTR == 64)
-#define PTR_STR		".dword"
-#endif
-
 /* HACHACHAHCAHC ...  */
 
 /* In case some other massaging is needed, keep MIPSInst as wrapper */
@@ -92,776 +85,4 @@ struct mm_decoded_insn {
 /* Recode table from 16-bit register notation to 32-bit GPR. Do NOT export!!! */
 extern const int reg16to32[];
 
-#ifdef __BIG_ENDIAN
-#define  _LoadHW(addr, value, res, type)  \
-do {                                                \
-	__asm__ __volatile__ (".set\tnoat\n"        \
-		"1:\t"type##_lb("%0", "0(%2)")"\n"  \
-		"2:\t"type##_lbu("$1", "1(%2)")"\n\t"\
-		"sll\t%0, 0x8\n\t"                  \
-		"or\t%0, $1\n\t"                    \
-		"li\t%1, 0\n"                       \
-		"3:\t.set\tat\n\t"                  \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define  _LoadW(addr, value, res, type)   \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\t"type##_lwl("%0", "(%2)")"\n"   \
-		"2:\t"type##_lwr("%0", "3(%2)")"\n\t"\
-		"li\t%1, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without lwl instruction */
-#define  _LoadW(addr, value, res, type) \
-do {                                                \
-	__asm__ __volatile__ (			    \
-		".set\tpush\n"			    \
-		".set\tnoat\n\t"		    \
-		"1:"type##_lb("%0", "0(%2)")"\n\t"  \
-		"2:"type##_lbu("$1", "1(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"3:"type##_lbu("$1", "2(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"4:"type##_lbu("$1", "3(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"li\t%1, 0\n"			    \
-		".set\tpop\n"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%1, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (value), "=r" (res)	    \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-#define  _LoadHWU(addr, value, res, type) \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		".set\tnoat\n"                      \
-		"1:\t"type##_lbu("%0", "0(%2)")"\n" \
-		"2:\t"type##_lbu("$1", "1(%2)")"\n\t"\
-		"sll\t%0, 0x8\n\t"                  \
-		"or\t%0, $1\n\t"                    \
-		"li\t%1, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".set\tat\n\t"                      \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define  _LoadWU(addr, value, res, type)  \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\t"type##_lwl("%0", "(%2)")"\n"  \
-		"2:\t"type##_lwr("%0", "3(%2)")"\n\t"\
-		"dsll\t%0, %0, 32\n\t"              \
-		"dsrl\t%0, %0, 32\n\t"              \
-		"li\t%1, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		"\t.section\t.fixup,\"ax\"\n\t"     \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#define  _LoadDW(addr, value, res)  \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\tldl\t%0, (%2)\n"               \
-		"2:\tldr\t%0, 7(%2)\n\t"            \
-		"li\t%1, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		"\t.section\t.fixup,\"ax\"\n\t"     \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without lwl and ldl instructions */
-#define  _LoadWU(addr, value, res, type) \
-do {                                                \
-	__asm__ __volatile__ (			    \
-		".set\tpush\n\t"		    \
-		".set\tnoat\n\t"		    \
-		"1:"type##_lbu("%0", "0(%2)")"\n\t" \
-		"2:"type##_lbu("$1", "1(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"3:"type##_lbu("$1", "2(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"4:"type##_lbu("$1", "3(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"li\t%1, 0\n"			    \
-		".set\tpop\n"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%1, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (value), "=r" (res)	    \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#define  _LoadDW(addr, value, res)  \
-do {                                                \
-	__asm__ __volatile__ (			    \
-		".set\tpush\n\t"		    \
-		".set\tnoat\n\t"		    \
-		"1:lb\t%0, 0(%2)\n\t"		    \
-		"2:lbu\t $1, 1(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"3:lbu\t$1, 2(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"4:lbu\t$1, 3(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"5:lbu\t$1, 4(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"6:lbu\t$1, 5(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"7:lbu\t$1, 6(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"8:lbu\t$1, 7(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"li\t%1, 0\n"			    \
-		".set\tpop\n\t"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%1, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		PTR_STR"\t5b, 11b\n\t"		    \
-		PTR_STR"\t6b, 11b\n\t"		    \
-		PTR_STR"\t7b, 11b\n\t"		    \
-		PTR_STR"\t8b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (value), "=r" (res)	    \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-
-#define  _StoreHW(addr, value, res, type) \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		".set\tnoat\n"                      \
-		"1:\t"type##_sb("%1", "1(%2)")"\n"  \
-		"srl\t$1, %1, 0x8\n"                \
-		"2:\t"type##_sb("$1", "0(%2)")"\n"  \
-		".set\tat\n\t"                      \
-		"li\t%0, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%0, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"              \
-		PTR_STR"\t2b, 4b\n\t"              \
-		".previous"                         \
-		: "=r" (res)                        \
-		: "r" (value), "r" (addr), "i" (-EFAULT));\
-} while (0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define  _StoreW(addr, value, res, type)  \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\t"type##_swl("%1", "(%2)")"\n"  \
-		"2:\t"type##_swr("%1", "3(%2)")"\n\t"\
-		"li\t%0, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%0, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=r" (res)                                \
-		: "r" (value), "r" (addr), "i" (-EFAULT));  \
-} while (0)
-
-#define  _StoreDW(addr, value, res) \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\tsdl\t%1,(%2)\n"                \
-		"2:\tsdr\t%1, 7(%2)\n\t"            \
-		"li\t%0, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%0, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=r" (res)                                \
-		: "r" (value), "r" (addr), "i" (-EFAULT));  \
-} while (0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-#define  _StoreW(addr, value, res, type)  \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		".set\tpush\n\t"		    \
-		".set\tnoat\n\t"		    \
-		"1:"type##_sb("%1", "3(%2)")"\n\t"  \
-		"srl\t$1, %1, 0x8\n\t"		    \
-		"2:"type##_sb("$1", "2(%2)")"\n\t"  \
-		"srl\t$1, $1,  0x8\n\t"		    \
-		"3:"type##_sb("$1", "1(%2)")"\n\t"  \
-		"srl\t$1, $1, 0x8\n\t"		    \
-		"4:"type##_sb("$1", "0(%2)")"\n\t"  \
-		".set\tpop\n\t"			    \
-		"li\t%0, 0\n"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%0, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (res)				    \
-		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-		: "memory");                                \
-} while (0)
-
-#define  _StoreDW(addr, value, res) \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		".set\tpush\n\t"		    \
-		".set\tnoat\n\t"		    \
-		"1:sb\t%1, 7(%2)\n\t"		    \
-		"dsrl\t$1, %1, 0x8\n\t"		    \
-		"2:sb\t$1, 6(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"3:sb\t$1, 5(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"4:sb\t$1, 4(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"5:sb\t$1, 3(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"6:sb\t$1, 2(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"7:sb\t$1, 1(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"8:sb\t$1, 0(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		".set\tpop\n\t"			    \
-		"li\t%0, 0\n"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%0, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		PTR_STR"\t5b, 11b\n\t"		    \
-		PTR_STR"\t6b, 11b\n\t"		    \
-		PTR_STR"\t7b, 11b\n\t"		    \
-		PTR_STR"\t8b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (res)				    \
-		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-		: "memory");                                \
-} while (0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-#else /* __BIG_ENDIAN */
-
-#define  _LoadHW(addr, value, res, type)  \
-do {                                                \
-	__asm__ __volatile__ (".set\tnoat\n"        \
-		"1:\t"type##_lb("%0", "1(%2)")"\n"  \
-		"2:\t"type##_lbu("$1", "0(%2)")"\n\t"\
-		"sll\t%0, 0x8\n\t"                  \
-		"or\t%0, $1\n\t"                    \
-		"li\t%1, 0\n"                       \
-		"3:\t.set\tat\n\t"                  \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define  _LoadW(addr, value, res, type)   \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\t"type##_lwl("%0", "3(%2)")"\n" \
-		"2:\t"type##_lwr("%0", "(%2)")"\n\t"\
-		"li\t%1, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without lwl instruction */
-#define  _LoadW(addr, value, res, type) \
-do {                                                \
-	__asm__ __volatile__ (			    \
-		".set\tpush\n"			    \
-		".set\tnoat\n\t"		    \
-		"1:"type##_lb("%0", "3(%2)")"\n\t"  \
-		"2:"type##_lbu("$1", "2(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"3:"type##_lbu("$1", "1(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"4:"type##_lbu("$1", "0(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"li\t%1, 0\n"			    \
-		".set\tpop\n"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%1, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (value), "=r" (res)	    \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-
-#define  _LoadHWU(addr, value, res, type) \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		".set\tnoat\n"                      \
-		"1:\t"type##_lbu("%0", "1(%2)")"\n" \
-		"2:\t"type##_lbu("$1", "0(%2)")"\n\t"\
-		"sll\t%0, 0x8\n\t"                  \
-		"or\t%0, $1\n\t"                    \
-		"li\t%1, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".set\tat\n\t"                      \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define  _LoadWU(addr, value, res, type)  \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\t"type##_lwl("%0", "3(%2)")"\n" \
-		"2:\t"type##_lwr("%0", "(%2)")"\n\t"\
-		"dsll\t%0, %0, 32\n\t"              \
-		"dsrl\t%0, %0, 32\n\t"              \
-		"li\t%1, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		"\t.section\t.fixup,\"ax\"\n\t"     \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#define  _LoadDW(addr, value, res)  \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\tldl\t%0, 7(%2)\n"              \
-		"2:\tldr\t%0, (%2)\n\t"             \
-		"li\t%1, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		"\t.section\t.fixup,\"ax\"\n\t"     \
-		"4:\tli\t%1, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=&r" (value), "=r" (res)         \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without lwl and ldl instructions */
-#define  _LoadWU(addr, value, res, type) \
-do {                                                \
-	__asm__ __volatile__ (			    \
-		".set\tpush\n\t"		    \
-		".set\tnoat\n\t"		    \
-		"1:"type##_lbu("%0", "3(%2)")"\n\t" \
-		"2:"type##_lbu("$1", "2(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"3:"type##_lbu("$1", "1(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"4:"type##_lbu("$1", "0(%2)")"\n\t" \
-		"sll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"li\t%1, 0\n"			    \
-		".set\tpop\n"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%1, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (value), "=r" (res)	    \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-
-#define  _LoadDW(addr, value, res)  \
-do {                                                \
-	__asm__ __volatile__ (			    \
-		".set\tpush\n\t"		    \
-		".set\tnoat\n\t"		    \
-		"1:lb\t%0, 7(%2)\n\t"		    \
-		"2:lbu\t$1, 6(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"3:lbu\t$1, 5(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"4:lbu\t$1, 4(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"5:lbu\t$1, 3(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"6:lbu\t$1, 2(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"7:lbu\t$1, 1(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"8:lbu\t$1, 0(%2)\n\t"		    \
-		"dsll\t%0, 0x8\n\t"		    \
-		"or\t%0, $1\n\t"		    \
-		"li\t%1, 0\n"			    \
-		".set\tpop\n\t"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%1, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		PTR_STR"\t5b, 11b\n\t"		    \
-		PTR_STR"\t6b, 11b\n\t"		    \
-		PTR_STR"\t7b, 11b\n\t"		    \
-		PTR_STR"\t8b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (value), "=r" (res)	    \
-		: "r" (addr), "i" (-EFAULT));       \
-} while (0)
-#endif /* CONFIG_CPU_NO_LOAD_STORE_LR */
-
-#define  _StoreHW(addr, value, res, type) \
-do {                                                 \
-	__asm__ __volatile__ (                      \
-		".set\tnoat\n"                      \
-		"1:\t"type##_sb("%1", "0(%2)")"\n"  \
-		"srl\t$1,%1, 0x8\n"                 \
-		"2:\t"type##_sb("$1", "1(%2)")"\n"  \
-		".set\tat\n\t"                      \
-		"li\t%0, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%0, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=r" (res)                        \
-		: "r" (value), "r" (addr), "i" (-EFAULT));\
-} while (0)
-
-#ifndef CONFIG_CPU_NO_LOAD_STORE_LR
-#define  _StoreW(addr, value, res, type)  \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\t"type##_swl("%1", "3(%2)")"\n" \
-		"2:\t"type##_swr("%1", "(%2)")"\n\t"\
-		"li\t%0, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%0, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=r" (res)                                \
-		: "r" (value), "r" (addr), "i" (-EFAULT));  \
-} while (0)
-
-#define  _StoreDW(addr, value, res) \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		"1:\tsdl\t%1, 7(%2)\n"              \
-		"2:\tsdr\t%1, (%2)\n\t"             \
-		"li\t%0, 0\n"                       \
-		"3:\n\t"                            \
-		".insn\n\t"                         \
-		".section\t.fixup,\"ax\"\n\t"       \
-		"4:\tli\t%0, %3\n\t"                \
-		"j\t3b\n\t"                         \
-		".previous\n\t"                     \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
-		".previous"                         \
-		: "=r" (res)                                \
-		: "r" (value), "r" (addr), "i" (-EFAULT));  \
-} while (0)
-
-#else /* CONFIG_CPU_NO_LOAD_STORE_LR */
-/* For CPUs without swl and sdl instructions */
-#define  _StoreW(addr, value, res, type)  \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		".set\tpush\n\t"		    \
-		".set\tnoat\n\t"		    \
-		"1:"type##_sb("%1", "0(%2)")"\n\t"  \
-		"srl\t$1, %1, 0x8\n\t"		    \
-		"2:"type##_sb("$1", "1(%2)")"\n\t"  \
-		"srl\t$1, $1,  0x8\n\t"		    \
-		"3:"type##_sb("$1", "2(%2)")"\n\t"  \
-		"srl\t$1, $1, 0x8\n\t"		    \
-		"4:"type##_sb("$1", "3(%2)")"\n\t"  \
-		".set\tpop\n\t"			    \
-		"li\t%0, 0\n"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%0, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (res)				    \
-		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-		: "memory");                                \
-} while (0)
-
-#define  _StoreDW(addr, value, res) \
-do {                                                \
-	__asm__ __volatile__ (                      \
-		".set\tpush\n\t"		    \
-		".set\tnoat\n\t"		    \
-		"1:sb\t%1, 0(%2)\n\t"		    \
-		"dsrl\t$1, %1, 0x8\n\t"		    \
-		"2:sb\t$1, 1(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"3:sb\t$1, 2(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"4:sb\t$1, 3(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"5:sb\t$1, 4(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"6:sb\t$1, 5(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"7:sb\t$1, 6(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		"8:sb\t$1, 7(%2)\n\t"		    \
-		"dsrl\t$1, $1, 0x8\n\t"		    \
-		".set\tpop\n\t"			    \
-		"li\t%0, 0\n"			    \
-		"10:\n\t"			    \
-		".insn\n\t"			    \
-		".section\t.fixup,\"ax\"\n\t"	    \
-		"11:\tli\t%0, %3\n\t"		    \
-		"j\t10b\n\t"			    \
-		".previous\n\t"			    \
-		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		PTR_STR"\t5b, 11b\n\t"		    \
-		PTR_STR"\t6b, 11b\n\t"		    \
-		PTR_STR"\t7b, 11b\n\t"		    \
-		PTR_STR"\t8b, 11b\n\t"		    \
-		".previous"			    \
-		: "=&r" (res)				    \
-		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-		: "memory");                                \
-} while (0)
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
 #endif /* _ASM_INST_H */
diff --git a/arch/mips/include/asm/unaligned.h b/arch/mips/include/asm/unaligned.h
new file mode 100644
index 00000000..b81db83
--- /dev/null
+++ b/arch/mips/include/asm/unaligned.h
@@ -0,0 +1,802 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_MIPS_UNALIGNED_H
+#define _ASM_MIPS_UNALIGNED_H
+
+#include <asm/byteorder.h>
+
+#if defined(__LITTLE_ENDIAN)
+# include <linux/unaligned/le_struct.h>
+# include <linux/unaligned/be_byteshift.h>
+# include <linux/unaligned/generic.h>
+# define get_unaligned	__get_unaligned_le
+# define put_unaligned	__put_unaligned_le
+#elif defined(__BIG_ENDIAN)
+# include <linux/unaligned/be_struct.h>
+# include <linux/unaligned/le_byteshift.h>
+# include <linux/unaligned/generic.h>
+# define get_unaligned	__get_unaligned_be
+# define put_unaligned	__put_unaligned_be
+#else
+# error need to define endianess
+#endif
+
+#if (_MIPS_SZPTR == 32)
+#define PTR_STR		".word"
+#endif
+#if (_MIPS_SZPTR == 64)
+#define PTR_STR		".dword"
+#endif
+
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
+		PTR_STR"\t5b, 11b\n\t"		    \
+		PTR_STR"\t6b, 11b\n\t"		    \
+		PTR_STR"\t7b, 11b\n\t"		    \
+		PTR_STR"\t8b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 4b\n\t"              \
+		PTR_STR"\t2b, 4b\n\t"              \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
+		PTR_STR"\t5b, 11b\n\t"		    \
+		PTR_STR"\t6b, 11b\n\t"		    \
+		PTR_STR"\t7b, 11b\n\t"		    \
+		PTR_STR"\t8b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
+		PTR_STR"\t5b, 11b\n\t"		    \
+		PTR_STR"\t6b, 11b\n\t"		    \
+		PTR_STR"\t7b, 11b\n\t"		    \
+		PTR_STR"\t8b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 4b\n\t"               \
+		PTR_STR"\t2b, 4b\n\t"               \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
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
+		PTR_STR"\t1b, 11b\n\t"		    \
+		PTR_STR"\t2b, 11b\n\t"		    \
+		PTR_STR"\t3b, 11b\n\t"		    \
+		PTR_STR"\t4b, 11b\n\t"		    \
+		PTR_STR"\t5b, 11b\n\t"		    \
+		PTR_STR"\t6b, 11b\n\t"		    \
+		PTR_STR"\t7b, 11b\n\t"		    \
+		PTR_STR"\t8b, 11b\n\t"		    \
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
+#endif /* _ASM_MIPS_UNALIGNED_H */
diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index 19b906a..efb818c 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -89,6 +89,7 @@
 #include <asm/fpu.h>
 #include <asm/fpu_emulator.h>
 #include <asm/inst.h>
+#include <asm/unaligned.h>
 #include <asm/mmu_context.h>
 #include <linux/uaccess.h>
 
diff --git a/arch/mips/loongson64/cop2-ex.c b/arch/mips/loongson64/cop2-ex.c
index af0600d..6096b03 100644
--- a/arch/mips/loongson64/cop2-ex.c
+++ b/arch/mips/loongson64/cop2-ex.c
@@ -23,6 +23,7 @@
 #include <asm/branch.h>
 #include <asm/current.h>
 #include <asm/mipsregs.h>
+#include <asm/unaligned.h>
 
 static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 	void *data)
-- 
2.7.0

