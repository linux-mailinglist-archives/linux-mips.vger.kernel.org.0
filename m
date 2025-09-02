Return-Path: <linux-mips+bounces-10929-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D138EB3FAA8
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 11:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17AB816054A
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5D6261B9E;
	Tue,  2 Sep 2025 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o36wWaQO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF32B279DDD
	for <linux-mips@vger.kernel.org>; Tue,  2 Sep 2025 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805756; cv=none; b=hfBHXV/u20/lslvpud69HNx3HBlkkKtqaVQGAmDOc6KqTmPT7qJscOIiMcPiPvcmq2UHs4VP+VfoOO4lqH2nqB1e0o68xF7SjGX4cPLRScMcz89w2dGLVTv7y/Prg8N9HIBzASSR2qYGbV/f71YtC9TLvyU+9JnaNwjPmmkdXgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805756; c=relaxed/simple;
	bh=pFFDzLw9khlKoPyON9xzEz5vMmiuZ0/NFYcYMwpLosM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fm9zeqrChV23dCtrVwsN/O6p2RSZJGkDFj1BE1NmR87DnnzkDbzB2+VAZ6wFnMJcEtoTXmnVEUEyW6bdzp9pxCXzRjq8ukNq5p9t23d8CYHtoohgGDNpDGQZlULlqYphipj3aM6IynQG8tXZ3LEJVAX9J+I4BZPD4BHI+qPOhjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o36wWaQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3943BC4CEED;
	Tue,  2 Sep 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805755;
	bh=pFFDzLw9khlKoPyON9xzEz5vMmiuZ0/NFYcYMwpLosM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o36wWaQOVFpNngXPmEouSZo/nPEGS0Ehr6Yu1hRHmHT7YbPQwwcYJXgRO7jGuscNR
	 RF8nJAcEUZ7cWX5f5S3PMYea9Hq8hfV0xHth1sBaqImj4eYzIBS4WCpxPkbE5ahRwz
	 m3Gvo+HJh9H0ZpQrwq9dMURLlCWEblDKWdeDDXIkyJs4+OhSoyXw7IhUAJ1wxD3qMc
	 qrV+EqnbVgIeHpHuxU3J1QrcDZf1pD1csyJ2uT/vvd7XDZFZeP5L6/NWYKMeYWTqxM
	 2VeFmmzNjNapj98j6Y0SC/zSqsuXeW9R+5NgZOW/cMvSLX88fPFiBYRggQqPW3WR42
	 OgbcVy0vzRujw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:10 +0200
Subject: [PATCH v2 11/37] drm/ingenic: ipu: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-11-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pFFDzLw9khlKoPyON9xzEz5vMmiuZ0/NFYcYMwpLosM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgW0pf7X2dJ6ZL4Ur5DqsV0fDKZeKtp44sq6Lxumm
 IjWbEnZ3zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmYhjG2LBiK3+gV3R2z5Gu
 u0VZcstVRX6JCAgdmGLYH7Eu+WRE87pCP4ZrBebPs7QFNwruOvnqCmPDxCJzf5FnTnP/10Vfjos
 4lD2j+d3t2Jn60ovvaOwM2yRx7MXd5n/ZHq5bb04ST/jMK34HAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ingenic IPU atomic_set_property implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called during the state building process, before
atomic_check, and thus before the states are swapped. The existing state
thus points to the new state, and we can use
drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 26ebf424d63ec21ccee80221745c3e8bcc6b3d7f..2574a4b4d40a2c27cb212114117829d9f6ab3ddb 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -703,11 +703,11 @@ ingenic_ipu_plane_atomic_set_property(struct drm_plane *plane,
 
 	mode_changed = val != ipu->sharpness;
 	ipu->sharpness = val;
 
 	if (state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state->state, state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 
 		crtc_state->mode_changed |= mode_changed;
 	}

-- 
2.50.1


