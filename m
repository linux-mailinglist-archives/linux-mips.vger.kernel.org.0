Return-Path: <linux-mips+bounces-11147-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213DB4AC02
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 13:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEAEF1B21A8A
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1A531E101;
	Tue,  9 Sep 2025 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAE1pt1g"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743531CA4C
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417373; cv=none; b=BkQJRYflkJ3DxD34lAj9lFqVQv4diE/viHME+QVCPM4DnOXqN3/y3al4wCvojGAPhQmNyKpc+zBiX8/M+4kOL/qKHtWN9gHaHucK841+qsZUGwmVG55bzVPNVwEzw1iDlgmeiFFIcWF7zD95x4T/3LHAn1/+mJfq3DVfeSL/jaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417373; c=relaxed/simple;
	bh=p0B/MlBIdKYrV/r4flN/RYrMbAlHMQgMK7FqUr3yZnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8GOsZvJX/FB0w/8fReEjRAi9uwsC+axWQ/iLXy6Egrv2ymhpG99Na8LLSV2kF+PhPhw1nwnbqtbW0WvBg1wcx+FxAi8wzl6GiLO3pJYOFEzKU1IkFa26L6kSFZRHORMySncnB4E8ruAht/TlQy0eFQ27Sqx3SQ2dmc5awfG/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAE1pt1g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9226C4CEF7;
	Tue,  9 Sep 2025 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417373;
	bh=p0B/MlBIdKYrV/r4flN/RYrMbAlHMQgMK7FqUr3yZnk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SAE1pt1gXwL0zxAfsS6fyGe0Q3yOtGjmWZADFJIc9JeNGI0Y052ooiPSGrjrj064F
	 565fA4ASgRM1E/2rYc4UGI//6bMlvzzliBpwySLL3Fhz2u+byWQlzaI2sh+HK3mWH0
	 h6hPjjrawYSs2T+Rh8+pq81uc49Loqmufg1+KHOgmYHyFj8I7Cl67hCbKtvhq8g3o/
	 K0ATTNK8jtgbkKMr6Et9poe5cOpyGWI3I0wBcdHGmTDkJNXIJKG9d2d0xV7wOyRqhj
	 0lnKOOHAxqeHe8PmKpnRf2PYUSUd5YkP4BdmPLXe/+Yu5joGJELJAdqt/nVI+Zeji/
	 ggQuS8FInk1Nw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:56 +0200
Subject: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-37-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870; i=mripard@kernel.org;
 h=from:subject:message-id; bh=p0B/MlBIdKYrV/r4flN/RYrMbAlHMQgMK7FqUr3yZnk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+I1idyg8Pnz/qlbW7fUT79veqWD4Z7A35OdmubDIF
 VLM949adkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJPJ3C2HBs+kutpSl2E87K
 ZGelFsV2nDG9oLnp8pFNU1JN+2uD1ktekl+8bVN6xirDM1vnnr7cEcPYcHdbudGC7GuvUqwdWw3
 ms/IuWvJhBqvklcU2Nfacvs+kNtnPOvGqhf/IYkOJtuD3/gfXAQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ingenic CRTC atomic_enable() implementation will indirectly call
drm_atomic_get_private_obj_state() through ingenic_drm_get_priv_state().

drm_atomic_get_private_obj_state() will either return the new state for
the object in the global state if it exists, or will allocate a new one
and add it to the global state.

atomic_enable() however isn't allowed to modify the global state. So
what the implementation should use is the
drm_atomic_get_new_private_obj_state() helper to get the new state for
the CRTC, without performing an extra allocation.

The ingenic driver has a wrapper around that helper with
ingenic_drm_get_new_priv_state(), so let's use that instead.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 05faed933e5619c796f2a4fa1906e0eaa029ac68..a1b641d63fc500dc169d0b0e22f93168c343a242 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -245,11 +245,11 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 	struct ingenic_drm_private_state *priv_state;
 	unsigned int next_id;
 
-	priv_state = ingenic_drm_get_priv_state(priv, state);
+	priv_state = ingenic_drm_get_new_priv_state(priv, state);
 	if (WARN_ON(IS_ERR(priv_state)))
 		return;
 
 	/* Set addresses of our DMA descriptor chains */
 	next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;

-- 
2.50.1


