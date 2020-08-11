Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDE9241E51
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 18:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgHKQc4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 11 Aug 2020 12:32:56 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38171 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgHKQc4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 12:32:56 -0400
Received: by mail-ed1-f65.google.com with SMTP id i6so9554220edy.5;
        Tue, 11 Aug 2020 09:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f3YXhNiKm0m6ZjqVOtDuZAjhyUrLxtp1YxZQKXDyLHk=;
        b=ehC3ZgWb2KJogDfYdxxyZyTXi5Zm9rHDulwdFdY6jLGPApXRiliBdsZwDmvZgHp7Ck
         JJfYCtWQkQa1YYCXCmbcuoWUxHp6DuN6fX9aQn1OiUgOx9iob5Ii/R4CXia8BN+oVB71
         yWvEiqsp+wnP91o4xC4ORAvXgLdIgmqjRFTPwskv1t1cU+IiLPWAPSfVmK3lroZMZn6W
         XHrGF1Pqaebd9oircPfFvQ0BRGw9L+xZiuq4V9kIyhw6lE4BBEOL2CqOPsVct90xVzHf
         G6N3Ju36Vz8k1vnGavTwf+tdNZfIkT+JQwxcwIa6f7LXL3LblfpN1gfX40/LOm2gJAXk
         baqg==
X-Gm-Message-State: AOAM533qGYk4kyRkDCcWgpM3P4Xxl/vE2Udp5PLFgQxD5OZ/ypEQoRFf
        kb7cYnNnKxmOZdCFKPpH/ku8aXVeNnx99qMS3cI=
X-Google-Smtp-Source: ABdhPJyRw2vyulyfgi7n9bk/PSyiFQQe0bZ3KxYI1LZVLQO25jZRjO90/W5df8tGzy3D0xwbTCyZcRWs2FIXpLBxFlM=
X-Received: by 2002:a50:e70e:: with SMTP id a14mr11619147edn.93.1597163574216;
 Tue, 11 Aug 2020 09:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200811150117.254620-1-noltari@gmail.com> <20200811150117.254620-3-noltari@gmail.com>
In-Reply-To: <20200811150117.254620-3-noltari@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Tue, 11 Aug 2020 18:32:42 +0200
Message-ID: <CAAdtpL5mofUYsiLecDB=yb_v6rKPuKLad5d6bM2jtoMirGLg1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] MIPS: BCM63xx: remove EHCI from BCM6348 boards
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

On Tue, Aug 11, 2020 at 5:05 PM Álvaro Fernández Rojas
<noltari@gmail.com> wrote:
>
> There's no EHCI controller on BCM6348.
>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  v3: no changes.
>  v2: no changes.
>
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> index 744aa16bab12..45f1bc437245 100644
> --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> @@ -285,7 +285,6 @@ static struct board_info __initdata board_96348gw_10 = {
>
>         .has_ohci0                      = 1,
>         .has_pccard                     = 1,
> -       .has_ehci0                      = 1,
>
>         .leds = {
>                 {
> @@ -338,7 +337,6 @@ static struct board_info __initdata board_96348gw_11 = {
>
>         .has_ohci0 = 1,
>         .has_pccard = 1,
> -       .has_ehci0 = 1,
>
>         .leds = {
>                 {
> @@ -441,7 +439,6 @@ static struct board_info __initdata board_FAST2404 = {
>
>         .has_ohci0                      = 1,
>         .has_pccard                     = 1,
> -       .has_ehci0                      = 1,
>  };
>
>  static struct board_info __initdata board_rta1025w_16 = {
> --
> 2.28.0
>
