Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CDA6A0603
	for <lists+linux-mips@lfdr.de>; Thu, 23 Feb 2023 11:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbjBWKXJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Feb 2023 05:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234224AbjBWKW7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Feb 2023 05:22:59 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058613AB0
        for <linux-mips@vger.kernel.org>; Thu, 23 Feb 2023 02:22:55 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso12039128pjb.3
        for <linux-mips@vger.kernel.org>; Thu, 23 Feb 2023 02:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8XdgTiTQNQEwsXE5pqovlVd84glWLCGpX2xXzua3LWo=;
        b=VSUKpsgMMB3wW4V/PL/BsM/fogLl/13whlKI52Bd29FJSvDxaM+KHBEcBBJ0lf2Skt
         s94Hco/mdtp9QSRaDMDdC2xam7ldKj1iYv0lWMBTkhBXalm3gBd0+C7/OeQ7vuVPb4Jr
         sqFGryW442ZIWkxq/nTLDXmlX36nsrmzua2/sgzayKhVIIH9dZlQ3/b1ekO6AuOIFoQl
         eb2tVsGAzmwNJQ6/eMSuWIym51Pma27tVy+R7RMCSvgU0zW8z/VSM3mcD75AwnsSlm3D
         i7GwpYj1gyabBmXQP4sObtEh909yV64c1/GhKjjqFZhNeuD1BBIdSCAsVHSW0qQ19/QG
         bxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XdgTiTQNQEwsXE5pqovlVd84glWLCGpX2xXzua3LWo=;
        b=n17nYVCCEOJNGuC9tLIqUJJgr1ZDkT1FWiwCjP8zz46i1o5cZCYdwJh+vsp3SfEtsq
         attKiq2Qb4RfU8SyZdELuHWmczejj4t6I2LzpRz6MQOr6/Cdu4DHxAHoD4M/iNTMD/Iq
         jAOzb6PxVPwhJVKTh+9jddCfMy33piYxoiU1JcVZdtZ8C7u+vAmIP5gC26pFjDSeY72B
         KshKj3yCjshGLz9Q1/ZFlck+48rz212L84fGO9WjMWz1Ewdglz5D05sRr9V4ElpX7VEd
         X1jibYQcIUntnWv9S4hsmvnpLUsqJeCf0UOHyC6Y3jvynrADGxJDnvUaWpEccidKx7sT
         k/4g==
X-Gm-Message-State: AO0yUKVWB37dB3EYDDR42LB8UH1rtqS/UuNBeUAMGJ19jIUOINbCYl53
        nS8c6TNYExFqCJU8EO8+lbde09Oarg+VIXKwdjD+I6LDeLF2rqRiSQJrmA==
X-Google-Smtp-Source: AK7set9I0Pd1vzjhdIfJFuY1Qt1ZAEkjuKoYDYuiisbN1VUQrOG44GsRAR3GmjhiWJl7kyBTulghkDn8DFnffgIEDVs=
X-Received: by 2002:a17:90b:384d:b0:237:50b6:983c with SMTP id
 nl13-20020a17090b384d00b0023750b6983cmr1056123pjb.116.1677147774407; Thu, 23
 Feb 2023 02:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20230222161222.11879-1-jiaxun.yang@flygoat.com> <20230222161222.11879-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20230222161222.11879-3-jiaxun.yang@flygoat.com>
From:   Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date:   Thu, 23 Feb 2023 11:22:43 +0100
Message-ID: <CAM1=_QTDkYJANgxYwkgPZB+hUX6Rr_Pvnn7cFwSJFHQtLrpQMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] MIPS: ebpf jit: Implement R4000 workarounds
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsbogend@alpha.franken.de, paulburton@kernel.org,
        bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 22, 2023 at 5:12 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> For R4000 erratas around multiplication and division instructions,
> as our use of those instructions are always followed by mflo/mfhi
> instructions, the only issue we need care is
>
> "MIPS R4000PC/SC Errata, Processor Revision 2.2 and 3.0" Errata 28:
> "A double-word or a variable shift may give an incorrect result if
> executed while an integer multiplication is in progress."
>
> We just emit a mfhi $0 to ensure the operation is completed after
> every multiplication instruction accorading to workaround suggestion
> in the document.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig              | 4 +---
>  arch/mips/net/bpf_jit_comp32.c | 4 ++++
>  arch/mips/net/bpf_jit_comp64.c | 3 +++
>  3 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index df0910e3895c..5ea07c833c5b 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -63,9 +63,7 @@ config MIPS
>         select HAVE_DEBUG_STACKOVERFLOW
>         select HAVE_DMA_CONTIGUOUS
>         select HAVE_DYNAMIC_FTRACE
> -       select HAVE_EBPF_JIT if !CPU_MICROMIPS && \
> -                               !CPU_R4000_WORKAROUNDS && \
> -                               !CPU_R4400_WORKAROUNDS

Is the R4400 errata also covered by this workaround?

> +       select HAVE_EBPF_JIT if !CPU_MICROMIPS
>         select HAVE_EXIT_THREAD
>         select HAVE_FAST_GUP
>         select HAVE_FTRACE_MCOUNT_RECORD
> diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
> index ace5db3fbd17..fee334544d2f 100644
> --- a/arch/mips/net/bpf_jit_comp32.c
> +++ b/arch/mips/net/bpf_jit_comp32.c
> @@ -446,6 +446,9 @@ static void emit_mul_i64(struct jit_context *ctx, const u8 dst[], s32 imm)
>                 } else {
>                         emit(ctx, multu, hi(dst), src);
>                         emit(ctx, mflo, hi(dst));
> +                       /* Ensure multiplication is completed */
> +                       if (IS_ENABLED(CONFIG_CPU_R4000_WORKAROUNDS))
> +                               emit(ctx, mfhi, MIPS_R_ZERO);
>                 }
>
>                 /* hi(dst) = hi(dst) - lo(dst) */
> @@ -504,6 +507,7 @@ static void emit_mul_r64(struct jit_context *ctx,
>         } else {
>                 emit(ctx, multu, lo(dst), lo(src));
>                 emit(ctx, mflo, lo(dst));
> +               /* No need for workaround because we have this mfhi */
>                 emit(ctx, mfhi, tmp);
>         }

R4000 is a 64-bit CPU, so the 32-bit JIT implementation will not be
used. From the Makefile:

ifeq ($(CONFIG_32BIT),y)
        obj-$(CONFIG_BPF_JIT) += bpf_jit_comp32.o
else
        obj-$(CONFIG_BPF_JIT) += bpf_jit_comp64.o
endif

>
> diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
> index 0e7c1bdcf914..5f5a93f997bc 100644
> --- a/arch/mips/net/bpf_jit_comp64.c
> +++ b/arch/mips/net/bpf_jit_comp64.c
> @@ -228,6 +228,9 @@ static void emit_alu_r64(struct jit_context *ctx, u8 dst, u8 src, u8 op)
>                 } else {
>                         emit(ctx, dmultu, dst, src);
>                         emit(ctx, mflo, dst);
> +                       /* Ensure multiplication is completed */
> +                       if (IS_ENABLED(CONFIG_CPU_R4000_WORKAROUNDS))
> +                               emit(ctx, mfhi, MIPS_R_ZERO);
>                 }
>                 break;
>         /* dst = dst / src */
> --
> 2.37.1 (Apple Git-137.1)
>
