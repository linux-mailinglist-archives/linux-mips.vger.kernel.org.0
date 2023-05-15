Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7210370266D
	for <lists+linux-mips@lfdr.de>; Mon, 15 May 2023 09:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238788AbjEOHwQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 May 2023 03:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239954AbjEOHvv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 May 2023 03:51:51 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9A8E41;
        Mon, 15 May 2023 00:51:35 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bc040c7b8so18709685a12.2;
        Mon, 15 May 2023 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684137094; x=1686729094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfDqT6X1hpnQXZe1MRUmzHPyHIv4YDADYndQ1imD+oM=;
        b=QEzBGKrSjRdyzYe6ieOdJODPeNUdYdnBUcfXpn0/moCF5bU4GDKao8GZRQQbw0ScSj
         hEalhWz2jHazrnbym08knKa0kriRSwPike6V7qFdb0SYkq5ZdsbY7DsO7FPGWFcQZc4I
         yx7v9MO0EFs1BsS1BzlrMU/49f38+CFEbN6cwavsTi/YNhpLd6/f7T/SGEGYx3nr8Hyq
         96GIg2iw6p9BedFsBmDM+AKZnAYeClMxXQ4dl34JgRS9vWkoZvXTodDnKACwzKvENSpl
         oGu3By0XqyO1n0TJjlvlzyTkzr2Q3JL9FS6JcHCYIaNwZPRY3PgIiLlR3XqzyirohV+9
         19TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684137094; x=1686729094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfDqT6X1hpnQXZe1MRUmzHPyHIv4YDADYndQ1imD+oM=;
        b=Wc0qS/fepLVwQlBozgtruKy1xBJsLfls1viPlOpbvl83pIeNcrd5h6pWBxKN7Wqi/d
         LriERB6am+oFdeibT6vv5QDmT3zB/wshhx4Jyg8xkiX2WjzNjUMIBao7kXVYBW2OlBwq
         qd0swZP4Ttt0aaZp4S8BJWObTKY1NzCkIyeG+oDFwPORncKhbU7dHQxPiznw8xvOBF4Q
         9eEtaK5s4+gui8kwIpfigy3wl5ZTCY87yVXcBHAubpNI1IUUFYKqRyrURNWHsOHqveeP
         VSOH8bPKSz4A9MFCNAXJynbrzOpLd0uGOA8dWIy4jmYMvRTQ2zlfkx/zvTUX+K1LOXx1
         QAYQ==
X-Gm-Message-State: AC+VfDxZBRcXO0G2ObIkXfZaX1nv+iHOHYWCHHjZhxITYSNMTrne8N/Q
        pZy5lEEvL/2GSh7z9f3+ij7t4bmKrGkuBNcbprg=
X-Google-Smtp-Source: ACHHUZ73K81XIZGLByuufDfxqMz465SRmfWrwBUtXlzEFG2IITIGcj/PIpOa0fmbOAVOCPKBAxevZY68jzd4AtlbsQg=
X-Received: by 2002:a17:907:7211:b0:96b:4ed5:a1c9 with SMTP id
 dr17-20020a170907721100b0096b4ed5a1c9mr1098991ejc.51.1684137093827; Mon, 15
 May 2023 00:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
From:   Inki Dae <daeinki@gmail.com>
Date:   Mon, 15 May 2023 16:50:57 +0900
Message-ID: <CAAQKjZP5jhwFg9sNndpa6_7G6HoV76heQbt=knoOEZZskexrhg@mail.gmail.com>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     James@pengutronix.de, Liviu Dudau <liviu.dudau@arm.com>,
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
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Danilo Krummrich <dakr@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
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
        Johan Hovold <johan+linaro@kernel.org>, Joel@pengutronix.de,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Douglas Anderson <dianders@chromium.org>,
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
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        etnaviv@lists.freedesktop.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        John Stultz <jstultz@google.com>, linux-mips@vger.kernel.org,
        lima@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

2023=EB=85=84 5=EC=9B=94 8=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:32, Uw=
e Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> Hello,
>
> this patch series adapts the platform drivers below drivers/gpu/drm
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because

First of all, I apologize for the delay in providing my review comments.

Not related to this patch but seems that the "remove_new" callback
naming implicitly implies that there is no need to return anything
since its return type is void. To help users understand the intended
behavior based on the callback name, how about considering a modified
naming convention like "remove_no_return" or something similar?

The relevant patch has already been merged as outlined below,
author Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> 2022-12-09
16:09:14 +0100
committer Greg Kroah-Hartman <gregkh@linuxfoundation.org> 2023-01-17
19:04:17 +0100
commit 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c (patch)
tree 0b6dbc003a6bb4a3f7fb084d31326bbfa3ba3f7c
parent 7bbb89b420d9e290cb34864832de8fcdf2c140dc (diff)
download linux-5c5a7680e67ba6fbbb5f4d79fa41485450c1985c.tar.gz
platform: Provide a remove callback that returns no value

Maybe a trivial thing but how about renaming it? I think the postfix,
'new', is a very generic word. I think you could introduce another
patch for it if you think it's reasonable.

Thanks,
Inki Dae

> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
>
> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (53):
>   drm/komeda: Convert to platform remove callback returning void
>   drm/arm/hdlcd: Convert to platform remove callback returning void
>   drm/arm/malidp: Convert to platform remove callback returning void
>   drm/armada: Convert to platform remove callback returning void
>   drm/aspeed: Convert to platform remove callback returning void
>   drm/atmel-hlcdc: Convert to platform remove callback returning void
>   drm/bridge: cdns-dsi: Convert to platform remove callback returning
>     void
>   drm/bridge: display-connector: Convert to platform remove callback
>     returning void
>   drm/bridge: fsl-ldb: Convert to platform remove callback returning
>     void
>   drm/imx/imx8*: Convert to platform remove callback returning void
>   drm/bridge: lvds-codec: Convert to platform remove callback returning
>     void
>   drm/bridge: nwl-dsi: Convert to platform remove callback returning
>     void
>   drm/bridge: simple-bridge: Convert to platform remove callback
>     returning void
>   drm/bridge: synopsys: Convert to platform remove callback returning
>     void
>   drm/bridge: thc63lvd1024: Convert to platform remove callback
>     returning void
>   drm/bridge: tfp410: Convert to platform remove callback returning void
>   drm/etnaviv: Convert to platform remove callback returning void
>   drm/exynos: Convert to platform remove callback returning void
>   drm/fsl-dcu: Convert to platform remove callback returning void
>   drm/hisilicon: Convert to platform remove callback returning void
>   drm/imx/dcss: Convert to platform remove callback returning void
>   drm/imx/ipuv3: Convert to platform remove callback returning void
>   drm/ingenic: Convert to platform remove callback returning void
>   drm/kmb: Convert to platform remove callback returning void
>   drm/lima: Convert to platform remove callback returning void
>   drm/logicvc: Convert to platform remove callback returning void
>   drm/mcde: Convert to platform remove callback returning void
>   drm/mediatek: Convert to platform remove callback returning void
>   drm/mediatek: Convert to platform remove callback returning void
>   drm/meson: Convert to platform remove callback returning void
>   drm/msm: Convert to platform remove callback returning void
>   drm/mxsfb: Convert to platform remove callback returning void
>   drm/nouveau: Convert to platform remove callback returning void
>   drm/omap: Convert to platform remove callback returning void
>   drm/panel: Convert to platform remove callback returning void
>   drm/panfrost: Convert to platform remove callback returning void
>   drm/rcar-du: Convert to platform remove callback returning void
>   drm/rockchip: Convert to platform remove callback returning void
>   drm/shmobile: Convert to platform remove callback returning void
>   drm/sprd: Convert to platform remove callback returning void
>   drm/sti: Convert to platform remove callback returning void
>   drm/stm: Convert to platform remove callback returning void
>   drm/sun4i: Convert to platform remove callback returning void
>   drm/tegra: Convert to platform remove callback returning void
>   drm/tests: helpers: Convert to platform remove callback returning void
>   drm/tidss: Convert to platform remove callback returning void
>   drm/tilcdc: Convert to platform remove callback returning void
>   drm/tiny: Convert to platform remove callback returning void
>   drm/tiny: Convert to platform remove callback returning void
>   drm/tve200: Convert to platform remove callback returning void
>   drm/v3d: Convert to platform remove callback returning void
>   drm/vc4: Convert to platform remove callback returning void
>   drm/xlnx/zynqmp_dpsub: Convert to platform remove callback returning
>     void
>
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c     | 5 ++---
>  drivers/gpu/drm/arm/hdlcd_drv.c                     | 5 ++---
>  drivers/gpu/drm/arm/malidp_drv.c                    | 5 ++---
>  drivers/gpu/drm/armada/armada_crtc.c                | 5 ++---
>  drivers/gpu/drm/armada/armada_drv.c                 | 5 ++---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c             | 6 ++----
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c        | 6 ++----
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c      | 6 ++----
>  drivers/gpu/drm/bridge/display-connector.c          | 6 ++----
>  drivers/gpu/drm/bridge/fsl-ldb.c                    | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c         | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c        | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 6 ++----
>  drivers/gpu/drm/bridge/lvds-codec.c                 | 6 ++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    | 5 ++---
>  drivers/gpu/drm/bridge/simple-bridge.c              | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c       | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c  | 6 ++----
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 6 ++----
>  drivers/gpu/drm/bridge/thc63lvd1024.c               | 6 ++----
>  drivers/gpu/drm/bridge/ti-tfp410.c                  | 6 ++----
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c               | 6 ++----
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c               | 5 ++---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c       | 6 ++----
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c          | 6 ++----
>  drivers/gpu/drm/exynos/exynos_dp.c                  | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_drv.c             | 5 ++---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c             | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c            | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c            | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c             | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c             | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_mic.c             | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c         | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c          | 6 ++----
>  drivers/gpu/drm/exynos/exynos_hdmi.c                | 6 ++----
>  drivers/gpu/drm/exynos/exynos_mixer.c               | 6 ++----
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c           | 6 ++----
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c        | 6 ++----
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c     | 5 ++---
>  drivers/gpu/drm/imx/dcss/dcss-drv.c                 | 6 ++----
>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c             | 6 ++----
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c            | 5 ++---
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                 | 5 ++---
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c                 | 5 ++---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c              | 5 ++---
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c        | 6 ++----
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c           | 6 ++----
>  drivers/gpu/drm/ingenic/ingenic-ipu.c               | 5 ++---
>  drivers/gpu/drm/kmb/kmb_drv.c                       | 5 ++---
>  drivers/gpu/drm/lima/lima_drv.c                     | 5 ++---
>  drivers/gpu/drm/logicvc/logicvc_drm.c               | 6 ++----
>  drivers/gpu/drm/mcde/mcde_drv.c                     | 6 ++----
>  drivers/gpu/drm/mcde/mcde_dsi.c                     | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_cec.c                  | 5 ++---
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c             | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c           | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_color.c           | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c           | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c           | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c             | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c            | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_dp.c                   | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                  | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c              | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 | 5 ++---
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c             | 6 ++----
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c             | 5 ++---
>  drivers/gpu/drm/meson/meson_drv.c                   | 6 ++----
>  drivers/gpu/drm/meson/meson_dw_hdmi.c               | 6 ++----
>  drivers/gpu/drm/msm/adreno/adreno_device.c          | 5 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c             | 6 ++----
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c            | 6 ++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c            | 5 ++---
>  drivers/gpu/drm/msm/dp/dp_display.c                 | 6 ++----
>  drivers/gpu/drm/msm/dsi/dsi.c                       | 6 ++----
>  drivers/gpu/drm/msm/hdmi/hdmi.c                     | 6 ++----
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c                 | 6 ++----
>  drivers/gpu/drm/msm/msm_drv.c                       | 6 ++----
>  drivers/gpu/drm/msm/msm_mdss.c                      | 6 ++----
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                   | 6 ++----
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                   | 6 ++----
>  drivers/gpu/drm/nouveau/nouveau_platform.c          | 5 ++---
>  drivers/gpu/drm/omapdrm/dss/dispc.c                 | 5 ++---
>  drivers/gpu/drm/omapdrm/dss/dsi.c                   | 6 ++----
>  drivers/gpu/drm/omapdrm/dss/dss.c                   | 6 ++----
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                 | 5 ++---
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                 | 5 ++---
>  drivers/gpu/drm/omapdrm/dss/venc.c                  | 5 ++---
>  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c            | 9 +++------
>  drivers/gpu/drm/omapdrm/omap_drv.c                  | 6 ++----
>  drivers/gpu/drm/panel/panel-lvds.c                  | 6 ++----
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c         | 6 ++----
>  drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c     | 6 ++----
>  drivers/gpu/drm/panel/panel-simple.c                | 6 ++----
>  drivers/gpu/drm/panfrost/panfrost_drv.c             | 5 ++---
>  drivers/gpu/drm/rcar-du/rcar_cmm.c                  | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c               | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c              | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                 | 6 ++----
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c             | 6 ++----
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c            | 6 ++----
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c     | 6 ++----
>  drivers/gpu/drm/rockchip/cdn-dp-core.c              | 6 ++----
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c     | 6 ++----
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c         | 6 ++----
>  drivers/gpu/drm/rockchip/inno_hdmi.c                | 6 ++----
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c              | 6 ++----
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c         | 6 ++----
>  drivers/gpu/drm/rockchip/rockchip_lvds.c            | 6 ++----
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c        | 6 ++----
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c         | 6 ++----
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c            | 6 ++----
>  drivers/gpu/drm/sprd/sprd_dpu.c                     | 6 ++----
>  drivers/gpu/drm/sprd/sprd_drm.c                     | 5 ++---
>  drivers/gpu/drm/sprd/sprd_dsi.c                     | 6 ++----
>  drivers/gpu/drm/sti/sti_compositor.c                | 5 ++---
>  drivers/gpu/drm/sti/sti_drv.c                       | 6 ++----
>  drivers/gpu/drm/sti/sti_dvo.c                       | 5 ++---
>  drivers/gpu/drm/sti/sti_hda.c                       | 5 ++---
>  drivers/gpu/drm/sti/sti_hdmi.c                      | 6 ++----
>  drivers/gpu/drm/sti/sti_hqvdp.c                     | 5 ++---
>  drivers/gpu/drm/sti/sti_tvout.c                     | 5 ++---
>  drivers/gpu/drm/stm/drv.c                           | 6 ++----
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c               | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_backend.c               | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_drv.c                   | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_frontend.c              | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c              | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                  | 6 ++----
>  drivers/gpu/drm/sun4i/sun4i_tv.c                    | 6 ++----
>  drivers/gpu/drm/sun4i/sun6i_drc.c                   | 6 ++----
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c              | 6 ++----
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c               | 6 ++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.c                 | 6 ++----
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c              | 6 ++----
>  drivers/gpu/drm/tegra/dpaux.c                       | 6 ++----
>  drivers/gpu/drm/tests/drm_kunit_helpers.c           | 5 ++---
>  drivers/gpu/drm/tidss/tidss_drv.c                   | 6 ++----
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c               | 6 ++----
>  drivers/gpu/drm/tiny/arcpgu.c                       | 6 ++----
>  drivers/gpu/drm/tiny/ofdrm.c                        | 6 ++----
>  drivers/gpu/drm/tiny/simpledrm.c                    | 6 ++----
>  drivers/gpu/drm/tve200/tve200_drv.c                 | 6 ++----
>  drivers/gpu/drm/v3d/v3d_drv.c                       | 6 ++----
>  drivers/gpu/drm/vc4/vc4_crtc.c                      | 5 ++---
>  drivers/gpu/drm/vc4/vc4_dpi.c                       | 5 ++---
>  drivers/gpu/drm/vc4/vc4_drv.c                       | 6 ++----
>  drivers/gpu/drm/vc4/vc4_dsi.c                       | 6 ++----
>  drivers/gpu/drm/vc4/vc4_hdmi.c                      | 5 ++---
>  drivers/gpu/drm/vc4/vc4_hvs.c                       | 5 ++---
>  drivers/gpu/drm/vc4/vc4_txp.c                       | 5 ++---
>  drivers/gpu/drm/vc4/vc4_v3d.c                       | 5 ++---
>  drivers/gpu/drm/vc4/vc4_vec.c                       | 5 ++---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c                 | 6 ++----
>  159 files changed, 319 insertions(+), 597 deletions(-)
>
>
> base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
> --
> 2.39.2
>
