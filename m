Return-Path: <linux-mips+bounces-11012-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 833C0B42971
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 21:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 420FE161489
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 19:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6692D77F1;
	Wed,  3 Sep 2025 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="kjMqKVoZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492152D3ECF
	for <linux-mips@vger.kernel.org>; Wed,  3 Sep 2025 19:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756926264; cv=none; b=XP0fSU4zgPi79MmPjNdvVv+D2vGsuWmD3eaE82BecJmAHznH65Wd7tq0elk6PpX5ifpqzDqCU+GIWrHd8Unz8EK5kbVS/H89SFY+ICZF5lNNQJdh3xybFIxYA4TCJZu4pVfSlcBMZArA9i9uHwK9U12gU2ANvGzj5w21AZkTePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756926264; c=relaxed/simple;
	bh=bJmSosPrI+ymY3k5fPzJ7/DV9uci5VbcZRgRU3n3lu4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PApkr3tOnupLM+93lnSnjq5yIWx3he3c4V1QGsSMjxIdC2xPDsozt8okb10gLJ+ZoONuamkcYwg+65BvMixnFNhUiB0/puD84if7yvsQ1yZtgzumnRdphzE3K3JgW8XMbLp0KKUnYwmP9eh5cwz9knTt8j9Ha3bfDDeVTYeX8fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=kjMqKVoZ; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1756926259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wO22lLVpvhTjSt7UiwpTspzXapQo0kN9zAH1RpqwYiw=;
	b=kjMqKVoZfKGH8zmo0VopBZN8pUi0ENNIfc4SPT/IkSohSZvgG3s9kb1Cdi1mrepDmrgox5
	eg9cpzMLcv8IMH/CQXeDf3yVx7rYrSGdeOwhqMEi88l5w+IUjpLPkpq3oAL9NF5KDVAEqC
	TfxdS6tHa8VIHeHdBJki4LROvWvGiiw=
Message-ID: <e81de8edb1ce674adb6773e89ad25e923ce4c09f.camel@crapouillou.net>
Subject: Re: [PATCH v2 19/37] drm/ingenic: Switch to
 drm_atomic_get_new_crtc_state()
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Date: Wed, 03 Sep 2025 21:04:16 +0200
In-Reply-To: <20250902-drm-no-more-existing-state-v2-19-de98fc5f6d66@kernel.org>
References: 
	<20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
	 <20250902-drm-no-more-existing-state-v2-19-de98fc5f6d66@kernel.org>
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

Hi Maxime,

Le mardi 02 septembre 2025 =C3=A0 11:35 +0200, Maxime Ripard a =C3=A9crit=
=C2=A0:
> The ingenic atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
>=20
> This hook is called as part of the global atomic_check, thus before
> the
> states are swapped. The existing state thus points to the new state,
> and
> we can use drm_atomic_get_new_crtc_state() instead.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

and/or:

Tested-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>=20
> ---
> To: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +--
> =C2=A0drivers/gpu/drm/ingenic/ingenic-ipu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A02 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index
> 9db1ceaed5188a4ef0897280dc72108eb3815b5f..05faed933e5619c796f2a4fa190
> 6e0eaa029ac68 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -469,12 +469,11 @@ static int
> ingenic_drm_plane_atomic_check(struct drm_plane *plane,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	if (priv->soc_info->plane_f0_not_working && plane =3D=3D &priv-
> >f0)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
> -							crtc);
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> =C2=A0	if (WARN_ON(!crtc_state))
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	priv_state =3D ingenic_drm_get_priv_state(priv, state);
> =C2=A0	if (IS_ERR(priv_state))
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index
> 2574a4b4d40a2c27cb212114117829d9f6ab3ddb..32638a713241abbd4eaed09f0aa
> ec2b790650cc9 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -578,11 +578,11 @@ static int
> ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
> =C2=A0	struct ingenic_ipu_private_state *ipu_state;
> =C2=A0
> =C2=A0	if (!crtc)
> =C2=A0		return 0;
> =C2=A0
> -	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
> crtc);
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> =C2=A0	if (WARN_ON(!crtc_state))
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	ipu_state =3D ingenic_ipu_get_priv_state(ipu, state);
> =C2=A0	if (IS_ERR(ipu_state))

