Return-Path: <linux-mips+bounces-11467-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEB8B8032A
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 16:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B990354381A
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 14:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2FF29A9F9;
	Wed, 17 Sep 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q44grB0+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB921CA00
	for <linux-mips@vger.kernel.org>; Wed, 17 Sep 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120402; cv=none; b=Q16P/4KL/NDwWIP9wyGI/9TH9RNH1bn88HXLHohswE5/7yL2DE0HYxRts6LF5z5a7P/XutIV5QkSNVjriWUaNp5/KLCoomFP9c0pmbpYIvXrqQbXIrS32Q5cxy6OuLuET8B4od4qrHmd6yo6Q5Z8BEBg0p9kQATgR5TAbxO0E44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120402; c=relaxed/simple;
	bh=45qXCq0r3ieNw6wBl7f4Vb0/4JcYiN+8JfsVh+VfjBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PA/cNMAlJwJjdwOMbXNVy5ZykgtZcGhW8ZZ+/Ts2hMjiKqJhLwPbWqebbNF7NLMO+8VEEM3R27hnxvI/iDDBmRoRYkk4YSXO6tdIzFwzY3b/B9m3dtMae9QmwOSohkNgTb6/Xvq5XMTb5Y5qxSj9L1JHJQEcamwyFL+4L22EcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q44grB0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3346EC4CEE7;
	Wed, 17 Sep 2025 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120402;
	bh=45qXCq0r3ieNw6wBl7f4Vb0/4JcYiN+8JfsVh+VfjBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q44grB0+qndlsbjP28XDbQfPLoNaHAgLE/grF0xCKTzEhVeAE9JIk2gX5Byexkaay
	 3oHz2f+45Xf1oDydoFK3zOSO3HMpPxioX6Ig/QDCfKq2cN7MBNEZFOiU6AkgquNjDe
	 EvhUE57ib9aN6sUNOhW8a21QyD7H//V1nF4NhtTHDiBUqBxftwqdBqLtKU48te8vLB
	 UkwNVTzYMzEYaFQxGeRJp6d0mp0QE80z+M3ft7mTJPdiEHmduu+QQjq0i/uKNoMkUu
	 2L85yMkC3zoVYgG65bYDwlU2MELUGL4KeR4hz4kOCUc5yuRflxnVLwLDjhZN0T+suM
	 rawvn2qo3zhWw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:52 +0200
Subject: [PATCH v4 11/39] drm/ingenic: ipu: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-11-5d4b9889c3c8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=mripard@kernel.org;
 h=from:subject:message-id; bh=45qXCq0r3ieNw6wBl7f4Vb0/4JcYiN+8JfsVh+VfjBQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi6Rv/VX58lOexseG53z35Oefvye92b1hei8tAVu5
 1KipjHodkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJhC5lrK8MCDzUdSGnKLw3
 4JnpIz7jj9vDNOsjbnx87nzXyeza2r1uW9uCmnMf8WrHly0yMZP3YKyvKLx9YN+nb9d0vltccy5
 nzLW2aivO5tqx6O7lQJMbAU4HnuucKq9escd5+/E3WRWLpa4CAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ingenic IPU atomic_set_property implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called during the state building process, before
atomic_check, and thus before the states are swapped. The existing state
thus points to the new state, and we can use
drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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


