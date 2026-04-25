Return-Path: <linux-mips+bounces-14316-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOkMDajc7GmsdAAAu9opvQ
	(envelope-from <linux-mips+bounces-14316-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 17:24:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA63466BAA
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 17:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9F523001CD1
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 15:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8266E3009F2;
	Sat, 25 Apr 2026 15:24:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC52F6562;
	Sat, 25 Apr 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777130658; cv=none; b=ZObbfEIjhGljuTILw4xABYazo9+71vYFyx8NMnKUF0bqyrNjLMidM5+Ge9h1lFGU3tEciit/K/ghZjdUh2FTWsEynNE22CVOW2Uu4TTmhlxD/sahtpdUNk31KOxvr/rPVA+hqvW86uVOCPAVl5WD8exkTjiqEaitrIxVaVUihQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777130658; c=relaxed/simple;
	bh=x9MsoHetsXS4FqMdObMnQmR5wCVYnKon6YnMeEZLvmE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mLAshMKHzHzzRfuftYjsNSZX6c9dzZZ/OUvj71UZ+v2q+FcrYG8y06YbWEjwToBD7yX6FmwLUW9ox7zan1Gte8p9h9VipWb637OgiKWNSlwicODPtPaUhH29sCShOwBjT9sgG1OLwVDfWaMAEOMFXHXOBbCLkuiy3hjjfzf0iXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.10])
	by APP-05 (Coremail) with SMTP id zQCowAB3BQlQ3OxppTiPDg--.10769S2;
	Sat, 25 Apr 2026 23:22:59 +0800 (CST)
Message-ID: <cf2c91396eb3017aa51dd9c840badffddca2f7ec.camel@iscas.ac.cn>
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
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
 Philipp Zabel	 <p.zabel@pengutronix.de>, Paul Cercueil
 <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
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
 <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae
 <inki.dae@samsung.com>,  Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski	 <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart	
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
Date: Sat, 25 Apr 2026 23:22:56 +0800
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
References: 
	<20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowAB3BQlQ3OxppTiPDg--.10769S2
X-Coremail-Antispam: 1UD129KBjvAXoW3ZF1xAF4DWw43AF4DWr1kGrg_yoW8Cr1ruo
	W8Gw1jy3WrG34UGF18KF17Jr13ZFyDtrnrZr1kJ3ZxWFs5tFWUK345Aryftay3tFn3Wr17
	Jw10qry8JFW7XFn7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUY67k0a2IF6F4UM7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW3AVW8Zr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
	C2KfnxnUUI43ZEXa7IU8LID7UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Queue-Id: EDA63466BAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com];
	TAGGED_FROM(0.00)[bounces-14316-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[78];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

=E5=9C=A8 2026-04-23=E5=9B=9B=E7=9A=84 11:16 +0200=EF=BC=8CLuca Ceresoli=E5=
=86=99=E9=81=93=EF=BC=9A
> This series simplifies using the bridge-connector by removing the
> need to
> attach the newly created connector to the encoder.
>=20
> =3D=3D Series description
>=20
> Currently all users of the bridge-connector must call
> drm_connector_attach_encoder() immediately after a successful
> drm_bridge_connector_init().
>=20
> This is an unnecessary burden for users. Move the call to the end of
> drm_bridge_connector_init() so all callers can be simplified.
>=20
> =C2=A0* Patch 1 adds a drm_connector_attach_encoder() call at the end of
> =C2=A0=C2=A0 drm_bridge_connector_init()
> =C2=A0* The other patches remove drm_connector_attach_encoder() after all
> =C2=A0=C2=A0 drm_bridge_connector_init() calls, ordered from the simplest=
 ones
> =C2=A0=C2=A0 (only the last one is somewhat non-obvious)
>=20
> The Cc list is huge due to the many drivers touched. I sent v1 to a
> reduced
> Cc list to ensure there is an agreement about the overall idea. That
> seems
> to be the case, so now it's time to copy all drivers maintainers.
>=20
> It would be nice to apply all of this series at once to avoid
> duplicated
> calls to drm_connector_attach_encoder() in the interim. That would be
> harmless beacuse drm_connector_attach_encoder() is idempotent, but
> unpleasant.
>=20
> =3D=3D Additional rationale (for the curious)
>=20
> Besides making the usage of the bridge-connector a bit simpler, this
> series
> is in preparation for DRM bridge hotplug. Here's why, feel free to
> skip if
> you don't care.
>=20
> The old bridge hotplug proposals I have sent in the past [1] were
> based on
> a hotplug-bridge driver to sit between the last fixed bridge and the
> first
> hotplugged bridge. Discussion with the community led to the need of
> removing the hotplug-bridge and let common DRM code handle hotplug.
> The
> common place of code that appears the most suitable for hotplug
> handling is
> the bridge-connector, which is by now the recommended way to handle
> connector instantiation after a bridge chain.
>=20
> So I'm in the process of extending the bridge-connector to be the
> central
> point to handle bridge hotplug. Turns out the need to call
> drm_connector_attach_encoder() after drm_bridge_connector_init() has
> returned is adding big headaches to such work. So I'm send this long
> but
> simple series to both simplify bridge-connector usage and remove one
> obstacle from the bridge hotplug work. This series is relevant by
> itself
> anyway.
>=20
> [1]
> https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-26-9d6f2c9c30=
58@bootlin.com/
>=20
> =3D=3D Grand plan
>=20
> This is part of the work to support hotplug of DRM bridges. The grand
> plan
> was discussed in [0].

Just see the bridge hotplugging thing, is it possible for DRM drivers
to declare bridges attached to themselves after this?

Loongson 7A1000 PCH can only output DPI signals, so nearly all products
with it are shipping with some kind of external bridges, but currently
drm/loongson does not support them (all display connectors are now seen
as DPI ones, and connectors behind non-transparent bridges won't work).

The bridges are going to be accessed by the DDC I2C busses of 7A1000,
and are not declared with device tree (systems with 7A1000 never ship
with device trees, and Linux currently matches a built-in device tree).
(Bridges being on the DDC I2C also introduces some dependency for them
to depend on the drm/loongson driver.)

Loongson have defined some kind of VBIOS declaring what bridge is
behind, and their non-mainline driver just contains driver codes for
all possible bridges. (Sui Jingfeng previously tried to mainline such
practice, and of course it's rejected because of code duplicity.)

Thanks,
Icenowy

>=20
> Here's the work breakdown (=E2=9E=9C marks the current series):
>=20
> =C2=A01. =E2=80=A6 add refcounting to DRM bridges struct drm_bridge,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 based on devm_drm_bridge_alloc()
> =C2=A0=C2=A0=C2=A0 A. =E2=9C=94 add new alloc API and refcounting (v6.16)
> =C2=A0=C2=A0=C2=A0 B. =E2=9C=94 convert all bridge drivers to new API (v6=
.17)
> =C2=A0=C2=A0=C2=A0 C. =E2=9C=94 kunit tests (v6.17)
> =C2=A0=C2=A0=C2=A0 D. =E2=9C=94 add get/put to drm_bridge_add/remove() + =
attach/detach()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and warn on old allocati=
on pattern (v6.17)
> =C2=A0=C2=A0=C2=A0 E. =E2=80=A6 add get/put on drm_bridge accessors
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. =E2=9C=94 drm_bridge_chain_get_fi=
rst_bridge(), add cleanup action
> (v6.18)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. =E2=9C=94 drm_bridge_get_prev_bri=
dge() (v6.18)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3. =E2=9C=94 drm_bridge_get_next_bri=
dge() (v6.19)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4. =E2=9C=94 drm_for_each_bridge_in_=
chain() (v6.19)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5. =E2=9C=94 drm_bridge_connector_in=
it (v6.19)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6. =E2=9C=94 protect encoder bridge =
chain with a mutex (v7.2)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7. =E2=80=A6 of_drm_find_bridge
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a. =E2=9C=94 add o=
f_drm_get_bridge() (v7.0),
> 	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 convert basic direct users (v7.0-v7=
.1)
> 	=C2=A0 b. =E2=9C=94 convert direct of_drm_get_bridge() users, part 2
> (v7.0)
> 	=C2=A0 c. =E2=9C=94 convert direct of_drm_get_bridge() users, part 3
> (v7.0)
> 	=C2=A0 d. =E2=9C=94 convert direct of_drm_get_bridge() users, part 4
> (v7.1-v7.2)
> 	=C2=A0 e. =E2=80=A6 convert bridge-only drm_of_find_panel_or_bridge()
> users
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8. drm_of_find_panel_or_bridge, *_of=
_get_bridge
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9. =E2=9C=94 enforce drm_bridge_add =
before drm_bridge_attach (v6.19)
> =C2=A0=C2=A0=C2=A0 F. =E2=9C=94 debugfs improvements
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. =E2=9C=94 add top-level 'bridges'=
 file (v6.16)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2. =E2=9C=94 show refcount and list =
lingering bridges (v6.19)
> =C2=A02. =E2=80=A6 handle gracefully atomic updates during bridge removal
> =C2=A0=C2=A0=C2=A0 A. =E2=9C=94 Add drm_bridge_enter/exit() to protect de=
vice resources
> (v7.0)
> =C2=A0=C2=A0=C2=A0 B. =E2=80=A6 protect private_obj removal from list
> =C2=A0=C2=A0=C2=A0 C. =E2=9C=94 Add drm_bridge_clear_and_put() (v7.1)
> =C2=A03. =E2=80=A6 DSI host-device driver interaction
> =C2=A04. =E2=9C=94 removing the need for the "always-disconnected" connec=
tor
> =C2=A05. =E2=9C=94 Migrate i.MX LCDIF driver to bridge-connector (v7.2)
> =C2=A06. =E2=9E=9C DRM bridge hotplug
> =C2=A0=C2=A0=C2=A0 A. =E2=9E=9C Bridge hotplug management in the DRM core
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1. =E2=9E=9C bridge-connector: attac=
h encoder to the connector
> =C2=A0=C2=A0=C2=A0 B.=C2=A0=C2=A0 Device tree description
>=20
> [0]
> https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c305=
8@bootlin.com/#t
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v2:
> - patch 1: update kdoc
> - patch 41: fix by rewriting it fully
> - update cover letter
> - Link to v1:
> https://patch.msgid.link/20260417-drm-bridge-connector-attach_encoder-v1-=
0-67b8b8fb872a@bootlin.com
>=20
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> To: Jonas Karlman <jonas@kwiboo.se>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Sasha Finkelstein <fnkl.kernel@gmail.com>
> To: Janne Grunau <j@jannau.net>
> To: Liu Ying <victor.liu@nxp.com>
> To: Douglas Anderson <dianders@chromium.org>
> To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> To: Lucas Stach <l.stach@pengutronix.de>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Paul Cercueil <paul@crapouillou.net>
> To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> To: Kevin Hilman <khilman@baylibre.com>
> To: Jerome Brunet <jbrunet@baylibre.com>
> To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> To: Rob Clark <robin.clark@oss.qualcomm.com>
> To: Dmitry Baryshkov <lumag@kernel.org>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Jessica Zhang <jesszhan0024@gmail.com>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Sandy Huang <hjc@rock-chips.com>
> To: Heiko St=C3=BCbner <heiko@sntech.de>
> To: Andy Yan <andy.yan@rock-chips.com>
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Mikko Perttunen <mperttunen@nvidia.com>
> To: Jonathan Hunter <jonathanh@nvidia.com>
> To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> To: Jingoo Han <jingoohan1@gmail.com>
> To: Inki Dae <inki.dae@samsung.com>
> To: Seung-Woo Kim <sw0312.kim@samsung.com>
> To: Kyungmin Park <kyungmin.park@samsung.com>
> To: Krzysztof Kozlowski <krzk@kernel.org>
> To: Alim Akhtar <alim.akhtar@samsung.com>
> To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> To: Geert Uytterhoeven <geert+renesas@glider.be>
> To: Magnus Damm <magnus.damm@gmail.com>
> To: Biju Das <biju.das.jz@bp.renesas.com>
> To: Marek Vasut <marex@denx.de>
> To: Stefan Agner <stefan@agner.ch>
> To: Jyri Sarha <jyri.sarha@iki.fi>
> To: Michal Simek <michal.simek@amd.com>
> Cc: Hui Pu <Hui.Pu@gehealthcare.com>
> Cc: Ian Ray <ian.ray@gehealthcare.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: asahi@lists.linux.dev
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
>=20
> ---
> Luca Ceresoli (41):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/display: bridge-connector: attach the =
encoder to the
> created connector
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: adp: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: adv7511: remove now-redundant =
call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: ite-it6263: remove now-redunda=
nt call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: ti-sn65dsi86: remove now-redun=
dant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/imx/dcss: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/imx: ldb: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/imx: parallel-display: remove now-redu=
ndant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/imx/lcdc: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/ingenic: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/kmb/dsi: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/mediatek: mtk_dpi: remove now-redundan=
t call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/mediatek: mtk_dsi: remove now-redundan=
t call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/meson: encoder_cvbs: remove now-redund=
ant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/meson: encoder_hdmi: remove now-redund=
ant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/msm/dp: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/msm/hdmi: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/omapdrm: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm/rockchip: cdn-dp: remove now-redundant =
call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: rk3066_hdmi: remove now-redu=
ndant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/tegra: hdmi: remove now-redundant call=
 to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/tegra: rgb: remove now-redundant call =
to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/tests: bridge: remove now-redundant ca=
ll to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: verisilicon: remove now-redundant cal=
l to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/exynos: exynos_dp: remove now-redundan=
t call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: rcar-du: encoder: remove now-redundan=
t call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: renesas: rz-du: rzg2l_du_encoder: rem=
ove now-redundant
> call to drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: analogix_dp: remove now-redu=
ndant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: dw_dp: remove now-redundant =
call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: dw_hdmi_qp: remove now-redun=
dant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: inno-hdmi: remove now-redund=
ant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/msm/mdp4: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/msm/dsi: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/mxsfb/lcdif: remove now-redundant call=
 to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: lvds: remove now-redundant c=
all to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/tidss: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/tilcdc: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: zynqmp_kms: remove now-redundant call=
 to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/imx: remove now-redundant call to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/rockchip: rgb: remove now-redundant ca=
ll to
> drm_connector_attach_encoder()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: renesas: shmobile: remove now-redunda=
nt call to
> drm_connector_attach_encoder()
>=20
> =C2=A0drivers/gpu/drm/adp/adp_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/bridge/adv7511/adv7511_drv.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/bridge/ite-it6263.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/bridge/ti-sn65dsi86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/display/drm_bridge_connector.c=C2=A0=C2=A0=C2=A0 | =
11 +++++++++--
> =C2=A0drivers/gpu/drm/exynos/exynos_dp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/imx/dc/dc-kms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 8 +-------
> =C2=A0drivers/gpu/drm/imx/dcss/dcss-kms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/imx/ipuv3/imx-ldb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/imx/ipuv3/parallel-display.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/imx/lcdc/imx-lcdc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/kmb/kmb_dsi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/mediatek/mtk_dpi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/gpu/drm/mediatek/mtk_dsi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/gpu/drm/meson/meson_encoder_cvbs.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/meson/meson_encoder_hdmi.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 -------
> =C2=A0drivers/gpu/drm/msm/dp/dp_drm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 --
> =C2=A0drivers/gpu/drm/msm/dsi/dsi_manager.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ----
> =C2=A0drivers/gpu/drm/msm/hdmi/hdmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 --
> =C2=A0drivers/gpu/drm/mxsfb/lcdif_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 -=
-----
> =C2=A0drivers/gpu/drm/omapdrm/omap_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 16 +++++++-----=
-
> ---
> =C2=A0drivers/gpu/drm/rockchip/analogix_dp-rockchip.c=C2=A0=C2=A0 |=C2=A0=
 2 +-
> =C2=A0drivers/gpu/drm/rockchip/cdn-dp-core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/rockchip/dw_dp-rockchip.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/rockchip/rk3066_hdmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/rockchip/rockchip_lvds.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ------
> =C2=A0drivers/gpu/drm/rockchip/rockchip_rgb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ---------
> =C2=A0drivers/gpu/drm/tegra/hdmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/tegra/rgb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/tests/drm_bridge_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/tidss/tidss_encoder.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ------
> =C2=A0drivers/gpu/drm/tilcdc/tilcdc_encoder.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ------
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/gpu/drm/xlnx/zynqmp_kms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 -=
-----
> =C2=A041 files changed, 25 insertions(+), 117 deletions(-)
> ---
> base-commit: 77fec37c895fcbdefbcec97cefd6d1f5cfdf1e3a
> change-id: 20260416-drm-bridge-connector-attach_encoder-c651ac05705f
>=20
> Best regards,
> --=C2=A0=20
> Luca Ceresoli <luca.ceresoli@bootlin.com>


