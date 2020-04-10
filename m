Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D14E1A4243
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2020 07:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgDJFgF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Apr 2020 01:36:05 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55581 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgDJFgF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Apr 2020 01:36:05 -0400
Received: by mail-pj1-f67.google.com with SMTP id a32so401560pje.5
        for <linux-mips@vger.kernel.org>; Thu, 09 Apr 2020 22:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SBmeOV33j99Ahv2AOOjrGhZDzGQUakuHvTCodYgyGrU=;
        b=iK3c9d03TqMH/wJCdGp17X297ywRgHSPki/WHkFkoWcDxzvWwBDGoV1ICoRk0LkA8G
         NxPD/vfLg8yKWgAP6Cv/mAKkNdkUsR1Yr3lzbrnux89LBMp54YyAsLLR815BTweF5yg/
         H4Km59ae7G7Xp2N/Ty5LAzb4oG/PW2xNL3oE4i8xBncOalsF9+9NpNA4FeObLQb5uaq8
         fx5+BzBZDKMYOHBFdWokBoSZXHIu/pyEAOgo3BXrYVZTT7FiqzdJErKpawbZUPssRJcf
         371aUz/eGcGdSJL3AHPVPqg69jYpWwE7ctQw3cy6273C7WmMCD5n13Vr9IRLGpLRJwrD
         KSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=SBmeOV33j99Ahv2AOOjrGhZDzGQUakuHvTCodYgyGrU=;
        b=lo5e61w/q27zmJ7R25bAQnvQruqGULTbGmWuRgHZ2Dvko8EgnZ/l1DPDpjWIHRsMeU
         DIjq0IxP7yZp+SrEiXR1+BZ9GfubnimOD9YWnSa6xIQHUymcFWlwMwZBEvLJPatU/rfY
         3Eo2vTnh33otfRyVhEShcTu2VjqCCqsW6ufhsp+5Oba64iOZHX9QFdFMLkDjFNmY+z9+
         yp+3Zj+aJaFp4AyxvMyNhDOGrggp8o5fb5GqvIBBPxMI120CrEjMBTl76GA6nFXyJ7Jk
         PgTJNgXpPC14TWxJ2Ze0bc6+45Haq3W0Thf5B34kFe3SEsH7Rt5uieIT2O+8WKT2xWL7
         4BCg==
X-Gm-Message-State: AGi0PuZLRO8BHx1nwBMTYAZNbo39hIxIqHtjODUB9n+TP9Khm4KLXrk9
        6Iddydra4RdOxGci62LdPfc=
X-Google-Smtp-Source: APiQypLiR/Axr3aknJR1wZ1CQ3Ei4f8Lr6R8ZX+Ekz2qJlcIyL5d3oSjFaXVRYb5Uuu55bqkid89VQ==
X-Received: by 2002:a17:90a:a00c:: with SMTP id q12mr3392354pjp.7.1586496960918;
        Thu, 09 Apr 2020 22:36:00 -0700 (PDT)
Received: from software.domain.org ([104.207.149.93])
        by smtp.gmail.com with ESMTPSA id c126sm780398pfb.83.2020.04.09.22.35.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 22:36:00 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Pei Huang <huangpei@loongson.cn>,
        Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Subject: [PATCH 2/3] MIPS: Move unaligned load/store helpers to inst.h
Date:   Fri, 10 Apr 2020 13:43:59 +0800
Message-Id: <1586497440-25621-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1586497440-25621-1-git-send-email-chenhc@lemote.com>
References: <1586497440-25621-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move unaligned load/store helpers from unaligned.c to inst.h, then
other parts of the kernel can use these helpers.

Signed-off-by: Pei Huang <huangpei@loongson.cn>
Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
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

