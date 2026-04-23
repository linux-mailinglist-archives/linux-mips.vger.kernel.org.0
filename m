Return-Path: <linux-mips+bounces-14296-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MTbARhe6mksygIAu9opvQ
	(envelope-from <linux-mips+bounces-14296-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 19:59:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10F455D1E
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 19:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3738A300C027
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 17:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975203A7F5F;
	Thu, 23 Apr 2026 17:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="VidnwjpK"
X-Original-To: linux-mips@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26E13AA4E7;
	Thu, 23 Apr 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776967180; cv=none; b=HRxqg5Cc9eGRqYvIhIo6BJQgaZX7fdDODx1nxtlP4oIrSFKVzn81+DymHnq4m+13qWYFLcu0xGR75sucUqbNF0blAeS1n9UqsmWEtsDsEBfCwF7Jm9dAuMbNZtSKf7P0BVn8cqZkPOKAzOsf0D9XOaaQogu813/rO3eDfrVP33s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776967180; c=relaxed/simple;
	bh=QGXWKH7JhojDk/vCfoesF6wdkbcwasz+b8TzqgsvnEY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l4edDqx79mpKVfHeDJZhrRKqXbhIXbPargs0d1QU//u/hUK54H3t7cllKaFYzpsAqzFJtFUWNeDSoSBZkhTV/oZ5hYlyBOqO4ssSu36EEwMfXuLQpjIM8MQSpTcqrw03HXb4syPLUxFFVme+oM0bEf8oTDBAUIXoU0JdrPfH1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=VidnwjpK; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1776967168;
	bh=QGXWKH7JhojDk/vCfoesF6wdkbcwasz+b8TzqgsvnEY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VidnwjpKlxAHpZXdZ5M8HqNp1+KLzj/lVqpTUjnVCvvI0AlMOvy6xLPjbVADW6Z7T
	 zX2omNSMnvzMFu+5OaTkic3YSw0JBpTj1pMqKOxAH5KG+vq/PHkgVXLcKBhtSsGmGS
	 Vrdc/osIcU6MzDXs3blATAtRvZpS57uE18zfDmjI=
Message-ID: <6bdce57340942334cf7d3c7f7ed0215458717495.camel@crapouillou.net>
Subject: Re: [PATCH v2 10/41] drm/ingenic: remove now-redundant call to
 drm_connector_attach_encoder()
From: Paul Cercueil <paul@crapouillou.net>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, Douglas
 Anderson <dianders@chromium.org>, Laurentiu Palcu	
 <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Frank
 Li	 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Philipp Zabel	 <p.zabel@pengutronix.de>, Anitha Chrisanthus
 <anitha.chrisanthus@intel.com>,  Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Kevin Hilman
 <khilman@baylibre.com>,  Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Clark	
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul	 <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?=	 <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Thierry Reding	 <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han
 <jingoohan1@gmail.com>,  Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park	 <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham	
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven	
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Biju Das	
 <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, Stefan Agner	
 <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek	
 <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 	linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	freedreno@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, 	linux-tegra@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-renesas-soc@vger.kernel.org
Date: Thu, 23 Apr 2026 19:59:21 +0200
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-10-2ae6ca69b390@bootlin.com>
References: 
	<20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
	 <20260423-drm-bridge-connector-attach_encoder-v2-10-2ae6ca69b390@bootlin.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[crapouillou.net,none];
	R_DKIM_ALLOW(-0.20)[crapouillou.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14296-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[bootlin.com,oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,collabora.com,baylibre.com,googlemail.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[crapouillou.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[78];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@crapouillou.net,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email,crapouillou.net:email,crapouillou.net:dkim,crapouillou.net:mid]
X-Rspamd-Queue-Id: BF10F455D1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

Le jeudi 23 avril 2026 =C3=A0 11:17 +0200, Luca Ceresoli a =C3=A9crit=C2=A0=
:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 4068114adf8c..70088db34f69 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1330,8 +1330,6 @@ static int ingenic_drm_bind(struct device *dev,
> bool has_components)
> =C2=A0			ret =3D PTR_ERR(connector);
> =C2=A0			goto err_drvdata;
> =C2=A0		}
> -
> -		drm_connector_attach_encoder(connector, encoder);
> =C2=A0	}
> =C2=A0
> =C2=A0	drm_for_each_encoder(encoder, drm) {

