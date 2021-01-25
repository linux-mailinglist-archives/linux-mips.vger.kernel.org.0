Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D4630442A
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 18:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbhAZGBq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 01:01:46 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:34645 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727561AbhAYLCB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Jan 2021 06:02:01 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8C6885805B3;
        Mon, 25 Jan 2021 05:52:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 25 Jan 2021 05:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=7Q7Nv0bqu4rlGBtYQ+gbUns0wJu
        h6GuAiFJdP+cGZnE=; b=SvMo/+4j2yNGhwp07OIeEeAwIPd3uLOkCRwQa21lHhP
        uBTNRs15VHVc0Wnm9juBrZh1WRoUfbAjl6OGg+3BMqWfLxbqr0GfnnNKvhRLv6z8
        Ht3Sogfq/tair/mlm5M0Ws4IhMxyYJJ5aB3ZMTsXfj7rPgB4UyKFB1tZPz0DRliK
        BHwi/farpZU9725kMRANiZjHMFssH8S/rOxF64POXubAjGC5dTdmZE9SM5r6LpI6
        3qeQ+jTkTpu2F1mx8CbaWl09kJjYGCSK7wcAudZIvP/ea20jayJYzTRZs3bFHtVl
        zCtbT3ZRCuxdI95cj5o9sQvZsw9/YnQhvwNRcBsm0nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7Q7Nv0
        bqu4rlGBtYQ+gbUns0wJuh6GuAiFJdP+cGZnE=; b=YeHVXlHvXL396hBceHKuI1
        2nodfeUi1jgIMhqjbIrcZLxiFtsltIkSU/rRD+IJBCKaviaCLZGCkHZUipzKh8aI
        YIp/m5NnLSU2gciUh/8Z1vTesObQnehVBhj4ngYN/Pf+cMEOkKiXjciatPw7K5uH
        KudFDbebfOFPHJfhLJKCfaWkyxBtzj2zcRrPeBXnnOG5RFH0coWQFtNlbSwC8t7p
        TYDH6qiIQ9QsegeQ3ZYr4Evcty2XIdgHyKS9BpK2qBedU/+5qgGyO94tCOGu/vcn
        UzMGe0Zs8hFTbEAt0SgII0xE2YdNu782KoFPPFHrfDCKzEbkhEw4It5xt1I0TUJQ
        ==
X-ME-Sender: <xms:5KIOYDZkCzKlxmwF8Past7gGnV8Uu1VXOKwdgl0zmSdGh9xjQbNWAg>
    <xme:5KIOYCZLoAjv-K3leKcmvRZVhKYdfz_zGHRxi7HJpYazyr5W-FBA4vqiKhw3PnUiN
    dI4Zs7rTFLuMm2vbSs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
    veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5KIOYF97LOISc2dVRzhdQbFgqL728_iJgSiKzU_LiMVXRb_tAllfVA>
    <xmx:5KIOYJpNP6bhZmkQKa-vcXo4QiLVKipRoitsrZ-mefMbXdAgiZY_EQ>
    <xmx:5KIOYOoq6PpxB4uFJVQhpgn3Wdr7RMwSOm8PVBhZdr68RJcXL3U17Q>
    <xmx:56IOYKw_xK1eOvHH4mUywKNmdsPDFtUqeoCTBix2hFA5DpClw3NKwg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E512724005A;
        Mon, 25 Jan 2021 05:52:19 -0500 (EST)
Date:   Mon, 25 Jan 2021 11:52:18 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Message-ID: <20210125105218.kv63vjbxz5b35hdo@gilmour>
References: <20210121163537.1466118-1-maxime@cerno.tech>
 <20210121163537.1466118-8-maxime@cerno.tech>
 <YArBy2DKdCct5cYW@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aovqw5rvxy3ynmws"
Content-Disposition: inline
In-Reply-To: <YArBy2DKdCct5cYW@intel.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--aovqw5rvxy3ynmws
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

On Fri, Jan 22, 2021 at 02:15:07PM +0200, Ville Syrj=E4l=E4 wrote:
> On Thu, Jan 21, 2021 at 05:35:33PM +0100, Maxime Ripard wrote:
> > Some drivers are storing the plane->state pointer in atomic_update and
> > atomic_disable in a variable simply called state, while the state passed
> > as an argument is called old_state.
> >=20
> > In order to ease subsequent reworks and to avoid confusing or
> > inconsistent names, let's rename those variables to new_state.
> >=20
> > This was done using the following coccinelle script, plus some manual
> > changes for mtk and tegra.
> >=20
> > @ plane_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > (
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >  	...,
> >  	.atomic_disable =3D func,
> > 	...,
> >  };
> > |
> >  static const struct drm_plane_helper_funcs helpers =3D {
> >  	...,
> >  	.atomic_update =3D func,
> > 	...,
> >  };
> > )
> >=20
> > @ moves_new_state_old_state @
> > identifier plane_atomic_func.func;
> > identifier plane;
> > symbol old_state;
> > symbol state;
> > @@
> >=20
> >  func(struct drm_plane *plane, struct drm_plane_state *old_state)
> >  {
> >  	...
> > -	struct drm_plane_state *state =3D plane->state;
> > +	struct drm_plane_state *new_state =3D plane->state;
> > 	...
> >  }
> >=20
> > @ depends on moves_new_state_old_state @
> > identifier plane_atomic_func.func;
> > identifier plane;
> > identifier old_state;
> > symbol state;
> > @@
> >=20
> >  func(struct drm_plane *plane, struct drm_plane_state *old_state)
> >  {
> >  	<...
> > -	state
> > +	new_state
> > 	...>
>=20
> Was going to say that this migh eat something else, but I guess
> the dependency prevents that?

Yeah, the dependency takes care of this

> Another way to avoid that I suppose would be to declare 'state'
> as
> symbol moves_new_state_old_state.state;
>=20
> That would probably make the intent a bit more obvious, even with
> the dependency. Or does a dependency somehow automagically imply
> that?

I'm not sure if it does, but it's a symbol here not an identifier or an
expression, so here moves_new_state_old_state.state would always resolve
to state (and only state) anyway

Maxime

--aovqw5rvxy3ynmws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYA6i4gAKCRDj7w1vZxhR
xXQfAQCpHFLAgzbOGuPHlUIw6srwonDWlJwZ5pDLwhp1/pTOIgEAwAm6K8CkMgzh
mwxW8RrOr5SMiQknGuS5OfDWZlYZBwo=
=AjKT
-----END PGP SIGNATURE-----

--aovqw5rvxy3ynmws--
