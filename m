Return-Path: <linux-mips+bounces-11626-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6773BBDF2C
	for <lists+linux-mips@lfdr.de>; Mon, 06 Oct 2025 14:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F24B1897E88
	for <lists+linux-mips@lfdr.de>; Mon,  6 Oct 2025 12:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8C427874F;
	Mon,  6 Oct 2025 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrCExbDG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EDD10FD;
	Mon,  6 Oct 2025 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759752168; cv=none; b=QlERonl441m9+rSOEYkJpR8r8aVoTgqhyj49v6ry3HH5nM0LFb2QkvsWWDlX18Cco+DsWOdCpbQ0H5y9YGQEh5qOhwe59D0QGwLYRAd0gfJn5fl8Fxg9fzfZtoV1M3CNcxMaDQ3So5uGMua4M6oT2qWY/LbkuHCRGOGXoeCLe0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759752168; c=relaxed/simple;
	bh=cUe8CtrafWoQsXn9fWcPDQv7fF4kzWcQD9k5yUC/Uwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LKJz7zaQiJkV6OrMvdjmY6zhERdhkahIu/nFBq+RjAIwjMW+Yz/7Y9WEkT++5yuzGIv1l5HiDyD6Zd9aX3nNe/37XI0W6jgQNIi4o8ybwhvRhlNxxC+hsUWBo7oRItT/RHK3TVl8bvfLLlVy4NvgUAffS53R1S3tazxvb6FWRmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrCExbDG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB346C4CEF5;
	Mon,  6 Oct 2025 12:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759752167;
	bh=cUe8CtrafWoQsXn9fWcPDQv7fF4kzWcQD9k5yUC/Uwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XrCExbDGUw0LYXohARq0wj5ixhBkiguFlV69LWhd/t5NkqihItIxVGgkJYVYebHeS
	 bbGyaUuLZY+rwJSwZdtdSVGYP6I24TmlPhVDqN3Wu92pv+ho39wr+IsgKQ4bTbIXIF
	 /rxkzb2rUvpt4jA4wBfhlKXw9LrjD5ZY3pm0GvalCYvKo8YZv0RDduhtmOOi5uTZcr
	 5QGgim6xn/vbzvVz0I6jiD9IgFzb0QM0DR+KeRrjaciAgfDTBhDRWzcUBYkJdaez7v
	 oj403k6Xyt+lqNwWRmPTY+GWjQCnvIg51e+wjQY/qGWc5qLIda+gQeEaowTaVrk0Rs
	 AiZqBRuYNrzoQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Edmund Dea <edmund.j.dea@intel.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Sui Jingfeng <suijingfeng@loongson.cn>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: Re: [PATCH v5 00/39] drm/atomic: Get rid of existing states (not really)
Date: Mon,  6 Oct 2025 14:02:42 +0200
Message-ID: <175975215493.792368.2468724280200785252.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 30 Sep 2025 12:59:15 +0200, Maxime Ripard wrote:
> Here's a series to get rid of the drm_atomic_helper_get_existing_*_state
> accessors.
> 
> The initial intent was to remove the __drm_*_state->state pointer to
> only rely on old and new states, but we still need it now to know which
> of the two we need to free: if a state has not been committed (either
> dropped or checked only), then we need to free the new one, if it has
> been committed we need to free the old state.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

