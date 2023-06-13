Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C8372E305
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jun 2023 14:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242402AbjFMM3v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Jun 2023 08:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242447AbjFMM33 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Jun 2023 08:29:29 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DCE1FD7;
        Tue, 13 Jun 2023 05:29:09 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id DB9C85C0269;
        Tue, 13 Jun 2023 08:29:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 13 Jun 2023 08:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1686659348; x=1686745748; bh=po
        Pn2abIHMYUZ1Dx/1E/Yp1yY1WX/gI2qJDM9zz/5yk=; b=PXNsXuFnHmtrexIvo1
        NFkXSPmStISk2E2hflBLMeucX12cuggg9P/WQUK0Ysg3Re6rxA4pvmZ/ccEEbnYt
        YSmpd6PiqifW8aY8XcHmNlGi1J9oioxr3Rk7IzaaLUZxkSbA+qjqCq1GhQz8N5VC
        cB0pektTL5niAg1+mP242Zbe0j7jJTud4HGIJwWArTrFAB9zeDApLkTZn8qeG+q2
        HQ3U5jgCZYTs8z7/e2C4M6BqRB7LxLhMSP3g+jJw+uKreGAx84bvy19F1VPMeiyA
        JkKuxbGJxf4vr9V9sEqaWoNvm/bP/fYLHZY5KZLmzisaDsZF0SUlGmw7Tydefs28
        XkfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1686659348; x=1686745748; bh=poPn2abIHMYUZ
        1Dx/1E/Yp1yY1WX/gI2qJDM9zz/5yk=; b=hTooP8qZ8p+/dvsXi9bZgAQjvAg0S
        qO+Yg9UsC/ZYTeBBM2aIfHRN38lkedy//8gdl2lZ364a7t9SANcoQOQLq11N6xyX
        6iKlxsogBxV0r6ryoNGIpEBc2SOTTt5hMtmsNpNXEiOO11Qi6AF/aN0LrPG7aoWX
        gSZGppZJI9A2ykXaeL7f4oPQin2Boug31/u5Se13f7X3pVEA0JawKvX0FDICnsHC
        fEdUOzHwv1rWXiN+2q/IBh20y8jao6JrtD9krS5dNC/ktby8yNdMQDs2h9rriQ5a
        RF0T1PdrwLcWpOrEDmIlUlKbaGx3Pt69VwsUFBp6pP6aEcJAis5OQravw==
X-ME-Sender: <xms:FGGIZAqby2px9Do10fciPiXx90B24_WfNzQQi32zqhKD1_CIvMidtQ>
    <xme:FGGIZGobKkfdXhbbNeNJCij63sG4CHwWLOs93PZ24WjdawvAFes9qdTaxa2C_DW1Q
    __2lscgLCWBUvT4B-c>
X-ME-Received: <xmr:FGGIZFNAp0p70b3JOlVZ20jG9QqoYxPr8eKdAsLPYkfT3WElnzr1EwYPcveDytTbsBGJAGWLylyywjowzcmovg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedujedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeefjeeiueeiheevtddvgfeluedufeeigeeijefhveelfeevueefieehuefg
    ffetteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FGGIZH5haJigjyHQUNGA_FU7XrE8QeZevYfo5Eac1QMl42LnJ66kvg>
    <xmx:FGGIZP56dAzUZmr2LIg4L-mXgbxCcWrw94Th1AMGCSD0PZ9iujsiEg>
    <xmx:FGGIZHguJxsuhh_XSoztBXXAPaiKlthqYEJ475FvDuzxci1G8R4omQ>
    <xmx:FGGIZOSsSpPyFPx2Uocy6BBEycE94g_ucdm3Y_zCQMuKdObb4ftOZA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jun 2023 08:29:07 -0400 (EDT)
Date:   Tue, 13 Jun 2023 14:29:05 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-actions@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v4 03/68] clk: Move no reparent case into a separate
 function
Message-ID: <l7jdpyp4lkqpmdxva4dkdvckjmeht2h3jfbmtvuffqgh4aaigl@k7626f2gv5tx>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-3-971d5077e7d2@cerno.tech>
 <b8d0272d-0193-fe40-3294-9e32a0235323@samsung.com>
 <CGME20230613121511eucas1p2595e0de21fadbafc1f6ffdc5636b9271@eucas1p2.samsung.com>
 <c031bff5-6219-adf0-6e73-b688b8de205e@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ym7pmf2huq36hsov"
Content-Disposition: inline
In-Reply-To: <c031bff5-6219-adf0-6e73-b688b8de205e@samsung.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--ym7pmf2huq36hsov
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 13, 2023 at 02:15:10PM +0200, Marek Szyprowski wrote:
> On 13.06.2023 13:15, Marek Szyprowski wrote:
> > On 05.05.2023 13:25, Maxime Ripard wrote:
> >> From: Stephen Boyd <sboyd@kernel.org>
> >>
> >> We'll need to turn the code in clk_mux_determine_rate_flags() to deal
> >> with CLK_SET_RATE_NO_REPARENT into a helper clock drivers will be able
> >> to use if they don't want to allow reparenting.
> >>
> >> Cc: Abel Vesa <abelvesa@kernel.org>
> >> Cc: Alessandro Zummo <a.zummo@towertech.it>
> >> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> >> Cc: "Andreas F=E4rber" <afaerber@suse.de>
> >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> >> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> >> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> >> Cc: Chen-Yu Tsai <wens@csie.org>
> >> Cc: Chen-Yu Tsai <wenst@chromium.org>
> >> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> >> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: David Lechner <david@lechnology.com>
> >> Cc: Dinh Nguyen <dinguyen@kernel.org>
> >> Cc: Fabio Estevam <festevam@gmail.com>
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Jaroslav Kysela <perex@perex.cz>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> >> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> >> Cc: Liam Girdwood <lgirdwood@gmail.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> Cc: Manivannan Sadhasivam <mani@kernel.org>
> >> Cc: Mark Brown <broonie@kernel.org>
> >> Cc: Markus Schneider-Pargmann <msp@baylibre.com>
> >> Cc: Max Filippov <jcmvbkbc@gmail.com>
> >> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> >> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> >> Cc: Miles Chen <miles.chen@mediatek.com>
> >> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> >> Cc: Orson Zhai <orsonzhai@gmail.com>
> >> Cc: Paul Cercueil <paul@crapouillou.net>
> >> Cc: Peng Fan <peng.fan@nxp.com>
> >> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> >> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> >> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> >> Cc: Samuel Holland <samuel@sholland.org>
> >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >> Cc: Sekhar Nori <nsekhar@ti.com>
> >> Cc: Shawn Guo <shawnguo@kernel.org>
> >> Cc: Takashi Iwai <tiwai@suse.com>
> >> Cc: Thierry Reding <thierry.reding@gmail.com>
> >> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> >> Cc: Vinod Koul <vkoul@kernel.org>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: linux-actions@lists.infradead.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-mips@vger.kernel.org
> >> Cc: linux-phy@lists.infradead.org
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> Cc: linux-rtc@vger.kernel.org
> >> Cc: linux-stm32@st-md-mailman.stormreply.com
> >> Cc: linux-sunxi@lists.linux.dev
> >> Cc: linux-tegra@vger.kernel.org
> >> Cc: NXP Linux Team <linux-imx@nxp.com>
> >> Cc: patches@opensource.cirrus.com
> >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> >> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >> ---
> >
> > This patch landed in today's linux-next as commit 1b4e99fda73f ("clk:=
=20
> > Move no reparent case into a separate function"). Unfortunately it=20
> > causes serious regression of some of my test boards. Namely Exynos3250=
=20
> > based boards are so slow after it, that my test scripts fail with a=20
> > timeout waiting for them to finish booting. I will try to debug this=20
> > later in the evening to check what has happened that some clocks got=20
> > very low rate.
> >
> I just got a few spare minutes, so I decided to take a look into this=20
> issue. The following change fixed my problem:
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ffc9f03840b7..7ac9f7a8cb84 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -629,6 +629,7 @@ clk_core_determine_rate_no_reparent(struct clk_hw *hw,
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 best =3D clk_core_get_rate=
_nolock(core);
>  =A0=A0=A0=A0=A0=A0=A0 }
>=20
> +=A0=A0=A0=A0=A0=A0 req->best_parent_rate =3D best;
>  =A0=A0=A0=A0=A0=A0=A0 req->rate =3D best;
>=20
>  =A0=A0=A0=A0=A0=A0=A0 return 0;
>=20
> best_parent_rate is still being used somewhere in the code and needs to=
=20
> be updated regardless of the CLK_SET_RATE_NO_REPARENT flag.

Yeah, that makes sense, could you send a patch?

Thanks for figuring it out!
Maxime

--ym7pmf2huq36hsov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIhhEQAKCRDj7w1vZxhR
xXOoAQDAK6aw4nYGYRJLqebtaBE5GyDeYP0t1soy+3BsbMlFzwD/ZiRkHp+B0tCO
03+uhQUNPVl5ZSkl2IyBNKSqkSJtOw0=
=bV8F
-----END PGP SIGNATURE-----

--ym7pmf2huq36hsov--
