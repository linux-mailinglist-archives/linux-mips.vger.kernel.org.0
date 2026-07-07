Return-Path: <linux-mips+bounces-15581-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WsijHgEMTWqouAEAu9opvQ
	(envelope-from <linux-mips+bounces-15581-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 16:24:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B971C8F3
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 16:24:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15581-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15581-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBE1A30173A4
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 14:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59306420E74;
	Tue,  7 Jul 2026 14:11:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5C383994;
	Tue,  7 Jul 2026 14:11:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433513; cv=none; b=IYsnpzt0JxQ18fnfIbTsiB1NgtE3wQWL2XBYZL1E90Z7zpjw9MrFzqBrIAcgk4kJsC6vbu7g8G2NnNtMMVDAEEN5XkRLu0eciUzkkeiSPKK1Zzb97MEVAL5FLnWXcawXGalGJEV9qzIdS3t8Nmi35niZlOl30+/KR7dHTJt9NmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433513; c=relaxed/simple;
	bh=Qw+DDNMPifPgLVRQbdGaymOOKrgVAVwhIDLS55Of8sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObJq7zldPWc2lcxRXmmrD093WaVcf/5H61qVCCf9QUIoXCXu7txPTb1ieyRJdibagxAaJjQZyzUQ/04/HQVGZQZad8qV1QseCAfCFEnS/FBrdv2IE+Bskh/vUhyJbURdXmZJI7uCFS8h1ZV7XtziV3uU5lrDOVtCl3+j/wTVOFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D11A3370033C;
	Tue,  7 Jul 2026 14:11:12 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CF2B0AE5EC7; Tue,  7 Jul 2026 14:11:06 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 6816EAE5EBF;
	Tue,  7 Jul 2026 14:10:55 +0000 (UTC)
Date: Tue, 7 Jul 2026 16:10:52 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eddie James <eajames@linux.ibm.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
	kernel@collabora.com, linux-tegra@vger.kernel.org,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 08/42] drm: logicvc: Use
 devm_of_reserved_mem_device_init()
Message-ID: <ak0I7AbfFITG1nyi@shepard>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-9-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ThTwSIZV2a2cCNSQ"
Content-Disposition: inline
In-Reply-To: <20260703193855.110619-9-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15581-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia
 .com,m:srini@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.i
 nfradead.org,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com,oss.qualcomm.com,bstai.top,linux.dev,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,alsa-project.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[paulk@sys-base.io,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[92];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sys-base.io:from_mime,sys-base.io:url,sys-base.io:email,vger.kernel.org:from_smtp,shepard:mid,paulk.fr:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C83B971C8F3

--ThTwSIZV2a2cCNSQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mukesh,

On Sat 04 Jul 26, 01:08, Mukesh Ojha wrote:
> Switch to devm_of_reserved_mem_device_init() so the reserved memory
> region is released automatically on probe failure or device unbind.
> Replace all error paths that jumped to error_reserved_mem: with
> error_early: since the manual cleanup label is no longer needed, and
> remove the explicit of_reserved_mem_device_release() call in the remove
> function.
>=20
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Looks good to me, thanks!

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  drivers/gpu/drm/logicvc/logicvc_drm.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logi=
cvc/logicvc_drm.c
> index bbebf4fc7f51..d6dbe52ff0a9 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -306,7 +306,7 @@ static int logicvc_drm_probe(struct platform_device *=
pdev)
>  	int irq;
>  	int ret;
> =20
> -	ret =3D of_reserved_mem_device_init(dev);
> +	ret =3D devm_of_reserved_mem_device_init(dev);
>  	if (ret && ret !=3D -ENODEV) {
>  		dev_err(dev, "Failed to init memory region\n");
>  		goto error_early;
> @@ -327,14 +327,14 @@ static int logicvc_drm_probe(struct platform_device=
 *pdev)
>  		ret =3D of_address_to_resource(of_node, 0, &res);
>  		if (ret) {
>  			dev_err(dev, "Failed to get resource from address\n");
> -			goto error_reserved_mem;
> +			goto error_early;
>  		}
> =20
>  		base =3D devm_ioremap_resource(dev, &res);
>  		if (IS_ERR(base)) {
>  			dev_err(dev, "Failed to map I/O base\n");
>  			ret =3D PTR_ERR(base);
> -			goto error_reserved_mem;
> +			goto error_early;
>  		}
> =20
>  		logicvc_drm_regmap_config.max_register =3D resource_size(&res) -
> @@ -345,21 +345,21 @@ static int logicvc_drm_probe(struct platform_device=
 *pdev)
>  		if (IS_ERR(regmap)) {
>  			dev_err(dev, "Failed to create regmap for I/O\n");
>  			ret =3D PTR_ERR(regmap);
> -			goto error_reserved_mem;
> +			goto error_early;
>  		}
>  	}
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		ret =3D -ENODEV;
> -		goto error_reserved_mem;
> +		goto error_early;
>  	}
> =20
>  	logicvc =3D devm_drm_dev_alloc(dev, &logicvc_drm_driver,
>  				     struct logicvc_drm, drm_dev);
>  	if (IS_ERR(logicvc)) {
>  		ret =3D PTR_ERR(logicvc);
> -		goto error_reserved_mem;
> +		goto error_early;
>  	}
> =20
>  	platform_set_drvdata(pdev, logicvc);
> @@ -371,7 +371,7 @@ static int logicvc_drm_probe(struct platform_device *=
pdev)
>  	caps =3D logicvc_drm_caps_match(logicvc);
>  	if (!caps) {
>  		ret =3D -EINVAL;
> -		goto error_reserved_mem;
> +		goto error_early;
>  	}
> =20
>  	logicvc->caps =3D caps;
> @@ -382,7 +382,7 @@ static int logicvc_drm_probe(struct platform_device *=
pdev)
>  	ret =3D logicvc_clocks_prepare(logicvc);
>  	if (ret) {
>  		drm_err(drm_dev, "Failed to prepare clocks\n");
> -		goto error_reserved_mem;
> +		goto error_early;
>  	}
> =20
>  	ret =3D devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
> @@ -450,9 +450,6 @@ static int logicvc_drm_probe(struct platform_device *=
pdev)
>  error_clocks:
>  	logicvc_clocks_unprepare(logicvc);
> =20
> -error_reserved_mem:
> -	of_reserved_mem_device_release(dev);
> -
>  error_early:
>  	return ret;
>  }
> @@ -469,8 +466,6 @@ static void logicvc_drm_remove(struct platform_device=
 *pdev)
>  	logicvc_mode_fini(logicvc);
> =20
>  	logicvc_clocks_unprepare(logicvc);
> -
> -	of_reserved_mem_device_release(dev);
>  }
> =20
>  static void logicvc_drm_shutdown(struct platform_device *pdev)
> --=20
> 2.53.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--ThTwSIZV2a2cCNSQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmpNCOwACgkQhP3B6o/u
lQyaPQ//f4pAYoEPe2VkBx5ziaC0VkGALJ8pMaCBZzEG6pnd2z1UBPK8Y2xJLlQP
5bkyAxCQjpN0fwzwtB+kdA0jp2iokJqDThaLYoql9R0Qvj2DyOy7x+SwRqbRzdyJ
npZtxXLCuF9oXL4YlUHBVPkgL9WsGf2cMpqkXAI/iPd0K+9zBfxT48xlRnuslCQF
gwlVwkghlca2EFVG0f4q4HVkGRcFkAM9pYpKZD4B4iS89SwzHmJo44SZWV0CsWfe
ysY5SERP+XL8EbiVlQxCWyqo9Yb//Ikc/EuIWFPMzPW7hp4ZTzjzYaRtVdWEM3Or
GQ8uFNoXZfWHzfBpHk1Ewfdr7JBtXM0vPIh650GS2SCdGaCS0Ud2UUv7QZdSluel
uGrsM82ZQ6ts4V8ct1O/dWG7TwYnc8BaFADG90JdKck+zb3fRnQ07aTNrF/bRDU1
gcnN0yfM/zPIZAc7GA+4Stzok5c+bj2Sb849b5S5g6LNETsScU+WPK5pvEjjWq9E
zsLawR41dclgUWujmQqflY1sbvVA3YsAADIxWAAsT1WDULfQ/c70/2rMIvNATzBN
VxbCWSZtk77xMlu6aje7HIbEQa9PGm52xeqNOqfwv/t5kGZxU1fqyAULXAfSYQ2R
jkjMhoWPkeb15z5Be0yQY0auFkEuIORZboIqn49NxQW0LVu7byA=
=tX4X
-----END PGP SIGNATURE-----

--ThTwSIZV2a2cCNSQ--

