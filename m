Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB7C6D32A2
	for <lists+linux-mips@lfdr.de>; Sat,  1 Apr 2023 18:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjDAQnG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Apr 2023 12:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjDAQnF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Apr 2023 12:43:05 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A622C15F
        for <linux-mips@vger.kernel.org>; Sat,  1 Apr 2023 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1680367380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DpC9ja8ZjcM0PGp3q1FiYBDPbTV8D7zSOCUb5nWLYpQ=;
        b=KmMFq6MU062Tgk9+AezWZ27EdZcHaz6UIVoi/GMwcsbqJe/j2qnGrNvIhJqJPlA+PtGOcW
        5lbvncVyCM7FRCLtSkpNfq8UmZOt/SoZdNZQwyLrLfjL5yt9ohYdVxq9A9OKayfqGyUgX4
        iY3kcKXkXa5unPeF0mP4+g8MIiJJ8Hg=
Message-ID: <2d7eb6bfd53a9cbf587a2cec53490b70a6ffeee4.camel@crapouillou.net>
Subject: Re: [PATCH 20/49] mtd: rawnand: ingenic: Convert to platform remove
 callback returning void
From:   Paul Cercueil <paul@crapouillou.net>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        linux-mips@vger.kernel.org, kernel@pengutronix.de
Date:   Sat, 01 Apr 2023 18:42:59 +0200
In-Reply-To: <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
         <20230401161938.2503204-21-u.kleine-koenig@pengutronix.de>
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

Le samedi 01 avril 2023 =C3=A0 18:19 +0200, Uwe Kleine-K=C3=B6nig a =C3=A9c=
rit=C2=A0:
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
> =C2=A0drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 6 ++----
> =C2=A01 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> index ff26c10f295d..b9f135297aa0 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> @@ -522,7 +522,7 @@ static int ingenic_nand_probe(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> -static int ingenic_nand_remove(struct platform_device *pdev)
> +static void ingenic_nand_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ingenic_nfc *nfc =
=3D platform_get_drvdata(pdev);
> =C2=A0
> @@ -530,8 +530,6 @@ static int ingenic_nand_remove(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ingenic_ecc_release(nfc->ecc);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ingenic_nand_cleanup_chip=
s(nfc);
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct jz_soc_info jz4740_soc_info =3D {
> @@ -564,7 +562,7 @@ MODULE_DEVICE_TABLE(of, ingenic_nand_dt_match);
> =C2=A0
> =C2=A0static struct platform_driver ingenic_nand_driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D ingenic_nand_probe,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D ingenic_nand_remove,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove_new=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=3D ingenic_nand_remove,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver=C2=A0=3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=3D DRV_NAME,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.of_match_table =3D ingenic_nand_dt_match,

