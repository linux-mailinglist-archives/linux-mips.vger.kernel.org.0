Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2E82EA618
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 08:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbhAEHkY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 02:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbhAEHkY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jan 2021 02:40:24 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA21C061794
        for <linux-mips@vger.kernel.org>; Mon,  4 Jan 2021 23:39:44 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id c132so9424032pga.3
        for <linux-mips@vger.kernel.org>; Mon, 04 Jan 2021 23:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qody2jCEDPoy5bjKSwnXJGXZoxBMsCIrdzCynOCmNlU=;
        b=oq3fBBKmVQVQozpKqPhH/2XZWBNc8+cN4bbYtGX+YXzXx3XwUV+HfKRTT6o4OdTLQl
         o1onvhoy7w5G9I+sfXuNay4Ez8YF0J7LLMolV111jFMx5pjqLmKSrfN3342dzuBFAQhp
         0Zu2Sbk46ruW9o6ePdpnVqeKl544A0mafGKogLlZORZIWDWl1YlZx1OwoE63RBKlboB8
         oO74UmcBqWY6+n6sJeNktbPMG+87Q/kSvSGufk0npne/7bvt3F1A0hwVknEyB/TPFk5m
         Qr8dWAoJKy9b24nXUkde2DGeQSicI8dCG5rBwGWIog9BReUCW/2xjL1fXtKZwfRRwXH0
         NbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qody2jCEDPoy5bjKSwnXJGXZoxBMsCIrdzCynOCmNlU=;
        b=W5pNugWMNMKR7Z8TBtW92ypMyyZVbjYnDyUWhJE0MPujhgV8IuC73nOBQr15ow5ERO
         3x4csQAEnEM1YewS5l2kN3t2f5p60/yR725PkPjdAjYHpdXY2VEBUU5SPREIgdhDx6Hq
         l4nYV3aGIcT3eVjG7JaouVa2NOMazObNEYgEFzHlz2uFH7MfIIZjV9zF9Ad0f95+mxHu
         rf4WCF7RXDDcMM/0z1/f5ADx1AO7n9vrdEXxvrlDz4dWyAN10f3BBTNhaL3qO1UO+d9U
         vgAxg+YLWIARib45LVveHDlnxCcPbSlCrlyEOlMKkLDsuZBIf8lgeLswrbXBQGwzlyCH
         z6Yg==
X-Gm-Message-State: AOAM530tVtKmtbJOo4O0ddeW1xMO8kJINlwV213AX1xs43J0d3zNpb+r
        TB5xu0mCR6hh2ijXgkQdlocR67YKc973SmvfSn1J4g==
X-Google-Smtp-Source: ABdhPJyEkV+8qgmexPOtB9TgBL0q3t62sie0wd8yDjAlRGOOjzf+N1GAUIpo3hfMrt177jqbaVEw4pHMt3IW13Gq+E4=
X-Received: by 2002:a62:61c5:0:b029:1a9:5a82:4227 with SMTP id
 v188-20020a6261c50000b02901a95a824227mr46633461pfb.61.1609832383369; Mon, 04
 Jan 2021 23:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20210104121729.46981-1-alobakin@pm.me> <20210104122016.47308-1-alobakin@pm.me>
 <20210104122016.47308-2-alobakin@pm.me>
In-Reply-To: <20210104122016.47308-2-alobakin@pm.me>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Mon, 4 Jan 2021 23:39:32 -0800
Message-ID: <CAFP8O3LA87zyi8f64Sk5g+aLFdYhnZqsEbLC_uTsQk3+6Qus3A@mail.gmail.com>
Subject: Re: [PATCH mips-next 2/4] MIPS: vmlinux.lds.S: add ".rel.dyn" to DISCARDS
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alex Smith <alex.smith@imgtec.com>,
        Markos Chandras <markos.chandras@imgtec.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        "# 3.4.x" <stable@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 4, 2021 at 4:21 AM Alexander Lobakin <alobakin@pm.me> wrote:
>
> GCC somehow manages to place some of the symbols from main.c into
> .rel.dyn section:
>
> mips-alpine-linux-musl-ld: warning: orphan section `.rel.dyn'
> from `init/main.o' being placed in section `.rel.dyn'
>
> I couldn't catch up the exact symbol, but seems like it's harmless
> to discard it from the final vmlinux as kernel doesn't use or
> support dynamic relocations.
>
> Misc: sort DISCARDS section entries alphabetically.
>
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---
>  arch/mips/kernel/vmlinux.lds.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index 83e27a181206..1c3c2e903062 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -221,9 +221,10 @@ SECTIONS
>                 /* ABI crap starts here */
>                 *(.MIPS.abiflags)
>                 *(.MIPS.options)
> +               *(.eh_frame)
>                 *(.options)
>                 *(.pdr)
>                 *(.reginfo)
> -               *(.eh_frame)
> +               *(.rel.dyn)
>         }
>  }
> --
> 2.30.0
>
>

(I don't know why I am on the CC list since I know little about
mips... Anyway, I know the LLD linker's behavior in case that was the
intention... )

I think it'd be good to know the reason why these dynamic relocations
are produced and fix the root cause.

arch/x86/kernel/vmlinux.lds.S asserts no dynamic relocation:
ASSERT(SIZEOF(.rela.dyn) == 0, "Unexpected run-time relocations
(.rela) detected!")
