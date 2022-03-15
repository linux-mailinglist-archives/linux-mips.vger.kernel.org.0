Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4DEA4DA5A5
	for <lists+linux-mips@lfdr.de>; Tue, 15 Mar 2022 23:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350689AbiCOWtV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 18:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350376AbiCOWtU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 18:49:20 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDF1255BF;
        Tue, 15 Mar 2022 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1647384480; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vePc/2l2kPwqNPcpI7/w16whm1eM7Hut3osd5HFg+AM=;
        b=jsFuj1qimCPjEGuKNaHW6yqQaPtxJASN3/Kr0LSEzU+5TLxv/hHEUfkzw+sh1BrG8gbE53
        0nidIxjVglH7P062Z4lr05vFtCKiWPR0N0vYgsmR63Mu1KnPS9SPi9c5QAdDbz4sXeUcc8
        /iPmtTQOZo7lYCYNcfNfn0LmwgmH0gg=
Date:   Tue, 15 Mar 2022 22:47:50 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 09/16] rtc: ingenic: Simplify using
 devm_clk_get_enabled()
To:     Uwe =?iso-8859-1?q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-mips@vger.kernel.org, linux-rtc@vger.kernel.org
Message-Id: <QZ5T8R.VWFGTZG0ZTLW2@crapouillou.net>
In-Reply-To: <20220314141643.22184-10-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
        <20220314141643.22184-10-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Uwe,

Le lun., mars 14 2022 at 15:16:36 +0100, Uwe Kleine-K=F6nig=20
<u.kleine-koenig@pengutronix.de> a =E9crit :
> With devm_clk_get_enabled() caring to disable (and unprepare) the=20
> clock,
> the probe function can be simplified accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Thanks!
-Paul

> ---
>  drivers/rtc/rtc-jz4740.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
> index 6e51df72fd65..9b7bb6ce93ee 100644
> --- a/drivers/rtc/rtc-jz4740.c
> +++ b/drivers/rtc/rtc-jz4740.c
> @@ -257,11 +257,6 @@ static void jz4740_rtc_power_off(void)
>  	kernel_halt();
>  }
>=20
> -static void jz4740_rtc_clk_disable(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static const struct of_device_id jz4740_rtc_of_match[] =3D {
>  	{ .compatible =3D "ingenic,jz4740-rtc", .data =3D (void *)ID_JZ4740 },
>  	{ .compatible =3D "ingenic,jz4760-rtc", .data =3D (void *)ID_JZ4760 },
> @@ -329,24 +324,12 @@ static int jz4740_rtc_probe(struct=20
> platform_device *pdev)
>  	if (IS_ERR(rtc->base))
>  		return PTR_ERR(rtc->base);
>=20
> -	clk =3D devm_clk_get(dev, "rtc");
> +	clk =3D devm_clk_get_enabled(dev, "rtc");
>  	if (IS_ERR(clk)) {
> -		dev_err(dev, "Failed to get RTC clock\n");
> +		dev_err(dev, "Failed to get enabled RTC clock\n");
>  		return PTR_ERR(clk);
>  	}
>=20
> -	ret =3D clk_prepare_enable(clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to enable clock\n");
> -		return ret;
> -	}
> -
> -	ret =3D devm_add_action_or_reset(dev, jz4740_rtc_clk_disable, clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to register devm action\n");
> -		return ret;
> -	}
> -
>  	spin_lock_init(&rtc->lock);
>=20
>  	platform_set_drvdata(pdev, rtc);
> --
> 2.35.1
>=20


