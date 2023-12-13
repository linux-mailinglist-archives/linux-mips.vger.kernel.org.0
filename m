Return-Path: <linux-mips+bounces-713-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 605F7810BE0
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 08:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1A911F210FE
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 07:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD22B1A5AC;
	Wed, 13 Dec 2023 07:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYqzdvPS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CB41A584
	for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 07:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006C7C43397
	for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702453972;
	bh=U6hZVBqXy4xwmq1/6kjg+Yqfr0zCIbFON5n2TDithi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dYqzdvPSIJUAU6rg4OPvfppsqkf5hBkq3854PzJ2bQOvo+gZsMZIJMFT1Y2WrPSLh
	 9smEGmZCwjKkpzyDY0eqhrD/ZEhSYcTtYzEdwsRzUfg/E2pQ3ssxYg6/ZCcTqSEINr
	 Hwh7XJqKsacz6Wx6HSIgHkYZNLiKQQlqGOMCfUawo9cMJOcXSJJWSHhnLjOSoQcYgY
	 xPMB3NzlZYS67pBnI4uxNHf/oiV4gfIZqwp5Li72dzHkuGOi3aCTptaLTvKk61m/qY
	 RbnMGwzCLrxPhFDWIOZ9ml3klrzzehP0l0YSqs59Qtgkd+MxNKdtQAWxAjWA89Gik0
	 E6SSvV/p+2vDw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a1f8510883aso526397966b.3
        for <linux-mips@vger.kernel.org>; Tue, 12 Dec 2023 23:52:51 -0800 (PST)
X-Gm-Message-State: AOJu0YxK3G6wCVFZ1j9CpByV8pVcTYXq9jHXG70Bpg3O7Ba9ptXH0RQE
	zalgHID8zo1jdUc/tEVI5Rd/HMs2nv+ouiGGApY=
X-Google-Smtp-Source: AGHT+IEOYAA8h+4yzfgVVDdDCHZ9BPAQgJU/8RQOzzEm/mrfI9VB4t1ZYNO73wCcTuSBWB9L6eOYqQyfKNP8nuYPcPY=
X-Received: by 2002:a17:906:209b:b0:a19:d40a:d1ea with SMTP id
 27-20020a170906209b00b00a19d40ad1eamr2055143ejq.182.1702453970210; Tue, 12
 Dec 2023 23:52:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213071026.466949-1-huangpei@loongson.cn>
In-Reply-To: <20231213071026.466949-1-huangpei@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 13 Dec 2023 15:52:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6uFNdtLbqeayF3yLxkUs=FPRGPvxyYaRJ2Zccj87TRTg@mail.gmail.com>
Message-ID: <CAAhV-H6uFNdtLbqeayF3yLxkUs=FPRGPvxyYaRJ2Zccj87TRTg@mail.gmail.com>
Subject: Re: [PATCH] selftests/rseq: add LoongArch64 support
To: Huang Pei <huangpei@loongson.cn>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Bibo Mao <maobibo@loongson.cn>, 
	linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Paul Burton <paulburton@kernel.org>, Li Xuefeng <lixuefeng@loongson.cn>, 
	Yang Tiezhu <yangtiezhu@loongson.cn>, Gao Juxin <gaojuxin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 3:11=E2=80=AFPM Huang Pei <huangpei@loongson.cn> wr=
ote:
>
> Use same test infrastructure as MIPS and RISC-V, rseq-MRL-bits.h,
> here MRL stands for MIPS-RISCV-LoongArch.
You can consider the name rseq-generic-bits.h, there is also similar
naming in this directory.

>
> Tested on 3A5000+7A1000+ArchLinux Loong64, no errors(need latest
> upstream binutils).
You needn't highlight you have tested. OTOH you can refer the related
commit of binutils.

>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  tools/testing/selftests/rseq/param_test.c     |  20 +
>  ...rseq-mips-riscv-bits.h =3D> rseq-MRL-bits.h} |   0
>  .../selftests/rseq/rseq-loongarch-bits.h      | 410 ++++++++++++++++++
>  .../rseq/rseq-loongarch-thread-pointer.h      |  22 +
>  tools/testing/selftests/rseq/rseq-loongarch.h | 196 +++++++++
>  .../selftests/rseq/rseq-thread-pointer.h      |   2 +
>  tools/testing/selftests/rseq/rseq.h           |   2 +
>  7 files changed, 652 insertions(+)
>  rename tools/testing/selftests/rseq/{rseq-mips-riscv-bits.h =3D> rseq-MR=
L-bits.h} (100%)
>  create mode 100644 tools/testing/selftests/rseq/rseq-loongarch-bits.h
>  create mode 100644 tools/testing/selftests/rseq/rseq-loongarch-thread-po=
inter.h
>  create mode 100644 tools/testing/selftests/rseq/rseq-loongarch.h
>
> diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/se=
lftests/rseq/param_test.c
> index 20403d58345c..724dd07ecc73 100644
> --- a/tools/testing/selftests/rseq/param_test.c
> +++ b/tools/testing/selftests/rseq/param_test.c
> @@ -227,7 +227,27 @@ unsigned int yield_mod_cnt, nr_abort;
>         "bnez " INJECT_ASM_REG ", 222b\n\t"                     \
>         "333:\n\t"
>
> +#elif defined(__loongarch__)
> +#define RSEQ_INJECT_INPUT \
> +       , [loop_cnt_1]"m"(loop_cnt[1]) \
> +       , [loop_cnt_2]"m"(loop_cnt[2]) \
> +       , [loop_cnt_3]"m"(loop_cnt[3]) \
> +       , [loop_cnt_4]"m"(loop_cnt[4]) \
> +       , [loop_cnt_5]"m"(loop_cnt[5]) \
> +       , [loop_cnt_6]"m"(loop_cnt[6])
> +
> +#define INJECT_ASM_REG  "$r16"
> +
> +#define RSEQ_INJECT_CLOBBER \
> +       , INJECT_ASM_REG
>
> +#define RSEQ_INJECT_ASM(n)                                      \
> +       "ld.w " INJECT_ASM_REG ", %[loop_cnt_" #n "]\n\t"         \
> +       "beqz " INJECT_ASM_REG ", 333f\n\t"                     \
> +       "222:\n\t"                                              \
> +       "addi.w  " INJECT_ASM_REG "," INJECT_ASM_REG ", -1\n\t"   \
> +       "bnez " INJECT_ASM_REG ", 222b\n\t"                     \
> +       "333:\n\t"
>  #else
>  #error unsupported target
>  #endif
> diff --git a/tools/testing/selftests/rseq/rseq-mips-riscv-bits.h b/tools/=
testing/selftests/rseq/rseq-MRL-bits.h
> similarity index 100%
> rename from tools/testing/selftests/rseq/rseq-mips-riscv-bits.h
> rename to tools/testing/selftests/rseq/rseq-MRL-bits.h
> diff --git a/tools/testing/selftests/rseq/rseq-loongarch-bits.h b/tools/t=
esting/selftests/rseq/rseq-loongarch-bits.h
> new file mode 100644
> index 000000000000..de31a0143139
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/rseq-loongarch-bits.h
> @@ -0,0 +1,410 @@
> +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> +
> +#include "rseq-bits-template.h"
> +
> +#if defined(RSEQ_TEMPLATE_MO_RELAXED) && \
> +       (defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID))
> +
> +static inline __always_inline
> +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_storev)(intptr_t *v, intptr_t e=
xpect, intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpf=
ail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfai=
l]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2=
]")
> +#endif
> +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> +                                 RSEQ_INJECT_ASM(5)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow output=
s */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (rseq_get_abi=
()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> +                                   [rseq_cs]           "m" (rseq_get_abi=
()->rseq_cs.arch.ptr),
> +                                   [v]                 "m" (*v),
> +                                   [expect]            "r" (expect),
> +                                   [newv]              "r" (newv)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpnev_storeoffp_load)(intptr_t *v, in=
tptr_t expectnot,
> +                              off_t voffp, intptr_t *load, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpf=
ail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPNE(v, expectnot, "%l[cmp=
fail]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPNE(v, expectnot, "%l[err=
or2]")
> +#endif
> +                                 RSEQ_ASM_OP_R_LOAD(v)
> +                                 RSEQ_ASM_OP_R_STORE(load)
> +                                 RSEQ_ASM_OP_R_LOAD_OFF(voffp)
> +                                 RSEQ_ASM_OP_R_FINAL_STORE(v, 3)
> +                                 RSEQ_INJECT_ASM(5)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow output=
s */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (rseq_get_abi=
()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> +                                   [rseq_cs]           "m" (rseq_get_abi=
()->rseq_cs.arch.ptr),
> +                                   [v]                 "m" (*v),
> +                                   [expectnot]         "r" (expectnot),
> +                                   [load]              "m" (*load),
> +                                   [voffp]             "r" (voffp)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int RSEQ_TEMPLATE_IDENTIFIER(rseq_addv)(intptr_t *v, intptr_t count, int=
 cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r1]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, "%l[error1]")
> +#endif
> +                                 RSEQ_ASM_OP_R_LOAD(v)
> +                                 RSEQ_ASM_OP_R_ADD(count)
> +                                 RSEQ_ASM_OP_R_FINAL_STORE(v, 3)
> +                                 RSEQ_INJECT_ASM(4)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow output=
s */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (rseq_get_abi=
()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> +                                   [rseq_cs]           "m" (rseq_get_abi=
()->rseq_cs.arch.ptr),
> +                                   [v]                 "m" (*v),
> +                                   [count]             "r" (count)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1
> +#endif
> +       );
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_cmpeqv_storev)(intptr_t *v, int=
ptr_t expect,
> +                             intptr_t *v2, intptr_t expect2,
> +                             intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpf=
ail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r2]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r3]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfai=
l]")
> +                                 RSEQ_INJECT_ASM(4)
> +                                 RSEQ_ASM_OP_CMPEQ(v2, expect2, "%l[cmpf=
ail]")
> +                                 RSEQ_INJECT_ASM(5)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2=
]")
> +                                 RSEQ_ASM_OP_CMPEQ(v2, expect2, "%l[erro=
r3]")
> +#endif
> +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> +                                 RSEQ_INJECT_ASM(6)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow output=
s */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (rseq_get_abi=
()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> +                                   [rseq_cs]           "m" (rseq_get_abi=
()->rseq_cs.arch.ptr),
> +                                   [v]                 "m" (*v),
> +                                   [expect]            "r" (expect),
> +                                   [v2]                        "m" (*v2)=
,
> +                                   [expect2]           "r" (expect2),
> +                                   [newv]              "r" (newv)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2, error3
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +error3:
> +       rseq_bug("2nd expected value comparison failed");
> +#endif
> +}
> +
> +#define RSEQ_ARCH_HAS_OFFSET_DEREF_ADDV
> +
> +/*
> + *   pval =3D *(ptr+off)
> + *  *pval +=3D inc;
> + */
> +static inline __always_inline
> +int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_=
t off, intptr_t inc, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r1]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, "%l[error1]")
> +#endif
> +                                 RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, 3)
> +                                 RSEQ_INJECT_ASM(4)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow output=
s */
> +                                 : [cpu_id]                    "r" (cpu)=
,
> +                                   [current_cpu_id]            "m" (rseq=
_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> +                                   [rseq_cs]                   "m" (rseq=
_get_abi()->rseq_cs.arch.ptr),
> +                                   [ptr]                       "r" (ptr)=
,
> +                                   [off]                       "er" (off=
),
> +                                   [inc]                       "er" (inc=
)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1
> +#endif
> +       );
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +#endif
> +}
> +
> +#endif /* #if defined(RSEQ_TEMPLATE_MO_RELAXED) &&
> +       (defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID)) =
*/
> +
> +#if (defined(RSEQ_TEMPLATE_MO_RELAXED) || defined(RSEQ_TEMPLATE_MO_RELEA=
SE)) && \
> +       (defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID))
> +
> +static inline __always_inline
> +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_trystorev_storev)(intptr_t *v, =
intptr_t expect,
> +                                intptr_t *v2, intptr_t newv2,
> +                                intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpf=
ail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfai=
l]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2=
]")
> +#endif
> +                                 RSEQ_ASM_OP_STORE(newv2, v2)
> +                                 RSEQ_INJECT_ASM(5)
> +#ifdef RSEQ_TEMPLATE_MO_RELEASE
> +                                 RSEQ_ASM_OP_FINAL_STORE_RELEASE(newv, v=
, 3)
> +#else
> +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> +#endif
> +                                 RSEQ_INJECT_ASM(6)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow output=
s */
> +                                 : [cpu_id]                    "r" (cpu)=
,
> +                                   [current_cpu_id]            "m" (rseq=
_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> +                                   [rseq_cs]                   "m" (rseq=
_get_abi()->rseq_cs.arch.ptr),
> +                                   [expect]                    "r" (expe=
ct),
> +                                   [v]                         "m" (*v),
> +                                   [newv]                      "r" (newv=
),
> +                                   [v2]                        "m" (*v2)=
,
> +                                   [newv2]                     "r" (newv=
2)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int RSEQ_TEMPLATE_IDENTIFIER(rseq_cmpeqv_trymemcpy_storev)(intptr_t *v, =
intptr_t expect,
> +                                void *dst, void *src, size_t len,
> +                                intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpf=
ail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[erro=
r2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfai=
l]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu=
_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2=
]")
> +#endif
> +                                 RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)
> +                                 RSEQ_INJECT_ASM(5)
> +#ifdef RSEQ_TEMPLATE_MO_RELEASE
> +                                 RSEQ_ASM_OP_FINAL_STORE_RELEASE(newv, v=
, 3)
> +#else
> +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> +#endif
> +                                 RSEQ_INJECT_ASM(6)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow output=
s */
> +                                 : [cpu_id]                    "r" (cpu)=
,
> +                                   [current_cpu_id]            "m" (rseq=
_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
> +                                   [rseq_cs]                   "m" (rseq=
_get_abi()->rseq_cs.arch.ptr),
> +                                   [expect]                    "r" (expe=
ct),
> +                                   [v]                         "m" (*v),
> +                                   [newv]                      "r" (newv=
),
> +                                   [dst]                       "r" (dst)=
,
> +                                   [src]                       "r" (src)=
,
> +                                   [len]                       "r" (len)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1, RSEQ_AS=
M_TMP_REG_2,
> +                                   RSEQ_ASM_TMP_REG_3, RSEQ_ASM_TMP_REG_=
4
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +#endif /* #if (defined(RSEQ_TEMPLATE_MO_RELAXED) || defined(RSEQ_TEMPLAT=
E_MO_RELEASE)) &&
> +       (defined(RSEQ_TEMPLATE_CPU_ID) || defined(RSEQ_TEMPLATE_MM_CID)) =
*/
> +
> +#include "rseq-bits-reset.h"
> diff --git a/tools/testing/selftests/rseq/rseq-loongarch-thread-pointer.h=
 b/tools/testing/selftests/rseq/rseq-loongarch-thread-pointer.h
> new file mode 100644
> index 000000000000..7dc990687982
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/rseq-loongarch-thread-pointer.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/* SPDX-FileCopyrightText: 2023 Huang Pei <huangpei@loongson.cn> */
> +
> +#ifndef _RSEQ_LOONGARCH_THREAD_POINTER
> +#define _RSEQ_LOONGARCH_THREAD_POINTER
> +
> +#ifdef __cplusplus
> +extern "C" {
> +#endif
> +
> +static inline void *rseq_thread_pointer(void)
> +{
> +       register void *__result asm ("$2");
> +       asm ("" : "=3Dr" (__result));
> +       return __result;
> +}
Since you have already refer the latest toolchain in commit message,
you don't need to define a local version of rseq_thread_pointer().

Huacai

> +
> +#ifdef __cplusplus
> +}
> +#endif
> +
> +#endif
> diff --git a/tools/testing/selftests/rseq/rseq-loongarch.h b/tools/testin=
g/selftests/rseq/rseq-loongarch.h
> new file mode 100644
> index 000000000000..1359d28c48a4
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/rseq-loongarch.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> +/*
> + * Author: Huang Pei <huangpei@loongson.cn>
> + * (C) Copyright 2023 Loongson Technology Corporation Limited
> + * (C) Copyright 2016-2022 - Mathieu Desnoyers <mathieu.desnoyers@effici=
os.com>
> + * (C) Copyright 2018 MIPS Tech LLC
> + * (C) Copyright 2018 - Paul Burton <paul.burton@mips.com>
> + */
> +
> +/*
> + * RSEQ_SIG use "break 0x10" instruction.
> + */
> +
> +# define RSEQ_SIG      0x002a0010
> +
> +
> +
> +#define rseq_smp_mb()  __asm__ __volatile__ ("dbar 0x10" ::: "memory")
> +#define rseq_smp_rmb() __asm__ __volatile__ ("dbar 0x15" ::: "memory")
> +#define rseq_smp_wmb() __asm__ __volatile__ ("dbar 0x1a" ::: "memory")
> +#define RSEQ_ASM_TMP_REG_1     "$r12"
> +#define RSEQ_ASM_TMP_REG_2     "$r13"
> +#define RSEQ_ASM_TMP_REG_3     "$r14"
> +#define RSEQ_ASM_TMP_REG_4     "$r15"
> +
> +#define rseq_smp_load_acquire(p)                                       \
> +__extension__ ({                                                       \
> +       rseq_unqual_scalar_typeof(*(p)) ____p1 =3D RSEQ_READ_ONCE(*(p)); =
 \
> +       __asm__ __volatile__("dbar 0x14" :::  "memory");                \
> +       ____p1;                                                         \
> +})
> +
> +#define rseq_smp_acquire__after_ctrl_dep()     rseq_smp_rmb()
> +
> +#define rseq_smp_store_release(p, v)                                   \
> +do {                                                                   \
> +       __asm__ __volatile__("dbar 0x12" :::  "memory");                \
> +       RSEQ_WRITE_ONCE(*(p), v);                                       \
> +} while (0)
> +
> +# define LONG                  ".dword "
> +# define LONG_LA               "la.local "
> +# define LONG_L                        "ld.d "
> +# define LONG_S                        "st.d "
> +# define LONG_ADDI             "addi.d "
> +# define LONG_ADDU             "add.d "
> +# define U32_U64_PAD(x)                x
> +
> +#define __RSEQ_ASM_DEFINE_TABLE(label, version, flags, start_ip, \
> +                               post_commit_offset, abort_ip) \
> +               ".pushsection __rseq_cs, \"aw\"\n\t" \
> +               ".balign 32\n\t" \
> +               __rseq_str(label) ":\n\t"                                =
       \
> +               ".word " __rseq_str(version) ", " __rseq_str(flags) "\n\t=
" \
> +               LONG " " U32_U64_PAD(__rseq_str(start_ip)) "\n\t" \
> +               LONG " " U32_U64_PAD(__rseq_str(post_commit_offset)) "\n\=
t" \
> +               LONG " " U32_U64_PAD(__rseq_str(abort_ip)) "\n\t" \
> +               ".popsection\n\t" \
> +               ".pushsection __rseq_cs_ptr_array, \"aw\"\n\t" \
> +               LONG " " U32_U64_PAD(__rseq_str(label) "b") "\n\t" \
> +               ".popsection\n\t"
> +
> +#define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip)=
 \
> +       __RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,               =
\
> +                               ((post_commit_ip) - (start_ip)), abort_ip=
)
> +
> +/*
> + * Exit points of a rseq critical section consist of all instructions ou=
tside
> + * of the critical section where a critical section can either branch to=
 or
> + * reach through the normal course of its execution. The abort IP and th=
e
> + * post-commit IP are already part of the __rseq_cs section and should n=
ot be
> + * explicitly defined as additional exit points. Knowing all exit points=
 is
> + * useful to assist debuggers stepping over the critical section.
> + */
> +#define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip) \
> +               ".pushsection __rseq_exit_point_array, \"aw\"\n\t" \
> +               LONG " " U32_U64_PAD(__rseq_str(start_ip)) "\n\t" \
> +               LONG " " U32_U64_PAD(__rseq_str(exit_ip)) "\n\t" \
> +               ".popsection\n\t"
> +
> +#define RSEQ_ASM_STORE_RSEQ_CS(label, cs_label, rseq_cs) \
> +               RSEQ_INJECT_ASM(1) \
> +               LONG_LA  RSEQ_ASM_TMP_REG_1 "," __rseq_str(cs_label) "\n\=
t" \
> +               LONG_S   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(rseq_cs) "]=
\n\t" \
> +               __rseq_str(label) ":\n\t"
> +
> +#define RSEQ_ASM_DEFINE_ABORT(label, abort_label)                      \
> +               "b      222f\n"                                          =
       \
> +               ".balign        4\n"                                     =
       \
> +               ".long "        __rseq_str(RSEQ_SIG) "\n"                =
       \
> +               __rseq_str(label) ":\n"                                  =
       \
> +               "b      %l[" __rseq_str(abort_label) "]\n"               =
       \
> +               "222:\n"
> +
> +#define RSEQ_ASM_OP_STORE(value, var)                                  \
> +       LONG_S  "%[" __rseq_str(value) "], %[" __rseq_str(var) "]\n"
> +
> +#define RSEQ_ASM_OP_CMPEQ(var, expect, label)                          \
> +               LONG_L  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"  =
       \
> +               "bne    " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "]=
 ,"    \
> +               __rseq_str(label) "\n"
> +
> +#define RSEQ_ASM_OP_CMPEQ32(var, expect, label)                         =
       \
> +               "ld.w   " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"=
       \
> +               "bne    " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "]=
 ,"    \
> +               __rseq_str(label) "\n"
> +
> +#define RSEQ_ASM_OP_CMPNE(var, expect, label)                          \
> +               LONG_L  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"  =
       \
> +               "beq    " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "]=
 ,"    \
> +               __rseq_str(label) "\n"
> +
> +#define RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, label) \
> +               RSEQ_INJECT_ASM(2) \
> +               RSEQ_ASM_OP_CMPEQ32(current_cpu_id, cpu_id, label)
> +
> +#define RSEQ_ASM_OP_R_LOAD(var)                                         =
       \
> +               LONG_L  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
> +
> +#define RSEQ_ASM_OP_R_STORE(var)                                       \
> +               LONG_S  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
> +
> +#define RSEQ_ASM_OP_R_LOAD_OFF(offset)                                 \
> +               LONG_ADDU RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(offset) "]=
, "    \
> +                RSEQ_ASM_TMP_REG_1 "\n"                                \
> +               LONG_L  RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", 0\n=
"
> +
> +#define RSEQ_ASM_OP_R_ADD(count)                                       \
> +               LONG_ADDU RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1     =
       \
> +               ", %[" __rseq_str(count) "]\n"
> +
> +#define RSEQ_ASM_OP_FINAL_STORE(value, var, post_commit_label)         \
> +               RSEQ_ASM_OP_STORE(value, var)                            =
       \
> +               __rseq_str(post_commit_label) ":\n"
> +
> +#define RSEQ_ASM_OP_FINAL_STORE_RELEASE(value, var, post_commit_label) \
> +               "dbar  0x12\t\n"                                         =
       \
> +               RSEQ_ASM_OP_STORE(value, var)                            =
       \
> +               __rseq_str(post_commit_label) ":\n"
> +
> +#define RSEQ_ASM_OP_R_FINAL_STORE(var, post_commit_label)              \
> +               LONG_S  RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"  =
       \
> +               __rseq_str(post_commit_label) ":\n"
> +
> +#define RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)                         =
       \
> +               "beqz   %[" __rseq_str(len) "], 333f\n"                  =
       \
> +               "move   " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(len) "]\n"=
       \
> +               "move   " RSEQ_ASM_TMP_REG_2 ", %[" __rseq_str(src) "]\n"=
       \
> +               "move   " RSEQ_ASM_TMP_REG_3 ", %[" __rseq_str(dst) "]\n"=
       \
> +               "222:\n"                                                 =
       \
> +               "ld.b   " RSEQ_ASM_TMP_REG_4 ", " RSEQ_ASM_TMP_REG_2 ", 0=
\n"    \
> +               "st.b   " RSEQ_ASM_TMP_REG_4 ", " RSEQ_ASM_TMP_REG_3 ", 0=
\n"    \
> +               LONG_ADDI RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", -=
1\n"   \
> +               LONG_ADDI RSEQ_ASM_TMP_REG_2 ", " RSEQ_ASM_TMP_REG_2 ", 1=
\n"    \
> +               LONG_ADDI RSEQ_ASM_TMP_REG_3 ", " RSEQ_ASM_TMP_REG_3 ", 1=
\n"    \
> +               "bnez   " RSEQ_ASM_TMP_REG_1 ", 222b\n"                  =
       \
> +               "333:\n"
> +
> +#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)          \
> +               "move   " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"=
       \
> +               RSEQ_ASM_OP_R_ADD(off)                                   =
       \
> +               LONG_L    RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", 0=
 \n"   \
> +               RSEQ_ASM_OP_R_ADD(inc)                                   =
       \
> +               __rseq_str(post_commit_label) ":\n"
> +
> +/* Per-cpu-id indexing. */
> +
> +#define RSEQ_TEMPLATE_CPU_ID
> +#define RSEQ_TEMPLATE_MO_RELAXED
> +#include "rseq-MRL-bits.h"
> +#undef RSEQ_TEMPLATE_MO_RELAXED
> +
> +#define RSEQ_TEMPLATE_MO_RELEASE
> +#include "rseq-MRL-bits.h"
> +#undef RSEQ_TEMPLATE_MO_RELEASE
> +#undef RSEQ_TEMPLATE_CPU_ID
> +
> +/* Per-mm-cid indexing. */
> +
> +#define RSEQ_TEMPLATE_MM_CID
> +#define RSEQ_TEMPLATE_MO_RELAXED
> +#include "rseq-MRL-bits.h"
> +#undef RSEQ_TEMPLATE_MO_RELAXED
> +
> +#define RSEQ_TEMPLATE_MO_RELEASE
> +#include "rseq-MRL-bits.h"
> +#undef RSEQ_TEMPLATE_MO_RELEASE
> +#undef RSEQ_TEMPLATE_MM_CID
> +
> +/* APIs which are not based on cpu ids. */
> +
> +#define RSEQ_TEMPLATE_CPU_ID_NONE
> +#define RSEQ_TEMPLATE_MO_RELAXED
> +#include "rseq-MRL-bits.h"
> +#undef RSEQ_TEMPLATE_MO_RELAXED
> +#undef RSEQ_TEMPLATE_CPU_ID_NONE
> diff --git a/tools/testing/selftests/rseq/rseq-thread-pointer.h b/tools/t=
esting/selftests/rseq/rseq-thread-pointer.h
> index 977c25d758b2..b9c8fe7c4683 100644
> --- a/tools/testing/selftests/rseq/rseq-thread-pointer.h
> +++ b/tools/testing/selftests/rseq/rseq-thread-pointer.h
> @@ -12,6 +12,8 @@
>  #include "rseq-x86-thread-pointer.h"
>  #elif defined(__PPC__)
>  #include "rseq-ppc-thread-pointer.h"
> +#elif defined(__loongarch__)
> +#include "rseq-loongarch-thread-pointer.h"
>  #else
>  #include "rseq-generic-thread-pointer.h"
>  #endif
> diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftest=
s/rseq/rseq.h
> index d7364ea4d201..75c4bbe013d3 100644
> --- a/tools/testing/selftests/rseq/rseq.h
> +++ b/tools/testing/selftests/rseq/rseq.h
> @@ -128,6 +128,8 @@ static inline struct rseq_abi *rseq_get_abi(void)
>  #include <rseq-s390.h>
>  #elif defined(__riscv)
>  #include <rseq-riscv.h>
> +#elif defined(__loongarch__)
> +#include <rseq-loongarch.h>
>  #else
>  #error unsupported target
>  #endif
> --
> 2.30.2
>
>

