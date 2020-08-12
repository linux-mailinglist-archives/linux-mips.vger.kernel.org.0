Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D187A242A04
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 15:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHLNFL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 12 Aug 2020 09:05:11 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:36556 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgHLNFL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 09:05:11 -0400
Received: by mail-ej1-f65.google.com with SMTP id kq25so2173596ejb.3;
        Wed, 12 Aug 2020 06:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tdqt1zitQfmhTeO/C0ROMNC0FZsvO10tWjPhl3Xzk1s=;
        b=ilrIAqPox+M1CfYRGxRCVut4rD6CUJM/Ev6uyjQL4Ih3in+8TSAHeCD91ut8VKjwsA
         mp/aylAadG3L8peAGdyOpof3gs1VEpyekXqPbMpGxFA07NIgY5UgrScQLUyL2WscXZnS
         iNClLQhiuoQT8bqPtWVNTEgAOZLx5S4Ufye3Z6UxqvefKbVwaN9NGP7u7QesdVRTy9Nt
         e2RwJtd2TqMXda/IwzwPHwOR6qWdyk4wm5a3CfxkFytN/nfSoJvNXpZQrL4ihFYuUBC/
         clHmSbjzgxP3+vEZXLOaKsVipGmguMS8QL7v4LDdWt+dtdJxDcpc177yZ/JyrbhhPXn3
         JiGw==
X-Gm-Message-State: AOAM533HnIXmnn1Fc26rAHb36XKwHS3CY1rg22YyoTEk0Dtnye4AZBmg
        /cHFajN09Dc6ImttLh63wvpkICzsU/8BfZk/D0s=
X-Google-Smtp-Source: ABdhPJyVm7zBQi5YIn6oTrm8D8AmCwXX9u08JvFWM1hGCm/lD3fbGNAPX2Ks72N27VzcBzyeQW2v7/ByspctqztSPvs=
X-Received: by 2002:a17:906:f914:: with SMTP id lc20mr30748642ejb.138.1597237509350;
 Wed, 12 Aug 2020 06:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200812075235.366864-1-noltari@gmail.com> <20200812075235.366864-3-noltari@gmail.com>
In-Reply-To: <20200812075235.366864-3-noltari@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Wed, 12 Aug 2020 15:04:57 +0200
Message-ID: <CAAdtpL5wVqbhqDCzrJCSAsOgY7fdVAoHhk5jekF3d3N+67jY-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] MIPS: BCM63xx: remove EHCI from BCM6348 boards
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

On Wed, Aug 12, 2020 at 9:53 AM Álvaro Fernández Rojas
<noltari@gmail.com> wrote:
>
> There's no EHCI controller on BCM6348.
>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

v3 already reviewed, again:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  v4: no changes.
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
