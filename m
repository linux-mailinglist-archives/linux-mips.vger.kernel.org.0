Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB61E734327
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jun 2023 20:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbjFQSq6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 17 Jun 2023 14:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjFQSq4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Jun 2023 14:46:56 -0400
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F6F1B1;
        Sat, 17 Jun 2023 11:46:54 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9875c2d949eso144265966b.0;
        Sat, 17 Jun 2023 11:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687027613; x=1689619613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IIAlmExRE6EbIYR/X1OU/hkRy+rZ5PC7Pr91ssHegm8=;
        b=WwtG/tWWRtuI+IdssLECT1z/qWs6cSUndYLLcDE2wBFDig0lT692D+upLjKA/Q2rJF
         wSUJ3sr61r2uKXrCuA3ISCCtVLu6L6Czq8+N9aMOJu0C6vf8zW/al9Sj1uulf5pt3UWl
         kXay5lerCeOIFjCcKGXStK0VjxAGfRyL73hgXQwpapVSPD6PVliTmsbH1lqcQ07Wll/k
         bOkpw4zlAjbXvQRNavAMCO7TbCm2rsrySqtJ5cZTn4jaB9iF5pvFlm1QJZMacbv2e6ei
         xRU0LJt73nvrUnwDH41Nbr4RbQXPLLofVCsyTegL0LaMUZVbpuojGHZpQJ1u0samdTR7
         UdIA==
X-Gm-Message-State: AC+VfDycdJC6/ruk2PBHjHBN+zWRPnGWKGG8CBN9rdjoJ+2rY8Dm7HNZ
        PkGwnT7lmoXS++/W/Ki02LgurPdBMquk3ltY
X-Google-Smtp-Source: ACHHUZ7sTcQxpVRu8qkIQQ9dty7EabO/pUgqwSAdI5433RC4EXc6ay8SfsxZ7qMiVUfj13LN5QueXw==
X-Received: by 2002:a19:9209:0:b0:4f6:25a3:95ab with SMTP id u9-20020a199209000000b004f625a395abmr3094783lfd.25.1687020704859;
        Sat, 17 Jun 2023 09:51:44 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 9-20020ac24829000000b004f625831d85sm3530603lft.126.2023.06.17.09.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 09:51:44 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b45c289615so21192341fa.1;
        Sat, 17 Jun 2023 09:51:44 -0700 (PDT)
X-Received: by 2002:a2e:9896:0:b0:2ad:8380:770d with SMTP id
 b22-20020a2e9896000000b002ad8380770dmr3881903ljj.21.1687020704207; Sat, 17
 Jun 2023 09:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de> <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
In-Reply-To: <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
Reply-To: wens@csie.org
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sun, 18 Jun 2023 00:51:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v676WBuHeN5cLNZEF0FHRu=jsNhVxN50pnZCMbqGFPYmLw@mail.gmail.com>
Message-ID: <CAGb2v676WBuHeN5cLNZEF0FHRu=jsNhVxN50pnZCMbqGFPYmLw@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Doug Anderson <dianders@chromium.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>,
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
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Danilo Krummrich <dakr@redhat.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-sunxi@lists.linux.dev,
        Rahul T R <r-ravikumar@ti.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
        Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
        Johan Hovold <johan+linaro@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jingoo Han <jingoohan1@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
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
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yuan Can <yuancan@huawei.com>, Stefan Agner <stefan@agner.ch>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-tegra@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
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
        Maxime Ripard <maxime@cerno.tech>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Liu Shixin <liushixin2@huawei.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Emma Anholt <emma@anholt.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-renesas-soc@vger.kernel.org,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jayshri Pawar <jpawar@cadence.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Clark <robdclark@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Melissa Wen <mwen@igalia.com>,
        linux-mediatek@lists.infradead.org,
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
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Karol Wachowski <karol.wachowski@linux.intel.com>,
        Laura Nao <laura.nao@collabora.com>,
        Wang Jianzheng <wangjianzheng@vivo.com>,
        Raymond Tan <raymond.tan@intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jun 18, 2023 at 12:13 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
>
> [expanding recipents by the other affected persons]
>
> On Thu, Jun 08, 2023 at 09:08:15AM -0700, Doug Anderson wrote:
> > On Thu, Jun 1, 2023 at 8:40 AM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > Hello,
> > >
> > > On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-König wrote:
> > > > this patch series adapts the platform drivers below drivers/gpu/drm
> > > > to use the .remove_new() callback. Compared to the traditional .remove()
> > > > callback .remove_new() returns no value. This is a good thing because
> > > > the driver core doesn't (and cannot) cope for errors during remove. The
> > > > only effect of a non-zero return value in .remove() is that the driver
> > > > core emits a warning. The device is removed anyhow and an early return
> > > > from .remove() usually yields a resource leak.
> > > >
> > > > By changing the remove callback to return void driver authors cannot
> > > > reasonably (but wrongly) assume any more that there happens some kind of
> > > > cleanup later.
> > >
> > > I wonder if someone would volunteer to add the whole series to
> > > drm-misc-next?!
> >
> > It looks as if Neil applied quite a few of them already, so I looked
> > at what was left...
> >
> > I'm a little hesitant to just apply the whole kit-and-caboodle to
> > drm-misc-next since there are specific DRM trees for a bunch of them
> > and it would be better if they landed there. ...so I went through all
> > the patches that still applied to drm-misc-next, then used
> > 'scripts/get_maintainer.pl --scm' to check if they were maintained
> > through drm-misc. That still left quite a few patches. I've applied
> > those ones and pushed to drm-misc-next:
> >
> > 71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
> > callback returning void
> > 1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning void
> > b957812839f8 drm/v3d: Convert to platform remove callback returning void
> > e2fd3192e267 drm/tve200: Convert to platform remove callback returning void
> > 84e6da7ad553 drm/tiny: Convert to platform remove callback returning void
> > 34cdd1f691ad drm/tidss: Convert to platform remove callback returning void
> > d665e3c9d37a drm/sun4i: Convert to platform remove callback returning void
> > 0c259ab19146 drm/stm: Convert to platform remove callback returning void
> > 9a865e45884a drm/sti: Convert to platform remove callback returning void
> > 3c855610840e drm/rockchip: Convert to platform remove callback returning void
> > e41977a83b71 drm/panfrost: Convert to platform remove callback returning void
> > cef3776d0b5a drm/panel: Convert to platform remove callback returning void
> > bd296a594e87 drm/mxsfb: Convert to platform remove callback returning void
> > 38ca2d93d323 drm/meson: Convert to platform remove callback returning void
> > fd1457d84bae drm/mcde: Convert to platform remove callback returning void
> > 41a56a18615c drm/logicvc: Convert to platform remove callback returning void
> > 980ec6444372 drm/lima: Convert to platform remove callback returning void
> > 82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returning void
> > c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning void
> > a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback returning void
> > 9a32dd324c46 drm/aspeed: Convert to platform remove callback returning void
> > 2c7d291c498c drm/arm/malidp: Convert to platform remove callback returning void
> > a920028df679 drm/arm/hdlcd: Convert to platform remove callback returning void
> > 1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning void
>
> Together with the patches that were applied later the topmost commit
> from this series is c2807ecb5290 ("drm/omap: Convert to platform remove
> callback returning void"). This commit was part for the following next
> tags:
>
>         $ git tag -l --contains c2807ecb5290
>         next-20230609
>         next-20230613
>         next-20230614
>         next-20230615
>
> However in next-20230616 they are missing. In next-20230616
> drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a35088660.
> Compared to c2807ecb5290 this adds 1149 patches but drops 37 (that are
> also not included with a different commit id). The 37 patches dropped
> are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
>
>         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290
>              1  Christophe JAILLET
>              2  Jessica Zhang
>              5  Karol Wachowski
>              1  Laura Nao
>             27  Uwe Kleine-König
>              1  Wang Jianzheng
>
>
> I guess this was done by mistake because nobody told me about dropping
> my/these patches? Can c2807ecb5290 please be merged into drm-misc-next
> again?

AFAIK drm-misc/for-linux-next cuts off at -rc6, at which point any patches
merged get queued up for -next-next. I think that's what happened to your
patches?


ChenYu
