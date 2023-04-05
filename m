Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7936D7EE2
	for <lists+linux-mips@lfdr.de>; Wed,  5 Apr 2023 16:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238419AbjDEONq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Apr 2023 10:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238400AbjDEONo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Apr 2023 10:13:44 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7226598;
        Wed,  5 Apr 2023 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1680703926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/jxlPIQ4u9vleEyrefgRxCDQcw2TFpQ6hgZw1V+VUv0=;
        b=0tPg9koIoVawVlZtv0wnFxavxUksWkaJbS6I/oIbhxSx+HSA7vEP4O22qaLeDSYW4cvxTy
        6t2iFXNRXwed3zFQm4OLRsWciMKwP4N/Kz+X2CaIG8M2h3H2Jbt8vfh7RR16C9lgn/Dhhl
        cpoJl0cMB6zxLzMcoz0dBejIU55U8eA=
Message-ID: <5e3e46fa93f8a821ba7afc18e7d16f27757a4650.camel@crapouillou.net>
Subject: Re: [PATCH 02/10] usb: musb: jz4740: Convert to platform remove
 callback returning void
From:   Paul Cercueil <paul@crapouillou.net>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Date:   Wed, 05 Apr 2023 16:12:04 +0200
In-Reply-To: <20230405141009.3400693-3-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
         <20230405141009.3400693-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Le mercredi 05 avril 2023 =C3=A0 16:10 +0200, Uwe Kleine-K=C3=B6nig a =C3=
=A9crit=C2=A0:
> The .remove() callback for a platform driver returns an int which
> makes
> many driver authors wrongly assume it's possible to do error handling
> by
> returning an error code. However the value returned is (mostly)
> ignored
> and this typically results in resource leaks. To improve here there
> is a
> quest to make the remove callback return void. In the first step of
> this
> quest all drivers are converted to .remove_new() which already
> returns
> void.
>=20
> Trivially convert this driver from always returning zero in the
> remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/usb/musb/jz4740.c | 6 ++----
> =C2=A01 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
> index c7b1d2a394d9..5aabdd7e2511 100644
> --- a/drivers/usb/musb/jz4740.c
> +++ b/drivers/usb/musb/jz4740.c
> @@ -308,14 +308,12 @@ static int jz4740_probe(struct platform_device
> *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> =C2=A0}
> =C2=A0
> -static int jz4740_remove(struct platform_device *pdev)
> +static void jz4740_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct jz4740_glue *glue =
=3D platform_get_drvdata(pdev);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0platform_device_unregiste=
r(glue->pdev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_disable_unprepare(glu=
e->clk);
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct of_device_id jz4740_musb_of_match[] =3D {
> @@ -327,7 +325,7 @@ MODULE_DEVICE_TABLE(of, jz4740_musb_of_match);
> =C2=A0
> =C2=A0static struct platform_driver jz4740_driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D jz4740_probe,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D jz4740_remove,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove_new=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=3D jz4740_remove,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=3D "musb-jz4740",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.of_match_table =3D jz4740_musb_of_match,

