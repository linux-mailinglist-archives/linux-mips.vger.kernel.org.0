Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1DBD7350B9
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 11:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjFSJpv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 05:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbjFSJpr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 05:45:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FFE188;
        Mon, 19 Jun 2023 02:45:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F99D60B20;
        Mon, 19 Jun 2023 09:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082AAC433C9;
        Mon, 19 Jun 2023 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687167940;
        bh=Lp4u3T+2xiedusJigDkWh4ix2i0wqp11sPPDYaU3Yo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uTs+Es5MJdQAH06s+4uVkVptqIjhO5PlC4tbhRLzHbhg/jvVFuwTvNh59ROQwqwlI
         FXKrTblcrG9mDZ/TJcMmYqLR2B7PXuxSi+QUizGiyfHcrUjYh69jXXHHFYdHc8FQ8Z
         utFJ+k51BLx2/k90s2dW6WrKqtXXnhUdkuS3Z5CJ1y3d6aKJ4O9d8A122C2R6Ym6c+
         cUPXt0Zryk1mw0GYYVLBKXFlKgEGOJiVvQ2x4DktJoUVQCzZow35a2hUPFH9SbumWV
         hxree4wzoiY6yiZMtFeAigy/yZsqjLyvq4ILxIMoPA7sCEJ1yQVV3K+UaP/p9aEdnF
         3Ul7qcM/T/eqA==
Date:   Mon, 19 Jun 2023 11:45:37 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Raymond Tan <raymond.tan@intel.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
        linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>,
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
        Miaoqian Lin <linmq006@gmail.com>,
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
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
Message-ID: <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gnbs5xikge2uwekh"
Content-Disposition: inline
In-Reply-To: <20230618162950.6th2yo66baqay5mv@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--gnbs5xikge2uwekh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 18, 2023 at 06:29:50PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Maxime,
>=20
> On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> > On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wrote:
> > > > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > Together with the patches that were applied later the topmost com=
mit
> > > > > from this series is c2807ecb5290 ("drm/omap: Convert to platform =
remove
> > > > > callback returning void"). This commit was part for the following=
 next
> > > > > tags:
> > > > >
> > > > >         $ git tag -l --contains c2807ecb5290
> > > > >         next-20230609
> > > > >         next-20230613
> > > > >         next-20230614
> > > > >         next-20230615
> > > > >
> > > > > However in next-20230616 they are missing. In next-20230616
> > > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a35088=
660.
> > > > > Compared to c2807ecb5290 this adds 1149 patches but drops 37 (tha=
t are
> > > > > also not included with a different commit id). The 37 patches dro=
pped
> > > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
> > > > >
> > > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9d=
c..c2807ecb5290
> > > > >              1  Christophe JAILLET
> > > > >              2  Jessica Zhang
> > > > >              5  Karol Wachowski
> > > > >              1  Laura Nao
> > > > >             27  Uwe Kleine-K=C3=B6nig
> > > > >              1  Wang Jianzheng
> > > > >
> > > > >
> > > > > I guess this was done by mistake because nobody told me about dro=
pping
> > > > > my/these patches? Can c2807ecb5290 please be merged into drm-misc=
-next
> > > > > again?
> > > >=20
> > > > Actually, it was probably a mistake that these patches got merged to
> > > > linuxnext during the 4 days that you noticed. However, your patches
> > > > aren't dropped and are still present in drm-misc-next.
> > > >=20
> > > > drm-misc has a bit of a unique model and it's documented fairly wel=
l here:
> > > >=20
> > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> > >=20
> > > Is there a flaw then in this unique model (or its implementation) when
> > > drm-misc/for-linux-next moves in a non-fast-forward manner? This isn't
> > > expected, is it?
> >=20
> > There's no expectation afaik. Any tree merged in linux-next can be
> > rebased, drop a patch, amend one, etc. without any concern.
>=20
> I agree that there are no rules broken for a tree that is included in
> next and a maintainer is free to rewrite their tree independant of the
> tree being included in next.
>=20
> Still I think that shouldn't be used as an excuse.

As an excuse for what?

> For me, if a maintainer puts some patch into next that's a statement
> saying (approximately) "I think this patch is fine and I intend to
> send it to Linus during the next merge window.".

I mean, that's what we're saying and doing?

> So my expectation is that if a patch is dropped again from next, there
> was a problem and it would be fair if the maintainer tells the
> author/submitter about this problem and that the patch was dropped.

But it wasn't dropped, it's still very much to be sent to Linus during
the next merge window.

> So my concern is not about rule breaking, but about the strange signal
> that is sent to contributors by including their work in next for some
> time and then dropping it again without comment.
>=20
> > It's also why linux-next is rebuilt entirely every day.
> >=20
> > > > The key is that committers can commit to drm-misc-next _at any time_
> > > > regardless of the merge window. The drm-misc merge strategy makes t=
his
> > > > OK. Specifically, when it's late in the linux cycle then drm-misc-n=
ext
> > > > is supposed to stop merging to linuxnext. Then, shortly after the
> > > > merge window closes, patches will start flowing again.
> > > >=20
> > > > So basically your patches are landed and should even keep the same =
git
> > > > hashes when they eventually make it to Linux. They just won't land =
for
> > > > another release cycle of Linux.
> > >=20
> > > OK, c2807ecb5290 is still included in drm-misc-next. So while I don't
> > > understand the whole model, the patches at least seem to be scheduled=
 to
> > > go in during the next merge window.
> >=20
> > It's not that complicated.
> >=20
> > drm-misc-next is always open, and we start targeting release X + 2 when
> > X-rc6 is released.
> >=20
> > This is due to Linus wanting all the commits sent as part of the PR in
> > linux-next for two weeks.
> >=20
> > In order to converge towards (X + 1)-rc1 in linux-next, as soon as X-rc6
> > is released, we remove drm-misc-next from the linux-next branch. All the
> > patches in drm-misc-next that were targetting X + 1 are in drm/next by
> > then, so it's not a concern.
>=20
> So if I were a maintainer of drm-misc, I'd want that no commit from
> drm-misc-next migrates to next after -rc6.
>=20
> Also note that the branch head in question (i.e. c2807ecb5290) was
> included in next-20230609, while v6.4-rc6 was tagged on Jun 11. So
> according to the rules you described c2807ecb5290 could have been
> qualified to go into v6.5-rc1?!

Yes, could have, but barely missed the last drm-misc-next PR we sent to
Dave that usually occurs on Thursday (8/6) so Dave can merge it on
Friday (9/6), the last working day before -rc6 was released.

Maxime

--gnbs5xikge2uwekh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJAjwQAKCRDj7w1vZxhR
xYaiAQDfltJZK/mNcp80pbD5Rf8rxBnU/bjLH8PwdZ4323+NNAD6An01V/1Zatms
3vBQYpLxFoCG3f+iuR0DoZgvGKSPVAw=
=UgXg
-----END PGP SIGNATURE-----

--gnbs5xikge2uwekh--
