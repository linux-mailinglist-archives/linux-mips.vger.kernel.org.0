Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F83440BF50
	for <lists+linux-mips@lfdr.de>; Wed, 15 Sep 2021 07:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhIOFao (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Sep 2021 01:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhIOFan (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Sep 2021 01:30:43 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78184C061574;
        Tue, 14 Sep 2021 22:29:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id g16so1874281wrb.3;
        Tue, 14 Sep 2021 22:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jGiz7cGZSBsnkMFCSyIwQQF5a/ZVfXBNEv6VQRf8G5w=;
        b=cGOHZjKrT2mePPo10UsxTr2e/gFrwMV7eqrgTso6V9afjr/JUH+T2VA2O7ra6ErJnp
         2AObkZG1xwP2mV91wrkGOk+/w5cCTlBwMokVW5W7/bZDq+Pc5e2fp0it38YkHt0FGw9W
         KJW3GoKx58F+m4Pf+SRmMoauNNpfE+o3InAocmhg7RgEkgegrPVeoNfJE4KjKCC59ig6
         RcKbdoQxYPyQNWG6q55M8CdkEHZdZyFFNr28vld8BJt5agAOeBoO/+Fo5HN4F90vCUBE
         jAp9o7NtwSJFc0q+3QZhw+9Ef1HYa9uXV6FBy88TGtY9qoZ5szJoXa7bQDTN3xDbptnA
         NzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jGiz7cGZSBsnkMFCSyIwQQF5a/ZVfXBNEv6VQRf8G5w=;
        b=TZ81rmR9yJ9uuaxhDkvvOg1o9CJZPJv/KeoiNBbJzpwOAXkZrjePfEIQr9sLK8K2Bu
         lA0g6TKmQA+dmjaC1YEEJeAhA9IdWSBxbYieerZkEXhr4l51wpIasQvHeVFvQLlvdkMP
         2HM0InOnGnGIET/19bMcrChKzPzJsW51tGsIoa+GqlTr4yzAj2QdMttFIsTnBBKPwRkt
         usrgwDRS8IFudjyWGflqyG0aizkefIQeCvMJlfB+hpp/K+Uo/jgjOnHMrEdDNATJM62/
         1tH5AlSRmCSWZ8QAUPc4ExeAL1h8bmx5sYaroylmBCrbF2ajfuse/K4sm7a3vD1gU4IP
         vnmw==
X-Gm-Message-State: AOAM531/CQfdmS6RlhN9xiDJxbukXLdsaLhCKkhJd+lkexePitXuYGKg
        4y20q1CnYC9YHL24Du6he+DkmdVU/+oZAH57iAU=
X-Google-Smtp-Source: ABdhPJxtZiIEpuC0VWVlbYM6btwJHcRMOQz5/ROuXz+iez/yFBHeHJgGVL8MmVppC2vg6ttJxn+2ko9GWjlXtw7Tn7c=
X-Received: by 2002:adf:fac7:: with SMTP id a7mr2757037wrs.341.1631683763866;
 Tue, 14 Sep 2021 22:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <2c399e52540536df9c4006e46ef93fbccdde88db.1631610825.git.geert+renesas@glider.be>
In-Reply-To: <2c399e52540536df9c4006e46ef93fbccdde88db.1631610825.git.geert+renesas@glider.be>
From:   Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date:   Wed, 15 Sep 2021 10:59:12 +0530
Message-ID: <CA+NV+Vk-+MrCA4x7kVoVk0Ejr9Qv33PysQjLBzpXqOF4WNfTRw@mail.gmail.com>
Subject: Re: [PATCH] reset: pistachio: Re-enable driver selection
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 14, 2021 at 2:46 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> After the retirement of MACH_PISTACHIO, the Pistachio Reset Driver is no
> longer auto-enabled when building a kernel for Pistachio systems.
> Worse, the driver cannot be enabled by the user at all (unless
> compile-testing), as the config symbol is invisible.
>
> Fix this partially by making the symbol visible again when compiling for
> MIPS, and dropping the useless default.  The user still has to enable
> the driver manually when building a kernel for Pistachio systems,
> though.
>
> Fixes: 104f942b2832ab13 ("MIPS: Retire MACH_PISTACHIO")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Thanks,
Rahul

> ---
>  drivers/reset/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index be799a5abf8a6edc..b0056ae5d463aedd 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -147,8 +147,8 @@ config RESET_OXNAS
>         bool
>
>  config RESET_PISTACHIO
> -       bool "Pistachio Reset Driver" if COMPILE_TEST
> -       default MACH_PISTACHIO
> +       bool "Pistachio Reset Driver"
> +       depends on MIPS || COMPILE_TEST
>         help
>           This enables the reset driver for ImgTec Pistachio SoCs.
>
> --
> 2.25.1
>
