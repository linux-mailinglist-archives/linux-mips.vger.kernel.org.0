Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7095F23FFBB
	for <lists+linux-mips@lfdr.de>; Sun,  9 Aug 2020 20:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgHISts convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 9 Aug 2020 14:49:48 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:45003 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgHISts (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Aug 2020 14:49:48 -0400
Received: by mail-ej1-f65.google.com with SMTP id bo3so7219757ejb.11;
        Sun, 09 Aug 2020 11:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=alj+kfoN+eiarYYjruTtRCY4nIK6VsYUfX1Hud++nqE=;
        b=UKVdH4XBbgJCQCzNQZ3AVL26j7hagA3oZ46MwL/plL0xfsjPo2UbH+9VCEXT8KJCE4
         KNpCL3mLtj3bpkc7mo/OBDU7FmWEGvuHrP9pj5niLDi1AgjXfI8mgiOdkj3MTGyHU6bT
         BbUEZNMISKNMw5+KB4zjeFvKJNxWgfmEgzskyVT9+ogS1l1EydfZ5Gghslkm0KUcF2ZR
         lLUlpt8OHW9uFL8LdDoBhq6ZQMixJ2PlyGZf1suVAhrsLpaSzwJEK5bhD1I1LYNr1Mz6
         C1rniKvIHUXO4ZtRAHuabuf2tyWPekjfvwXAzIxhi6IAdb9enPSi1IdvLCxpO+VHL1Xk
         9HRw==
X-Gm-Message-State: AOAM5333OOZnLmkITDIjBGoe/OAVu2kvIxZNZAHB8UZhaO514/16uCqN
        0MNHpJLreqkCfjkahljhSw+Zvt0OsTFh+eUYUxs=
X-Google-Smtp-Source: ABdhPJyU3N9uvim4xkSI3BHETCWemPV1h7wCd/svgGV47SPVIyk5kbfW4sbROmqJuY1srOoKAYAvA8XhU2feujNpSNI=
X-Received: by 2002:a17:907:42a0:: with SMTP id ny24mr18884449ejb.328.1596998986146;
 Sun, 09 Aug 2020 11:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200807100411.2904279-1-noltari@gmail.com> <20200807100411.2904279-4-noltari@gmail.com>
In-Reply-To: <20200807100411.2904279-4-noltari@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Sun, 9 Aug 2020 20:49:34 +0200
Message-ID: <CAAdtpL7+_inNrbDpq_wt1Eo=tU6+e+yYR9ox-BF7bN82HVV5_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] MIPS: BCM63xx: enable EHCI for DWV-S0 board
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

Hi Álvaro,

On Fri, Aug 7, 2020 at 12:05 PM Álvaro Fernández Rojas
<noltari@gmail.com> wrote:
>
> EHCI and OHCI share the same USB ports. Therefore, if the board has OHCI
> it should also have EHCI.

This statement isn't correct. OHCI doesn't imply EHCI...
(although the opposite is almost always true).

Now per 6358-PB01-R the bcm6358 indeed has a EHCI controller.

Do you mind rewording the commit description?

Regards,

Phil.

>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
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
> 2.27.0
>
