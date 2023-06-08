Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67EB47285D5
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jun 2023 18:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236229AbjFHQyB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jun 2023 12:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbjFHQx7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jun 2023 12:53:59 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E40F2711
        for <linux-mips@vger.kernel.org>; Thu,  8 Jun 2023 09:53:55 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-77807e43b7cso35410539f.1
        for <linux-mips@vger.kernel.org>; Thu, 08 Jun 2023 09:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686243234; x=1688835234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmEOm3Skn8Jl/sRC6hqqJWkitptFK5F761thwbnVCkg=;
        b=AU0cOsG+KDlMjOtruSu/fUXNn7aeo5vacPNkFZtSeYuyt/xBFrZWoSgtMIx/UTNamu
         pOFUnVkAjgZxWE55LttACjxNXCoYJYSM52Ekk3At8WXoYbT8KQBfCxjsiLbEo/ZSZJHK
         dxEUtY9fYoq7B9Pb3H6IYWMUB4X6ViW2NLXTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686243234; x=1688835234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmEOm3Skn8Jl/sRC6hqqJWkitptFK5F761thwbnVCkg=;
        b=IR8p0xktVnsmw9lg2GdOVg4wREiqhLCJRmRgXTCa3LbRQlKQeJWsmVa8C/SdvE7x5Y
         PqdqrR+IIwLAsnle7hRBnL/aMb0tp2n7zc/NqwGPJnYUuPGFu3HaV9VHa508t49PWQhW
         SG78yzAemAl7W1eHWB14bAxJQ5gcEtIryfiBO5T5k+2Qm6Hx56ScbqxqM+va1KldRe0C
         cmHawKiaZrO1SKesKSvCXKf6A58314Zmgg1lChB/ohp/WmTyKdNyhPBqskesyKOGFkUQ
         LZFoLRubPkHeK/r06uMEyXmTrIrV3RIuxp3lXQhQenYkRuJRs8OdD56T8A4AGUE8VBaE
         2Ghw==
X-Gm-Message-State: AC+VfDxjh9/6fBfdePzqc7TNu5Wrj0qHrSWtaoqfiSImgINq6eg0W/Yh
        jbdRFN30u1sqIsdFw6C1YhO8/SV/fpPBFONN2xapeQ==
X-Google-Smtp-Source: ACHHUZ70DoxEK8BN4d1TlVJzP8xwKliZfwIQb0ueeLiSRdLO27CtApkQms4kWQElL9lf+ZMhPh2mnw==
X-Received: by 2002:a5e:a611:0:b0:777:a970:b382 with SMTP id q17-20020a5ea611000000b00777a970b382mr13012611ioi.18.1686243234493;
        Thu, 08 Jun 2023 09:53:54 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id f7-20020a6be807000000b0076c5c927acesm474074ioh.13.2023.06.08.09.53.54
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:53:54 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-33d928a268eso145225ab.0
        for <linux-mips@vger.kernel.org>; Thu, 08 Jun 2023 09:53:54 -0700 (PDT)
X-Received: by 2002:a05:6e02:18ca:b0:33b:68fb:ea0 with SMTP id
 s10-20020a056e0218ca00b0033b68fb0ea0mr145479ilu.26.1686242834959; Thu, 08 Jun
 2023 09:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de> <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230608162642.GA23400@pendragon.ideasonboard.com>
In-Reply-To: <20230608162642.GA23400@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Jun 2023 09:47:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vwz9+jhZ94DvagVyAq=4TtWLMEVLRi8rTKaishoPQEfw@mail.gmail.com>
Message-ID: <CAD=FV=Vwz9+jhZ94DvagVyAq=4TtWLMEVLRi8rTKaishoPQEfw@mail.gmail.com>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning void
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
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
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Jun 8, 2023 at 9:26=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > The following ones appeared to apply to the top of drm-misc-next, but
> > I didn't apply them since get_maintainer didn't say they were part of
> > drm-misc-next:
> >
> > drm/tiny: Convert to platform remove callback returning void
> > drm/tilcdc: Convert to platform remove callback returning void
> > drm/sprd: Convert to platform remove callback returning void
> > drm/shmobile: Convert to platform remove callback returning void
> > drm/rcar-du: Convert to platform remove callback returning void
>
> If you don't mind, could you take the rcar-du patch through drm-misc too
> ? I don't plan to send another pull request for v6.5.

Done.

2510a2579324 drm/rcar-du: Convert to platform remove callback returning voi=
d
