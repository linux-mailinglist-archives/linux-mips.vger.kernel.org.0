Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E5438D6F0
	for <lists+linux-mips@lfdr.de>; Sat, 22 May 2021 20:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhEVS03 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 May 2021 14:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbhEVS02 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 May 2021 14:26:28 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EFFC061574;
        Sat, 22 May 2021 11:25:02 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id k4so17492841ili.4;
        Sat, 22 May 2021 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gxvf6CItXhnwkIkAhhU1TGdchDlAJrQF9LriPZOdZ1w=;
        b=qt2eDctdLY3j41bD8Ba658MYI1+6yvGtzO/8BZjL7iNqT/wVKZWnnOFIM8INFQ0zBk
         B7klkA1BA6+h0H5E7hehfgbJM1/fAF41c7WgSUgel0rJdGCpeEK3r/XHy/kIRefNRpDZ
         FOhfB66jaxIPmd6i7vuKkcSH9fSvbIVk9wGVVcnC0xPYY8dQEqEfpRKaFIL9cBHbugZr
         U2ujsTw+Ld+L7DBWMBX59zIF2rk16LKj2T1esLXrhxEE98EtfWBFpz50bgHZvYe5WbPh
         jntI9SHXCNYTa+rUGaaNAuS5dRSKzw/jnJqBMNwbw7DX4e+ZcoiwTYcHhWXCSQJi8gvQ
         Xw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gxvf6CItXhnwkIkAhhU1TGdchDlAJrQF9LriPZOdZ1w=;
        b=dqomDZr3I8aBC14nH1iVCiaOWeF1CfJSbENSPcg57Eo+RbW6DBILOBm9gD6DjGHls4
         F/GW51VndDhYynDDCWTAAfgK0opZa19SYyg7jo58vlJlWjQUqJKy2oG+qzCrPiupa4Q0
         TO6lIEA5Jw4XIxXsMGIVy8RQ83eE/Q0uQ2uv+Oef18puS0N0llTmE25Vt6bnglhRwS2v
         4y/PyduAE/9t7AkP8nQ1QUtjgsHQAKCCQB3Wca0bjQsMjehrFf1bRzlTj+pVHUoUFNax
         kUUAU1Eh+HI/6Kq5c4CEjy7RMfkBgCxeRt8IDJhQXXVAeIUTKclz9tEgfNv1E/x/WPWv
         avBQ==
X-Gm-Message-State: AOAM532BzHkMNFEddLCMcsXchixHVmOOijiqx7/99MChCfAyayUnH7Aw
        xkSPcjJvgUo2dOMbje8nfqk/BNCY6/ycSCJSRKg0bbBa+lJRCA==
X-Google-Smtp-Source: ABdhPJxToo0dsn97OUWHNita+P6de7hRF+rG4qV618HdE0nBwC84ekAAI42jVUHkBMm+w0lE2C6feTdKf3W5BguMkFI=
X-Received: by 2002:a05:6e02:df2:: with SMTP id m18mr6221698ilj.77.1621707901668;
 Sat, 22 May 2021 11:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210521051343.20059-1-rdunlap@infradead.org>
In-Reply-To: <20210521051343.20059-1-rdunlap@infradead.org>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Sat, 22 May 2021 11:24:50 -0700
Message-ID: <CALCv0x0mHPCvknB-jUS8V8t5mnFTMrENcbNA2oFuX+Z2gmPTHg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: launch.h: add include guard to prevent build errors
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 20, 2021 at 10:13 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> arch/mips/include/asm/mips-boards/launch.h needs an include guard
> to prevent it from being #included more than once.
> Prevents these build errors:
>
> In file included from ../arch/mips/mti-malta/malta-amon.c:16:
> ../arch/mips/include/asm/mips-boards/launch.h:8:8: error: redefinition of 'struct cpulaunch'
>     8 | struct cpulaunch {
>       |        ^~~~~~~~~
> In file included from ../arch/mips/include/asm/mips-cps.h:13,
>                  from ../arch/mips/include/asm/smp-ops.h:16,
>                  from ../arch/mips/include/asm/smp.h:21,
>                  from ../include/linux/smp.h:114,
>                  from ../arch/mips/mti-malta/malta-amon.c:12:
> ../arch/mips/include/asm/mips-boards/launch.h:8:8: note: originally defined here
>     8 | struct cpulaunch {
>       |        ^~~~~~~~~
> make[3]: [../scripts/Makefile.build:273: arch/mips/mti-malta/malta-amon.o] Error 1 (ignored)
>
> Fixes: 6decd1aad15f ("MIPS: add support for buggy MT7621S core detection")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/include/asm/mips-boards/launch.h |    5 +++++
>  1 file changed, 5 insertions(+)
>
> --- linux-next-20210520.orig/arch/mips/include/asm/mips-boards/launch.h
> +++ linux-next-20210520/arch/mips/include/asm/mips-boards/launch.h
> @@ -3,6 +3,9 @@
>   *
>   */
>
> +#ifndef _ASM_MIPS_BOARDS_LAUNCH_H
> +#define _ASM_MIPS_BOARDS_LAUNCH_H
> +
>  #ifndef _ASSEMBLER_
>
>  struct cpulaunch {
> @@ -34,3 +37,5 @@ struct cpulaunch {
>
>  /* Polling period in count cycles for secondary CPU's */
>  #define LAUNCHPERIOD   10000
> +
> +#endif /* _ASM_MIPS_BOARDS_LAUNCH_H */
Thank you for fixing this.

Reviewed-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
