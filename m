Return-Path: <linux-mips+bounces-11468-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B483B80356
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 16:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36F6E583D79
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 14:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A4732E72C;
	Wed, 17 Sep 2025 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOVtr9Gg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6864A32E72F
	for <linux-mips@vger.kernel.org>; Wed, 17 Sep 2025 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120427; cv=none; b=C1uwAdQtsRalXT1Qflu2GXMkE5QOsLyeUu6i4UVXK3kSdiP5YGQWciw8mUxRhkR2vpnwc6SiGQ9Xz9zf3GzJ8ppMr3DC/h0Z0A/SWXzpfOCpQ8/EIPGK2akY2L9J9m88jb2N7wcqI1//RT4AcyN6ByD9lDjPq1ZlLlSCYtDAKwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120427; c=relaxed/simple;
	bh=ot7wT/ic2tdSFcXA434UDIu4Noj3OkvyirG084ZgvSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mxpqo1PMzA1ww17gDa+NqPmz+YRRNM6RuVTWcfnUKmPh+bzqENUhpLrdL9sxF2LMNTElZL11jOmAWCg/KUEWNAwhq9VnUgW5V6p1dC+YkZ5htl/ubc66ozITx9fhKu7iR/HIx7kmDeFzWPGhYQ1ZbwHe5WeKWzbqz2Avo/oBndE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOVtr9Gg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2E8C4CEFB;
	Wed, 17 Sep 2025 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120427;
	bh=ot7wT/ic2tdSFcXA434UDIu4Noj3OkvyirG084ZgvSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cOVtr9GgMeJ0VwARdJljAVu+bE1JXowC7get+G2aWqkXrBHFhNw5iP8Rfwx2R6mVs
	 G27DWMfxqS4DiAg0b/C83ZDrz5pM1Fe/Rba5QrAgblSkVJZS/ayTkkijvwwWp8xtte
	 Xpbuyi5rbiTWN3h/nio7Dn2uqY4w+5UF3CAPtfJOVweVisr+ZRC51c6zBhs2bddLxP
	 Jb4al9N6rVVIAvL7vbGqOqLRpfPrw5tHNCJiHpca7Z1bEVoIYFKcCy+0c9aGGzb8tg
	 qKcx0qv8y7co0zc9znKWNBsAN/JdZAhPqmlGvKmSzjLhxgRAtTu4uTnwOvZ+OjzOe0
	 2OLZlrk2GOgNA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:01 +0200
Subject: [PATCH v4 20/39] drm/ingenic: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-20-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq5o53vUPP/Cwx8MNf0cLdmvXNv/7v+jv/6D7CROj
 yOcEZOEO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBENtxgrOEIlltbMGl3HmOS
 zJlqp9ki17+L2K+/Wti76vzcvmzO33MZL/PrrPrdN2VWZU7RsctVBoz1gWvDjC4KeD8rC1Sd7Mx
 wplCmJXuDhfKSQKMl5n1H+j/tesS79Z3Bl2UZKZqF4dFFgakA
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


