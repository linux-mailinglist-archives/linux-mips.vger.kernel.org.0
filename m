Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F222C8F10
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 21:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388430AbgK3UW7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 15:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388401AbgK3UW7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 15:22:59 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FE5C0613D3
        for <linux-mips@vger.kernel.org>; Mon, 30 Nov 2020 12:22:18 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id j13so292759pjz.3
        for <linux-mips@vger.kernel.org>; Mon, 30 Nov 2020 12:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PhqkesEyNsbnWI5IbqVSyafnBntjvSaAxrpkezcKIVU=;
        b=hCYtJpAKkIxnnszMBxFiO+qa2gIhwweece/fLNGsJio4yQZxBiYBGVX/AEK4t2G+C6
         YhihDYuI5gXWP00+frV1Z9UTrmXgAguUKAt2Z2cSPtxEFS1XMSNDXD/po6xGxNG8AwR4
         mGiIifI/rv32aIq0bhUqMKAYruuwOczr+hq4eUzPIBIGsXCC385wCn7mre/PftQe4Ful
         K/PkxYYQdjwew4A/7PQ6ybB84uEYMVJ5VtNBLy9016p9f0gxgbOsVv+2F/o9Rwn1SGIO
         Z0lDsjGF4ZhCLwnlPPexzmCXyr3Afyhr40mPU6PLI9QpMBbSMw8wZ1KWejmZ4d11ahZv
         FlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PhqkesEyNsbnWI5IbqVSyafnBntjvSaAxrpkezcKIVU=;
        b=HnamScY2VhZxNjWy/LYQS2OKONBlTwHuxi+ee1yd+pj9kskfjsrisOtXIoZfSQvc1y
         H+ANGhUGU4bNq2J7p08XUG9zy9U6MCdCt0n+EnjV8ywIibECAtOPN7H92uNdb+bzoy3u
         JxuQKwa1W/phQScbwLBEDs9bqIh7sNirPWkyowt1gdtd8IOk+CYHCvkjfNd591H0iwBP
         N/5CuTw4qyS5nOLiK7DPEDB11QyJydr6zctbxhjIqNRdFqhk+OfWyOSG13Av+C9N6u5W
         czh5oL4goi+ReljTvSAJKtQZCBC3ZT4TOrXtoluAfevmUhM8KdZ4dTrTN3/Q8RR4rwoa
         PSAA==
X-Gm-Message-State: AOAM532obAoSu7MosYkmq06YWLrUcR3/jzkDtXYDEy19h3zIG1AuyF/O
        3oopme0jHc4kd8jf+4EgRunGKg6VyRH+hK/sTGnedQ==
X-Google-Smtp-Source: ABdhPJxQ/Jldooi4QE+yJ1CxK/g9fW1WIGt9VRzRT9SDV2Khp6wxcSDQcLBF6bRB7teem1+TdLust4YWNFMkov9kJH4=
X-Received: by 2002:a17:90a:dc16:: with SMTP id i22mr697324pjv.32.1606767738145;
 Mon, 30 Nov 2020 12:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20201127083938.2666770-1-anders.roxell@linaro.org>
In-Reply-To: <20201127083938.2666770-1-anders.roxell@linaro.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 30 Nov 2020 12:22:07 -0800
Message-ID: <CAKwvOdkbPCaJO8c+Zj_BSwfkwcVuMQSFhnxj6PXGo5i86NQ_Zg@mail.gmail.com>
Subject: Re: [PATCH] mips: lib: uncached: fix uninitialized variable 'sp'
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 27, 2020 at 12:39 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building mips tinyconfig with clang the following warning show up:
>
> /tmp/arch/mips/lib/uncached.c:40:18: note: initialize the variable 'sp' to silence this warning
>         register long sp __asm__("$sp");
>                         ^
>                          = 0

Hi Anders, thank you for sending the patch. Do you have the full text
of the warning; it looks like only the note was included?

>
> Rework to make an explicit inline move.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/mips/lib/uncached.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
> index 09d5deea747f..21a4b94a0558 100644
> --- a/arch/mips/lib/uncached.c
> +++ b/arch/mips/lib/uncached.c
> @@ -37,10 +37,11 @@
>   */
>  unsigned long run_uncached(void *func)
>  {
> -       register long sp __asm__("$sp");
>         register long ret __asm__("$2");
>         long lfunc = (long)func, ufunc;
>         long usp;
> +       long sp;
> +       asm ("move %0, $sp" : "=r" (sp));
>
>         if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
>                 usp = CKSEG1ADDR(sp);
> --
> 2.29.2
>


--
Thanks,
~Nick Desaulniers
