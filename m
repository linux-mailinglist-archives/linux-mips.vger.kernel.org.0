Return-Path: <linux-mips+bounces-641-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC3980BEAE
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 02:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A95E31F20EC3
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 01:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F857748C;
	Mon, 11 Dec 2023 01:13:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2B010A9
	for <linux-mips@vger.kernel.org>; Sun, 10 Dec 2023 17:13:20 -0800 (PST)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxpPAuYnZlvn9AAA--.63745S3;
	Mon, 11 Dec 2023 09:13:18 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxvt4fYnZlqvtaAA--.10150S2;
	Mon, 11 Dec 2023 09:13:15 +0800 (CST)
From: Huang Pei <huangpei@loongson.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Bibo Mao <maobibo@loongson.cn>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] selftests/rseq: unify mips and riscv
Date: Mon, 11 Dec 2023 09:13:03 +0800
Message-Id: <20231211011303.170124-1-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxvt4fYnZlqvtaAA--.10150S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoWfAw1xJrWkArWfGFyDGrykJFc_yoW8KF18Zo
	ZrKF1rK3WIqw1q9an5Ca47trWrJFW7Ga4jyry2grykCr17Gr1UGw1UZwn7XwsrCrZ5GayD
	XFn8J3ySqF9Iywn3l-sFpf9Il3svdjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYh7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r1j6r4UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxUc0eHDUUUU

Since MIPS and RISC-V has similar asm syntax and architecture, use
same test infrastructure.

No functional changes on riscv, tested on 3B1500(8 gs464 cores,
MIPS64r2-compatible within 2 nodes), no errors.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 tools/testing/selftests/rseq/rseq-mips-bits.h | 462 ------------------
 ...eq-riscv-bits.h => rseq-mips-riscv-bits.h} |   0
 tools/testing/selftests/rseq/rseq-mips.h      | 143 ++++--
 tools/testing/selftests/rseq/rseq-riscv.h     |  10 +-
 4 files changed, 104 insertions(+), 511 deletions(-)
 delete mode 100644 tools/testing/selftests/rseq/rseq-mips-bits.h
 rename tools/testing/selftests/rseq/{rseq-riscv-bits.h => rseq-mips-riscv-bits.h} (100%)

diff --git a/tools/testing/selftests/rseq/rseq-mips-bits.h b/tools/testing/selftests/rseq/rseq-mips-bits.h
deleted file mode 100644
index 6c48af4d0944..000000000000
--- a/tools/testing/selftests/rseq/rseq-mips-bits.h
+++ /dev/null
@@ -1,462 +0,0 @@
-/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
-/*
- * Author: Paul Burton <paul.burton@mips.com>
- * (C) Copyright 2018 MIPS Tech LLC
- * (C) Copyright 2016-2022 - Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
- */
-
-#include "rseq-bits-template.h"
-
-#if defined(RSEQ_TEMPLATE_MO_RELAXED) && \
-	(defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID))
-
-static inline __attribute__((always_inline))
-int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_storev)(intptr_t *v, intptr_t expect, intptr_t newv, int cpu)
-{
-	RSEQ_INJECT_C(9)
-
-	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error2])
-#endif
-		/* Start rseq by storing table entry pointer into rseq_cs. */
-		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
-		RSEQ_INJECT_ASM(3)
-		LONG_L " $4, %[v]\n\t"
-		"bne $4, %[expect], %l[cmpfail]\n\t"
-		RSEQ_INJECT_ASM(4)
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, %l[error1])
-		LONG_L " $4, %[v]\n\t"
-		"bne $4, %[expect], %l[error2]\n\t"
-#endif
-		/* final store */
-		LONG_S " %[newv], %[v]\n\t"
-		"2:\n\t"
-		RSEQ_INJECT_ASM(5)
-		"b 5f\n\t"
-		RSEQ_ASM_DEFINE_ABORT(3, 4, "", abort, 1b, 2b, 4f)
-		"5:\n\t"
-		: /* gcc asm goto does not allow outputs */
-		: [cpu_id]		"r" (cpu),
-		  [current_cpu_id]	"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
-		  [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
-		  [v]			"m" (*v),
-		  [expect]		"r" (expect),
-		  [newv]		"r" (newv)
-		  RSEQ_INJECT_INPUT
-		: "$4", "memory"
-		  RSEQ_INJECT_CLOBBER
-		: abort, cmpfail
-#ifdef RSEQ_COMPARE_TWICE
-		  , error1, error2
-#endif
-	);
-	return 0;
-abort:
-	RSEQ_INJECT_FAILED
-	return -1;
-cmpfail:
-	return 1;
-#ifdef RSEQ_COMPARE_TWICE
-error1:
-	rseq_bug("cpu_id comparison failed");
-error2:
-	rseq_bug("expected value comparison failed");
-#endif
-}
-
-static inline __attribute__((always_inline))
-int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpnev_storeoffp_load)(intptr_t *v, intptr_t expectnot,
-			       long voffp, intptr_t *load, int cpu)
-{
-	RSEQ_INJECT_C(9)
-
-	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error2])
-#endif
-		/* Start rseq by storing table entry pointer into rseq_cs. */
-		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
-		RSEQ_INJECT_ASM(3)
-		LONG_L " $4, %[v]\n\t"
-		"beq $4, %[expectnot], %l[cmpfail]\n\t"
-		RSEQ_INJECT_ASM(4)
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, %l[error1])
-		LONG_L " $4, %[v]\n\t"
-		"beq $4, %[expectnot], %l[error2]\n\t"
-#endif
-		LONG_S " $4, %[load]\n\t"
-		LONG_ADDI " $4, %[voffp]\n\t"
-		LONG_L " $4, 0($4)\n\t"
-		/* final store */
-		LONG_S " $4, %[v]\n\t"
-		"2:\n\t"
-		RSEQ_INJECT_ASM(5)
-		"b 5f\n\t"
-		RSEQ_ASM_DEFINE_ABORT(3, 4, "", abort, 1b, 2b, 4f)
-		"5:\n\t"
-		: /* gcc asm goto does not allow outputs */
-		: [cpu_id]		"r" (cpu),
-		  [current_cpu_id]	"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
-		  [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
-		  /* final store input */
-		  [v]			"m" (*v),
-		  [expectnot]		"r" (expectnot),
-		  [voffp]		"Ir" (voffp),
-		  [load]		"m" (*load)
-		  RSEQ_INJECT_INPUT
-		: "$4", "memory"
-		  RSEQ_INJECT_CLOBBER
-		: abort, cmpfail
-#ifdef RSEQ_COMPARE_TWICE
-		  , error1, error2
-#endif
-	);
-	return 0;
-abort:
-	RSEQ_INJECT_FAILED
-	return -1;
-cmpfail:
-	return 1;
-#ifdef RSEQ_COMPARE_TWICE
-error1:
-	rseq_bug("cpu_id comparison failed");
-error2:
-	rseq_bug("expected value comparison failed");
-#endif
-}
-
-static inline __attribute__((always_inline))
-int RSEQ_TEMPLATE_IDENTIFIER(rseq_addv)(intptr_t *v, intptr_t count, int cpu)
-{
-	RSEQ_INJECT_C(9)
-
-	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
-#endif
-		/* Start rseq by storing table entry pointer into rseq_cs. */
-		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
-		RSEQ_INJECT_ASM(3)
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, %l[error1])
-#endif
-		LONG_L " $4, %[v]\n\t"
-		LONG_ADDI " $4, %[count]\n\t"
-		/* final store */
-		LONG_S " $4, %[v]\n\t"
-		"2:\n\t"
-		RSEQ_INJECT_ASM(4)
-		"b 5f\n\t"
-		RSEQ_ASM_DEFINE_ABORT(3, 4, "", abort, 1b, 2b, 4f)
-		"5:\n\t"
-		: /* gcc asm goto does not allow outputs */
-		: [cpu_id]		"r" (cpu),
-		  [current_cpu_id]	"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
-		  [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
-		  [v]			"m" (*v),
-		  [count]		"Ir" (count)
-		  RSEQ_INJECT_INPUT
-		: "$4", "memory"
-		  RSEQ_INJECT_CLOBBER
-		: abort
-#ifdef RSEQ_COMPARE_TWICE
-		  , error1
-#endif
-	);
-	return 0;
-abort:
-	RSEQ_INJECT_FAILED
-	return -1;
-#ifdef RSEQ_COMPARE_TWICE
-error1:
-	rseq_bug("cpu_id comparison failed");
-#endif
-}
-
-static inline __attribute__((always_inline))
-int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_cmpeqv_storev)(intptr_t *v, intptr_t expect,
-			      intptr_t *v2, intptr_t expect2,
-			      intptr_t newv, int cpu)
-{
-	RSEQ_INJECT_C(9)
-
-	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error2])
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error3])
-#endif
-		/* Start rseq by storing table entry pointer into rseq_cs. */
-		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
-		RSEQ_INJECT_ASM(3)
-		LONG_L " $4, %[v]\n\t"
-		"bne $4, %[expect], %l[cmpfail]\n\t"
-		RSEQ_INJECT_ASM(4)
-		LONG_L " $4, %[v2]\n\t"
-		"bne $4, %[expect2], %l[cmpfail]\n\t"
-		RSEQ_INJECT_ASM(5)
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, %l[error1])
-		LONG_L " $4, %[v]\n\t"
-		"bne $4, %[expect], %l[error2]\n\t"
-		LONG_L " $4, %[v2]\n\t"
-		"bne $4, %[expect2], %l[error3]\n\t"
-#endif
-		/* final store */
-		LONG_S " %[newv], %[v]\n\t"
-		"2:\n\t"
-		RSEQ_INJECT_ASM(6)
-		"b 5f\n\t"
-		RSEQ_ASM_DEFINE_ABORT(3, 4, "", abort, 1b, 2b, 4f)
-		"5:\n\t"
-		: /* gcc asm goto does not allow outputs */
-		: [cpu_id]		"r" (cpu),
-		  [current_cpu_id]	"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
-		  [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
-		  /* cmp2 input */
-		  [v2]			"m" (*v2),
-		  [expect2]		"r" (expect2),
-		  /* final store input */
-		  [v]			"m" (*v),
-		  [expect]		"r" (expect),
-		  [newv]		"r" (newv)
-		  RSEQ_INJECT_INPUT
-		: "$4", "memory"
-		  RSEQ_INJECT_CLOBBER
-		: abort, cmpfail
-#ifdef RSEQ_COMPARE_TWICE
-		  , error1, error2, error3
-#endif
-	);
-	return 0;
-abort:
-	RSEQ_INJECT_FAILED
-	return -1;
-cmpfail:
-	return 1;
-#ifdef RSEQ_COMPARE_TWICE
-error1:
-	rseq_bug("cpu_id comparison failed");
-error2:
-	rseq_bug("1st expected value comparison failed");
-error3:
-	rseq_bug("2nd expected value comparison failed");
-#endif
-}
-
-#endif /* #if defined(RSEQ_TEMPLATE_MO_RELAXED) &&
-	(defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID)) */
-
-#if (defined(RSEQ_TEMPLATE_MO_RELAXED) || defined(RSEQ_TEMPLATE_MO_RELEASE)) && \
-	(defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID))
-
-static inline __attribute__((always_inline))
-int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_trystorev_storev)(intptr_t *v, intptr_t expect,
-				 intptr_t *v2, intptr_t newv2,
-				 intptr_t newv, int cpu)
-{
-	RSEQ_INJECT_C(9)
-
-	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error2])
-#endif
-		/* Start rseq by storing table entry pointer into rseq_cs. */
-		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
-		RSEQ_INJECT_ASM(3)
-		LONG_L " $4, %[v]\n\t"
-		"bne $4, %[expect], %l[cmpfail]\n\t"
-		RSEQ_INJECT_ASM(4)
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, %l[error1])
-		LONG_L " $4, %[v]\n\t"
-		"bne $4, %[expect], %l[error2]\n\t"
-#endif
-		/* try store */
-		LONG_S " %[newv2], %[v2]\n\t"
-		RSEQ_INJECT_ASM(5)
-#ifdef RSEQ_TEMPLATE_MO_RELEASE
-		"sync\n\t"	/* full sync provides store-release */
-#endif
-		/* final store */
-		LONG_S " %[newv], %[v]\n\t"
-		"2:\n\t"
-		RSEQ_INJECT_ASM(6)
-		"b 5f\n\t"
-		RSEQ_ASM_DEFINE_ABORT(3, 4, "", abort, 1b, 2b, 4f)
-		"5:\n\t"
-		: /* gcc asm goto does not allow outputs */
-		: [cpu_id]		"r" (cpu),
-		  [current_cpu_id]	"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
-		  [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
-		  /* try store input */
-		  [v2]			"m" (*v2),
-		  [newv2]		"r" (newv2),
-		  /* final store input */
-		  [v]			"m" (*v),
-		  [expect]		"r" (expect),
-		  [newv]		"r" (newv)
-		  RSEQ_INJECT_INPUT
-		: "$4", "memory"
-		  RSEQ_INJECT_CLOBBER
-		: abort, cmpfail
-#ifdef RSEQ_COMPARE_TWICE
-		  , error1, error2
-#endif
-	);
-	return 0;
-abort:
-	RSEQ_INJECT_FAILED
-	return -1;
-cmpfail:
-	return 1;
-#ifdef RSEQ_COMPARE_TWICE
-error1:
-	rseq_bug("cpu_id comparison failed");
-error2:
-	rseq_bug("expected value comparison failed");
-#endif
-}
-
-static inline __attribute__((always_inline))
-int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_trymemcpy_storev)(intptr_t *v, intptr_t expect,
-				 void *dst, void *src, size_t len,
-				 intptr_t newv, int cpu)
-{
-	uintptr_t rseq_scratch[3];
-
-	RSEQ_INJECT_C(9)
-
-	__asm__ __volatile__ goto (
-		RSEQ_ASM_DEFINE_TABLE(9, 1f, 2f, 4f) /* start, commit, abort */
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error1])
-		RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[error2])
-#endif
-		LONG_S " %[src], %[rseq_scratch0]\n\t"
-		LONG_S "  %[dst], %[rseq_scratch1]\n\t"
-		LONG_S " %[len], %[rseq_scratch2]\n\t"
-		/* Start rseq by storing table entry pointer into rseq_cs. */
-		RSEQ_ASM_STORE_RSEQ_CS(1, 3f, rseq_cs)
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
-		RSEQ_INJECT_ASM(3)
-		LONG_L " $4, %[v]\n\t"
-		"bne $4, %[expect], 5f\n\t"
-		RSEQ_INJECT_ASM(4)
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 6f)
-		LONG_L " $4, %[v]\n\t"
-		"bne $4, %[expect], 7f\n\t"
-#endif
-		/* try memcpy */
-		"beqz %[len], 333f\n\t" \
-		"222:\n\t" \
-		"lb   $4, 0(%[src])\n\t" \
-		"sb   $4, 0(%[dst])\n\t" \
-		LONG_ADDI " %[src], 1\n\t" \
-		LONG_ADDI " %[dst], 1\n\t" \
-		LONG_ADDI " %[len], -1\n\t" \
-		"bnez %[len], 222b\n\t" \
-		"333:\n\t" \
-		RSEQ_INJECT_ASM(5)
-#ifdef RSEQ_TEMPLATE_MO_RELEASE
-		"sync\n\t"	/* full sync provides store-release */
-#endif
-		/* final store */
-		LONG_S " %[newv], %[v]\n\t"
-		"2:\n\t"
-		RSEQ_INJECT_ASM(6)
-		/* teardown */
-		LONG_L " %[len], %[rseq_scratch2]\n\t"
-		LONG_L " %[dst], %[rseq_scratch1]\n\t"
-		LONG_L " %[src], %[rseq_scratch0]\n\t"
-		"b 8f\n\t"
-		RSEQ_ASM_DEFINE_ABORT(3, 4,
-				      /* teardown */
-				      LONG_L " %[len], %[rseq_scratch2]\n\t"
-				      LONG_L " %[dst], %[rseq_scratch1]\n\t"
-				      LONG_L " %[src], %[rseq_scratch0]\n\t",
-				      abort, 1b, 2b, 4f)
-		RSEQ_ASM_DEFINE_CMPFAIL(5,
-					/* teardown */
-					LONG_L " %[len], %[rseq_scratch2]\n\t"
-					LONG_L " %[dst], %[rseq_scratch1]\n\t"
-					LONG_L " %[src], %[rseq_scratch0]\n\t",
-					cmpfail)
-#ifdef RSEQ_COMPARE_TWICE
-		RSEQ_ASM_DEFINE_CMPFAIL(6,
-					/* teardown */
-					LONG_L " %[len], %[rseq_scratch2]\n\t"
-					LONG_L " %[dst], %[rseq_scratch1]\n\t"
-					LONG_L " %[src], %[rseq_scratch0]\n\t",
-					error1)
-		RSEQ_ASM_DEFINE_CMPFAIL(7,
-					/* teardown */
-					LONG_L " %[len], %[rseq_scratch2]\n\t"
-					LONG_L " %[dst], %[rseq_scratch1]\n\t"
-					LONG_L " %[src], %[rseq_scratch0]\n\t",
-					error2)
-#endif
-		"8:\n\t"
-		: /* gcc asm goto does not allow outputs */
-		: [cpu_id]		"r" (cpu),
-		  [current_cpu_id]	"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
-		  [rseq_cs]		"m" (rseq_get_abi()->rseq_cs.arch.ptr),
-		  /* final store input */
-		  [v]			"m" (*v),
-		  [expect]		"r" (expect),
-		  [newv]		"r" (newv),
-		  /* try memcpy input */
-		  [dst]			"r" (dst),
-		  [src]			"r" (src),
-		  [len]			"r" (len),
-		  [rseq_scratch0]	"m" (rseq_scratch[0]),
-		  [rseq_scratch1]	"m" (rseq_scratch[1]),
-		  [rseq_scratch2]	"m" (rseq_scratch[2])
-		  RSEQ_INJECT_INPUT
-		: "$4", "memory"
-		  RSEQ_INJECT_CLOBBER
-		: abort, cmpfail
-#ifdef RSEQ_COMPARE_TWICE
-		  , error1, error2
-#endif
-	);
-	return 0;
-abort:
-	RSEQ_INJECT_FAILED
-	return -1;
-cmpfail:
-	return 1;
-#ifdef RSEQ_COMPARE_TWICE
-error1:
-	rseq_bug("cpu_id comparison failed");
-error2:
-	rseq_bug("expected value comparison failed");
-#endif
-}
-
-#endif /* #if (defined(RSEQ_TEMPLATE_MO_RELAXED) || defined(RSEQ_TEMPLATE_MO_RELEASE)) &&
-	(defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID)) */
-
-#include "rseq-bits-reset.h"
diff --git a/tools/testing/selftests/rseq/rseq-riscv-bits.h b/tools/testing/selftests/rseq/rseq-mips-riscv-bits.h
similarity index 100%
rename from tools/testing/selftests/rseq/rseq-riscv-bits.h
rename to tools/testing/selftests/rseq/rseq-mips-riscv-bits.h
diff --git a/tools/testing/selftests/rseq/rseq-mips.h b/tools/testing/selftests/rseq/rseq-mips.h
index 50b950cf9585..edf8bd8bded8 100644
--- a/tools/testing/selftests/rseq/rseq-mips.h
+++ b/tools/testing/selftests/rseq/rseq-mips.h
@@ -42,6 +42,10 @@
 #define rseq_smp_mb()	__asm__ __volatile__ ("sync" ::: "memory")
 #define rseq_smp_rmb()	rseq_smp_mb()
 #define rseq_smp_wmb()	rseq_smp_mb()
+#define RSEQ_ASM_TMP_REG_1	"$2"
+#define RSEQ_ASM_TMP_REG_2	"$3"
+#define RSEQ_ASM_TMP_REG_3	"$24"
+#define RSEQ_ASM_TMP_REG_4	"$25"
 
 #define rseq_smp_load_acquire(p)					\
 __extension__ ({							\
@@ -60,17 +64,19 @@ do {									\
 
 #if _MIPS_SZLONG == 64
 # define LONG			".dword"
-# define LONG_LA		"dla"
-# define LONG_L			"ld"
-# define LONG_S			"sd"
-# define LONG_ADDI		"daddiu"
+# define LONG_LA		"dla "
+# define LONG_L			"ld "
+# define LONG_S			"sd "
+# define LONG_ADDI		"daddiu "
+# define LONG_ADDU		"daddu "
 # define U32_U64_PAD(x)		x
 #elif _MIPS_SZLONG == 32
 # define LONG			".word"
-# define LONG_LA		"la"
-# define LONG_L			"lw"
-# define LONG_S			"sw"
-# define LONG_ADDI		"addiu"
+# define LONG_LA		"la "
+# define LONG_L			"lw "
+# define LONG_S			"sw "
+# define LONG_ADDI		"addiu "
+# define LONG_ADDU		"addu "
 # ifdef __BIG_ENDIAN
 #  define U32_U64_PAD(x)	"0x0, " x
 # else
@@ -95,8 +101,8 @@ do {									\
 		".popsection\n\t"
 
 #define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip) \
-	__RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip, \
-				(post_commit_ip - start_ip), abort_ip)
+	__RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,		 \
+				((post_commit_ip) - (start_ip)), abort_ip)
 
 /*
  * Exit points of a rseq critical section consist of all instructions outside
@@ -114,49 +120,98 @@ do {									\
 
 #define RSEQ_ASM_STORE_RSEQ_CS(label, cs_label, rseq_cs) \
 		RSEQ_INJECT_ASM(1) \
-		LONG_LA " $4, " __rseq_str(cs_label) "\n\t" \
-		LONG_S  " $4, %[" __rseq_str(rseq_cs) "]\n\t" \
+		LONG_LA  RSEQ_ASM_TMP_REG_1 "," __rseq_str(cs_label) "\n\t" \
+		LONG_S   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(rseq_cs) "]\n\t" \
 		__rseq_str(label) ":\n\t"
 
+#define RSEQ_ASM_DEFINE_ABORT(label, abort_label)			\
+		"b	222f\n"							\
+		".balign	4\n"						\
+		".long "	__rseq_str(RSEQ_SIG) "\n"			\
+		__rseq_str(label) ":\n"						\
+		"b	%l[" __rseq_str(abort_label) "]\n"			\
+		"222:\n"
+
+#define RSEQ_ASM_OP_STORE(value, var)					\
+	LONG_S	"%[" __rseq_str(value) "], %[" __rseq_str(var) "]\n"
+
+#define RSEQ_ASM_OP_CMPEQ(var, expect, label)				\
+		LONG_L	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"		\
+		"bne	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+		__rseq_str(label) "\n"
+
+#define RSEQ_ASM_OP_CMPEQ32(var, expect, label)				\
+		"lw	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"	\
+		"bne	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+		__rseq_str(label) "\n"
+
+#define RSEQ_ASM_OP_CMPNE(var, expect, label)				\
+		LONG_L	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"		\
+		"beq	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+		__rseq_str(label) "\n"
+
 #define RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, label) \
 		RSEQ_INJECT_ASM(2) \
-		"lw  $4, %[" __rseq_str(current_cpu_id) "]\n\t" \
-		"bne $4, %[" __rseq_str(cpu_id) "], " __rseq_str(label) "\n\t"
-
-#define __RSEQ_ASM_DEFINE_ABORT(table_label, label, teardown, \
-				abort_label, version, flags, \
-				start_ip, post_commit_offset, abort_ip) \
-		".balign 32\n\t" \
-		__rseq_str(table_label) ":\n\t" \
-		".word " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
-		LONG " " U32_U64_PAD(__rseq_str(start_ip)) "\n\t" \
-		LONG " " U32_U64_PAD(__rseq_str(post_commit_offset)) "\n\t" \
-		LONG " " U32_U64_PAD(__rseq_str(abort_ip)) "\n\t" \
-		".word " __rseq_str(RSEQ_SIG) "\n\t" \
-		__rseq_str(label) ":\n\t" \
-		teardown \
-		"b %l[" __rseq_str(abort_label) "]\n\t"
-
-#define RSEQ_ASM_DEFINE_ABORT(table_label, label, teardown, abort_label, \
-			      start_ip, post_commit_ip, abort_ip) \
-	__RSEQ_ASM_DEFINE_ABORT(table_label, label, teardown, \
-				abort_label, 0x0, 0x0, start_ip, \
-				(post_commit_ip - start_ip), abort_ip)
-
-#define RSEQ_ASM_DEFINE_CMPFAIL(label, teardown, cmpfail_label) \
-		__rseq_str(label) ":\n\t" \
-		teardown \
-		"b %l[" __rseq_str(cmpfail_label) "]\n\t"
+		RSEQ_ASM_OP_CMPEQ32(current_cpu_id, cpu_id, label)
+
+#define RSEQ_ASM_OP_R_LOAD(var)						\
+		LONG_L	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
+
+#define RSEQ_ASM_OP_R_STORE(var)					\
+		LONG_S	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
+
+#define RSEQ_ASM_OP_R_LOAD_OFF(offset)					\
+		LONG_ADDU RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(offset) "], "	\
+		 RSEQ_ASM_TMP_REG_1 "\n"				\
+		LONG_L	RSEQ_ASM_TMP_REG_1 ", (" RSEQ_ASM_TMP_REG_1 ")\n"
+
+#define RSEQ_ASM_OP_R_ADD(count)					\
+		LONG_ADDU RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1		\
+		", %[" __rseq_str(count) "]\n"
+
+#define RSEQ_ASM_OP_FINAL_STORE(value, var, post_commit_label)		\
+		RSEQ_ASM_OP_STORE(value, var)					\
+		__rseq_str(post_commit_label) ":\n"
+
+#define RSEQ_ASM_OP_FINAL_STORE_RELEASE(value, var, post_commit_label)	\
+		"sync \t\n"						\
+		RSEQ_ASM_OP_STORE(value, var)					\
+		__rseq_str(post_commit_label) ":\n"
+
+#define RSEQ_ASM_OP_R_FINAL_STORE(var, post_commit_label)		\
+		LONG_S	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"		\
+		__rseq_str(post_commit_label) ":\n"
+
+#define RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)				\
+		"beqz	%[" __rseq_str(len) "], 333f\n"				\
+		"move	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(len) "]\n"	\
+		"move	" RSEQ_ASM_TMP_REG_2 ", %[" __rseq_str(src) "]\n"	\
+		"move	" RSEQ_ASM_TMP_REG_3 ", %[" __rseq_str(dst) "]\n"	\
+		"222:\n"							\
+		"lb	" RSEQ_ASM_TMP_REG_4 ", 0(" RSEQ_ASM_TMP_REG_2 ")\n"	\
+		"sb	" RSEQ_ASM_TMP_REG_4 ", 0(" RSEQ_ASM_TMP_REG_3 ")\n"	\
+		LONG_ADDI RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", -1\n"	\
+		LONG_ADDI RSEQ_ASM_TMP_REG_2 ", " RSEQ_ASM_TMP_REG_2 ", 1\n"	\
+		LONG_ADDI RSEQ_ASM_TMP_REG_3 ", " RSEQ_ASM_TMP_REG_3 ", 1\n"	\
+		"bnez	" RSEQ_ASM_TMP_REG_1 ", 222b\n"				\
+		"333:\n"
+
+#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)		\
+		"move	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"	\
+		RSEQ_ASM_OP_R_ADD(off)						\
+		LONG_L	  RSEQ_ASM_TMP_REG_1 ", 0(" RSEQ_ASM_TMP_REG_1 ")\n"	\
+		RSEQ_ASM_OP_R_ADD(inc)						\
+		__rseq_str(post_commit_label) ":\n"
 
 /* Per-cpu-id indexing. */
 
 #define RSEQ_TEMPLATE_CPU_ID
 #define RSEQ_TEMPLATE_MO_RELAXED
-#include "rseq-mips-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELAXED
 
 #define RSEQ_TEMPLATE_MO_RELEASE
-#include "rseq-mips-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELEASE
 #undef RSEQ_TEMPLATE_CPU_ID
 
@@ -164,11 +219,11 @@ do {									\
 
 #define RSEQ_TEMPLATE_MM_CID
 #define RSEQ_TEMPLATE_MO_RELAXED
-#include "rseq-mips-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELAXED
 
 #define RSEQ_TEMPLATE_MO_RELEASE
-#include "rseq-mips-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELEASE
 #undef RSEQ_TEMPLATE_MM_CID
 
@@ -176,6 +231,6 @@ do {									\
 
 #define RSEQ_TEMPLATE_CPU_ID_NONE
 #define RSEQ_TEMPLATE_MO_RELAXED
-#include "rseq-mips-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELAXED
 #undef RSEQ_TEMPLATE_CPU_ID_NONE
diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
index 17932a79e066..50bf587f2552 100644
--- a/tools/testing/selftests/rseq/rseq-riscv.h
+++ b/tools/testing/selftests/rseq/rseq-riscv.h
@@ -169,11 +169,11 @@ do {									\
 
 #define RSEQ_TEMPLATE_CPU_ID
 #define RSEQ_TEMPLATE_MO_RELAXED
-#include "rseq-riscv-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELAXED
 
 #define RSEQ_TEMPLATE_MO_RELEASE
-#include "rseq-riscv-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELEASE
 #undef RSEQ_TEMPLATE_CPU_ID
 
@@ -181,11 +181,11 @@ do {									\
 
 #define RSEQ_TEMPLATE_MM_CID
 #define RSEQ_TEMPLATE_MO_RELAXED
-#include "rseq-riscv-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELAXED
 
 #define RSEQ_TEMPLATE_MO_RELEASE
-#include "rseq-riscv-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELEASE
 #undef RSEQ_TEMPLATE_MM_CID
 
@@ -193,6 +193,6 @@ do {									\
 
 #define RSEQ_TEMPLATE_CPU_ID_NONE
 #define RSEQ_TEMPLATE_MO_RELAXED
-#include "rseq-riscv-bits.h"
+#include "rseq-mips-riscv-bits.h"
 #undef RSEQ_TEMPLATE_MO_RELAXED
 #undef RSEQ_TEMPLATE_CPU_ID_NONE
-- 
2.30.2


