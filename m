Return-Path: <linux-mips+bounces-15010-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1rnTHZnlJ2ow4QIAu9opvQ
	(envelope-from <linux-mips+bounces-15010-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 12:06:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B765EB51
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 12:06:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=crapouillou.net header.s=mail header.b=thP4M7h3;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15010-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15010-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=crapouillou.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88887300D90D
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2026 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EFE2BEC3F;
	Tue,  9 Jun 2026 09:55:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D94342CB1
	for <linux-mips@vger.kernel.org>; Tue,  9 Jun 2026 09:55:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998908; cv=none; b=LcGb47QJAjJnPekWUO+xr5iJTcYL7KCU+tq3KN5BJPgRJk4H/SY0IUUAtUU0Xx4AwpmFFs+A8MD9XyTWYK+fj4YHtU1Gya7sYM37mDmgsLvSiB5VhqsIDBYgMlut5LRPE8YwX4vgPjMJt0wEn3o6iNF4d1yDJaEcQWlL/1h7df4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998908; c=relaxed/simple;
	bh=jv/F1AaeWo0DoheXJQi0yrZH8IrIoceQeWossAeEYr0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F9n4fMyRz1aOmOcEHlhN6zNSgpV+pXLeIKtQpMgcZ93U5kbh8VoiuWrSik/n8iBlPrM3NIQ/qzOE16pKk1huuxlGdYOl/EfqnL+IAf6KeAPeF4YQERtiTMVTePAzkxPzcjgWEQ8iQcCFXzipPeEhVzUGEAl06y8KBg4wiEU5oCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=thP4M7h3; arc=none smtp.client-ip=185.119.170.32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1780998585;
	bh=jv/F1AaeWo0DoheXJQi0yrZH8IrIoceQeWossAeEYr0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=thP4M7h3Dr0phauLNqIWgL5Qdv6NCuobMaPO+VrwslmbhIdkwymDspdIdW0Naq7o0
	 JnvdBHlw0OlIW1T/sfojD2hlj5WdOB8P8ZjUQ28hOiTXRHzG2aVyqEyCVOzmvsQGQ3
	 ahobuvnQptVQrsrIXeGrEQXTlmkiqh6wsYwQOQM4=
Message-ID: <a529231db4b2c46d524ba6086b0868e60b179cbe.camel@crapouillou.net>
Subject: Re: [PATCH v2 48/78] drm/ingenic: Switch to atomic_create_state
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-mips@vger.kernel.org
Date: Tue, 09 Jun 2026 11:49:42 +0200
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-48-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
	 <20260608-drm-no-more-bridge-reset-v2-48-0a91018bf886@kernel.org>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[crapouillou.net,none];
	R_DKIM_ALLOW(-0.20)[crapouillou.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15010-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[paul@crapouillou.net,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@crapouillou.net,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[crapouillou.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,crapouillou.net:dkim,crapouillou.net:email,crapouillou.net:mid,crapouillou.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD5B765EB51

Hi Maxime,

Le lundi 08 juin 2026 =C3=A0 16:36 +0200, Maxime Ripard a =C3=A9crit=C2=A0:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
>=20
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> To: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 42c86f195c66..7e569af22391 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1029,11 +1029,11 @@ static const struct drm_encoder_helper_funcs
> ingenic_drm_encoder_helper_funcs =3D
> =C2=A0static const struct drm_bridge_funcs ingenic_drm_bridge_funcs =3D {
> =C2=A0	.attach			=3D ingenic_drm_bridge_attach,
> =C2=A0	.atomic_enable		=3D ingenic_drm_bridge_atomic_enable,
> =C2=A0	.atomic_disable		=3D
> ingenic_drm_bridge_atomic_disable,
> =C2=A0	.atomic_check		=3D ingenic_drm_bridge_atomic_check,
> -	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
> +	.atomic_create_state		=3D
> drm_atomic_helper_bridge_create_state,
> =C2=A0	.atomic_duplicate_state	=3D
> drm_atomic_helper_bridge_duplicate_state,
> =C2=A0	.atomic_destroy_state	=3D
> drm_atomic_helper_bridge_destroy_state,
> =C2=A0	.atomic_get_input_bus_fmts =3D
> ingenic_drm_bridge_atomic_get_input_bus_fmts,
> =C2=A0};
> =C2=A0

