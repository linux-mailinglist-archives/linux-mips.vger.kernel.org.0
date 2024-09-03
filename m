Return-Path: <linux-mips+bounces-5291-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2420969140
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 04:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E09E28334E
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 02:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C71A1CDA34;
	Tue,  3 Sep 2024 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szoMx1LH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF971CDA07
	for <linux-mips@vger.kernel.org>; Tue,  3 Sep 2024 02:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725328930; cv=none; b=fFw7f+TvpuXJYu0JN3mJSuOj2ajKsTZhoSk8ZDmSFgqFrd8Zwm++nCUnnpHFR9Jifa+Ut8PH0quy8LkstCKLwJ8hz5Jdgoi4uTFxxJn7h1Xommc8TpUIiz0889zbZtJcjwXIl3Kc7oRyQW/nZSUoFnyWjPIUFEg5RJYMOSFFe3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725328930; c=relaxed/simple;
	bh=/mT5/AR35rbIDoBCMIT6yhd22qoLCIO/78RuGNtcQT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FibweRZ4fucW1EqPOrDaZXcHU+GeflbKNRGijgGQqr2c4qem8wswuGF0mWlm1m14P46krdrClR7rHOwGrxWy6W9FjFsDNOWKLLCmny+/IHlrVwMk1TFrnWCfPmi+c4vzt4+EiRHaid+ZCOB8/a+kB/tUT7i1FkZ4Jswrc9lW4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=szoMx1LH; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3f68dd44bso50275501fa.3
        for <linux-mips@vger.kernel.org>; Mon, 02 Sep 2024 19:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725328926; x=1725933726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpzQw9LNt+SDHOumdIx/cD2vW3Vk+Ggm6Q+ZCEu5Pho=;
        b=szoMx1LHLOnJMHiNKKO4bSXUapO228cENPw+MzZ7dgIvuB8jrbwGj9aYB3dVzMHvpy
         9ZdETkizgpHtrFAvyIsA7xfkoewugPJcxYhrcxkxNsYyYkk+Ue94Bg42wH5/Oj03/n22
         LbWtmyNx4cKKFrC83OuXCETxfEPZ2PMK95Shim0FX/2TKWYC1H9pdXkXVNpDK4a64Qmw
         ubILjh2yVqh3NUFPbJSXR84zw1WhYlxr0iKGyGRmQJDCfYrFA7R9Hf1wM8+gFVioInIK
         BDfdJ0r3lwpjd43pI9IhXK91E3fKC3TPiaQMRQWc9u1qx8W1XG7thQm7xHnpiJg2aYAT
         9qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725328926; x=1725933726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpzQw9LNt+SDHOumdIx/cD2vW3Vk+Ggm6Q+ZCEu5Pho=;
        b=wqdtKpzbU2rPSffaEJ8Qhz4waMy394pMutsX713xdZ2zMvPepqqy7OuJt2aAzjafZ7
         /LfpskMzyEciqzaq+vMJXiwEuxoMVcVmwB0VNLhAnKhamt2EwHbzRUKHILe7VS7i7rKE
         X+q+DpZUIaROV/KXQ/Qzj6GPrphNMeqlGAfnwAmtv5muT4KvA4PtNMTTGyJq1D2ykC4K
         X7bGdSpVSYEzGPL9h6YmmMfo6EWUAEdITSQy4AOuBMj6ez1wLHB1NPuxvAFJKc2Cq4cF
         JfHoFMMJ0eWGhaZAkVq44P5FQ45krJeyvMi1EIvJSkphbaegOckheaBduylgclWOY1NB
         maQA==
X-Forwarded-Encrypted: i=1; AJvYcCXbc1imgeHCunnDq05cub/st581E4eS4Zw6vRSyJbwpU3/MPF4fGctPRqRBEDZyGVK/rN5okMr0hD9o@vger.kernel.org
X-Gm-Message-State: AOJu0YzNIcgYJk+iUHcMBRTZo2jbdBfCa7ID3cu3mjlkmr+SRLSWDyyJ
	lcreGfHNnSCNdUGNsyA4g9pdA4bmXE4XfJFW3SOxd8lxVK5/7lFag/I8mS/El0Y=
X-Google-Smtp-Source: AGHT+IF8v8eYKKb2eQMr0Hsc2qs48UsPP7HLkrE86Dm+WJr2IzV/yR9tjZDK7rnfHNsBM4q2M+EhlA==
X-Received: by 2002:a05:651c:19a9:b0:2ef:296d:1dda with SMTP id 38308e7fff4ca-2f61e025871mr77730561fa.1.1725328925919;
        Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm20827761fa.8.2024.09.02.19.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 05:01:58 +0300
Subject: [PATCH v5 3/3] drm/bridge-connector: reset the HDMI connector
 state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-3-daebde6d9857@linaro.org>
References: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
In-Reply-To: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/mT5/AR35rbIDoBCMIT6yhd22qoLCIO/78RuGNtcQT0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q1PMnqI1KVspetFZi3Gl8JEpLtUs6+nOiyV+WlRKv/7
 tQfLsWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIbif7PxXBmk0v/1w+d0WT
 71S6XpXL7jLtn4avhQsSLjYWFpWlNFyaLt3N/iGnatKcwkMCu7O/rjFqCDz8KJc5ufCiQ8KledW
 /uRseHIiy8MxMVvnEyeb7WHv1FZfUhPk9i/cUHg/6HX76mM8Wtf6ERceePG1tVaz5/H9DQNLcGZ
 y6Llcc8p0+KzalN0T9jE0QmaB78cCR07q69f850w4GJ+7JZ4t78CCmYvZnNaPsssesT1P7DzTWz
 mNsNlHTrT7mds9yCbu/axEfR516y5TjmctOSC///F7oMUO36NtU1kIT+YKzleddOzbMTjo2R/KQ
 K/f8d0nnXwQH3rwSL3mk4NsGjQcrfrHr8a45VH/B/RMXAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
IGT chokes on the max_bpc property in several kms_properties tests due
to the drm_bridge_connector failing to reset HDMI-related
properties.

Call __drm_atomic_helper_connector_hdmi_reset() if the
drm_bridge_connector has bridge_hdmi.

It is impossible to call this function from HDMI bridges, none of the
bridge callbacks correspond to the drm_connector_funcs::reset().

Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8c174ceb0c4d..3763649ba251 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -15,6 +15,7 @@ if DRM_DISPLAY_HELPER
 
 config DRM_BRIDGE_CONNECTOR
 	bool
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a4fbf1eb7ac5..3da5b8bf8259 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -216,8 +216,19 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 	}
 }
 
+static void drm_bridge_connector_reset(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	if (bridge_connector->bridge_hdmi)
+		__drm_atomic_helper_connector_hdmi_reset(connector,
+							 connector->state);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.2


