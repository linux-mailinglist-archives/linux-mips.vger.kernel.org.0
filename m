Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE8E241E3E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 18:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbgHKQa3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 11 Aug 2020 12:30:29 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38849 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728947AbgHKQa2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 12:30:28 -0400
Received: by mail-ed1-f65.google.com with SMTP id i6so9548008edy.5;
        Tue, 11 Aug 2020 09:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9eqGj8EIJFVcHBsCD8Lv6m1EjN63VDEuZ5XkTm8I3vQ=;
        b=i9ZBppot+hXxCaNmVWSeFJ6vzGBT0GzdLmXaOM7HvFMbJ7CBqmn+sejZOaZInP+0zS
         Y1r6nSy2VXZ983R7+VUYG4aqyhtrq9t05RjEw4e0+RgXadjhWvm3rKacY0gsWvimspbw
         o/rVCGFrAn3/fb2MHxBHAYB/xnKJ0o/x6M5041j7YwGBduNC+9Pn9oKsHtQZ7Tw8THso
         Jq20Zx1L+qnXULvaOtG0KLJ29VS0Xo5oInU/+6k0NmFKIJYiZ3klD3gIGA6t6OO2Hiwp
         GryMHCypAIGfCnwBbnEn4DI3Jz+KBR+0Hgx7jUh58xOvyFJoXF6bLA+4blvW7wft1Bok
         ej0A==
X-Gm-Message-State: AOAM531qHKZxWjje34iJcQ7m49DPK+pXA8AGg2jExT3TNj/CcXGEbwYj
        NgApPHhlJ+SWksFzyN0FQUcJemmAG0dIxHkiC9Q=
X-Google-Smtp-Source: ABdhPJy+sJzie+nNhws1WvRnHF1WPTTCyEH8ke79MTLAoB0XyL2e2Lj4p/CjY45d6S8t3lhptHLlwSprAqmdFvWMWzs=
X-Received: by 2002:a05:6402:3130:: with SMTP id dd16mr19933740edb.55.1597163427068;
 Tue, 11 Aug 2020 09:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200811150117.254620-1-noltari@gmail.com> <20200811150117.254620-4-noltari@gmail.com>
In-Reply-To: <20200811150117.254620-4-noltari@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Tue, 11 Aug 2020 18:30:15 +0200
Message-ID: <CAAdtpL7f=KPgVmSqNpAyiyUUURFsDZqwE8A6v-ZHp2Sfut-Mqg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: BCM63xx: enable EHCI for DWV-S0 board
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 11, 2020 at 5:01 PM Álvaro Fernández Rojas
<noltari@gmail.com> wrote:
>
> BCM6358 SoCs have OHCI and EHCI controllers that share the same USB ports.
> Therefore, the board should also have EHCI enabled.
>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  v3: Reword commit description to avoid possible confusions.

Thanks!

>  v2: no changes.
>
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> index 45f1bc437245..ac9570b66f37 100644
> --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> @@ -645,6 +645,7 @@ static struct board_info __initdata board_DWVS0 = {
>         },
>
>         .has_ohci0                      = 1,
> +       .has_ehci0                      = 1,
>  };
>  #endif /* CONFIG_BCM63XX_CPU_6358 */
>
> --
> 2.28.0
>
