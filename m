Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808EC2EC4D3
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 21:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbhAFUWq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 15:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbhAFUWp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 15:22:45 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C252C061575
        for <linux-mips@vger.kernel.org>; Wed,  6 Jan 2021 12:22:05 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id h186so2381614pfe.0
        for <linux-mips@vger.kernel.org>; Wed, 06 Jan 2021 12:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qC3v3aPiZ/ZR6mkFft0a1FWQbrfzrwyrP+icxRFO0Uo=;
        b=lWjK0DjcEVyiNi3dbH0Ml9RlkyjbL9K9DYj+2SjNJeYX2iwhpEZe9jwXg6jN3AhtcU
         ubhV0ojfjqKfh53UClDjH1ihMibOhcUncz1GYyggB5/JWVc4LlYVRbZX3ph69BvrkgH/
         XiWZEB8k3EWGbIajMb+M0D64GI5pLLImOIOKG8Lq09dqPsASsAsNPxBAhLMKK4+WUkYA
         ugUBdV6yNcdSZOoXT/ZXUJ8JaOmsHRkStyS8UUdENfP6BjKSgGlAbJY2DGwRxJ3C61cb
         rO3kV4Up6mGKlqqgKjRAwjpRrVnSsEtqiZyp/yax8u/7ZeMSu8HSn01U/5qiW6mvklld
         I9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qC3v3aPiZ/ZR6mkFft0a1FWQbrfzrwyrP+icxRFO0Uo=;
        b=GEAs+6OKR97X403cKbUoXtwWcrVRlvUv98WhI7XSkawy/pGQaRMvzfXVWMQPly9U9Y
         1tIxutCLjyRNDKrEfbBAQ4DyAd0UAe9nwYmU70wLXd8afUBklIqi7W2XdAsr6FA9pOVe
         b+qfVaiadwESQ0xjetJuCqojLCQUr7tkbLRRcPYDoXtMDlkaapU2CNm02JPaJCCMoFgu
         QYEB8erT5tqa/TU9kHaILyC3WDxlpBZzfP+d+6wpywGOcCS+sOnGNe4FXwHItbMk4eDc
         wpWOucLeEVPZdN8i3lye9V3l2IJQN3kBVGfiUhMArNNk740aQxqOmf2uojl1W9fl02up
         nC3g==
X-Gm-Message-State: AOAM530Knk7/J9/rh4ggCjp3inUU8mbpnCqH5C3x1g7Y9xCTBm0IC2BR
        aYU755E2LQDoJTrWiUg7tqTXAH5+qUVdGyMp0MpbAw==
X-Google-Smtp-Source: ABdhPJyFbigeLaivyfiV1zLifSuBl9eD/ojGZps0lq3cOaW+XuQZJ/DAzjJWxZIA/k4i8Syck+AMEJiramMh2jC9dnA=
X-Received: by 2002:a63:5a08:: with SMTP id o8mr6253893pgb.118.1609964524946;
 Wed, 06 Jan 2021 12:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20210106200713.31840-1-alobakin@pm.me> <20210106200801.31993-1-alobakin@pm.me>
 <20210106200801.31993-3-alobakin@pm.me>
In-Reply-To: <20210106200801.31993-3-alobakin@pm.me>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Wed, 6 Jan 2021 12:21:53 -0800
Message-ID: <CAFP8O3LBM-qSaM0ij7cEoP-s-zDaEG_VApbKonenCTrSxmJw+w@mail.gmail.com>
Subject: Re: [PATCH v2 mips-next 3/4] MIPS: vmlinux.lds.S: catch bad .got,
 .plt and .rel.dyn at link time
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alex Smith <alex.smith@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Markos Chandras <markos.chandras@imgtec.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        "# 3.4.x" <stable@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 6, 2021 at 12:08 PM Alexander Lobakin <alobakin@pm.me> wrote:
>
> Catch any symbols placed in .got, .got.plt, .plt, .rel.dyn
> or .rela.dyn and check for these sections to be zero-sized
> at link time.
>
> At least two of them were noticed in real builds:
>
> mips-alpine-linux-musl-ld: warning: orphan section `.rel.dyn'
> from `init/main.o' being placed in section `.rel.dyn'
>
> ld.lld: warning: <internal>:(.got) is being placed in '.got'
>
> Adopted from x86/kernel/vmlinux.lds.S.
>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com> # .got
> Suggested-by: Fangrui Song <maskray@google.com> # .rel.dyn
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---
>  arch/mips/kernel/vmlinux.lds.S | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index 5d6563970ab2..05eda9d9a7d5 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -227,4 +227,39 @@ SECTIONS
>                 *(.pdr)
>                 *(.reginfo)
>         }
> +
> +       /*
> +        * Sections that should stay zero sized, which is safer to
> +        * explicitly check instead of blindly discarding.
> +        */
> +
> +       .got : {
> +               *(.got)
> +               *(.igot.*)
> +       }
> +       ASSERT(SIZEOF(.got) == 0, "Unexpected GOT entries detected!")
> +
> +       .got.plt (INFO) : {
> +               *(.got.plt)
> +       }
> +       ASSERT(SIZEOF(.got.plt) == 0, "Unexpected GOT/PLT entries detected!")

(INFO) drops the SHF_ALLOC flag from the output section (It does not
mean "informational"). INFO is not need here.
The diff from 815d680771ae09080d2da83dac2647c08cdf99ce "x86/build:
Enforce an empty .got.plt section" is not needed.

> +       .plt : {
> +               *(.plt)
> +               *(.plt.*)
> +               *(.iplt)
> +       }
> +       ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
> +
> +       .rel.dyn : {
> +               *(.rel.*)
> +               *(.rel_*)
> +       }
> +       ASSERT(SIZEOF(.rel.dyn) == 0, "Unexpected run-time relocations (.rel) detected!")
> +
> +       .rela.dyn : {
> +               *(.rela.*)
> +               *(.rela_*)
> +       }
> +       ASSERT(SIZEOF(.rela.dyn) == 0, "Unexpected run-time relocations (.rela) detected!")
>  }

x86 has both .rel.dyn and .rela.dyn because i386 psABI uses REL while
x86-64 psABI uses RELA, but mips does not need .rela.dyn

> --
> 2.30.0
>
>
