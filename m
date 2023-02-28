Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4256A5924
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 13:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjB1Mfq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 07:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjB1Mfq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 07:35:46 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1132E823
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 04:35:44 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id s18so5546655pgq.1
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 04:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhWe8sLMccBLRrPsWcYHRaaybNDxZ0zi1CaL4lrAFvc=;
        b=iJtweGpDdSTqN2kXZgyLyRHBqBC9GUkRRoy6rynxSdBwc/xi7Vbq/3f2N94C5mLujq
         w9EG2wiCllviId6GNDlLkbXFwd3mXYXseKL95wKTB6KmEQRjBHJCGbOqKmbCti3DI+ge
         /jjBYZdSq+2BssKiI8DTPI5TE4zup3ctckwnYAZoqcHmwlnU/lF34WLBlpPh5DbmZW1x
         OnYjrkr1l05OXbW3P7CY1B6CopBD27raod6Z7rbWXHCofjgDskhx3QBlMTRKsjTh8d0+
         GZZSBSrne7Q72pybnSMNmSC0ZLCujlURHmZoqWO/H6Tviay4BkJWod6ZfRaG33ptLhER
         A9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KhWe8sLMccBLRrPsWcYHRaaybNDxZ0zi1CaL4lrAFvc=;
        b=hRsi1Onmtu5d8V4DGOUIxdV8qR3fT6r8g46kgOibRXtp2G7uUfLbgSACnrmB9cVhuS
         UuJYmvpHo1AXmAw3Ty56R5AdmPVc7b0Lr8uACS6WjQGfaEOxvCuQHDTFTHoRgfMi6Lh4
         JVEFwMaxkp2aMG1fUl3SBSTYCUKeZehtyxo/C+618PAunA3RQXb4o3nFoQ5I+CFkkLnx
         9zXTsPCvQtuTo9esVIIj724n7XFGnHmSlLbvXvu22OAuX0eMKtVnuiF6y2vjKlQp9Hmq
         MIrDBo+14PtZWEUoca11U1BWUW0KCZd5FerOupfHLwEAJI1IKKjXFPlwcoLc+0PO6Yzd
         gcGA==
X-Gm-Message-State: AO0yUKU9w/Kka5kY6PURn0KZdsRRdi/4vhSLhspFzzexylv99xt3Zj48
        EEBpiODBeJbRoT7iNQMoZNM1dGn9kqHI+bu7Ycn38g==
X-Google-Smtp-Source: AK7set982toa957BfsESaT9p96TlyfxqaTB6xdGDJ93u6JOrGrfrsLteEwl7OmrMxFUw0AK+STVOgMbUnjwZ3PQRWHE=
X-Received: by 2002:a63:7807:0:b0:502:f4c6:b96 with SMTP id
 t7-20020a637807000000b00502f4c60b96mr701622pgc.5.1677587743821; Tue, 28 Feb
 2023 04:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20230228113305.83751-1-jiaxun.yang@flygoat.com> <20230228113305.83751-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20230228113305.83751-2-jiaxun.yang@flygoat.com>
From:   Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date:   Tue, 28 Feb 2023 13:35:32 +0100
Message-ID: <CAM1=_QTwYqAH+21fNnG3aBW-cV8vxtgM7h=enqZYaj2wbRnV8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] MIPS: ebpf jit: Implement DADDI workarounds
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsbogend@alpha.franken.de, paulburton@kernel.org,
        bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

On Tue, Feb 28, 2023 at 12:33=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
>
> For DADDI errata we just workaround by disable immediate operation
> for BPF_ADD / BPF_SUB to avoid generation of DADDIU.
>
> All other use cases in JIT won't cause overflow thus they are all safe.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Drop 64BIT ifdef
> ---
>  arch/mips/Kconfig            | 1 -
>  arch/mips/net/bpf_jit_comp.c | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 37072e15b263..df0910e3895c 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -64,7 +64,6 @@ config MIPS
>         select HAVE_DMA_CONTIGUOUS
>         select HAVE_DYNAMIC_FTRACE
>         select HAVE_EBPF_JIT if !CPU_MICROMIPS && \
> -                               !CPU_DADDI_WORKAROUNDS && \
>                                 !CPU_R4000_WORKAROUNDS && \
>                                 !CPU_R4400_WORKAROUNDS
>         select HAVE_EXIT_THREAD
> diff --git a/arch/mips/net/bpf_jit_comp.c b/arch/mips/net/bpf_jit_comp.c
> index b17130d510d4..a40d926b6513 100644
> --- a/arch/mips/net/bpf_jit_comp.c
> +++ b/arch/mips/net/bpf_jit_comp.c
> @@ -218,9 +218,13 @@ bool valid_alu_i(u8 op, s32 imm)
>                 /* All legal eBPF values are valid */
>                 return true;
>         case BPF_ADD:
> +               if (IS_ENABLED(CONFIG_CPU_DADDI_WORKAROUNDS))
> +                       return false;
>                 /* imm must be 16 bits */
>                 return imm >=3D -0x8000 && imm <=3D 0x7fff;
>         case BPF_SUB:
> +               if (IS_ENABLED(CONFIG_CPU_DADDI_WORKAROUNDS))
> +                       return false;
>                 /* -imm must be 16 bits */
>                 return imm >=3D -0x7fff && imm <=3D 0x8000;
>         case BPF_AND:
> --
> 2.37.1 (Apple Git-137.1)
>
