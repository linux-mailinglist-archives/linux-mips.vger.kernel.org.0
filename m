Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5535711F790
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 13:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfLOMAO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 07:00:14 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:45804 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfLOMAO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 07:00:14 -0500
Received: by mail-io1-f65.google.com with SMTP id i11so960220ioi.12;
        Sun, 15 Dec 2019 04:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U32Ya4ZtyKRe0g31iyaOrg9bNIbVTfXKPEbGivDkS10=;
        b=OSen5Gcvcdj9lEzBZB15Tn6QiRTI9MWlO/rPN49bMq0K83mAgq18VHkzQ7zVlPrjML
         gszdUGt2eF1kyYhDFF+GP7FeP1RPEnPsfH7wY9I095RPAYClYjywGRCaSteDEqN+zK62
         IKehzG864B+NpPZLPI1yH3m0V9J02rnTKvgIZxkccK3VNzHuy++Doo+IV2cQKWeFpyGv
         sOw1S4YJdTl9C8RnFpAVjILHeJMichKHxPUSI98wDRt0UmqQkWCWFLtA7q2g+jukhVzx
         EloylsApJVNnAMvbYem3m+vszDWIyz4reg4yOYbOHfUjbut1/oBMn1uR67AGYca3deCP
         DSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U32Ya4ZtyKRe0g31iyaOrg9bNIbVTfXKPEbGivDkS10=;
        b=hAZx0teeY1ceX/WJXIRvWdfy8H49b3zDRCWyKhNKAGBwd9JU1/N5frsnWmpC2WlPdS
         0hrP3X8Urp+BKXvf3jDnWJyJfSEx2QeBQt6fYGnNID8JFQ3/VOsXEf920Io7G5gUPZSj
         1BtzoQyyMrmqNZrpjW2m3ywPnixc8vU1hNfM34mNiuVopVIRjWG5xqZM8u86IljsIu4a
         WP5NkpPpUhP/Nn0C9S79or0lARxTcsBwRXKoHh8KUdFPuLWVZJ3yiYnIKwlarHgbyVRN
         rMKxgJ+ePwb4Yv1YgA2E6uuJrt0GVozvvZLwCk0Z1wbkfqm0iVB4He1RrfRZuK2x988r
         bhWA==
X-Gm-Message-State: APjAAAXaR48/hPi7HGyK3yBSMlybcj5OFMvnIlMoscFchUGtabzBqoBD
        dOVBg2sajdNapmNg5TvPtnh5TJ+sC/2zDiQX1p8=
X-Google-Smtp-Source: APXvYqytWwvnLfUD+171nhXHDbJqlTikV21tQNc2dQdQlOI6X6lJ/eLQFLTNTro7mQyhFx4wzdvzbYn6q+tytdyDIA8=
X-Received: by 2002:a5d:9f05:: with SMTP id q5mr14678305iot.295.1576411213379;
 Sun, 15 Dec 2019 04:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20191214175447.25482-1-tiny.windzz@gmail.com> <20191214175447.25482-10-tiny.windzz@gmail.com>
 <20191215104824.658889d3@why>
In-Reply-To: <20191215104824.658889d3@why>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Sun, 15 Dec 2019 20:00:01 +0800
Message-ID: <CAEExFWtgXt2pGM1fGfmxNdk_7S_53gnhN0-bProWA4-vOaNN3w@mail.gmail.com>
Subject: Re: [PATCH 10/10] soc: qcom: convert to devm_platform_ioremap_resource
To:     Marc Zyngier <maz@kernel.org>
Cc:     khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
        john@phrozen.org, Matthias Brugger <matthias.bgg@gmail.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, kgene@kernel.org,
        krzk@kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, ssantosh@kernel.org,
        jun.nie@linaro.org, shawnguo@kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Dec 15, 2019 at 6:48 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 14 Dec 2019 17:54:47 +0000
> Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> > Use devm_platform_ioremap_resource() to simplify code.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/soc/qcom/llcc-qcom.c    | 7 +------
> >  drivers/soc/qcom/qcom-geni-se.c | 4 +---
> >  drivers/soc/qcom/qcom_aoss.c    | 4 +---
> >  drivers/soc/qcom/qcom_gsbi.c    | 5 +----
> >  drivers/soc/qcom/spm.c          | 4 +---
> >  5 files changed, 5 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> > index 429b5a60a1ba..99e19df76889 100644
> > --- a/drivers/soc/qcom/llcc-qcom.c
> > +++ b/drivers/soc/qcom/llcc-qcom.c
> > @@ -387,7 +387,6 @@ static int qcom_llcc_remove(struct platform_device *pdev)
> >  static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
> >               const char *name)
> >  {
> > -     struct resource *res;
> >       void __iomem *base;
> >       struct regmap_config llcc_regmap_config = {
> >               .reg_bits = 32,
> > @@ -396,11 +395,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
> >               .fast_io = true,
> >       };
> >
> > -     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> > -     if (!res)
> > -             return ERR_PTR(-ENODEV);
> > -
> > -     base = devm_ioremap_resource(&pdev->dev, res);
> > +     base = devm_platform_ioremap_resource(pdev, 0);
>
> What guarantees do you have that entry 0 matches name?

Yeah, this place is wrong. I intruduce another helper.

https://lore.kernel.org/patchwork/patch/1165186/

Thx,
Yangtao


>
> I find these changes pointless: they don't add much to the readability
> or maintainability of the code, and instead introduce creative bugs.
>
>         M.
> --
> Jazz is not dead. It just smells funny...
