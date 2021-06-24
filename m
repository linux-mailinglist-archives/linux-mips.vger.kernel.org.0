Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9D53B2A6B
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 10:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhFXIfH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 24 Jun 2021 04:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhFXIfG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Jun 2021 04:35:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46C3C061574
        for <linux-mips@vger.kernel.org>; Thu, 24 Jun 2021 01:32:47 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lwKmk-0006cm-HJ; Thu, 24 Jun 2021 10:32:30 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lwKmX-0006oO-Cb; Thu, 24 Jun 2021 10:32:17 +0200
Message-ID: <43f805608f1172b73c62717f6cdc72c7a15d145c.camel@pengutronix.de>
Subject: Re: [PATCH 08/15] drm/<driver>: drm_gem_plane_helper_prepare_fb is
 now the default
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Date:   Thu, 24 Jun 2021 10:32:17 +0200
In-Reply-To: <20210622165511.3169559-9-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
         <20210622165511.3169559-9-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 2021-06-22 at 18:55 +0200, Daniel Vetter wrote:
> No need to set it explicitly.
> 
[...]
>  drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
>  14 files changed, 15 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index 8710f55d2579..ef114b6aa691 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -772,7 +772,6 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs ipu_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_plane_helper_prepare_fb,
>  	.atomic_check = ipu_plane_atomic_check,
>  	.atomic_disable = ipu_plane_atomic_disable,
>  	.atomic_update = ipu_plane_atomic_update,

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
