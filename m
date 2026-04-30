Return-Path: <linux-mips+bounces-14394-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJBLEoQe82kvxQEAu9opvQ
	(envelope-from <linux-mips+bounces-14394-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 11:19:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E38049FBFC
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 11:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E2023004D27
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 09:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB89239F160;
	Thu, 30 Apr 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jl75Y6bE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B374F39FCBF
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540733; cv=none; b=b8yRzIvyXHi3ZXpQ1KcXZVyVCdhKz8YYxvZaSVzKzPTXlnRstnveqkvhLaFsvVSah1XRbLSUq0ZZhA0uMi9cC/pATrevS9awYZaN16izpwf1KZlQEa/5Dgb9JZKWtm5Uv31mjIIxB4Aa03l2WGSJCwa0Ml+t5pQkpkR+IdQT8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540733; c=relaxed/simple;
	bh=UJL6OelUXsdUY30x9NgFXQIVtEbTmLIWMXWCnrTOyiM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mylm3S1LeMrX8B9e2YyxbjC1+x1UR+sAmPBteJg+eR+NYTTT5F89THn0uDzaaC47T28N2a2tcJFTEqOfIdbM0cIf2IrjD5kUEkzsLM20AAcX9KH+WuGLMGy1p/ZGrXm+kNGLfxZubo9VWfwSiXgORsqMSTDv/2AhStUaUDgkgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jl75Y6bE; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 32C651A348A;
	Thu, 30 Apr 2026 09:18:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9B706053C;
	Thu, 30 Apr 2026 09:18:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3A8E1072B84F;
	Thu, 30 Apr 2026 11:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777540726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kPzFTYl8s/0qzQL977XUmLm+EjuPVHwAvy6zvNV2190=;
	b=jl75Y6bEL+7XH1zwiNW+c6qdRlqqlGGwLUpQ85RtTJdu9EpHAcCly7th2dkRJqgvBNtrOi
	m2QfOXlLwq71dPBT0OgjxI68dJM3R2cB+iqkYi+0XspHjpHCoF+EBBUkZg5KaK9Ge507iz
	kqv6ZoGGXkW8Sf95ZaByPAT/w9zxdFH418OSOYfew2Xz2glDUB3n85brvXZfGs5i95VpeD
	3qzwbW2V/v/ub1Uw3wAAOmhwm9AQuiqFqc4ERnz9TZ2T+PdNiUahf2hsk6fdwzSWKMnhlC
	YsCVptaZkFgjdrCmR7033Fh8MbPK2PhMdRWJYtWVA5m52jQShDFOY9mIO9MHIA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
Message-Id: <177754070456.1321073.15208749896191583310.b4-ty@b4>
Date: Thu, 30 Apr 2026 11:18:24 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 4E38049FBFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14394-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com,chaosmail.tech,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_GT_50(0.00)[79];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]


On Thu, 23 Apr 2026 11:16:54 +0200, Luca Ceresoli wrote:
> This series simplifies using the bridge-connector by removing the need to
> attach the newly created connector to the encoder.
> 
> == Series description
> 
> Currently all users of the bridge-connector must call
> drm_connector_attach_encoder() immediately after a successful
> drm_bridge_connector_init().
> 
> [...]

Applied, thanks!

[01/41] drm/display: bridge-connector: attach the encoder to the created connector
        commit: dcad6dd16e87a6dcc78ab05f64c704cec2809db9
[02/41] drm: adp: remove now-redundant call to drm_connector_attach_encoder()
        commit: f96e621e90dfeb35676604b223f42f721e7c364f
[03/41] drm/bridge: adv7511: remove now-redundant call to drm_connector_attach_encoder()
        commit: 4f88126e09160fa5c226e786982d433aba0345c4
[04/41] drm/bridge: ite-it6263: remove now-redundant call to drm_connector_attach_encoder()
        commit: 7ecf62396ed7883eda3bb949df7f95e5a1048b17
[05/41] drm/bridge: ti-sn65dsi86: remove now-redundant call to drm_connector_attach_encoder()
        commit: 1977688f60eab4c92dca15c8b7e6b19635902ee0
[06/41] drm/imx/dcss: remove now-redundant call to drm_connector_attach_encoder()
        commit: 4b29d25b55fc28ab6065500a60693b093ad05366
[07/41] drm/imx: ldb: remove now-redundant call to drm_connector_attach_encoder()
        commit: dd7784328061fba1fba919d8879ed65ea30feeae
[08/41] drm/imx: parallel-display: remove now-redundant call to drm_connector_attach_encoder()
        commit: 5c18883f8050b1f6fdb35050cf9dad64779f6ee9
[09/41] drm/imx/lcdc: remove now-redundant call to drm_connector_attach_encoder()
        commit: b490bc69f1c11d8335dbd628d5e32db8986f848c
[10/41] drm/ingenic: remove now-redundant call to drm_connector_attach_encoder()
        commit: bc9e6392403e316c9d6e337b7cf28543051cb28e
[11/41] drm/kmb/dsi: remove now-redundant call to drm_connector_attach_encoder()
        commit: d731d87126d43936ab74804785446f67a2d60d0c
[12/41] drm/mediatek: mtk_dpi: remove now-redundant call to drm_connector_attach_encoder()
        commit: c21f9adc83c5edf0b990cd068283d3c831b43074
[13/41] drm/mediatek: mtk_dsi: remove now-redundant call to drm_connector_attach_encoder()
        commit: 41bfe06bb3cae68c0b3e21c5181c49f68db67e18
[14/41] drm/meson: encoder_cvbs: remove now-redundant call to drm_connector_attach_encoder()
        commit: 82da98ea371dff7a9ece58083846556b043bec9a
[15/41] drm/meson: encoder_hdmi: remove now-redundant call to drm_connector_attach_encoder()
        commit: 013adec1a93dcd052c6eb1769609eee661983ca9
[16/41] drm/msm/dp: remove now-redundant call to drm_connector_attach_encoder()
        commit: 6108b5b7219e3f3f947922f4faa8ccbc570210d2
[17/41] drm/msm/hdmi: remove now-redundant call to drm_connector_attach_encoder()
        commit: f7ed1d3dde56b98e065b950d1044a0f655b194ba
[18/41] drm/omapdrm: remove now-redundant call to drm_connector_attach_encoder()
        commit: 7b229305be6300c90e6f005784f9f53d4d23d579
[19/41] rm/rockchip: cdn-dp: remove now-redundant call to drm_connector_attach_encoder()
        commit: 86909f184b4f045f4d85dd2ca957811c1184aa1c
[20/41] drm/rockchip: rk3066_hdmi: remove now-redundant call to drm_connector_attach_encoder()
        commit: d5304653b60edb79bfb71209ebbd4b57001ab003
[21/41] drm/tegra: hdmi: remove now-redundant call to drm_connector_attach_encoder()
        commit: c0670fc1e75782a9dd0cd94acb7b262077b3f720
[22/41] drm/tegra: rgb: remove now-redundant call to drm_connector_attach_encoder()
        commit: 04ce2e375f6dde267f53995d81c48ab31dc06b52
[23/41] drm/tests: bridge: remove now-redundant call to drm_connector_attach_encoder()
        commit: 6d303956b41f870240a23d4896ec12e420026637
[24/41] drm: verisilicon: remove now-redundant call to drm_connector_attach_encoder()
        commit: 6d65baa60f0d7c305eb63b738163c1e35d0eef20
[25/41] drm/exynos: exynos_dp: remove now-redundant call to drm_connector_attach_encoder()
        commit: d627f7e6318906da2b95ac60616af7501d5145a5
[26/41] drm: rcar-du: encoder: remove now-redundant call to drm_connector_attach_encoder()
        commit: fa38bb8dc2e852e2979593b965779b8cca532014
[27/41] drm: renesas: rz-du: rzg2l_du_encoder: remove now-redundant call to drm_connector_attach_encoder()
        commit: 88bcd924cd85a29658a60418f6e60a0f912f990c
[28/41] drm/rockchip: analogix_dp: remove now-redundant call to drm_connector_attach_encoder()
        commit: b7e25e250ea405f1c65256494b56e0f6443cc96a
[29/41] drm/rockchip: dw_dp: remove now-redundant call to drm_connector_attach_encoder()
        commit: 8015bfccca36672e412dae4240886c71278c5b3c
[30/41] drm/rockchip: dw_hdmi_qp: remove now-redundant call to drm_connector_attach_encoder()
        commit: 14a25df41b19aba228e66c0d9578e6e6b3cc58f9
[31/41] drm/rockchip: inno-hdmi: remove now-redundant call to drm_connector_attach_encoder()
        commit: 6db094d4ce87fb4caf90db9863bb6a8b427b15c9
[32/41] drm/msm/mdp4: remove now-redundant call to drm_connector_attach_encoder()
        commit: 4e833e078f3d40d4f4a24c162210a1b7855f1539
[33/41] drm/msm/dsi: remove now-redundant call to drm_connector_attach_encoder()
        commit: f9274ba1dff8b0adff22e8d877ec1e85bb14d0c3
[34/41] drm/mxsfb/lcdif: remove now-redundant call to drm_connector_attach_encoder()
        commit: da3918b645a5efe6fad2aa53b84a4d98c3df999c
[35/41] drm/rockchip: lvds: remove now-redundant call to drm_connector_attach_encoder()
        commit: 24202edb689ead20411568251792a31103b9bde0
[35/41] drm/rockchip: lvds: remove now-redundant call to drm_connector_attach_encoder()
        commit: 24202edb689ead20411568251792a31103b9bde0
[37/41] drm/tilcdc: remove now-redundant call to drm_connector_attach_encoder()
        commit: 055673da01cdb130732ee556db58f7408392c1b8
[38/41] drm: zynqmp_kms: remove now-redundant call to drm_connector_attach_encoder()
        commit: 42ccccb38ca8bac394faeb30c924ad542f5f1bee
[39/41] drm/imx: remove now-redundant call to drm_connector_attach_encoder()
        commit: 2b727270b955b72cf6f47c5883bdc6f997f0e06f
[40/41] drm/rockchip: rgb: remove now-redundant call to drm_connector_attach_encoder()
        commit: d5d8e04dc0557437b19039206012305166df2bf7
[41/41] drm: renesas: shmobile: remove now-redundant call to drm_connector_attach_encoder()
        commit: 6533278b0deb14de860035dd1913e1e55e781e60

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


