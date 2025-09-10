Return-Path: <linux-mips+bounces-11193-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F5B5157E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 13:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 727421895EF8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 11:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8002989B0;
	Wed, 10 Sep 2025 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Unew0oVV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066F827F73A
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503566; cv=none; b=iggl4vGG84hzrd4+Bj0rzO5eXXVns5pkZa6BZ91GfspDGmVAvfiC1V/LZ37jRu2rJdpeOlj/F0plskYe0Qr/K85hgQ8a7EXjDXav9jVLBkxjfg2oHgoJ7ti/t2+mtnGzydcsfWgQ4BbRaH3M2U3EPLxn8fIBvgIY1vLJsvt29yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503566; c=relaxed/simple;
	bh=wUeNAc2fEuH8FTq46hWFXFIBfl5LUKjn12PIBFgqPmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKCPznf4ywKJCdOk06SDZkxyV7hgQT7MWTWv4EnbwlHvmb64zOWY2WFdmmd0PgNJJxhswIrtdy5KLtTZEk+reY2G0h7IxoqRBbksVrvn5CTDLJ5d/o8JfoqA3GE3bEtFog++nWZgKtwFzq0KMfyfGfgjtF+J9iulU78N1zkWmLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Unew0oVV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B486C4CEF0;
	Wed, 10 Sep 2025 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757503565;
	bh=wUeNAc2fEuH8FTq46hWFXFIBfl5LUKjn12PIBFgqPmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Unew0oVVo/u8Injo6sBZj3N+shEwsVP0uXYhEibA0dc1s8Z4l0qDvvr4cnxVPGDkF
	 DEjzqAewL7LBG+keOgFx1nV2mwanDO4TQCElTYxpmK/I0tElUQU7wGLa30aZ9ZB42g
	 l42GbOuZXQWqhcAwobzWvJ15qlpvGV4qeo+qY45GiNYU+SyldNZTwGDU94p6yDPYfx
	 NJS/cukQuV3z9BuIGK5ZaULxMeU8cpf7I3hhxGBZQv05S7/EXMf8rjl0eP3Ds36qVQ
	 7QVlJEt7qhhEG7CHsAol8s5oiJ2a/ja4bkwuADltgo9wAu2ED/eLBMHhhpq368v6h9
	 17Z5XFNQQJfQg==
Date: Wed, 10 Sep 2025 13:26:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
Message-ID: <20250910-magnetic-hot-lizard-cfecd2@houat>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-37-1c7a7d960c33@kernel.org>
 <aMAxEjIJOvxmOj2D@intel.com>
 <3d9058a503d6b852756476490f091e43358c21ba.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="thlrckery7x3nejr"
Content-Disposition: inline
In-Reply-To: <3d9058a503d6b852756476490f091e43358c21ba.camel@crapouillou.net>


--thlrckery7x3nejr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 04:45:27PM +0200, Paul Cercueil wrote:
> Hi Ville,
>=20
> Le mardi 09 septembre 2025 =E0 16:52 +0300, Ville Syrj=E4l=E4 a =E9crit=
=A0:
> > On Tue, Sep 09, 2025 at 01:27:56PM +0200, Maxime Ripard wrote:
> > > The ingenic CRTC atomic_enable() implementation will indirectly
> > > call
> > > drm_atomic_get_private_obj_state() through
> > > ingenic_drm_get_priv_state().
> > >=20
> > > drm_atomic_get_private_obj_state() will either return the new state
> > > for
> > > the object in the global state if it exists, or will allocate a new
> > > one
> > > and add it to the global state.
> > >=20
> > > atomic_enable() however isn't allowed to modify the global state.
> > > So
> > > what the implementation should use is the
> > > drm_atomic_get_new_private_obj_state() helper to get the new state
> > > for
> > > the CRTC, without performing an extra allocation.
> > >=20
> > > The ingenic driver has a wrapper around that helper with
> > > ingenic_drm_get_new_priv_state(), so let's use that instead.
> > >=20
> > > Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >=20
> > > ---
> > > To: Paul Cercueil <paul@crapouillou.net>
> > > Cc: linux-mips@vger.kernel.org
> > > ---
> > > =A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
> > > =A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > index
> > > 05faed933e5619c796f2a4fa1906e0eaa029ac68..a1b641d63fc500dc169d0b0e2
> > > 2f93168c343a242 100644
> > > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > @@ -245,11 +245,11 @@ static void
> > > ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> > > =A0{
> > > =A0	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> > > =A0	struct ingenic_drm_private_state *priv_state;
> > > =A0	unsigned int next_id;
> > > =A0
> > > -	priv_state =3D ingenic_drm_get_priv_state(priv, state);
> > > +	priv_state =3D ingenic_drm_get_new_priv_state(priv, state);
> > > =A0	if (WARN_ON(IS_ERR(priv_state)))
> >=20
> > get_new_state() will never return an error pointer. It's either
> > a valid pointer or NULL.
>=20
> Good catch.

Yeah, thanks.

> > To me it looks like this could potentially be NULL here as the
> > get_pvi_state() call is done from the plane .atomic_check()
> > whereas this gets called for the crtc. So if the plane is
> > disabled there might not be any private state included in the
> > commit.
> >=20
> > Not sure how this driver/hardware is supposed to work so not
> > sure what the proper fix for that is...
>=20
> Would it be just a matter of calling drm_atomic_get_private_obj_state()
> in the crtc's .atomic_check() to make sure the object is created?

It's really not clear to me what that private object stores in the first
place. It looks like it's about toggling a bit in the crtc DMA
descriptors, but it's only set by planes?

Can you expand a bit on the hw design and why you're using a private
object to store that?

Maxime

--thlrckery7x3nejr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFgSgAKCRAnX84Zoj2+
diJRAX9fcpba9/W+SMbpLJe4gnHyqcWysphVT9iElaJ5QNlFFttPf7cLEqI1+m1z
iFNZzaYBgO//Llh0Llyawy4DiqGxShBh8CPsjK7fEqsFNtT06bcLFq/m0He6c03/
pjb2rSqgrw==
=yhcu
-----END PGP SIGNATURE-----

--thlrckery7x3nejr--

