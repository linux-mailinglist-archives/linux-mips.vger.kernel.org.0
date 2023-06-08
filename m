Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307DA7284E7
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jun 2023 18:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbjFHQ1T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jun 2023 12:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235241AbjFHQ1G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jun 2023 12:27:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F115F30D3;
        Thu,  8 Jun 2023 09:26:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126033089000.35.openmobile.ne.jp [126.33.89.0])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD6FF7C;
        Thu,  8 Jun 2023 18:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686241579;
        bh=9rruNaQgl/oQBE2oLPlmpO6slCgdtIRvea2nyNzPSZs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LLXEiASpvCS+K6TnETZR+gAVntREVUQlWqSFAEd8t5iunYhMtLxUDYZ7ZD4AjpFdD
         n9hRLmIFvh9Nfrccon6V6aV4cRl+tSQCd+S/RISk+hv5rWicoVYu0qcAItyObwwlvE
         dO+yQN68ltwo5R0MgrqYlmfk5q+3Kvczr50XtQSw=
Date:   Thu, 8 Jun 2023 19:26:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>, Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Rahul T R <r-ravikumar@ti.com>,
        Jayshri Pawar <jpawar@cadence.com>,
        Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Mark Brown <broonie@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Danilo Krummrich <dakr@redhat.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Qiang Yu <yuq825@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Marek Vasut <marex@denx.de>, Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Yuan Can <yuancan@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
        Liang He <windhl@126.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxime Ripard <maxime@cerno.tech>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        Steven Price <steven.price@arm.com>,
        linux-rockchip@lists.infradead.org,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de, Yongqin Liu <yongqin.liu@linaro.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning
 void
Message-ID: <20230608162642.GA23400@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Doug,

On Thu, Jun 08, 2023 at 09:08:15AM -0700, Doug Anderson wrote:
> On Thu, Jun 1, 2023 at 8:40 AM Uwe Kleine-König wrote:
> > On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-König wrote:
> > > this patch series adapts the platform drivers below drivers/gpu/drm
> > > to use the .remove_new() callback. Compared to the traditional .remove()
> > > callback .remove_new() returns no value. This is a good thing because
> > > the driver core doesn't (and cannot) cope for errors during remove. The
> > > only effect of a non-zero return value in .remove() is that the driver
> > > core emits a warning. The device is removed anyhow and an early return
> > > from .remove() usually yields a resource leak.
> > >
> > > By changing the remove callback to return void driver authors cannot
> > > reasonably (but wrongly) assume any more that there happens some kind of
> > > cleanup later.
> >
> > I wonder if someone would volunteer to add the whole series to
> > drm-misc-next?!
> 
> It looks as if Neil applied quite a few of them already, so I looked
> at what was left...
> 
> I'm a little hesitant to just apply the whole kit-and-caboodle to
> drm-misc-next since there are specific DRM trees for a bunch of them
> and it would be better if they landed there. ...so I went through all
> the patches that still applied to drm-misc-next, then used
> 'scripts/get_maintainer.pl --scm' to check if they were maintained
> through drm-misc. That still left quite a few patches. I've applied
> those ones and pushed to drm-misc-next:
> 
> 71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
> callback returning void
> 1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning void
> b957812839f8 drm/v3d: Convert to platform remove callback returning void
> e2fd3192e267 drm/tve200: Convert to platform remove callback returning void
> 84e6da7ad553 drm/tiny: Convert to platform remove callback returning void
> 34cdd1f691ad drm/tidss: Convert to platform remove callback returning void
> d665e3c9d37a drm/sun4i: Convert to platform remove callback returning void
> 0c259ab19146 drm/stm: Convert to platform remove callback returning void
> 9a865e45884a drm/sti: Convert to platform remove callback returning void
> 3c855610840e drm/rockchip: Convert to platform remove callback returning void
> e41977a83b71 drm/panfrost: Convert to platform remove callback returning void
> cef3776d0b5a drm/panel: Convert to platform remove callback returning void
> bd296a594e87 drm/mxsfb: Convert to platform remove callback returning void
> 38ca2d93d323 drm/meson: Convert to platform remove callback returning void
> fd1457d84bae drm/mcde: Convert to platform remove callback returning void
> 41a56a18615c drm/logicvc: Convert to platform remove callback returning void
> 980ec6444372 drm/lima: Convert to platform remove callback returning void
> 82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returning void
> c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning void
> a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback returning void
> 9a32dd324c46 drm/aspeed: Convert to platform remove callback returning void
> 2c7d291c498c drm/arm/malidp: Convert to platform remove callback returning void
> a920028df679 drm/arm/hdlcd: Convert to platform remove callback returning void
> 1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning void
> 
> The following ones appeared to apply to the top of drm-misc-next, but
> I didn't apply them since get_maintainer didn't say they were part of
> drm-misc-next:
> 
> drm/tiny: Convert to platform remove callback returning void
> drm/tilcdc: Convert to platform remove callback returning void
> drm/sprd: Convert to platform remove callback returning void
> drm/shmobile: Convert to platform remove callback returning void
> drm/rcar-du: Convert to platform remove callback returning void

If you don't mind, could you take the rcar-du patch through drm-misc too
? I don't plan to send another pull request for v6.5.

> drm/omap: Convert to platform remove callback returning void

Tomi, should drm/omap moved to being maintained through drm-misc ?

> drm/nouveau: Convert to platform remove callback returning void
> drm/mediatek: Convert to platform remove callback returning void
> drm/kmb: Convert to platform remove callback returning void
> drm/ingenic: Convert to platform remove callback returning void
> drm/imx/ipuv3: Convert to platform remove callback returning void
> drm/imx/dcss: Convert to platform remove callback returning void
> drm/etnaviv: Convert to platform remove callback returning void
> drm/armada: Convert to platform remove callback returning void

-- 
Regards,

Laurent Pinchart
