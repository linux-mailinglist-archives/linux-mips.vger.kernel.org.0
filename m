Return-Path: <linux-mips+bounces-11586-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B2BAC988
	for <lists+linux-mips@lfdr.de>; Tue, 30 Sep 2025 13:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7901C2F0D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Sep 2025 11:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FAC34BA29;
	Tue, 30 Sep 2025 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IppY4rsg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516A17736
	for <linux-mips@vger.kernel.org>; Tue, 30 Sep 2025 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759230037; cv=none; b=pOPu3Qx5fcebaEjy05NWHir6y0S31h+Eo0bwU8LLC9THHJtzmJM9zwqmZ40XYojZJ+6RaZGWLTt087i/ucBpzR8cbhcqME3i9vRhPQCrhj56r132gaS+cd7rOHzaOd+KurhRqNlv+euVaipUR5eAsWGx1x4LxqMUy732tMSdGX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759230037; c=relaxed/simple;
	bh=jfdzVknbt27HxmQJhWYW7cewyNObAJ41QtcPYohZBOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EC/FErKf6NRkl07h+DHIpuyEVxmHfiybkA++HuZLORx0cc8UiR/L+sIUNICIDZ71yUCqWmnwmwpq5OivtSKEc7bDbqVK+JPkLapigyhF+jFekHKkXerLVoeyQD4GLjbWPUyIrHCxeIIL07tMQFJjEbeRNy4tbLUnK2NR5r1N4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IppY4rsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6F2C113D0;
	Tue, 30 Sep 2025 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230036;
	bh=jfdzVknbt27HxmQJhWYW7cewyNObAJ41QtcPYohZBOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IppY4rsgoMLE8DHtmN9Lr3WnprKa/0ux7mU6USAPJIaLiJChZOjUCUODnLVvtWJ48
	 s6gyqmexQ/OON27DNVIaBjhVjI86QIgw/8J03oFNw8r7ZY2V/g0bPlk3rZgqRsE6tn
	 BOxSBiZZV1rQD2STUeRq+P2Ua9ey0233bP1XUgPg4SxuvArMANViVhxP/Rq/ovU0jV
	 t6J5nPXOt2aZAjpTOggJl+I/DcGypFzxVSejG8oXKIaEcAfb22AyE1Iu7wiScfj5kP
	 b3OsUR/U785SUMJiPpj4KtwbidiEQyqRzgbMUGxwYK/ZF2E53/ru/DKAZEuoHKy47E
	 0H6Zvm6bRLLHw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:26 +0200
Subject: [PATCH v5 11/39] drm/ingenic: ipu: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-11-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jfdzVknbt27HxmQJhWYW7cewyNObAJ41QtcPYohZBOw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6jstlnYwHl5NX+OxMtdv762dvY17hddptfBX5Nw2
 d3jS+C3jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRFfsZGxZa82b1xlY3aDBO
 cSw/pB6g2VARVjWFcc9hK9FXBfurLOdduTGx6uqBfLYEkRI3SaVDjA0Pv3RVXvu9JKK5IGpx2l5
 JS5fbFRa3YlQuzOlgnSD1vyxud830433ehx++Wz1l4tPF6SsA
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
2.51.0


