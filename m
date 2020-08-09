Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218D023FC17
	for <lists+linux-mips@lfdr.de>; Sun,  9 Aug 2020 03:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgHIB2z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Aug 2020 21:28:55 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:39307 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgHIB2z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Aug 2020 21:28:55 -0400
Received: by mail-il1-f194.google.com with SMTP id z17so4852272ill.6;
        Sat, 08 Aug 2020 18:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VS8yH85WvutsO/KjeEQ2FvfbJcVZS6nX5Zxp1darUqc=;
        b=ePAJDTEFgL2Bn+H2WTjEDCgkRDv3glyvxCz/KnhdE1yYdfKVn0G5UgYdYFgXUM/k1H
         ARzJHrnzzgusiIYtg2EvebxINac+KfayTTYeqULYQnIw94y+zp7ejHGWnNeIq22lXPTa
         T7mOWCT1xezBylthxndCJJffCi8QNIabEGaFrYXf2Hm4h7DL7+AYIvv2Dx6bB9HpOD6C
         BIuLT61EC1PL0r7M9zSghymSUm2B6+r4ZHmHopXq6bdrY4/XfVcXBmTAQt0S3WM3PLS9
         lfMOqrjH8wOeqBF8BMLG6BNRKNoLqajaFJTibqla8dBxUUp1BB3dIeQEM4DdguWbU3Qb
         ZbuA==
X-Gm-Message-State: AOAM5322ojAuaBIf1lS4l6l5eS8M+Zcho+hnpMmPPCg3bYNSe7HEdf20
        KhMOIMuQp5HdKBVYP82YS+ojBCNs0r46JvshYnkkjLr7+IY=
X-Google-Smtp-Source: ABdhPJyXoPzVNwr0tJXZD05cAi3FhTBjqLmbBNMdvEQtSCscJAdZQTYIC+eBygDZqqi+6K/NkaFEPZZ9fWB5mwCqXTU=
X-Received: by 2002:a92:d30a:: with SMTP id x10mr11616603ila.287.1596936533940;
 Sat, 08 Aug 2020 18:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200808123227.2873961-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20200808123227.2873961-1-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sun, 9 Aug 2020 09:28:42 +0800
Message-ID: <CAAhV-H5aG5=rR8iHCp7HMa5eDeFo06GXx9gDjrDy+uFhWy28PA@mail.gmail.com>
Subject: Re: [PATCH for-fixes] MIPS: Loongson64: Do not override watch and
 ejtag feature
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Sat, Aug 8, 2020 at 8:33 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Do not override ejtag feature to 0 as Loongson 3A1000+ do have ejtag.
> For watch, as KVM emulated CPU doesn't have watch feature, we should
> not enable it unconditionally.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> This patch should go into mips-fixes tree as watch feature is blocking
> KVM guest boot in some cases.
> ---
>  arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
> index b6e9c99b85a5..eb181224eb4c 100644
> --- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
> +++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
> @@ -26,7 +26,6 @@
>  #define cpu_has_counter                1
>  #define cpu_has_dc_aliases     (PAGE_SIZE < 0x4000)
>  #define cpu_has_divec          0
> -#define cpu_has_ejtag          0
>  #define cpu_has_inclusive_pcaches      1
>  #define cpu_has_llsc           1
>  #define cpu_has_mcheck         0
> @@ -42,7 +41,6 @@
>  #define cpu_has_veic           0
>  #define cpu_has_vint           0
>  #define cpu_has_vtag_icache    0
> -#define cpu_has_watch          1
>  #define cpu_has_wsbh           1
>  #define cpu_has_ic_fills_f_dc  1
>  #define cpu_hwrena_impl_bits   0xc0000000
> --
> 2.28.0.rc1
>
