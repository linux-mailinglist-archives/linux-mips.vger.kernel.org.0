Return-Path: <linux-mips+bounces-14832-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNVTN3QzG2rIAAkAu9opvQ
	(envelope-from <linux-mips+bounces-14832-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 20:59:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA92612E73
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 20:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84A06301602A
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 18:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D912343BE;
	Sat, 30 May 2026 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nMa6IlcJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmoCkl1w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nMa6IlcJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmoCkl1w"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7562566E9
	for <linux-mips@vger.kernel.org>; Sat, 30 May 2026 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780167458; cv=none; b=iWY/Pa3bOxvnw6IWwVNN5bgxLw/NX4k5bjFW3aWjmKpS+CEsfiBdKcCPfdUPpNOvLnao3wXYlS3GdGQzdC8rV2WUrw3NAMNK8oiU/ODbWx+3L1MsT9kB/0X5C6iBIw6G569ePij94aKlJGlPlhmIhnhyk3uzR45kd1VIHOMv7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780167458; c=relaxed/simple;
	bh=zvi2KB+XDARb4T5x5JfOaZBXE/r7Rgbqkw/PGjalFw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZC6/m72JwIe3wKIjrJefj8ZmowxBmP1NTFNsbrDGncnwx3MPPlA45NC0ijjCVJMr/D68VNskqm9wHQomtt/nwPl677JvB3E2SvKDpBnlQytjhmXahRIeXIsAyG02I9v7ChNN8lenYJgNaKKggqa35cbI9p/wmdoDc4hH3UH7/Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nMa6IlcJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NmoCkl1w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nMa6IlcJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NmoCkl1w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 959AC67ACF;
	Sat, 30 May 2026 18:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780167440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZK4PeHzxMPcNTtzELk8j471w6oU0jQbguxLq0F0e1Y=;
	b=nMa6IlcJtGrAmcifZDOOS0esuVTaZeS0G+z59ZJ7x0i4ocL07oLLhGiKrFqOIYAtJ9DRX3
	QIauFUw9W1Ey++ZGG0RQqdJ1Vfi92DJtyqG7Cg+ESLFkHLLLTDJNL4MKrNQiHDRkaRuFwq
	Iyc7nSMyUR1pgnLCwu1hd/r7G9sER2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780167440;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZK4PeHzxMPcNTtzELk8j471w6oU0jQbguxLq0F0e1Y=;
	b=NmoCkl1wt2g3X9HMT3rU064rN2FFjIDEDpA3JmKxp4NYghgMJ3Dma2JPMaJSt1Y7tGzCVq
	QmT8PyWLep+o8WCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780167440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZK4PeHzxMPcNTtzELk8j471w6oU0jQbguxLq0F0e1Y=;
	b=nMa6IlcJtGrAmcifZDOOS0esuVTaZeS0G+z59ZJ7x0i4ocL07oLLhGiKrFqOIYAtJ9DRX3
	QIauFUw9W1Ey++ZGG0RQqdJ1Vfi92DJtyqG7Cg+ESLFkHLLLTDJNL4MKrNQiHDRkaRuFwq
	Iyc7nSMyUR1pgnLCwu1hd/r7G9sER2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780167440;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZK4PeHzxMPcNTtzELk8j471w6oU0jQbguxLq0F0e1Y=;
	b=NmoCkl1wt2g3X9HMT3rU064rN2FFjIDEDpA3JmKxp4NYghgMJ3Dma2JPMaJSt1Y7tGzCVq
	QmT8PyWLep+o8WCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A519779A7;
	Sat, 30 May 2026 18:57:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UNxGBRAzG2rXUwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Sat, 30 May 2026 18:57:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	airlied@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	admin@kodeit.net,
	gargaditya08@proton.me,
	paul@crapouillou.net,
	jani.nikula@linux.intel.com,
	mhklinux@outlook.com,
	zack.rusin@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 04/10] drm/appletbdrm: Allocate request/response buffers in begin_fb_access
Date: Sat, 30 May 2026 20:53:17 +0200
Message-ID: <20260530185716.65688-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530185716.65688-1-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.79
X-Spam-Level: 
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-14832-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,redhat.com,gmail.com,ffwll.ch,kodeit.net,proton.me,crapouillou.net,outlook.com,broadcom.com];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,proton.me:email,suse.de:email,suse.de:mid,suse.de:dkim,broadcom.com:email]
X-Rspamd-Queue-Id: BEA92612E73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In atomic_check, damage handling is not fully evaluated. Another
atomic_check helper could trigger a full modeset and thus invalidate
damage clips.

Allocation of the request/response buffers in appletbdrm depends on
correct damage information. Otherwise it might allocate incorrectly
sized buffers. Allocate the buffers in the driver's begin_fb_access
helper. It runs early during the commit when damage clipping has been
fully evaluated.

v2:
- allocate before drm_gem_begin_shadow_fb_access() to avoid leak on error

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Aditya Garg <gargaditya08@proton.me>
Acked-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/tiny/appletbdrm.c | 53 +++++++++++++++++--------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index cdd35af49892..b683dcb35b0b 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -315,33 +315,16 @@ static const u32 appletbdrm_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888, /* emulated */
 };
 
-static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						   struct drm_atomic_commit *state)
+static int appletbdrm_primary_plane_helper_begin_fb_access(struct drm_plane *plane,
+							   struct drm_plane_state *new_plane_state)
 {
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_crtc *new_crtc = new_plane_state->crtc;
-	struct drm_crtc_state *new_crtc_state = NULL;
 	struct appletbdrm_plane_state *appletbdrm_state = to_appletbdrm_plane_state(new_plane_state);
+	size_t frames_size = 0;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
-	size_t frames_size = 0;
 	size_t request_size;
-	int ret;
-
-	if (new_crtc)
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
 
-	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	if (ret)
-		return ret;
-	else if (!new_plane_state->visible)
-		return 0;
-
-	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, new_plane_state);
+	drm_atomic_helper_damage_iter_init(&iter, NULL, new_plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		frames_size += struct_size((struct appletbdrm_frame *)0, buf, rect_size(&damage));
 	}
@@ -366,6 +349,29 @@ static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	appletbdrm_state->request_size = request_size;
 	appletbdrm_state->frames_size = frames_size;
 
+	return drm_gem_begin_shadow_fb_access(plane, new_plane_state);
+}
+
+static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
+							struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+	int ret;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
+
 	return 0;
 }
 
@@ -468,7 +474,7 @@ static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
 }
 
 static void appletbdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
-						     struct drm_atomic_commit *old_state)
+							  struct drm_atomic_commit *old_state)
 {
 	struct appletbdrm_device *adev = drm_to_adev(plane->dev);
 	struct drm_device *drm = plane->dev;
@@ -552,7 +558,8 @@ static void appletbdrm_primary_plane_destroy_state(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.begin_fb_access = appletbdrm_primary_plane_helper_begin_fb_access,
+	.end_fb_access = drm_gem_end_shadow_fb_access,
 	.atomic_check = appletbdrm_primary_plane_helper_atomic_check,
 	.atomic_update = appletbdrm_primary_plane_helper_atomic_update,
 	.atomic_disable = appletbdrm_primary_plane_helper_atomic_disable,
-- 
2.54.0


