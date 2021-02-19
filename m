Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5487031FBBA
	for <lists+linux-mips@lfdr.de>; Fri, 19 Feb 2021 16:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbhBSPN3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Feb 2021 10:13:29 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:39349 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhBSPN2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Feb 2021 10:13:28 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 93E225801D8;
        Fri, 19 Feb 2021 10:12:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 19 Feb 2021 10:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=Emd+iGXCpjhCIuGJ6kINzMtdOjP
        Vb1dtj8cLvd3w9uQ=; b=NGfSf1xCTv59Q/62lzFrQUe3OfzHicY7PdlXFseZ+fo
        CXaps5k96MCo/y6dXa/ePCUiVr/+yd+bY0z6zZBYrTTK2YzzxM1J8iqD3y6W62cZ
        rXBdZ7f2+aX04uHfX4St/hRD2mvVDoQ+/wu5mb+Q5x907WZ9caEJ8KHfdT1nr2yD
        JLP64gaaabo7m5fSkBVWV9SDIr/uh0mJgEZZlhBIJuPlE67fksWmT4qsGXSXnPqG
        CKVo2kTnbLrkMB9P1EmlLJdgH0orL2bJxv6jphPeJpe+zESq+2OJKnDQBxs0UL06
        x/1RFeKzSAsBixLgniCd+pZnvp+IstVDQldHmokucVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Emd+iG
        XCpjhCIuGJ6kINzMtdOjPVb1dtj8cLvd3w9uQ=; b=YkCuJYja0uX4TkD2rzV21h
        g8ng0jTMGlNLgjp3ibUk89EXpzsGrxEJjWRxIIHh3CLNVbOWazk2yrYzBXJ23kBR
        4wFbAgUarW3c96/qt+aEbZfVXEvUxH9PdikMlzxmtt9xyHWiVQpqsVbo6jcEa6iJ
        S5ASjZRNk11V2LP36XYPaue+cGDQy5dTRhUanBnB/KPmSuAVAvVr8FxbpG1DM4QP
        EabMeDUOtfQ6sWdaKB/kFRqXUJOra2iCGagkBurhMfRmM3t0wgIxbfA3h4kbSzIy
        MuzVRTwFasgPMG+HDe+aFmQxFNJJYD06GCyMfq7EAN1LPbPmuQhzaHFugwqkspHQ
        ==
X-ME-Sender: <xms:ZtUvYPGywbwb_W_X_rHD8PzuY-T32APXk_hW92aAe8msQObxCrKUFQ>
    <xme:ZtUvYMXSX6H4Zazn71SMqbZfKo75Xu2WSlL0lAD23b9Owys2Pdmw7rhPL-VpNd91z
    4S9PFdrk7Wctr0bo40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZtUvYBIUJuioxxraj3nflffP1AzbRkhnaIOVnlX3XwS9zmyHZ2byOg>
    <xmx:ZtUvYNEjum8w0L68Xo84cpFdfo-7BdSTnTSZf3vOsIFddzRi7AVUcg>
    <xmx:ZtUvYFXKXk3ywwLCh1ihNeDgTUlKEVDBbKVFdkJQ50WK-22UnG9MHg>
    <xmx:adUvYGbtXseOPET8eQPCaGa5NONIe4S195vIixBTbFd4se4gga4qQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C72DF1080057;
        Fri, 19 Feb 2021 10:12:37 -0500 (EST)
Date:   Fri, 19 Feb 2021 16:12:35 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        John Stultz <john.stultz@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>, Eric Anholt <eric@anholt.net>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 02/11] drm: Rename plane atomic_check state names
Message-ID: <20210219151235.dsv4mujqyrzndhsn@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-2-maxime@cerno.tech>
 <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x6inkztb7pnxs2gu"
Content-Disposition: inline
In-Reply-To: <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--x6inkztb7pnxs2gu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for your review!

On Fri, Feb 19, 2021 at 03:49:22PM +0100, Thomas Zimmermann wrote:
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> > index 075508051b5f..1873a155bb26 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -337,12 +337,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
> >   };
> >   static int ipu_plane_atomic_check(struct drm_plane *plane,
> > -				  struct drm_plane_state *state)
> > +				  struct drm_plane_state *new_state)
>=20
> This function uses a different naming convention then the others?
>=20
> >   {
> >   	struct drm_plane_state *old_state =3D plane->state;

So, the function already had a variable named old_state, so I was
actually trying to make the drivers consistent here: having one variable
with old_state and new_plane_state felt weird.

The heuristic is thus to use the convention of the driver if one exists
already, and if there's none pick new_plane_state.

It makes it indeed inconsistent across drivers, but it felt more natural
to be consistent within a single driver.

Maxime

--x6inkztb7pnxs2gu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYC/VYwAKCRDj7w1vZxhR
xXb7AP9dLYZ0ol4FnTyS9ndvGPPXpijdNPtrfZDs40BKL//eEgEA8HMiYKjgufNK
Zn4QIsaErGpt9UM9/IC6ZwJ7lvoIrQ0=
=ygPX
-----END PGP SIGNATURE-----

--x6inkztb7pnxs2gu--
