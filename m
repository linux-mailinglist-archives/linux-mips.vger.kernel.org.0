Return-Path: <linux-mips+bounces-11014-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEEAB4298A
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 21:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7F665802FB
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 19:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E6C3680AB;
	Wed,  3 Sep 2025 19:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="XUBkO3Bp"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BB82D6E6D
	for <linux-mips@vger.kernel.org>; Wed,  3 Sep 2025 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756926710; cv=none; b=ddngXQbiReuO8gqDCJ5C/0QHN5T6qfdS4L+3XtJsDIpcMrbI/d/0rsaYXQ8x37niPmmZvTcQfXeCPQdkEsJAGUVR2Niw1jBZU+jqGrf/UWzL2Yuhhf/TPjHC2xsrC4KeOAbixHjJCNb7KSNTyP3MvRYA6LBBrt9shIICU/ktMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756926710; c=relaxed/simple;
	bh=M+RUQjyGg6VYNscTJByklmOdst/GdrJZEjFbbU/cmo8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JV5GwsLuZxbTwy95W9OhggmVXLnBzeGB9qFulG9vf2pmTWAS3WcFwd7LLPkWPJXUFq4x41JZy83NpjS3ItVoqoRj1Z2f9L7QsveM+c4yrVlhd/Ag1lUaw2weYtw4X89JQhvjC/PEIYQwqWHdrYhEVyg+Rhwbe0Sgb9hixnMR5u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=XUBkO3Bp; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1756926234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EToa9DUv5S2yqWVgv21Tyyq/IGMsQV774Nd/X220Vzs=;
	b=XUBkO3Bp3HYvOjGm3qBjYgI41NuNcQDMAybwlHnHkh+UPaMxf4uLnOzLW3HruCBvALm+gf
	jzuLVqUopQFVqSLrFydy8lXFEpnCQWu4crJN37ndbV6OzinDPn6G4kaR8WJVpZ5SA8w425
	68re+wW9b1XStnF9KVa6suzZwR/f7Yw=
Message-ID: <7fa81efab32e5d3865282eb99325be862c8d5fb0.camel@crapouillou.net>
Subject: Re: [PATCH v2 11/37] drm/ingenic: ipu: Switch to
 drm_atomic_get_new_crtc_state()
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Date: Wed, 03 Sep 2025 21:03:51 +0200
In-Reply-To: <20250902-drm-no-more-existing-state-v2-11-de98fc5f6d66@kernel.org>
References: 
	<20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
	 <20250902-drm-no-more-existing-state-v2-11-de98fc5f6d66@kernel.org>
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

Le mardi 02 septembre 2025 =C3=A0 11:35 +0200, Maxime Ripard a =C3=A9crit=
=C2=A0:
> The ingenic IPU atomic_set_property implementation uses the
> deprecated
> drm_atomic_get_existing_crtc_state() helper.
>=20
> This hook is called during the state building process, before
> atomic_check, and thus before the states are swapped. The existing
> state
> thus points to the new state, and we can use
> drm_atomic_get_new_crtc_state() instead.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Tested it and my screen still works.

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
> =C2=A0drivers/gpu/drm/ingenic/ingenic-ipu.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index
> 26ebf424d63ec21ccee80221745c3e8bcc6b3d7f..2574a4b4d40a2c27cb212114117
> 829d9f6ab3ddb 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -703,11 +703,11 @@ ingenic_ipu_plane_atomic_set_property(struct
> drm_plane *plane,
> =C2=A0
> =C2=A0	mode_changed =3D val !=3D ipu->sharpness;
> =C2=A0	ipu->sharpness =3D val;
> =C2=A0
> =C2=A0	if (state->crtc) {
> -		crtc_state =3D
> drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> +		crtc_state =3D drm_atomic_get_new_crtc_state(state-
> >state, state->crtc);
> =C2=A0		if (WARN_ON(!crtc_state))
> =C2=A0			return -EINVAL;
> =C2=A0
> =C2=A0		crtc_state->mode_changed |=3D mode_changed;
> =C2=A0	}

