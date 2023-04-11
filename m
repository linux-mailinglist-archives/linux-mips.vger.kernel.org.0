Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98FA6DD922
	for <lists+linux-mips@lfdr.de>; Tue, 11 Apr 2023 13:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjDKLOb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Apr 2023 07:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjDKLOa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Apr 2023 07:14:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7834210
        for <linux-mips@vger.kernel.org>; Tue, 11 Apr 2023 04:14:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmBv0-0004gl-Lm; Tue, 11 Apr 2023 13:12:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmBuf-00AURe-AU; Tue, 11 Apr 2023 13:11:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmBue-00CH5H-AL; Tue, 11 Apr 2023 13:11:48 +0200
Date:   Tue, 11 Apr 2023 13:11:48 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Valentin Korenblit <vkorenblit@sequans.com>,
        Lucas Stach <dev@lynxeye.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Stefan Agner <stefan@agner.ch>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Han Xu <han.xu@nxp.com>, Chuanhong Guo <gch981213@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Heiko Stuebner <heiko@sntech.de>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jack Wang <jinpu.wang@ionos.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-sunxi@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
        Roger Quadros <rogerq@kernel.org>,
        Wang Weiyang <wangweiyang2@huawei.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        kernel@pengutronix.de, Richard Weinberger <richard@nod.at>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-oxnas@groups.io, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] mtd: nand: Convert to platform remove callback returning
 void
Message-ID: <20230411111148.yefmzohsvk3facq3@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
 <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
 <20230411102025.6b2fdc9e@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="he6vq5knkogtd7j7"
Content-Disposition: inline
In-Reply-To: <20230411102025.6b2fdc9e@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--he6vq5knkogtd7j7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Miquel,

On Tue, Apr 11, 2023 at 10:20:25AM +0200, Miquel Raynal wrote:
> > On Fri, Apr 07, 2023 at 10:10:43AM +0200, Miquel Raynal wrote:
> > > I've looked at the different patches, they look good to me but as they
> > > are all trivial and exactly identical, would you mind sending this
> > > again all squashed in a single patch? A subsystem-wide conversion see=
ms
> > > appropriate. In all cases I plan to take this for the next merge
> > > window. =20
> >=20
> > I slightly prefer them separately, because I like small patches and
> > because the Acks and Reviews only apply to the individual drivers.
> > But I don't mind seriously, so here comes the series squashed into one.
>=20
> For any non trivial change, I would definitely do that as well.

A patch is only trivial as long as it doesn't do anything wrong.
I don't assume any problem, but it wouldn't be the first. The first was
bcm2835_spi_remove() being used in bcm2835_spi_shutdown().

> The thing is, by collecting the tags with b4, you lost all the Acks and
> Reviews targets, while we could prevent this, see below.
>=20
> > While going through the changed, probably the s3c24xx driver (which
> > isn't exactly identical to the other changes) could benefit from an
> > additional change throwing out the early exit (which---I guess---cannot
> > be hit).
>=20
> Yes, I believe the 'info =3D=3D NULL' condition is useless, feel free to
> drop it in a second patch if you wish.

Yeah.

> > BTW, I constructed the lists of acks/reviews myself and found the same
> > set. However b4 wailed about each patch claiming:
> >=20
> > 	    =E2=9C=97 BADSIG: DKIM/infradead.org
>=20
> No idea what this means, any pointer?

lists.infradead.org signs all outgoing mail and something between these
outgoing mails and b4 consuming them breaks the signature. I didn't
debug, but depending on where the problem is, either
postmaster@lists.infradead.org or the admins of lore.kernel.org or the
maintainer of b4 might want to know and fix.

> > And it didn't like you producing the tags, saying:
> >=20
> > 	NOTE: some trailers ignored due to from/email mismatches:
> > 	    ! Trailer: Acked-by: Roger Quadros <rogerq@kernel.org>
> > 	     Msg From: Miquel Raynal <miquel.raynal@bootlin.com>
> > 	    [...]
>=20
> Well, yes, I don't expect b4 to read plain english when I say "I
> collected them for you" ^^ But at least my list had a '# <area>' suffix
> for each of the Acked and Reviewed changes, which is now missing. I
> don't know  how useful they actually are, but it seems to me that the
> information was lost between v1 and v2?

That's right. I will resend in a separate thread with the annotations
fixed. Sorry for the noise.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--he6vq5knkogtd7j7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ1QHMACgkQj4D7WH0S
/k59PQgApmYCdD89s3AZJOYu84R1sSO13lJD2sW2YG/826FnsTQ8v5JAAMkZRhMV
k+MCufvC25ennRcrXR5Uv8O1rreswBF1+9WhnWNEGGzaOsRqvVjkbsrMHgpJUsh3
FMlNyvjm6KpNJhqF46lITimOhkWph7CAmCq1OMnfs5D1/biK19XqlwyNlOrka0XW
8dwB13fYwc9PnEdLkyfmzqtcQbGBezwBjXzPkAls4+2qwIJkinKwMZACrpKd1VUr
VOROg0xogL+KfIkaVvPu4UQTs2jpIf13YnyBfynr+pg81qKqHh6lHeS9zaMbTEhM
JRbE//97QsOix1ZjsQHXvFD4zk8yjQ==
=LsjF
-----END PGP SIGNATURE-----

--he6vq5knkogtd7j7--
