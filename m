Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAB7242A07
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 15:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgHLNFt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 12 Aug 2020 09:05:49 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33087 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgHLNFh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 09:05:37 -0400
Received: by mail-ed1-f66.google.com with SMTP id v22so1481717edy.0;
        Wed, 12 Aug 2020 06:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=86cwkh38zlQcWCjoXodryopmo7X2tpcSM5gcbscKQ0M=;
        b=LfLWy69r5PopPySz3/upBbaClKTF1CnfmmsdaLMbobq9AdHhPsl367CeT6tGxT9wXU
         GHz+YUh7dQOreDaY1ryyiB7xcjUaevSdkkc7Kp6WbG02PXW4r9zx8/W6Y4hcizv517uw
         bwD+WFOISyq3mpyPt0zijzkivIq7r74CEnyVLe1F1tcmnX4eoctdmO4yXkdx5l1bJvVz
         QNFWPy9qY//aFlXUTYhG6n65DJFjufVzit6Lddl1VofwiHhFc1411QysRjTfdFlks/v3
         gpVLyMfKaKnTXmRZlYAzKXaTLkFnn3yyFmLB7Bnj8zI8KF3riXcuhv+Nbj4zzsapdcvc
         kYiQ==
X-Gm-Message-State: AOAM533qKNl+Jg3tb/eQ7+8yRxEagNRBtykAyCl/HfkPcCVlrt2Yz0jT
        zvAysgWeIpQUYEnvXm4vWusrArjXII8S8zrINZQ=
X-Google-Smtp-Source: ABdhPJwOHQpYOR3jt2x+RImx7BBNUDUvTJJPpjeJOh2qXkvIhVclbWE2EaUtquKhKTU4qDcmeBAA9RVGAGdRqndqVAI=
X-Received: by 2002:aa7:dd05:: with SMTP id i5mr25655525edv.324.1597237536069;
 Wed, 12 Aug 2020 06:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200812075235.366864-1-noltari@gmail.com> <20200812075235.366864-4-noltari@gmail.com>
In-Reply-To: <20200812075235.366864-4-noltari@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Wed, 12 Aug 2020 15:05:24 +0200
Message-ID: <CAAdtpL6eiXff38r-e1EtKDsx34mYS2eV0fxw=tXPPCbw1S5ZAw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] MIPS: BCM63xx: enable EHCI for DWV-S0 board
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
> BCM6358 SoCs have OHCI and EHCI controllers that share the same USB ports.
> Therefore, the board should also have EHCI enabled.
>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

v3 already reviewed, again:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  v4: no changes.
>  v3: Reword commit description to avoid possible confusions.
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
