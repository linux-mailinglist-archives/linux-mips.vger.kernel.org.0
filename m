Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358A2123D5D
	for <lists+linux-mips@lfdr.de>; Wed, 18 Dec 2019 03:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfLRCqH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 21:46:07 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40855 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbfLRCqH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 21:46:07 -0500
Received: by mail-ed1-f67.google.com with SMTP id b8so372640edx.7;
        Tue, 17 Dec 2019 18:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vxwj4gd/9Empd7D3FvHODrnvOnRhpeyanogRcG726ys=;
        b=WJzS6aI/wz3VLuL/0FDfwQQAAqsOUxcJv7nKo1hhzCtoU84k665aVrGSuMqkvY7De+
         lqlMehJDU5TRD0Q4lZqTgYB6/4F/0DI8CXmKVzcgR+0/MRq6FTDa5ZqLLnTaX49b1tn8
         +y/6cOFtVDY75CTr+JWiXbgeBmmAkXk1lgZHPzkK9SjgBtWQaPIifZyd6Rs2bGc2ywcg
         wC6ORMysZYgBRY3lLc5a0QGsNl8UjWsyKAzqHokMvun/8oV/Ujz7+xnPaaRQC3fGf8Gs
         cn58q2JQhzrCHhS3zsIyLrXsO+F8xHyV0Cvq27hhndThBhynZVvEQif2Pmcb/bhY80KC
         jaIg==
X-Gm-Message-State: APjAAAWfsZeyHnrI1ECc5AjIu3PFkkP+62jiBLBaK+saoqo3+i9ugbTS
        KOU59SsrqSms7oyFqbbDGnveuYUJj0E=
X-Google-Smtp-Source: APXvYqxNBeHbe8zvqdXNfrw2aVLabdey2tYFz15BBeGGlqJ8LSmJufGAd+R0F+AyIdfxYOriQgDlxA==
X-Received: by 2002:a17:906:260b:: with SMTP id h11mr1669980ejc.327.1576637164922;
        Tue, 17 Dec 2019 18:46:04 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id d4sm36660ejd.57.2019.12.17.18.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 18:46:04 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id w15so608541wru.4;
        Tue, 17 Dec 2019 18:46:04 -0800 (PST)
X-Received: by 2002:adf:81e3:: with SMTP id 90mr1136437wra.23.1576637164034;
 Tue, 17 Dec 2019 18:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Wed, 18 Dec 2019 10:45:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v67kgMcV5hhURYzMCggeTSnOoupmYKDPViS0tiYFSxOfjA@mail.gmail.com>
Message-ID: <CAGb2v67kgMcV5hhURYzMCggeTSnOoupmYKDPViS0tiYFSxOfjA@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: sunxi: convert to devm_platform_ioremap_resource
To:     Yangtao Li <tiny.windzz@gmail.com>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, leoyang.li@nxp.com,
        khalasa@piap.pl, John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNO..." 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Dec 15, 2019 at 1:54 AM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/soc/sunxi/sunxi_sram.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 1b0d50f36349..f73fbcc73f51 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -320,7 +320,6 @@ static struct regmap_config sunxi_sram_emac_clock_regmap = {
>
>  static int sunxi_sram_probe(struct platform_device *pdev)
>  {
> -       struct resource *res;
>         struct dentry *d;
>         struct regmap *emac_clock;
>         const struct sunxi_sramc_variant *variant;
> @@ -331,8 +330,7 @@ static int sunxi_sram_probe(struct platform_device *pdev)
>         if (!variant)
>                 return -EINVAL;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       base = devm_ioremap_resource(&pdev->dev, res);
> +       base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>
> --
> 2.17.1
>
