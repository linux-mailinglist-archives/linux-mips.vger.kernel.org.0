Return-Path: <linux-mips+bounces-11161-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1798B4FFD9
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 16:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C0FA1C624BC
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 14:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9CD1A9F8E;
	Tue,  9 Sep 2025 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="NI73Txsz"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7B01A5B8A
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 14:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429135; cv=none; b=sNTaKhOz0t8xpyZFCAUNp4fnJ46Xul/FgX4qqfrPzkBx6I64xXEGxCKinHwqnxoKqlTi06gX6wlg6TPHgX3HaqlrspqFuDjv7uSxuiv4Liysfgk19xVMOqYN343c4E6CHFrLp6NwstmBHlt1VAizCH2ydofQEWP2EWyA6YDOZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429135; c=relaxed/simple;
	bh=Kxk58gXgCZHN7X9PYvngO9J3KUj9PsLFjGobPsNHaSA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8RSCR545KoJRrbB8Yl5LFj0mmnLAQV2L2o0TTzGcsSQpACWdiGG2aVjNmrHSTmQ/hjkT1cs+qxSXP3V4h+/bEya5ZiIWNJG/Fikg3tqJSZk4GzYlDnqQOQkHdfvVOu5rUD/JkvmUNi5XzOOK1cG5V4D54KRj0WS6686O+t+fiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=NI73Txsz; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1757429129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JHAZESm+y62QqcPnAfjsvhKwECCjMVqEOoqdoNz7Ang=;
	b=NI73TxszrDckjLiz2fP8dPaR2vPl64YREExCZKP2w/u07q9hgfqvRsnkiL5nLwmI6Zwwn0
	BVZd6lxF5eTCImFaeoha5GB4kMzWeu5zJdRb1brkd2SM8IleqTmW0LEWqe6uWiuL1S5Cah
	lkc6e2qwLY1v5KKOcFc5oAPwfCw1jxs=
Message-ID: <3d9058a503d6b852756476490f091e43358c21ba.camel@crapouillou.net>
Subject: Re: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
From: Paul Cercueil <paul@crapouillou.net>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
	 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, Dmitry Baryshkov
	 <dmitry.baryshkov@oss.qualcomm.com>, linux-mips@vger.kernel.org
Date: Tue, 09 Sep 2025 16:45:27 +0200
In-Reply-To: <aMAxEjIJOvxmOj2D@intel.com>
References: 
	<20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
	 <20250909-drm-no-more-existing-state-v3-37-1c7a7d960c33@kernel.org>
	 <aMAxEjIJOvxmOj2D@intel.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ville,

Le mardi 09 septembre 2025 =C3=A0 16:52 +0300, Ville Syrj=C3=A4l=C3=A4 a =
=C3=A9crit=C2=A0:
> On Tue, Sep 09, 2025 at 01:27:56PM +0200, Maxime Ripard wrote:
> > The ingenic CRTC atomic_enable() implementation will indirectly
> > call
> > drm_atomic_get_private_obj_state() through
> > ingenic_drm_get_priv_state().
> >=20
> > drm_atomic_get_private_obj_state() will either return the new state
> > for
> > the object in the global state if it exists, or will allocate a new
> > one
> > and add it to the global state.
> >=20
> > atomic_enable() however isn't allowed to modify the global state.
> > So
> > what the implementation should use is the
> > drm_atomic_get_new_private_obj_state() helper to get the new state
> > for
> > the CRTC, without performing an extra allocation.
> >=20
> > The ingenic driver has a wrapper around that helper with
> > ingenic_drm_get_new_priv_state(), so let's use that instead.
> >=20
> > Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >=20
> > ---
> > To: Paul Cercueil <paul@crapouillou.net>
> > Cc: linux-mips@vger.kernel.org
> > ---
> > =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > index
> > 05faed933e5619c796f2a4fa1906e0eaa029ac68..a1b641d63fc500dc169d0b0e2
> > 2f93168c343a242 100644
> > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > @@ -245,11 +245,11 @@ static void
> > ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> > =C2=A0{
> > =C2=A0	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> > =C2=A0	struct ingenic_drm_private_state *priv_state;
> > =C2=A0	unsigned int next_id;
> > =C2=A0
> > -	priv_state =3D ingenic_drm_get_priv_state(priv, state);
> > +	priv_state =3D ingenic_drm_get_new_priv_state(priv, state);
> > =C2=A0	if (WARN_ON(IS_ERR(priv_state)))
>=20
> get_new_state() will never return an error pointer. It's either
> a valid pointer or NULL.

Good catch.

> To me it looks like this could potentially be NULL here as the
> get_pvi_state() call is done from the plane .atomic_check()
> whereas this gets called for the crtc. So if the plane is
> disabled there might not be any private state included in the
> commit.
>=20
> Not sure how this driver/hardware is supposed to work so not
> sure what the proper fix for that is...

Would it be just a matter of calling drm_atomic_get_private_obj_state()
in the crtc's .atomic_check() to make sure the object is created?

Cheers,
-Paul

>=20
> > =C2=A0		return;
> > =C2=A0
> > =C2=A0	/* Set addresses of our DMA descriptor chains */
> > =C2=A0	next_id =3D priv_state->use_palette ? HWDESC_PALETTE : 0;
> >=20
> > --=20
> > 2.50.1

