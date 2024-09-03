Return-Path: <linux-mips+bounces-5289-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB1969138
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 04:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61E828416F
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 02:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF531CCEDB;
	Tue,  3 Sep 2024 02:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkiTnWhy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018C1CCEED
	for <linux-mips@vger.kernel.org>; Tue,  3 Sep 2024 02:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725328929; cv=none; b=HkhMrlb72tf/W/JBOOfIxiDk609fQ7TOL6/NcMKRIxf1syF1oNNOp6vrlIIrneJs8GBZarAhnL9tFiTT7yrM7Ajy9C0igXFNi7NkbCwHJxk5k8BpwedVeSFML1YPgRi+Ce4KWVa/Std2JMOkMzQSEWg9fojKk2qwm2onG2vluFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725328929; c=relaxed/simple;
	bh=eQJ3hRch4PVpnxcgcIs2vVrHHBN8kCt55Lg1+zlGYoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8J+psBh+UvdbLNjfyOsPJLQMXY4dKPiDxZCZlE/3ZA/3h+K5OLPI5sND0wXs7yfux/PvyXtOqoesnGXKqAPxaIyDFFFe9bE4iK7BdAdCbRhQGT6jpWI+npTwHSiVFz+/6m6bm/P/qax+fZIgt5RVUn2LFzHW05UmJUcoI98ByE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kkiTnWhy; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f409c87b07so59857291fa.0
        for <linux-mips@vger.kernel.org>; Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725328924; x=1725933724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=;
        b=kkiTnWhyyovozvthJ+ls1k4xoxt07D+1jnWsPQb+su+SAAOYKCsHRdYs0K7HqeJa/s
         5RxXuF1mLm2WtkXdy0lgp0wYaDFzXYOxBSAFoB2rMp+wuMPBl7UzwnWbEcd7LqOjj/iL
         vsMGjZxgndbsjCxudIqfSlm2yhlrJAWdqaSvEiqDPlDNK/4lU2VJxBjXDnz27ViUXg1x
         b/vUuRvhY6aaU5cpnvH31ltFolqU1d3vn1HhIz2erRkX1iii7NULskVr8+zGiwSGfCV+
         L8elsxCxpopPZYm7cDZikAVHNI4GDoKTWFZN8rfgFJrl/61veVce0RIafgmlVAuO9NfK
         /uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725328924; x=1725933724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=;
        b=xMCek/Ni4pG8/zTnsv93Dzk5Ohdy8cAJbaVd/1dOjlePd7s3JW6OZ/8IWPF6MeUHZp
         OHvriSX6GTL0drl3WLkfL47yTizYFtC/LXBROvhCGaDJwkHxWMatPHPdKZTFG3Dfim2K
         dakSSKKzUW7IetXOWxsLZObA6eiAjA7LKK3c8p+YsramVky+m1+Z/8Gja9NQ/fK1RybD
         ESpw2HcmcJWjqkrv3BTjG3bl1W8m6rXZ9yLz9BqvsTyoTozJowemMbL9ZrC83HjoF9p5
         SNEDtNOhSngkiBGLGgaTByF1Yzu7mcBKqh3w/yPZytlnKpNMGyYBgvh6+8832V50KLs2
         663g==
X-Forwarded-Encrypted: i=1; AJvYcCUsryYCu7XdyWWxx68N0c1QBieLwMTfv6C9kSzQvwmMgKcgdqcsQ4TuYNPgu+sVSSqSo666Vaa7H9Et@vger.kernel.org
X-Gm-Message-State: AOJu0Yyky/HbQH0S9fS23QREEUCIcKJ77SE1hvDifSeo8BzfttWk96aL
	iRzCwWnEcTmcfW/dzc2omCvEQaQgxBKl56/LgDfymi8cvIV5J4ZRAvURbzuFdNU=
X-Google-Smtp-Source: AGHT+IFmUC62ts4TlsiKbmKtX0hZZ8aQftMcsTMwsK5R1sswn3munGEWxmkaVy5WBPmPGx4nrbeQOQ==
X-Received: by 2002:a2e:6111:0:b0:2ec:3d74:88ca with SMTP id 38308e7fff4ca-2f626585672mr58938981fa.25.1725328923605;
        Mon, 02 Sep 2024 19:02:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm20827761fa.8.2024.09.02.19.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 19:02:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 05:01:56 +0300
Subject: [PATCH v5 1/3] drm/display: stop depending on DRM_DISPLAY_HELPER
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-1-daebde6d9857@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eQJ3hRch4PVpnxcgcIs2vVrHHBN8kCt55Lg1+zlGYoo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1m4Ydfw19JUYRwn1jTaddmh8cQLUA2XqNCKhP
 lN9A0ASCZWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtZuGAAKCRCLPIo+Aiko
 1WImB/48EDSxmra6JSSLZCioPN1jQgA037hCAO6vQjo/qRj7VRQGLSHJ+bxa6Z3+La9aIP6xrz7
 ruMK94QpzIyTF6dMy30OaTgS6ZX96eBlR6vKDwhaeiJevCDRZnVTejmWXXh4gizEIp0AsbN6a6t
 52BW8FdsYKtqO5NMYODz1yXrCckyJ22+M8hi6JUndhd04OylNhmOd1H/E2afMOvE/VXfnnlLPab
 aCGDA9Jq4qxZHernrwhzxi2K0ppV1dmg8mTTK7KHrv5zpjjtNeVzbr+alSFN51EgWxV43rg+Ugq
 9krzcgaLUA7XPlXqn86PPRCYCxMtmeDaupqUIYvNX98r2CAb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Kconfig symbols should not declare dependency on DRM_DISPLAY_HELPER.
Move all parts of DRM_DISPLAY_HELPER to an if DRM_DISPLAY_HELPER block.

It is not possible to make those symbols select DRM_DISPLAY_HELPER
because of the link issues when a part of the helper is selected to be
built-in, while other part is selected to be as module. In such a case
the modular part doesn't get built at all, leading to undefined symbols.

The only viable alternative is to split drm_display_helper.ko into
several small modules, each of them having their own dependencies.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index a2e42014ffe0..9c2da1e48b75 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,19 +1,20 @@
 # SPDX-License-Identifier: MIT
 
+config DRM_DISPLAY_DP_AUX_BUS
+	tristate
+	depends on DRM
+	depends on OF || COMPILE_TEST
+
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
 	help
 	  DRM helpers for display adapters.
 
-config DRM_DISPLAY_DP_AUX_BUS
-	tristate
-	depends on DRM
-	depends on OF || COMPILE_TEST
+if DRM_DISPLAY_HELPER
 
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
@@ -25,7 +26,6 @@ config DRM_DISPLAY_DP_AUX_CEC
 
 config DRM_DISPLAY_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
-	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
@@ -34,7 +34,6 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 
 config DRM_DISPLAY_DP_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
@@ -61,25 +60,23 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 
 config DRM_DISPLAY_DSC_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
 
 config DRM_DISPLAY_HDCP_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDCP.
 
 config DRM_DISPLAY_HDMI_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
+
+endif # DRM_DISPLAY_HELPER

-- 
2.39.2


