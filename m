Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF0E322CA5
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 15:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbhBWOmX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 09:42:23 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:36871 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232424AbhBWOmO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Feb 2021 09:42:14 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8A11E580292;
        Tue, 23 Feb 2021 09:41:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 23 Feb 2021 09:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=W5Ow9fvH75ZU0EulrQV4vENorU9
        mrOKzv5PjfArajy8=; b=GU22XeFWKMGcAZu6NWqRYgkFYnXryfc3+rlB2tk1nhN
        zH1yO4BroV86D8Wj+siHaUgnYeJECPYuoxUrrb83MoTFpzJSJphB7CNYaw5EteJZ
        Rfe2uUFGY6BHcoPSg4DF4SQKrsvwPDYYdobiTIUwMYND4GTIu0kbe2QDQrUJz9Ys
        XL+8v06HcJxiYtSVO/5pD1twtzjjYfm8ikS3vacu5DbMHaCdJ/0Bb0eQOCqUJ+xJ
        NIaaer0XVasP54dsztAiOD81TbYaNwUKzT83ztyWAR6aGwJqfbXvuoSxWKtBKTYP
        sX/HgxIZrBTwnzz8GG1ss6/7GOr1ivxZ14BClrGyHWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=W5Ow9f
        vH75ZU0EulrQV4vENorU9mrOKzv5PjfArajy8=; b=qgr4AecZXNy49Pwwcr3zO7
        TdV+JR/XzKNcIDbvGOHn1gyMulZmqUgjZE15uY4QiiJDSs5yNTNDlDvrT8aqmBBw
        m+TXy7tppkYi/athZQuOT688uMOAKQ7dD0wKr2fATxKmEcNhGq/hRsEf67pAYWel
        CW2ClVZEj/WtvMd8w9vOaLZF4/vbQKAGVKEf5TRK7VzsxG4xPY/90O6t9lIKeVT/
        1DcSLdifDN3mbzrRQzXSpVMVk4u14TpKcyvkgpa1j+tLel53b9ATvGlQIXWSFb9A
        HU6MQUGYedLJ6xeOJ9x1CoCFAY6BRqNMM/TVvqlknPHnkpZPBT690jCUju/aYCIQ
        ==
X-ME-Sender: <xms:DxQ1YHcwLkacrL4buHESnYHKnUzjsYIPVVlJYBMfFvRDM6MqeiMrAw>
    <xme:DxQ1YNINX6ny7m8oyXghU1wTT_mRfZ_k9-vxor2IQNCD8oH5QjnGopn2JvmXfufFs
    FrwJdNAWEr_OSJSzjU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
    veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DxQ1YNaDoP46QK6II2Npge5z11oEm9Qdi527yfK1TS9XQKwgMuLiVQ>
    <xmx:DxQ1YAtTvX9P0b2VSBPnZpGywjzTaKaYjRz8OjAsZ4ZT-xr086WGuA>
    <xmx:DxQ1YCtHW6OQizQezuGIpR8i1BG7bAFrv_z_qt-lNwGn9thFMHtHFQ>
    <xmx:EhQ1YGbmP5bQbsmz_bNtZPrY7XxwA4fy1g0NHauspJh91sPMYVo-bw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 74C8124005D;
        Tue, 23 Feb 2021 09:41:19 -0500 (EST)
Date:   Tue, 23 Feb 2021 15:41:17 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 06/11] drm: Use state helper instead of plane state
 pointer in atomic_check
Message-ID: <20210223144117.6lhuizr2zrutbkzi@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-6-maxime@cerno.tech>
 <e6e8191d-08d9-7144-bb1a-ddaa6c21eccb@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="etokcv6rtvultpe4"
Content-Disposition: inline
In-Reply-To: <e6e8191d-08d9-7144-bb1a-ddaa6c21eccb@suse.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--etokcv6rtvultpe4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Feb 22, 2021 at 10:12:49AM +0100, Thomas Zimmermann wrote:
> Am 19.02.21 um 13:00 schrieb Maxime Ripard:
> > Many drivers reference the plane->state pointer in order to get the
> > current plane state in their atomic_check hook, which would be the old
> > plane state in the global atomic state since _swap_state hasn't happened
> > when atomic_check is run.
> >=20
> > Use the drm_atomic_get_old_plane_state helper to get that state to make
> > it more obvious.
> >=20
> > This was made using the coccinelle script below:
> >=20
> > @ plane_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > static struct drm_plane_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_check =3D func,
> > 	...,
> > };
> >=20
> > @ replaces_old_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state, plane_state;
> > @@
> >=20
> >   func(struct drm_plane *plane, struct drm_atomic_state *state) {
> >   	...
> > -	struct drm_plane_state *plane_state =3D plane->state;
> > +	struct drm_plane_state *plane_state =3D drm_atomic_get_old_plane_stat=
e(state, plane);
> >   	...
> >   }
> >=20
> > @@
> > identifier plane_atomic_func.func;
> > identifier plane, state, plane_state;
> > @@
> >=20
> >   func(struct drm_plane *plane, struct drm_atomic_state *state) {
> >   	struct drm_plane_state *plane_state =3D drm_atomic_get_old_plane_sta=
te(state, plane);
> >   	<...
> > -	plane->state
> > +	plane_state
> >   	...>
> >   }
> >=20
> > @ adds_old_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state;
> > @@
> >=20
> >   func(struct drm_plane *plane, struct drm_atomic_state *state) {
> > +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_=
state(state, plane);
> >   	<...
> > -	plane->state
> > +	old_plane_state
> >   	...>
> >   }
> >=20
> > @ include depends on adds_old_state || replaces_old_state @
> > @@
> >=20
> >   #include <drm/drm_atomic.h>
> >=20
> > @ no_include depends on !include && (adds_old_state || replaces_old_sta=
te) @
> > @@
> >=20
> > + #include <drm/drm_atomic.h>
> >    #include <drm/...>
> >=20
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> However, I find 'old plane state' somewhat confusing in this context,
> because it's actually the current plane state. Would it make sense to use
> drm_atomic_get_existing_plane_state() instead?

drm_atomic_get_existing_plane_state is deprecated nowadays, in favour of ei=
ther
drm_atomic_get_old_plane_state or drm_atomic_get_new_plane_state

Maxime

--etokcv6rtvultpe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDUUDQAKCRDj7w1vZxhR
xRvbAP9dHjMFrJJN6sPJ07XtwTqAGn3EfEWhkDvhKpwZr1R6KQEAq1fU0dcu291f
xFwjCPWCaX5tqUHCQKox185muDdxKgU=
=fkaC
-----END PGP SIGNATURE-----

--etokcv6rtvultpe4--
