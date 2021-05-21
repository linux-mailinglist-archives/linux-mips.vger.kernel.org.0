Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DDA38CA71
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 17:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhEUPzA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 May 2021 11:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhEUPyt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 May 2021 11:54:49 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4466EC061574
        for <linux-mips@vger.kernel.org>; Fri, 21 May 2021 08:53:21 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 62so10370712wmb.3
        for <linux-mips@vger.kernel.org>; Fri, 21 May 2021 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kdAs0Ep5+2K53fiSGhNfrLNzj7MMY3EgOQjni9Umht8=;
        b=IhYlOGhD14MnNUDN3/gcfgDBq/BNMorjLEdyQeq1zzib97z1tEhGiiXaphyov0B6rm
         Fnug5G0nwmDNTjmkdcXodXq9U/gz3ibsum4pzrkpfI9FmltJSw2CUcxsWX7jGXwwmyCj
         6vxc3W7raymKSRp3BSh9pxV9ixt7fhYnirv/L00YJBgVdZZYogPdXKuTSkEFfH1IrFRZ
         Da9BK8RCuQqZjWtJt4Z9PY1PYT/d4yv4t/as1y1Bzr1dc6M55Y5AjpEufmJ68LUqwnaN
         r/4pWcKNmcNKigTm4vX1D6oC/E3gRqOexUh1NDZr0Zq9RS8nw5b/KoUs/ymofl20nPkJ
         EdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdAs0Ep5+2K53fiSGhNfrLNzj7MMY3EgOQjni9Umht8=;
        b=VShR1/7bTftfNOWzTUAKd4DSr5fb6F8Ex3kFa8JGPfJhllAdrTX3c9IWsM73h412OQ
         IbQTrc4Us24TTUeigqNPOJQGjXIBoJo3lOtnAP27QfEi7RwzOOYpm/5c7Z+hVsGHv8FL
         vzKerCSNqo8UbPwWchKOXc/j6K3Qccx7fybYopBTVdYIB/sjFTCiIopMlYl6/WNH4sFe
         Gg3R4bLqaEl1KYFn5rji1s2Q5kZtEFHKaJKYbS08arIsbe6SpH0HwulOiboeACO0/Tl9
         vYqvtPZF2+CvnL9iAuJcu4Wvr+ERiXQ6k769+q4g6HAs4kS4DQZzr0Dsjg4hULnSKe44
         eHLg==
X-Gm-Message-State: AOAM533sEBIJAzklhE9cY3zgUquGYhViHoe/26NQr9V0EdCWVrcfWfQ9
        Ps4OAHkOl0kq39DDF977izU=
X-Google-Smtp-Source: ABdhPJxTn/ueWgal7rvRO3A3ECHpC111Q7o7SxwZUm6zNTqM9YK/SolsENlCqq1BAUxDrXnfxploOg==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr9425116wmi.101.1621612399794;
        Fri, 21 May 2021 08:53:19 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id o129sm13051356wmo.22.2021.05.21.08.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 08:53:19 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
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
Subject: Re: [PATCH 06/11] drm/<driver>: drm_gem_plane_helper_prepare_fb is now the default
Date:   Fri, 21 May 2021 17:53:16 +0200
Message-ID: <1940958.iMR1v07LRx@jernej-laptop>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch> <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Dne petek, 21. maj 2021 ob 11:09:54 CEST je Daniel Vetter napisal(a):
> No need to set it explicitly.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-sunxi@lists.linux.dev

=46or sun4i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


