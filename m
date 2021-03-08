Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84715330A58
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 10:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhCHJfB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 04:35:01 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:35530 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhCHJeY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 04:34:24 -0500
Received: by mail-ot1-f46.google.com with SMTP id j22so2713434otp.2;
        Mon, 08 Mar 2021 01:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CfKvzPwrH09K3mfPL9rn9TytiECVIszpkadXFP26McQ=;
        b=aa1gzwFYhl99SRQkmyuPXEWSLKixlSasT+e2EscW2OYcIwZ+epWSDBJBhemKF1dwTG
         ja0qsLa+Bi3UcSSk4W+Oc82yVbsJTA04xy1RfYArozngqQDYKtAqcLkKWuwdsb/Izxwj
         8e0Lk/axRF0tRzZHiJrbt+jVrtSieKy58irvACK0uITRrPlnn+qA6c6A/NfxKVEGydW9
         oUXm2x46Z1aKzaCqLwE9yPcjxpqlaXG2yyE/yhJEj3ic6PX6VBAdK5exfLzR0WsTnrEp
         wqOFtSeGVLqivqpS61GP+gbt7XxuGPkTC8C1AkX5t7eb+PrHndJN027E2rd/rtw3hHbB
         RPAA==
X-Gm-Message-State: AOAM5335gjWvQQzQGtWfg8PSoAjsCWDnuJ947MsSgRlIZO00xgqffvO0
        9gMCoPL/l8FiiE7JhKkk8L15cyQbl9uoo07vm0c=
X-Google-Smtp-Source: ABdhPJyzdAZmgfcrWP8548AHWQjq2RF6/CTxvu69rzOJaWC4yKA8+jXeva7i28g8zHVIRmTV0UGy6Mp6C/Rb9dfUr8Y=
X-Received: by 2002:a9d:4a8e:: with SMTP id i14mr19333580otf.37.1615196063615;
 Mon, 08 Mar 2021 01:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20210305020535.25006-1-unixbhaskar@gmail.com>
In-Reply-To: <20210305020535.25006-1-unixbhaskar@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Mon, 8 Mar 2021 10:34:11 +0100
Message-ID: <CAAdtpL7jEQQ2TQAHEObWC_uDGDYtxTr3=Sb-MVQ=V6PNZvVJbg@mail.gmail.com>
Subject: Re: [PATCH] arch: mips: bcm63xx: Spello fix in the file clk.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Bhaskar,

On Fri, Mar 5, 2021 at 3:06 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
>
>
> s/revelant/relevant/

Let me recommend you this great post explaining why and how you could
improve your patch subject and description:
https://www.freecodecamp.org/news/writing-good-commit-messages-a-practical-guide/#how-to-write-good-commit-messages

Regards,

Phil.

>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  arch/mips/bcm63xx/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/bcm63xx/clk.c b/arch/mips/bcm63xx/clk.c
> index 164115944a7f..5a3e325275d0 100644
> --- a/arch/mips/bcm63xx/clk.c
> +++ b/arch/mips/bcm63xx/clk.c
> @@ -76,7 +76,7 @@ static struct clk clk_enet_misc = {
>  };
>
>  /*
> - * Ethernet MAC clocks: only revelant on 6358, silently enable misc
> + * Ethernet MAC clocks: only relevant on 6358, silently enable misc
>   * clocks
>   */
>  static void enetx_set(struct clk *clk, int enable)
> --
> 2.30.1
>
