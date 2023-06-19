Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1529573590B
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 16:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjFSOBh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 10:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjFSOBd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 10:01:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3030910D
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 07:01:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qBFPa-0005Ly-J3; Mon, 19 Jun 2023 15:59:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qBFP9-008WgL-AE; Mon, 19 Jun 2023 15:58:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qBFP8-00FbzI-5U; Mon, 19 Jun 2023 15:58:50 +0200
Date:   Mon, 19 Jun 2023 15:58:49 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Raymond Tan <raymond.tan@intel.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Steven Price <steven.price@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
        Karol Herbst <kherbst@redhat.com>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Danilo Krummrich <dakr@redhat.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-sunxi@lists.linux.dev,
        Rob Clark <robdclark@gmail.com>,
        Rahul T R <r-ravikumar@ti.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Sean Paul <sean@poorly.run>,
        Johan Hovold <johan+linaro@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jingoo Han <jingoohan1@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-aspeed@lists.ozlabs.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <jstultz@google.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Liang He <windhl@126.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-mips@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
        linux-arm-msm@vger.kernel.org,
        Wang Jianzheng <wangjianzheng@vivo.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Brian Starkey <brian.starkey@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yuan Can <yuancan@huawei.com>, Stefan Agner <stefan@agner.ch>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-tegra@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        Joel Stanley <joel@jms.id.au>, nouveau@lists.freedesktop.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alison Wang <alison.wang@nxp.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liu Shixin <liushixin2@huawei.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Karol Wachowski <karol.wachowski@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Emma Anholt <emma@anholt.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Doug Anderson <dianders@chromium.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Laura Nao <laura.nao@collabora.com>,
        David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-renesas-soc@vger.kernel.org,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jayshri Pawar <jpawar@cadence.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Russell King <linux@armlinux.org.uk>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Melissa Wen <mwen@igalia.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Qiang Yu <yuq825@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Lucas Stach <l.stach@pengutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
Message-ID: <20230619135849.crbbeqsytla7upbw@pengutronix.de>
References: <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
 <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
 <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tz4xugcktzhvzxbs"
Content-Disposition: inline
In-Reply-To: <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--tz4xugcktzhvzxbs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Maxime,

On Mon, Jun 19, 2023 at 02:47:09PM +0200, Maxime Ripard wrote:
> On Mon, Jun 19, 2023 at 12:53:42PM +0200, Uwe Kleine-K=F6nig wrote:
> > IMHO you still should ensure that only commits make it into any next
> > snapshot via your tree before X-rc1 for some X (e.g. v6.5) that you
> > intend to be included in X-rc1.
>=20
> That's never been a next rule either. Rust support has been in next for
> almost a year without being sent as a PR for example.

It seems not to be rigorously enforced, but it exists. See for example
https://lore.kernel.org/all/20230510092313.16693e4c@canb.auug.org.au/ .

@Stephen: you wrote there

	You will need to ensure that the patches/commits in your
	tree/series have been [...] destined for the current or next
	Linux merge window.

This is a bit ambiguous because (AFAIK) during a merge window no patches
should be added that are supposed to go in during the next one, right?
Maybe adapt your template to read:

	[...] destined to be included in the next -rc1 release.

which is more precise?

Even if others don't adhere to it, IMHO it's still an opportunity to
improve. Also there is a difference between a patch that is included in
next that doesn't make it in during the next merge window and a patch
that disappears from next. The latter (up to now) only happened to me
when there was a problem with the patch and the maintainer who first
thought the patch to be fine changed their opinion.

> > > > For me, if a maintainer puts some patch into next that's a statement
> > > > saying (approximately) "I think this patch is fine and I intend to
> > > > send it to Linus during the next merge window.".
> > >=20
> > > I mean, that's what we're saying and doing?
> >=20
> > No, on 2023-06-09 I assumed that my patches will go into v6.5-rc1 (as it
> > was part of next-20230609). A few days later however the patches were
> > dropped.
> >
> > The two options that would have made the experience smoother for me are:
> >=20
> >  a) keep c2807ecb5290 in next and send it for v6.5-rc1; or
>=20
> That's not an option. You were simply too late for v6.5-rc1, unless you
> expect us to get rid of timezones and work on week-ends. But surely you
> don't.

We're mixing two things here. One is: "When will my patches be merged?".
I have no problem being patient here and b) is fine for me. The other is
"The patches first being included in next and then later not anymore
is a thing that just waits to be misinterpreted". This latter is the one
I care about here and that I think should be fixed for the future.

> >  b) keep c2807ecb5290 in a branch that doesn't result it entering next
> >     before v6.5-rc1.
>=20
> All the drm-misc committers use dim. If that's a concern for you, feel
> free to send a patch addressing this to dim.

Not sure this is sensible given that I neither use nor know dim. Also I
think it should be the drm-misc maintainers who should care here given
that it's them who create this unfortunate situation again and again.

> > > > So my expectation is that if a patch is dropped again from next, th=
ere
> > > > was a problem and it would be fair if the maintainer tells the
> > > > author/submitter about this problem and that the patch was dropped.
> > >=20
> > > But it wasn't dropped,
> >=20
> > From my POV it was dropped from next as it was part of next between
> > next-20230609 and next-20230615 but not any more since next-20230616.
> > You talk about (not) being dropped from some branch in drm-misc, that's
> > irrelevant for the thing I'm complaining about.
>=20
> You were never told that they were merged in linux-next, but in
> drm-misc-next.

That's nitpicking and little helpful here. In your bubble where only or
mostly drm-misc matters it's ok to only look at drm-misc. But for a
contributor who sends patches for dozens of subsystems next is the more
useful place to look and each subsystem that is special is an obstacle.
=20
> If they did, it's mostly an unfortunate artifact.

I see some progress in this discussion as you seem to agree this is
unfortunate. Actually that's all I intend to achieve.

> We have a documentation that explains the process and how drm-misc-next
> works. If that's still confusing somehow, feel free to amend it to make
> it clearer.
>=20
> > > it's still very much to be sent to Linus during the next merge window.
> >=20
> > "next merge window" as in the one leading to 6.5-rc1? Either we mean
> > different things when we say "next merge window", or there is a
> > misunderstanding I don't see yet.
>=20
> Linus doesn't want to receive in a PR patches that haven't been in
> linux-next for at least two weeks. In most cases that's rc6, which means
> that by the time we send our last PR before rc6, the
> next-merge-window-while-still-meeting-Linus-requirements is 6.6.
>=20
> The rule applies to all trees, and it's why the soc tree also requires
> its submaintainers to submit their PR before -rc6.
>=20
> So yeah, sorry if it was confusing. At the end of the day, it's a
> compromise, and I can't find a better one for everyone involved
> (maintainers, contributors and committers alike) off the top of my head.

Not knowing dim I think there is a simple(?) technical solution here: It
only has to make sure that after the pull request from drm-misc to drm
was sent, no new patches are added to the branch that is merged in next.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tz4xugcktzhvzxbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSQXxkACgkQj4D7WH0S
/k7hFwf9Hc6jU21nCSnyxtSJD52rcy1CAVfRQuE4L4puvv1qo23YedPDQWx38LRO
5IlKdBKcRSupHJH/eZnSoodize/BLrnMvfjU6GBpk7iQJZ5ecRYBP4qOncVQT8xC
b/mFFWcVkhM7dnKm7PhHsBgB2VpeX2ldgXeSUYZGo3T+vhcP3nloyAedR2fSNSSG
dmZoZhftQSafs3ek8qnVMBdTzJAobbe+P/EhtAR32YOdZRueccgkQ48/WJRGDC9l
bzMhHuw5SAAq3XpOk3JN5cL2AK7yB7IDH/SzDVUUSe+DRTT6BwohuGTuYlgfVoPE
2vFPvvwGcWpLmgrrXZWNtM8jn9usBg==
=9IX/
-----END PGP SIGNATURE-----

--tz4xugcktzhvzxbs--
