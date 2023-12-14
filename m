Return-Path: <linux-mips+bounces-725-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C2B8128BF
	for <lists+linux-mips@lfdr.de>; Thu, 14 Dec 2023 08:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2605B281CBF
	for <lists+linux-mips@lfdr.de>; Thu, 14 Dec 2023 07:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7A0D52C;
	Thu, 14 Dec 2023 07:08:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 716E7133
	for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 23:08:07 -0800 (PST)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxhfDVqXplj_AAAA--.5391S3;
	Thu, 14 Dec 2023 15:08:05 +0800 (CST)
Received: from Board-3A3000 (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxnnPRqXplRM8DAA--.775S2;
	Thu, 14 Dec 2023 15:08:03 +0800 (CST)
Date: Thu, 14 Dec 2023 15:08:01 +0800
From: Huang Pei <huangpei@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH] selftests/rseq: add LoongArch64 support
Message-ID: <20231214025623.db6qzzmkawvqyp4e@Board-3A3000>
Received: from huangpei@loongson.cn (unknown [111.9.175.10:47358]) by IMAP
 (Coremail) with SMTP id I001/U05ANxtemX+pwEA; Thu, 14 Dec 2023 10:56:47
 +0800 (CST)
References: <20231213071026.466949-1-huangpei@loongson.cn>
 <CAAhV-H6uFNdtLbqeayF3yLxkUs=FPRGPvxyYaRJ2Zccj87TRTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H6uFNdtLbqeayF3yLxkUs=FPRGPvxyYaRJ2Zccj87TRTg@mail.gmail.com>
X-CM-TRANSID:AQAAf8BxnnPRqXplRM8DAA--.775S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoWfZF1UKw4UurWUAF4UAr1fAFc_yoW5Gw45Ao
	ZrGF1xKF1fKw129r1kua47tFWfJa47GFW7AFW3Kr1DCF1xWa4UCr1UAw40qrsxuFZ2g34U
	XFyUJ395uasrJwn5l-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYU7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

On Wed, Dec 13, 2023 at 03:52:19PM +0800, Huacai Chen wrote:
> On Wed, Dec 13, 2023 at 3:11 PM Huang Pei <huangpei@loongson.cn> wrote:
> >
> > Use same test infrastructure as MIPS and RISC-V, rseq-MRL-bits.h,
> > here MRL stands for MIPS-RISCV-LoongArch.
> You can consider the name rseq-generic-bits.h, there is also similar
> naming in this directory.
> 
this file is for MIPS/RISC-V/LoongArch, not that "general"
> >
> > Tested on 3A5000+7A1000+ArchLinux Loong64, no errors(need latest
> > upstream binutils).
> You needn't highlight you have tested. OTOH you can refer the related
> commit of binutils.
> 
got it.
> >
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  tools/testing/selftests/rseq/param_test.c     |  20 +
> >  ...rseq-mips-riscv-bits.h => rseq-MRL-bits.h} |   0
> >  .../selftests/rseq/rseq-loongarch-bits.h      | 410 ++++++++++++++++++
> >  .../rseq/rseq-loongarch-thread-pointer.h      |  22 +
> >  tools/testing/selftests/rseq/rseq-loongarch.h | 196 +++++++++
> >  .../selftests/rseq/rseq-thread-pointer.h      |   2 +
> >  tools/testing/selftests/rseq/rseq.h           |   2 +
> >  7 files changed, 652 insertions(+)
> >  rename tools/testing/selftests/rseq/{rseq-mips-riscv-bits.h => rseq-MRL-bits.h} (100%)
> >  create mode 100644 tools/testing/selftests/rseq/rseq-loongarch-bits.h
> >  create mode 100644 tools/testing/selftests/rseq/rseq-loongarch-thread-pointer.h
> >  create mode 100644 tools/testing/selftests/rseq/rseq-loongarch.h
> >
> > diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/selftests/rseq/param_test.c
> > index 20403d58345c..724dd07ecc73 100644
> > --- a/tools/testing/selftests/rseq/param_test.c
> > +++ b/tools/testing/selftests/rseq/param_test.c
> > @@ -227,7 +227,27 @@ unsigned int yield_mod_cnt, nr_abort;
> >         "bnez " INJECT_ASM_REG ", 222b\n\t"                     \
> >         "333:\n\t"
> >
> > +#elif defined(__loongarch__)
> > +#define RSEQ_INJECT_INPUT \
> > +       , [loop_cnt_1]"m"(loop_cnt[1]) \
> > +       , [loop_cnt_2]"m"(loop_cnt[2]) \
> > +       , [loop_cnt_3]"m"(loop_cnt[3]) \
> > +       , [loop_cnt_4]"m"(loop_cnt[4]) \
> > +       , [loop_cnt_5]"m"(loop_cnt[5]) \
> > +       , [loop_cnt_6]"m"(loop_cnt[6])
> > +
> > +#define INJECT_ASM_REG  "$r16"
> > +
> > +#define RSEQ_INJECT_CLOBBER \
> > +       , INJECT_ASM_REG
> >
> > +#define RSEQ_INJECT_ASM(n)                                      \
> > +       "ld.w " INJECT_ASM_REG ", %[loop_cnt_" #n "]\n\t"         \
> > +       "beqz " INJECT_ASM_REG ", 333f\n\t"                     \
> > +       "222:\n\t"                                              \
> > +       "addi.w  " INJECT_ASM_REG "," INJECT_ASM_REG ", -1\n\t"   \
> > +       "bnez " INJECT_ASM_REG ", 222b\n\t"                     \
> > +       "333:\n\t"
> >  #else
> >  #error unsupported target
> >  #endif
> > diff --git a/tools/testing/selftests/rseq/rseq-mips-riscv-bits.h b/tools/testing/selftests/rseq/rseq-MRL-bits.h
> > similarity index 100%
> > rename from tools/testing/selftests/rseq/rseq-mips-riscv-bits.h
> > rename to tools/testing/selftests/rseq/rseq-MRL-bits.h
> > diff --git a/tools/testing/selftests/rseq/rseq-loongarch-bits.h b/tools/testing/selftests/rseq/rseq-loongarch-bits.h
> > new file mode 100644
> > index 000000000000..de31a0143139
> > --- /dev/null
> > +++ b/tools/testing/selftests/rseq/rseq-loongarch-bits.h
> > @@ -0,0 +1,410 @@
> > +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> > +
> > +#include "rseq-bits-template.h"
> > +
> > +#if defined(RSEQ_TEMPLATE_MO_RELAXED) && \
> > +       (defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID))
> > +
> > +static inline __always_inline
> > +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_storev)(intptr_t *v, intptr_t expect, intptr_t newv, int cpu)
> > +{
> > +       RSEQ_INJECT_C(9)
> > +
> > +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> > +#endif
> > +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> > +                                 RSEQ_INJECT_ASM(3)
> > +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> > +                                 RSEQ_INJECT_ASM(4)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> > +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> > +#endif
> > +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> > +                                 RSEQ_INJECT_ASM(5)
> > +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> > +                                 : /* gcc asm goto does not allow outputs */
> > +                                 : [cpu_id]            "r" (cpu),
> > +                                   [current_cpu_id]    "m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> > +                                   [rseq_cs]           "m" (rseq_get_abi()->rseq_cs.arch.ptr),
> > +                                   [v]                 "m" (*v),
> > +                                   [expect]            "r" (expect),
> > +                                   [newv]              "r" (newv)
> > +                                   RSEQ_INJECT_INPUT
> > +                                 : "memory", RSEQ_ASM_TMP_REG_1
> > +                                   RSEQ_INJECT_CLOBBER
> > +                                 : abort, cmpfail
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                   , error1, error2
> > +#endif
> > +       );
> > +
> > +       return 0;
> > +abort:
> > +       RSEQ_INJECT_FAILED
> > +       return -1;
> > +cmpfail:
> > +       return 1;
> > +#ifdef RSEQ_COMPARE_TWICE
> > +error1:
> > +       rseq_bug("cpu_id comparison failed");
> > +error2:
> > +       rseq_bug("expected value comparison failed");
> > +#endif
> > +}
> > +
> > +static inline __always_inline
> > +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpnev_storeoffp_load)(intptr_t *v, intptr_t expectnot,
> > +                              off_t voffp, intptr_t *load, int cpu)
> > +{
> > +       RSEQ_INJECT_C(9)
> > +
> > +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> > +#endif
> > +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> > +                                 RSEQ_INJECT_ASM(3)
> > +                                 RSEQ_ASM_OP_CMPNE(v, expectnot, "%l[cmpfail]")
> > +                                 RSEQ_INJECT_ASM(4)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> > +                                 RSEQ_ASM_OP_CMPNE(v, expectnot, "%l[error2]")
> > +#endif
> > +                                 RSEQ_ASM_OP_R_LOAD(v)
> > +                                 RSEQ_ASM_OP_R_STORE(load)
> > +                                 RSEQ_ASM_OP_R_LOAD_OFF(voffp)
> > +                                 RSEQ_ASM_OP_R_FINAL_STORE(v, 3)
> > +                                 RSEQ_INJECT_ASM(5)
> > +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> > +                                 : /* gcc asm goto does not allow outputs */
> > +                                 : [cpu_id]            "r" (cpu),
> > +                                   [current_cpu_id]    "m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> > +                                   [rseq_cs]           "m" (rseq_get_abi()->rseq_cs.arch.ptr),
> > +                                   [v]                 "m" (*v),
> > +                                   [expectnot]         "r" (expectnot),
> > +                                   [load]              "m" (*load),
> > +                                   [voffp]             "r" (voffp)
> > +                                   RSEQ_INJECT_INPUT
> > +                                 : "memory", RSEQ_ASM_TMP_REG_1
> > +                                   RSEQ_INJECT_CLOBBER
> > +                                 : abort, cmpfail
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                   , error1, error2
> > +#endif
> > +       );
> > +       return 0;
> > +abort:
> > +       RSEQ_INJECT_FAILED
> > +       return -1;
> > +cmpfail:
> > +       return 1;
> > +#ifdef RSEQ_COMPARE_TWICE
> > +error1:
> > +       rseq_bug("cpu_id comparison failed");
> > +error2:
> > +       rseq_bug("expected value comparison failed");
> > +#endif
> > +}
> > +
> > +static inline __always_inline
> > +int RSEQ_TEMPLATE_IDENTIFIER(rseq_addv)(intptr_t *v, intptr_t count, int cpu)
> > +{
> > +       RSEQ_INJECT_C(9)
> > +
> > +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> > +#endif
> > +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> > +                                 RSEQ_INJECT_ASM(3)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> > +#endif
> > +                                 RSEQ_ASM_OP_R_LOAD(v)
> > +                                 RSEQ_ASM_OP_R_ADD(count)
> > +                                 RSEQ_ASM_OP_R_FINAL_STORE(v, 3)
> > +                                 RSEQ_INJECT_ASM(4)
> > +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> > +                                 : /* gcc asm goto does not allow outputs */
> > +                                 : [cpu_id]            "r" (cpu),
> > +                                   [current_cpu_id]    "m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> > +                                   [rseq_cs]           "m" (rseq_get_abi()->rseq_cs.arch.ptr),
> > +                                   [v]                 "m" (*v),
> > +                                   [count]             "r" (count)
> > +                                   RSEQ_INJECT_INPUT
> > +                                 : "memory", RSEQ_ASM_TMP_REG_1
> > +                                   RSEQ_INJECT_CLOBBER
> > +                                 : abort
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                   , error1
> > +#endif
> > +       );
> > +       return 0;
> > +abort:
> > +       RSEQ_INJECT_FAILED
> > +       return -1;
> > +#ifdef RSEQ_COMPARE_TWICE
> > +error1:
> > +       rseq_bug("cpu_id comparison failed");
> > +#endif
> > +}
> > +
> > +static inline __always_inline
> > +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_cmpeqv_storev)(intptr_t *v, intptr_t expect,
> > +                             intptr_t *v2, intptr_t expect2,
> > +                             intptr_t newv, int cpu)
> > +{
> > +       RSEQ_INJECT_C(9)
> > +
> > +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error3]")
> > +#endif
> > +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> > +                                 RSEQ_INJECT_ASM(3)
> > +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> > +                                 RSEQ_INJECT_ASM(4)
> > +                                 RSEQ_ASM_OP_CMPEQ(v2, expect2, "%l[cmpfail]")
> > +                                 RSEQ_INJECT_ASM(5)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> > +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> > +                                 RSEQ_ASM_OP_CMPEQ(v2, expect2, "%l[error3]")
> > +#endif
> > +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> > +                                 RSEQ_INJECT_ASM(6)
> > +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> > +                                 : /* gcc asm goto does not allow outputs */
> > +                                 : [cpu_id]            "r" (cpu),
> > +                                   [current_cpu_id]    "m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> > +                                   [rseq_cs]           "m" (rseq_get_abi()->rseq_cs.arch.ptr),
> > +                                   [v]                 "m" (*v),
> > +                                   [expect]            "r" (expect),
> > +                                   [v2]                        "m" (*v2),
> > +                                   [expect2]           "r" (expect2),
> > +                                   [newv]              "r" (newv)
> > +                                   RSEQ_INJECT_INPUT
> > +                                 : "memory", RSEQ_ASM_TMP_REG_1
> > +                                   RSEQ_INJECT_CLOBBER
> > +                                 : abort, cmpfail
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                   , error1, error2, error3
> > +#endif
> > +       );
> > +
> > +       return 0;
> > +abort:
> > +       RSEQ_INJECT_FAILED
> > +       return -1;
> > +cmpfail:
> > +       return 1;
> > +#ifdef RSEQ_COMPARE_TWICE
> > +error1:
> > +       rseq_bug("cpu_id comparison failed");
> > +error2:
> > +       rseq_bug("expected value comparison failed");
> > +error3:
> > +       rseq_bug("2nd expected value comparison failed");
> > +#endif
> > +}
> > +
> > +#define RSEQ_ARCH_HAS_OFFSET_DEREF_ADDV
> > +
> > +/*
> > + *   pval = *(ptr+off)
> > + *  *pval += inc;
> > + */
> > +static inline __always_inline
> > +int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, intptr_t inc, int cpu)
> > +{
> > +       RSEQ_INJECT_C(9)
> > +
> > +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> > +#endif
> > +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> > +                                 RSEQ_INJECT_ASM(3)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> > +#endif
> > +                                 RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, 3)
> > +                                 RSEQ_INJECT_ASM(4)
> > +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> > +                                 : /* gcc asm goto does not allow outputs */
> > +                                 : [cpu_id]                    "r" (cpu),
> > +                                   [current_cpu_id]            "m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> > +                                   [rseq_cs]                   "m" (rseq_get_abi()->rseq_cs.arch.ptr),
> > +                                   [ptr]                       "r" (ptr),
> > +                                   [off]                       "er" (off),
> > +                                   [inc]                       "er" (inc)
> > +                                   RSEQ_INJECT_INPUT
> > +                                 : "memory", RSEQ_ASM_TMP_REG_1
> > +                                   RSEQ_INJECT_CLOBBER
> > +                                 : abort
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                   , error1
> > +#endif
> > +       );
> > +       return 0;
> > +abort:
> > +       RSEQ_INJECT_FAILED
> > +       return -1;
> > +#ifdef RSEQ_COMPARE_TWICE
> > +error1:
> > +       rseq_bug("cpu_id comparison failed");
> > +#endif
> > +}
> > +
> > +#endif /* #if defined(RSEQ_TEMPLATE_MO_RELAXED) &&
> > +       (defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID)) */
> > +
> > +#if (defined(RSEQ_TEMPLATE_MO_RELAXED) || defined(RSEQ_TEMPLATE_MO_RELEASE)) && \
> > +       (defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID))
> > +
> > +static inline __always_inline
> > +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_trystorev_storev)(intptr_t *v, intptr_t expect,
> > +                                intptr_t *v2, intptr_t newv2,
> > +                                intptr_t newv, int cpu)
> > +{
> > +       RSEQ_INJECT_C(9)
> > +
> > +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> > +#endif
> > +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> > +                                 RSEQ_INJECT_ASM(3)
> > +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> > +                                 RSEQ_INJECT_ASM(4)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> > +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> > +#endif
> > +                                 RSEQ_ASM_OP_STORE(newv2, v2)
> > +                                 RSEQ_INJECT_ASM(5)
> > +#ifdef RSEQ_TEMPLATE_MO_RELEASE
> > +                                 RSEQ_ASM_OP_FINAL_STORE_RELEASE(newv, v, 3)
> > +#else
> > +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> > +#endif
> > +                                 RSEQ_INJECT_ASM(6)
> > +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> > +                                 : /* gcc asm goto does not allow outputs */
> > +                                 : [cpu_id]                    "r" (cpu),
> > +                                   [current_cpu_id]            "m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> > +                                   [rseq_cs]                   "m" (rseq_get_abi()->rseq_cs.arch.ptr),
> > +                                   [expect]                    "r" (expect),
> > +                                   [v]                         "m" (*v),
> > +                                   [newv]                      "r" (newv),
> > +                                   [v2]                        "m" (*v2),
> > +                                   [newv2]                     "r" (newv2)
> > +                                   RSEQ_INJECT_INPUT
> > +                                 : "memory", RSEQ_ASM_TMP_REG_1
> > +                                   RSEQ_INJECT_CLOBBER
> > +                                 : abort, cmpfail
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                   , error1, error2
> > +#endif
> > +       );
> > +
> > +       return 0;
> > +abort:
> > +       RSEQ_INJECT_FAILED
> > +       return -1;
> > +cmpfail:
> > +       return 1;
> > +#ifdef RSEQ_COMPARE_TWICE
> > +error1:
> > +       rseq_bug("cpu_id comparison failed");
> > +error2:
> > +       rseq_bug("expected value comparison failed");
> > +#endif
> > +}
> > +
> > +static inline __always_inline
> > +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_trymemcpy_storev)(intptr_t *v, intptr_t expect,
> > +                                void *dst, void *src, size_t len,
> > +                                intptr_t newv, int cpu)
> > +{
> > +       RSEQ_INJECT_C(9)
> > +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> > +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> > +#endif
> > +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> > +                                 RSEQ_INJECT_ASM(3)
> > +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> > +                                 RSEQ_INJECT_ASM(4)
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> > +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> > +#endif
> > +                                 RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)
> > +                                 RSEQ_INJECT_ASM(5)
> > +#ifdef RSEQ_TEMPLATE_MO_RELEASE
> > +                                 RSEQ_ASM_OP_FINAL_STORE_RELEASE(newv, v, 3)
> > +#else
> > +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> > +#endif
> > +                                 RSEQ_INJECT_ASM(6)
> > +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> > +                                 : /* gcc asm goto does not allow outputs */
> > +                                 : [cpu_id]                    "r" (cpu),
> > +                                   [current_cpu_id]            "m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> > +                                   [rseq_cs]                   "m" (rseq_get_abi()->rseq_cs.arch.ptr),
> > +                                   [expect]                    "r" (expect),
> > +                                   [v]                         "m" (*v),
> > +                                   [newv]                      "r" (newv),
> > +                                   [dst]                       "r" (dst),
> > +                                   [src]                       "r" (src),
> > +                                   [len]                       "r" (len)
> > +                                   RSEQ_INJECT_INPUT
> > +                                 : "memory", RSEQ_ASM_TMP_REG_1, RSEQ_ASM_TMP_REG_2,
> > +                                   RSEQ_ASM_TMP_REG_3, RSEQ_ASM_TMP_REG_4
> > +                                   RSEQ_INJECT_CLOBBER
> > +                                 : abort, cmpfail
> > +#ifdef RSEQ_COMPARE_TWICE
> > +                                   , error1, error2
> > +#endif
> > +       );
> > +
> > +       return 0;
> > +abort:
> > +       RSEQ_INJECT_FAILED
> > +       return -1;
> > +cmpfail:
> > +       return 1;
> > +#ifdef RSEQ_COMPARE_TWICE
> > +error1:
> > +       rseq_bug("cpu_id comparison failed");
> > +error2:
> > +       rseq_bug("expected value comparison failed");
> > +#endif
> > +}
> > +
> > +#endif /* #if (defined(RSEQ_TEMPLATE_MO_RELAXED) || defined(RSEQ_TEMPLATE_MO_RELEASE)) &&
> > +       (defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID)) */
> > +
> > +#include "rseq-bits-reset.h"
> > diff --git a/tools/testing/selftests/rseq/rseq-loongarch-thread-pointer.h b/tools/testing/selftests/rseq/rseq-loongarch-thread-pointer.h
> > new file mode 100644
> > index 000000000000..7dc990687982
> > --- /dev/null
> > +++ b/tools/testing/selftests/rseq/rseq-loongarch-thread-pointer.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/* SPDX-FileCopyrightText: 2023 Huang Pei <huangpei@loongson.cn> */
> > +
> > +#ifndef _RSEQ_LOONGARCH_THREAD_POINTER
> > +#define _RSEQ_LOONGARCH_THREAD_POINTER
> > +
> > +#ifdef __cplusplus
> > +extern "C" {
> > +#endif
> > +
> > +static inline void *rseq_thread_pointer(void)
> > +{
> > +       register void *__result asm ("$2");
> > +       asm ("" : "=r" (__result));
> > +       return __result;
> > +}
> Since you have already refer the latest toolchain in commit message,
> you don't need to define a local version of rseq_thread_pointer().
> 
> Huacai
> 
> > +
> > +#ifdef __cplusplus
> > +}
> > +#endif
> > +
> > +#endif
> > diff --git a/tools/testing/selftests/rseq/rseq-loongarch.h b/tools/testing/selftests/rseq/rseq-loongarch.h
> > new file mode 100644
> > index 000000000000..1359d28c48a4
> > --- /dev/null
> > +++ b/tools/testing/selftests/rseq/rseq-loongarch.h
> > @@ -0,0 +1,196 @@
> > +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> > +/*
> > + * Author: Huang Pei <huangpei@loongson.cn>
> > + * (C) Copyright 2023 Loongson Technology Corporation Limited
> > + * (C) Copyright 2016-2022 - Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > + * (C) Copyright 2018 MIPS Tech LLC
> > + * (C) Copyright 2018 - Paul Burton <paul.burton@mips.com>
> > + */
> > +
> > +/*
> > + * RSEQ_SIG use "break 0x10" instruction.
> > + */
> > +
> > +# define RSEQ_SIG      0x002a0010
> > +
> > +
> > +
> > +#define rseq_smp_mb()  __asm__ __volatile__ ("dbar 0x10" ::: "memory")
> > +#define rseq_smp_rmb() __asm__ __volatile__ ("dbar 0x15" ::: "memory")
> > +#define rseq_smp_wmb() __asm__ __volatile__ ("dbar 0x1a" ::: "memory")
> > +#define RSEQ_ASM_TMP_REG_1     "$r12"
> > +#define RSEQ_ASM_TMP_REG_2     "$r13"
> > +#define RSEQ_ASM_TMP_REG_3     "$r14"
> > +#define RSEQ_ASM_TMP_REG_4     "$r15"
> > +
> > +#define rseq_smp_load_acquire(p)                                       \
> > +__extension__ ({                                                       \
> > +       rseq_unqual_scalar_typeof(*(p)) ____p1 = RSEQ_READ_ONCE(*(p));  \
> > +       __asm__ __volatile__("dbar 0x14" :::  "memory");                \
> > +       ____p1;                                                         \
> > +})
> > +
> > +#define rseq_smp_acquire__after_ctrl_dep()     rseq_smp_rmb()
> > +
> > +#define rseq_smp_store_release(p, v)                                   \
> > +do {                                                                   \
> > +       __asm__ __volatile__("dbar 0x12" :::  "memory");                \
> > +       RSEQ_WRITE_ONCE(*(p), v);                                       \
> > +} while (0)
> > +
> > +# define LONG                  ".dword "
> > +# define LONG_LA               "la.local "
> > +# define LONG_L                        "ld.d "
> > +# define LONG_S                        "st.d "
> > +# define LONG_ADDI             "addi.d "
> > +# define LONG_ADDU             "add.d "
> > +# define U32_U64_PAD(x)                x
> > +
> > +#define __RSEQ_ASM_DEFINE_TABLE(label, version, flags, start_ip, \
> > +                               post_commit_offset, abort_ip) \
> > +               ".pushsection __rseq_cs, \"aw\"\n\t" \
> > +               ".balign 32\n\t" \
> > +               __rseq_str(label) ":\n\t"                                       \
> > +               ".word " __rseq_str(version) ", " __rseq_str(flags) "\n\t" \
> > +               LONG " " U32_U64_PAD(__rseq_str(start_ip)) "\n\t" \
> > +               LONG " " U32_U64_PAD(__rseq_str(post_commit_offset)) "\n\t" \
> > +               LONG " " U32_U64_PAD(__rseq_str(abort_ip)) "\n\t" \
> > +               ".popsection\n\t" \
> > +               ".pushsection __rseq_cs_ptr_array, \"aw\"\n\t" \
> > +               LONG " " U32_U64_PAD(__rseq_str(label) "b") "\n\t" \
> > +               ".popsection\n\t"
> > +
> > +#define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip) \
> > +       __RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,               \
> > +                               ((post_commit_ip) - (start_ip)), abort_ip)
> > +
> > +/*
> > + * Exit points of a rseq critical section consist of all instructions outside
> > + * of the critical section where a critical section can either branch to or
> > + * reach through the normal course of its execution. The abort IP and the
> > + * post-commit IP are already part of the __rseq_cs section and should not be
> > + * explicitly defined as additional exit points. Knowing all exit points is
> > + * useful to assist debuggers stepping over the critical section.
> > + */
> > +#define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip) \
> > +               ".pushsection __rseq_exit_point_array, \"aw\"\n\t" \
> > +               LONG " " U32_U64_PAD(__rseq_str(start_ip)) "\n\t" \
> > +               LONG " " U32_U64_PAD(__rseq_str(exit_ip)) "\n\t" \
> > +               ".popsection\n\t"
> > +
> > +#define RSEQ_ASM_STORE_RSEQ_CS(label, cs_label, rseq_cs) \
> > +               RSEQ_INJECT_ASM(1) \
> > +               LONG_LA  RSEQ_ASM_TMP_REG_1 "," __rseq_str(cs_label) "\n\t" \
> > +               LONG_S   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(rseq_cs) "]\n\t" \
> > +               __rseq_str(label) ":\n\t"
> > +
> > +#define RSEQ_ASM_DEFINE_ABORT(label, abort_label)                      \
> > +               "b      222f\n"                                                 \
> > +               ".balign        4\n"                                            \
> > +               ".long "        __rseq_str(RSEQ_SIG) "\n"                       \
> > +               __rseq_str(label) ":\n"                                         \
> > +               "b      %l[" __rseq_str(abort_label) "]\n"                      \
> > +               "222:\n"
> > +
> > +#define RSEQ_ASM_OP_STORE(value, var)                                  \
> > +       LONG_S  "%[" __rseq_str(value) "], %[" __rseq_str(var) "]\n"
> > +
> > +#define RSEQ_ASM_OP_CMPEQ(var, expect, label)                          \
> > +               LONG_L  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"         \
> > +               "bne    " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"    \
> > +               __rseq_str(label) "\n"
> > +
> > +#define RSEQ_ASM_OP_CMPEQ32(var, expect, label)                                \
> > +               "ld.w   " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"       \
> > +               "bne    " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"    \
> > +               __rseq_str(label) "\n"
> > +
> > +#define RSEQ_ASM_OP_CMPNE(var, expect, label)                          \
> > +               LONG_L  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"         \
> > +               "beq    " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"    \
> > +               __rseq_str(label) "\n"
> > +
> > +#define RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, label) \
> > +               RSEQ_INJECT_ASM(2) \
> > +               RSEQ_ASM_OP_CMPEQ32(current_cpu_id, cpu_id, label)
> > +
> > +#define RSEQ_ASM_OP_R_LOAD(var)                                                \
> > +               LONG_L  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
> > +
> > +#define RSEQ_ASM_OP_R_STORE(var)                                       \
> > +               LONG_S  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
> > +
> > +#define RSEQ_ASM_OP_R_LOAD_OFF(offset)                                 \
> > +               LONG_ADDU RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(offset) "], "    \
> > +                RSEQ_ASM_TMP_REG_1 "\n"                                \
> > +               LONG_L  RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", 0\n"
> > +
> > +#define RSEQ_ASM_OP_R_ADD(count)                                       \
> > +               LONG_ADDU RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1            \
> > +               ", %[" __rseq_str(count) "]\n"
> > +
> > +#define RSEQ_ASM_OP_FINAL_STORE(value, var, post_commit_label)         \
> > +               RSEQ_ASM_OP_STORE(value, var)                                   \
> > +               __rseq_str(post_commit_label) ":\n"
> > +
> > +#define RSEQ_ASM_OP_FINAL_STORE_RELEASE(value, var, post_commit_label) \
> > +               "dbar  0x12\t\n"                                                \
> > +               RSEQ_ASM_OP_STORE(value, var)                                   \
> > +               __rseq_str(post_commit_label) ":\n"
> > +
> > +#define RSEQ_ASM_OP_R_FINAL_STORE(var, post_commit_label)              \
> > +               LONG_S  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"         \
> > +               __rseq_str(post_commit_label) ":\n"
> > +
> > +#define RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)                                \
> > +               "beqz   %[" __rseq_str(len) "], 333f\n"                         \
> > +               "move   " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(len) "]\n"       \
> > +               "move   " RSEQ_ASM_TMP_REG_2 ", %[" __rseq_str(src) "]\n"       \
> > +               "move   " RSEQ_ASM_TMP_REG_3 ", %[" __rseq_str(dst) "]\n"       \
> > +               "222:\n"                                                        \
> > +               "ld.b   " RSEQ_ASM_TMP_REG_4 ", " RSEQ_ASM_TMP_REG_2 ", 0\n"    \
> > +               "st.b   " RSEQ_ASM_TMP_REG_4 ", " RSEQ_ASM_TMP_REG_3 ", 0\n"    \
> > +               LONG_ADDI RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", -1\n"   \
> > +               LONG_ADDI RSEQ_ASM_TMP_REG_2 ", " RSEQ_ASM_TMP_REG_2 ", 1\n"    \
> > +               LONG_ADDI RSEQ_ASM_TMP_REG_3 ", " RSEQ_ASM_TMP_REG_3 ", 1\n"    \
> > +               "bnez   " RSEQ_ASM_TMP_REG_1 ", 222b\n"                         \
> > +               "333:\n"
> > +
> > +#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)          \
> > +               "move   " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"       \
> > +               RSEQ_ASM_OP_R_ADD(off)                                          \
> > +               LONG_L    RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", 0 \n"   \
> > +               RSEQ_ASM_OP_R_ADD(inc)                                          \
> > +               __rseq_str(post_commit_label) ":\n"
> > +
> > +/* Per-cpu-id indexing. */
> > +
> > +#define RSEQ_TEMPLATE_CPU_ID
> > +#define RSEQ_TEMPLATE_MO_RELAXED
> > +#include "rseq-MRL-bits.h"
> > +#undef RSEQ_TEMPLATE_MO_RELAXED
> > +
> > +#define RSEQ_TEMPLATE_MO_RELEASE
> > +#include "rseq-MRL-bits.h"
> > +#undef RSEQ_TEMPLATE_MO_RELEASE
> > +#undef RSEQ_TEMPLATE_CPU_ID
> > +
> > +/* Per-mm-cid indexing. */
> > +
> > +#define RSEQ_TEMPLATE_MM_CID
> > +#define RSEQ_TEMPLATE_MO_RELAXED
> > +#include "rseq-MRL-bits.h"
> > +#undef RSEQ_TEMPLATE_MO_RELAXED
> > +
> > +#define RSEQ_TEMPLATE_MO_RELEASE
> > +#include "rseq-MRL-bits.h"
> > +#undef RSEQ_TEMPLATE_MO_RELEASE
> > +#undef RSEQ_TEMPLATE_MM_CID
> > +
> > +/* APIs which are not based on cpu ids. */
> > +
> > +#define RSEQ_TEMPLATE_CPU_ID_NONE
> > +#define RSEQ_TEMPLATE_MO_RELAXED
> > +#include "rseq-MRL-bits.h"
> > +#undef RSEQ_TEMPLATE_MO_RELAXED
> > +#undef RSEQ_TEMPLATE_CPU_ID_NONE
> > diff --git a/tools/testing/selftests/rseq/rseq-thread-pointer.h b/tools/testing/selftests/rseq/rseq-thread-pointer.h
> > index 977c25d758b2..b9c8fe7c4683 100644
> > --- a/tools/testing/selftests/rseq/rseq-thread-pointer.h
> > +++ b/tools/testing/selftests/rseq/rseq-thread-pointer.h
> > @@ -12,6 +12,8 @@
> >  #include "rseq-x86-thread-pointer.h"
> >  #elif defined(__PPC__)
> >  #include "rseq-ppc-thread-pointer.h"
> > +#elif defined(__loongarch__)
> > +#include "rseq-loongarch-thread-pointer.h"
> >  #else
> >  #include "rseq-generic-thread-pointer.h"
> >  #endif
> > diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftests/rseq/rseq.h
> > index d7364ea4d201..75c4bbe013d3 100644
> > --- a/tools/testing/selftests/rseq/rseq.h
> > +++ b/tools/testing/selftests/rseq/rseq.h
> > @@ -128,6 +128,8 @@ static inline struct rseq_abi *rseq_get_abi(void)
> >  #include <rseq-s390.h>
> >  #elif defined(__riscv)
> >  #include <rseq-riscv.h>
> > +#elif defined(__loongarch__)
> > +#include <rseq-loongarch.h>
> >  #else
> >  #error unsupported target
> >  #endif
> > --
> > 2.30.2
> >
> >


