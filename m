Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5124303626
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 07:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729116AbhAZGCC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 01:02:02 -0500
Received: from mga02.intel.com ([134.134.136.20]:47122 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727837AbhAYMLv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Jan 2021 07:11:51 -0500
IronPort-SDR: fqz5a1tn3qhlMUlkY76XwQXck4G6XKSaQOGwObuDQINO2RFZplUNFUZ0mza3zGyUSkwAAvW5Ko
 mN5FdGqLc2gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="166812576"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="166812576"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 03:52:51 -0800
IronPort-SDR: 48DaYsnvHv+gYU3iB0lIM7aytVWrCoDavD2mjf0kyTM07tuyUD4vfRcB0epq/cCvtOYMGfxoLJ
 ZQzg2k7suibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="472167193"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga001.fm.intel.com with SMTP; 25 Jan 2021 03:52:39 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 25 Jan 2021 13:52:38 +0200
Date:   Mon, 25 Jan 2021 13:52:38 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Jerome Brunet <jbrunet@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Yannick Fertre <yannick.fertre@st.com>,
        linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-mediatek@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-msm@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
        linux-mips@vger.kernel.org,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alison Wang <alison.wang@nxp.com>,
        dri-devel@lists.freedesktop.org,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
        Vincent Abriou <vincent.abriou@st.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH v2 08/11] drm: Rename plane->state variables in atomic
 update and disable
Message-ID: <YA6xBuECFjzjY7gG@intel.com>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-8-maxime@cerno.tech>
 <YArBy2DKdCct5cYW@intel.com>
 <20210125105218.kv63vjbxz5b35hdo@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210125105218.kv63vjbxz5b35hdo@gilmour>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 25, 2021 at 11:52:18AM +0100, Maxime Ripard wrote:
> Hi Ville,
> 
> On Fri, Jan 22, 2021 at 02:15:07PM +0200, Ville Syrjälä wrote:
> > On Thu, Jan 21, 2021 at 05:35:33PM +0100, Maxime Ripard wrote:
> > > Some drivers are storing the plane->state pointer in atomic_update and
> > > atomic_disable in a variable simply called state, while the state passed
> > > as an argument is called old_state.
> > > 
> > > In order to ease subsequent reworks and to avoid confusing or
> > > inconsistent names, let's rename those variables to new_state.
> > > 
> > > This was done using the following coccinelle script, plus some manual
> > > changes for mtk and tegra.
> > > 
> > > @ plane_atomic_func @
> > > identifier helpers;
> > > identifier func;
> > > @@
> > > 
> > > (
> > >  static const struct drm_plane_helper_funcs helpers = {
> > >  	...,
> > >  	.atomic_disable = func,
> > > 	...,
> > >  };
> > > |
> > >  static const struct drm_plane_helper_funcs helpers = {
> > >  	...,
> > >  	.atomic_update = func,
> > > 	...,
> > >  };
> > > )
> > > 
> > > @ moves_new_state_old_state @
> > > identifier plane_atomic_func.func;
> > > identifier plane;
> > > symbol old_state;
> > > symbol state;
> > > @@
> > > 
> > >  func(struct drm_plane *plane, struct drm_plane_state *old_state)
> > >  {
> > >  	...
> > > -	struct drm_plane_state *state = plane->state;
> > > +	struct drm_plane_state *new_state = plane->state;
> > > 	...
> > >  }
> > > 
> > > @ depends on moves_new_state_old_state @
> > > identifier plane_atomic_func.func;
> > > identifier plane;
> > > identifier old_state;
> > > symbol state;
> > > @@
> > > 
> > >  func(struct drm_plane *plane, struct drm_plane_state *old_state)
> > >  {
> > >  	<...
> > > -	state
> > > +	new_state
> > > 	...>
> > 
> > Was going to say that this migh eat something else, but I guess
> > the dependency prevents that?
> 
> Yeah, the dependency takes care of this
> 
> > Another way to avoid that I suppose would be to declare 'state'
> > as
> > symbol moves_new_state_old_state.state;
> > 
> > That would probably make the intent a bit more obvious, even with
> > the dependency. Or does a dependency somehow automagically imply
> > that?
> 
> I'm not sure if it does, but it's a symbol here not an identifier or an
> expression, so here moves_new_state_old_state.state would always resolve
> to state (and only state) anyway

Hm. Right. OK, cocci bits look good to me. Variable naming
bikeshed I'll leave to others :)

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
Ville Syrjälä
Intel
