Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C0539F781
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 15:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhFHNTY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 09:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbhFHNTX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 09:19:23 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37A8C061789
        for <linux-mips@vger.kernel.org>; Tue,  8 Jun 2021 06:17:13 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id z206so10832677vsz.6
        for <linux-mips@vger.kernel.org>; Tue, 08 Jun 2021 06:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IBlaigZjV5sq8STNj0id8/6Cg17DTXWl1Q3IQsLPB3A=;
        b=v8xYVwI7sysXcu+xETCr1LbUTUYskjilN0Dg2uGSzOZodjApeA0q7FxdkOCkGMS0N3
         ILr8bflMTzoCZUlQPLEclNbKHkn3uceD9K4vKih6eInxNapCN9NGHEP4n8r6Ah0zY43d
         82nctpPmnvPljQQClDLAZ8f7c9U6IwEnrDZ4FbAAHQCq9oWdXwMZK46B8CA9etPJ+W3V
         AaOz/Wzi5FjceFevb7GqFolzXDWwpOh9BV2QtiM3zFiLUz6hmozVELcNEJC64OQNsc7D
         xBjfbYRlLzuygibOaMaCq6N7oEDk53x4R9i+fQwmndXKdMnrOFRwoZBxOjxR8A6KyrGg
         usoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IBlaigZjV5sq8STNj0id8/6Cg17DTXWl1Q3IQsLPB3A=;
        b=oM9tjzNPPPOCmZ7f1XFWSr+/XFbV5uTQNsJQcQW6D+foVAVgJvPOCfmo8v0lY6jInR
         bWJiPFwbDMtueTdczcoOhwXhtq/CJxvsOsp58fvPPZMrwbzfMvyXw+dgyWx+KDXCHnpQ
         NGAA3b99b31OhlWajzWxzFpx7MYyrY92RXHNF+vNOm1aFvOs4ewjrr2Y/aG8/PHTsg3c
         qh8laJvIiXTpWjYqZAyMo16LwEwDl7yiedKDv0y8xTnskYQEbGn1qhxDhgaiYmlSc/fp
         wTCnB1iR63rXG326Qapcd0RQhzN6FdFMbs86emx9Z4bQrSnZFdIXGA4TzuPvVnr/txLr
         oU1g==
X-Gm-Message-State: AOAM5326QWAQYZbSa6UrZeHPjwiNMGTnVem1b49dAV6/3ofFlB17iJB8
        84axb9TH9L2h4+OFHpbTYVubx0JlXK4px0Nq3iPsyA==
X-Google-Smtp-Source: ABdhPJxay7JnvbyravvhaZyhK6CMPilmQ9CWkeUrB1ld1S7WrWJelrVoiHD/h4dAW2M4pQKzXjKANWYFeGYiPvyjMxI=
X-Received: by 2002:a67:e359:: with SMTP id s25mr11902381vsm.55.1623158227317;
 Tue, 08 Jun 2021 06:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <1623002884-57244-1-git-send-email-zhouyanjie@wanyeetech.com> <1623002884-57244-3-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1623002884-57244-3-git-send-email-zhouyanjie@wanyeetech.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 8 Jun 2021 15:16:30 +0200
Message-ID: <CAPDyKFpQcoyu1Fg46XgyCcgTxLaN1Ez29F1URRaEd4ZHZmuUhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: JZ4740: Add support for JZ4775 and rename
 unreasonable array name.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com, Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 6 Jun 2021 at 20:08, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:
>
> 1.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
> 2.When the support for JZ4775 SoC is added, there will be six compatible
>   strings, so renaming "jz4740_mmc_of_match[]" to "jz4740_mmc_of_matches[=
]"
>   is more reasonable.
>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Applied for next, with a minor change, see below, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/jz4740_mmc.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.=
c
> index b3c636e..ea8434f 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -2,6 +2,7 @@
>  /*
>   *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
>   *  Copyright (C) 2013, Imagination Technologies
> + *  Copyright (C) 2021, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouy=
anjie@wanyeetech.com>

I am dropping this as it's pointless, because of your "Signed-off-by" tag.

If you want more explanation, please have a look at
Documentation/process/submitting-patches.rst. It should explain more
about "Signed-off-by" tags.


>   *
>   *  JZ4740 SD/MMC controller driver
>   */
> @@ -114,6 +115,7 @@ enum jz4740_mmc_version {
>         JZ_MMC_JZ4740,
>         JZ_MMC_JZ4725B,
>         JZ_MMC_JZ4760,
> +       JZ_MMC_JZ4775,
>         JZ_MMC_JZ4780,
>         JZ_MMC_X1000,
>  };
> @@ -138,7 +140,7 @@ enum jz4740_mmc_state {
>   * COOKIE_MAPPED: the request was mapped in the irq handler,
>   * and should be unmapped before mmc_request_done is called..
>   */
> -enum jz4780_cookie {
> +enum jz4775_cookie {
>         COOKIE_UNMAPPED =3D 0,
>         COOKIE_PREMAPPED,
>         COOKIE_MAPPED,
> @@ -194,7 +196,7 @@ static void jz4740_mmc_write_irq_mask(struct jz4740_m=
mc_host *host,
>  static void jz4740_mmc_write_irq_reg(struct jz4740_mmc_host *host,
>                                      uint32_t val)
>  {
> -       if (host->version >=3D JZ_MMC_JZ4780)
> +       if (host->version >=3D JZ_MMC_JZ4775)
>                 writel(val, host->base + JZ_REG_MMC_IREG);
>         else
>                 writew(val, host->base + JZ_REG_MMC_IREG);
> @@ -202,7 +204,7 @@ static void jz4740_mmc_write_irq_reg(struct jz4740_mm=
c_host *host,
>
>  static uint32_t jz4740_mmc_read_irq_reg(struct jz4740_mmc_host *host)
>  {
> -       if (host->version >=3D JZ_MMC_JZ4780)
> +       if (host->version >=3D JZ_MMC_JZ4775)
>                 return readl(host->base + JZ_REG_MMC_IREG);
>         else
>                 return readw(host->base + JZ_REG_MMC_IREG);
> @@ -674,7 +676,7 @@ static void jz4740_mmc_send_command(struct jz4740_mmc=
_host *host,
>                         cmdat |=3D JZ_MMC_CMDAT_WRITE;
>                 if (host->use_dma) {
>                         /*
> -                        * The 4780's MMC controller has integrated DMA a=
bility
> +                        * The JZ4775's MMC controller has integrated DMA=
 ability
>                          * in addition to being able to use the external =
DMA
>                          * controller. It moves DMA control bits to a sep=
arate
>                          * register. The DMA_SEL bit chooses the external
> @@ -682,13 +684,13 @@ static void jz4740_mmc_send_command(struct jz4740_m=
mc_host *host,
>                          * can only use the external controller, and have=
 a
>                          * single DMA enable bit in CMDAT.
>                          */
> -                       if (host->version >=3D JZ_MMC_JZ4780) {
> +                       if (host->version >=3D JZ_MMC_JZ4775) {
>                                 writel(JZ_MMC_DMAC_DMA_EN | JZ_MMC_DMAC_D=
MA_SEL,
>                                        host->base + JZ_REG_MMC_DMAC);
>                         } else {
>                                 cmdat |=3D JZ_MMC_CMDAT_DMA_EN;
>                         }
> -               } else if (host->version >=3D JZ_MMC_JZ4780) {
> +               } else if (host->version >=3D JZ_MMC_JZ4775) {
>                         writel(0, host->base + JZ_REG_MMC_DMAC);
>                 }
>
> @@ -866,7 +868,7 @@ static int jz4740_mmc_set_clock_rate(struct jz4740_mm=
c_host *host, int rate)
>         writew(div, host->base + JZ_REG_MMC_CLKRT);
>
>         if (real_rate > 25000000) {
> -               if (host->version >=3D JZ_MMC_X1000) {
> +               if (host->version >=3D JZ_MMC_JZ4775) {
>                         writel(JZ_MMC_LPM_DRV_RISING_QTR_PHASE_DLY |
>                                    JZ_MMC_LPM_SMP_RISING_QTR_OR_HALF_PHAS=
E_DLY |
>                                    JZ_MMC_LPM_LOW_POWER_MODE_EN,
> @@ -955,15 +957,16 @@ static const struct mmc_host_ops jz4740_mmc_ops =3D=
 {
>         .enable_sdio_irq =3D jz4740_mmc_enable_sdio_irq,
>  };
>
> -static const struct of_device_id jz4740_mmc_of_match[] =3D {
> +static const struct of_device_id jz4740_mmc_of_matches[] =3D {
>         { .compatible =3D "ingenic,jz4740-mmc", .data =3D (void *) JZ_MMC=
_JZ4740 },
>         { .compatible =3D "ingenic,jz4725b-mmc", .data =3D (void *)JZ_MMC=
_JZ4725B },
>         { .compatible =3D "ingenic,jz4760-mmc", .data =3D (void *) JZ_MMC=
_JZ4760 },
> +       { .compatible =3D "ingenic,jz4775-mmc", .data =3D (void *) JZ_MMC=
_JZ4775 },
>         { .compatible =3D "ingenic,jz4780-mmc", .data =3D (void *) JZ_MMC=
_JZ4780 },
>         { .compatible =3D "ingenic,x1000-mmc", .data =3D (void *) JZ_MMC_=
X1000 },
>         {},
>  };
> -MODULE_DEVICE_TABLE(of, jz4740_mmc_of_match);
> +MODULE_DEVICE_TABLE(of, jz4740_mmc_of_matches);
>
>  static int jz4740_mmc_probe(struct platform_device* pdev)
>  {
> @@ -980,7 +983,7 @@ static int jz4740_mmc_probe(struct platform_device* p=
dev)
>
>         host =3D mmc_priv(mmc);
>
> -       match =3D of_match_device(jz4740_mmc_of_match, &pdev->dev);
> +       match =3D of_match_device(jz4740_mmc_of_matches, &pdev->dev);
>         if (match) {
>                 host->version =3D (enum jz4740_mmc_version)match->data;
>         } else {
> @@ -1124,7 +1127,7 @@ static struct platform_driver jz4740_mmc_driver =3D=
 {
>         .driver =3D {
>                 .name =3D "jz4740-mmc",
>                 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> -               .of_match_table =3D of_match_ptr(jz4740_mmc_of_match),
> +               .of_match_table =3D of_match_ptr(jz4740_mmc_of_matches),
>                 .pm =3D pm_ptr(&jz4740_mmc_pm_ops),
>         },
>  };
> --
> 2.7.4
>
