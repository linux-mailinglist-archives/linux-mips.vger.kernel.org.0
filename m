Return-Path: <linux-mips+bounces-11146-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D7B4ABE6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 13:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B017F342419
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C89C3203BE;
	Tue,  9 Sep 2025 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooqBnkbg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E0731E117
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417326; cv=none; b=VH9ka2Y/gfNepIipHLdGdxYi5K480/p6aNIwPvM5SGLBUVhjuSekPjaO3VWZpM3J4qphCMm/qHk2XOEMKIUNKE5JGtxcEtREemnA6un1y/H65uFmbQNnHSoV39wU6pYCqOB7HgZY642FJHHAFZvqLJ4cnlYP4mkZz0V0NUo7Ado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417326; c=relaxed/simple;
	bh=ot7wT/ic2tdSFcXA434UDIu4Noj3OkvyirG084ZgvSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q/72xIdCW+kexKH1eluxhDEs7BgR6neGuY7IffDDCZSh0U/5oorkih7Xya23kyJkhV0c7ekavap8Q0B7aW9RjBQu7jPzB4gRDa1oK2FrWBVTurdZbsJJO99za1C26TOtjkvXOgKsv2R5wnDTTeBN1lYIhmLVP/xKptvMztpEsIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooqBnkbg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9859C4CEF5;
	Tue,  9 Sep 2025 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417326;
	bh=ot7wT/ic2tdSFcXA434UDIu4Noj3OkvyirG084ZgvSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ooqBnkbgc/zoogElmukqygNEbkOECUXr5tT2DQVncGINWuDpht/Pye3G6r4VBULNn
	 Zy0eim5HovrCjUUuRVcAZB4WsfJbU0kyWJexR9glXBv+EE4WIua2Wc+Q3gRtBvgAhm
	 f4QIREywcZ5GMGiH+kHt4GQKGeypPpF3Svd2i6eXg0KjRmpxXb2PYphfhLawA7d+js
	 bb5YRunT79MDR7GwzlQUriOGa+Dn9PSsEEC7l8XgLBomj13qQfwDJdK78KM2pcw9iD
	 IbQOucxfJZCf6WoXpqHS5t8lnEvF5bXEIbeySP30jXqqahyf92T4mWUE4kV2YIO8Nc
	 O0P4cEgcelIfA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:39 +0200
Subject: [PATCH v3 20/39] drm/ingenic: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-20-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2250; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ot7wT/ic2tdSFcXA434UDIu4Noj3OkvyirG084ZgvSg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+LUZHrherU0xLHmkd9XRZvO5kmPm5/Kmzvh7tDOz/
 /BRxo23O6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmcCGcHEKwET2cDHWys+SXp/zoUXzysmA
 d+Z3ZWpflZ25rpl+6Bmj8O+1jysvR+9qf+2xm2cxK9P1y6afvyfYMdYpLW1YVzi1Yv20U39fHHU
 Wz9bcLvVE1TT72KFDLgb/JUtSLh/4OffY572uc861Tm6N0ZcBAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ingenic atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +--
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 9db1ceaed5188a4ef0897280dc72108eb3815b5f..05faed933e5619c796f2a4fa1906e0eaa029ac68 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -469,12 +469,11 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	if (priv->soc_info->plane_f0_not_working && plane == &priv->f0)
 		return -EINVAL;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	priv_state = ingenic_drm_get_priv_state(priv, state);
 	if (IS_ERR(priv_state))
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 2574a4b4d40a2c27cb212114117829d9f6ab3ddb..32638a713241abbd4eaed09f0aaec2b790650cc9 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -578,11 +578,11 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	struct ingenic_ipu_private_state *ipu_state;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ipu_state = ingenic_ipu_get_priv_state(ipu, state);
 	if (IS_ERR(ipu_state))

-- 
2.50.1


