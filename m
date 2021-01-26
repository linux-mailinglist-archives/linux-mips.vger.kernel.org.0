Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21935303ED2
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 14:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404571AbhAZNfz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 08:35:55 -0500
Received: from mga06.intel.com ([134.134.136.31]:48273 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392005AbhAZN0n (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Jan 2021 08:26:43 -0500
IronPort-SDR: Ksr2gGZ7dn03b/85c1HgNMlPduJ5NJC4EiCDNMkUNQVcrdHtToYzTjEMhgvdUx+T9+FNarGHaf
 N+TpHz0X3cag==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="241429103"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="241429103"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 05:24:53 -0800
IronPort-SDR: g4Zswe3qz4zMid/EyEG5xz4WWhFPriWd/t2t5KrG0ShP0j9WNEEJayXNCJQTEkRkM2/IHRNzgx
 zk+bb8SSGplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="369103591"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga002.jf.intel.com with SMTP; 26 Jan 2021 05:24:36 -0800
Received: by stinkbox (sSMTP sendmail emulation); Tue, 26 Jan 2021 15:24:35 +0200
Date:   Tue, 26 Jan 2021 15:24:35 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Yannick Fertre <yannick.fertre@st.com>,
        linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-rockchip@lists.infradead.org,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        freedreno@lists.freedesktop.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-msm@vger.kernel.org,
        Philippe Cornu <philippe.cornu@st.com>,
        Dave Airlie <airlied@redhat.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        virtualization@lists.linux-foundation.org,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alison Wang <alison.wang@nxp.com>,
        Roland Scheidegger <sroland@vmware.com>,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        linux-mediatek@lists.infradead
Subject: Re: [PATCH v2 10/11] drm: Use state helper instead of the plane
 state pointer
Message-ID: <YBAYE4YH4bgURmuf@intel.com>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-10-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210121163537.1466118-10-maxime@cerno.tech>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 21, 2021 at 05:35:35PM +0100, Maxime Ripard wrote:
> Many drivers reference the plane->state pointer in order to get the
> current plane state in their atomic_update or atomic_disable hooks,
> which would be the new plane state in the global atomic state since
> _swap_state happened when those hooks are run.
> 
> Use the drm_atomic_get_new_plane_state helper to get that state to make it
> more obvious.
> 
> This was made using the coccinelle script below:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> (
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_disable = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_update = func,
> 	...,
>  };
> )
> 
> @ adds_new_state @
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier new_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state)
>  {
>  	...
> -	struct drm_plane_state *new_state = plane->state;
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> 	...
>  }
> 
> @ include depends on adds_new_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && adds_new_state @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks great.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
Ville Syrjälä
Intel
