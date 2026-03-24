Return-Path: <linux-mips+bounces-13906-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDEuA6WPwmn/ewQAu9opvQ
	(envelope-from <linux-mips+bounces-13906-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 14:20:37 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 990FD3093FE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 14:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EA6231CFD85
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE30636680F;
	Tue, 24 Mar 2026 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QcbodRRZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCA83F87F9
	for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2026 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357675; cv=none; b=sOEMri4NCKpfTyKa1XQtpeXRUd8wK4N1m1dD/d6naUao8+fENhBzMLluLsem70oJFxlVHuV7+E1LKqVqx2/mRk0n5DuGqQ+2WhA7S0yQilqghTslDXQ5kahUdLDOmdVl7lGOw8yJ2PSknHdejHwhlAmCrjSjCKDr4xPjusRqATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357675; c=relaxed/simple;
	bh=3gcDvKDiofu5+UBNldcs7iRDdzjLiu7N536dnvCCZcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+pgYBd0dfNVQAcTK8JZpaeufV4IR9WGE/FFL7U51QZ1yvqnpCBLaovjRNWSOky4eBlwjQ1fCntA3G7KPeNtiUk+240R6V/i+iWik8vDERTAdAWcTypGB2U66jz20J1Rt8T1lkSRCmDkiHhzKGKg8l2Q/xC1pbuXIBcomuTVzOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QcbodRRZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 383AFC5809B;
	Tue, 24 Mar 2026 13:08:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5B506011D;
	Tue, 24 Mar 2026 13:07:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC98510451277;
	Tue, 24 Mar 2026 14:07:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774357670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fzs1pWNycSsS39sE+twHeUSR+qT4+7glSHwX8hsiv/I=;
	b=QcbodRRZQ7IqeUKtkAQoCsXRCzX49zCQ7c/T+hCSVAXapnmgLoW9sIiyhNT46+mtFpU61J
	gJKeSKsjZKwJOSysmrVxJF3olbTeDJZ2DqVTCNwCP9TRBajYIcDIENx5tLs+7THxp2dWu0
	G/nuEQt7uiBb0r0BIkhRCZVn6pXSbqYfjcLzD/L4CbpSNR9WLcFeTQpZ4rS6QK/GzA8nkX
	h9C6LEGO1+qyCWSTqAgOYNv4hY+3xqTMYTAflOF0bmF5eF20QckGAirTPjA+Op1MqF0Nv7
	40zg4pJn5YPXFwI/uVYiiJu5XpAy2TfiMXAYQmP7sGyJ6NVFPthK0xMFXjZ6wA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 24 Mar 2026 14:07:30 +0100
Subject: [PATCH v3] drm/atomic: drm_atomic_private_obj_fini: protect
 private_obj removal from list
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-drm-bridge-atomic-vs-remove-private_obj-v3-1-64deefe84044@bootlin.com>
References: <20260324-drm-bridge-atomic-vs-remove-private_obj-v3-0-64deefe84044@bootlin.com>
In-Reply-To: <20260324-drm-bridge-atomic-vs-remove-private_obj-v3-0-64deefe84044@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.0
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13906-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,crapouillou.net,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,nvidia.com,raspberrypi.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 990FD3093FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently drm_bridge_detach() expects that the bridge private_obj is not
locked by a drm_modeset_acquire_ctx, and it warns in case that happens:

  drm_bridge_detach()
  -> drm_atomic_private_obj_fini()
     -> list_del(&obj->head) // removes priv_obj from
                             // dev->mode_config.privobj_list
     -> obj->funcs->atomic_destroy_state()
     -> drm_modeset_lock_fini(&obj->lock)
        -> WARN_ON(!list_empty(&lock->head)) // warn if priv_obj->lock
	                                     // is still in ctx->locked

The expectation is not respected when introducing bridge hot-plugging. In
such case the warning triggers if the bridge is being removed concurrently
to an operation that locks the private object using a
drm_modeset_acquire_ctx, such as in this execution scenario:

  CPU0:
  drm_mode_obj_get_properties_ioctl() // userspace request
  -> DRM_MODESET_LOCK_ALL_BEGIN()
  .  -> drm_for_each_privobj() // loop on dev->mode_config.privobj_list
  .     - lock the privobj mutex
  .	- add priv_obj->lock to ctx->locked
  .	  (list of locks to be released later)
  .
  .                         CPU1:
  .                         drm_bridge_detach() // bridge hot-unplug
  .		            -> WARN triggers!
  .
  -> DRM_MODESET_LOCK_ALL_END()
     -> for each lock in ctx->locked
	- remove priv_obj->lock from ctx->locked
        - unlock the privobj mutex

Prevent this potential deadlock by using DRM_MODESET_LOCK_ALL_BEGIN/END()
around the list removal in drm_atomic_private_obj_fini(). This ensures that
exactly one of these happens:

 * the concurrent code (e.g. drm_mode_obj_get_properties_ioctl()) acquires
   all the locks first, so it can execute fully and release the
   privobj->lock before drm_atomic_private_obj_fini() calls list_del() and
   before the WARN_ON()
 * drm_atomic_private_obj_fini() acquires all the locks first, so it
   removes its privobj->lock from the dev->mode_config.privobj_list; the
   concurrent code will run afterwards and not acquire that lock because it
   is not present anymore

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Rebased on current drm-misc-next (on 7.0-rc3)
- Small commit message clarification

Changes in v2:
- added 'drm/atomic:' prefix to commit title
- Adapted to work on top of "drm/atomic: Add dev pointer to drm_private_obj"
- Slightly improved commit message
---
 drivers/gpu/drm/drm_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 41c57063f3b4..0f9c2528c9ee 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -962,7 +962,13 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
 void
 drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
+	DRM_MODESET_LOCK_ALL_BEGIN(obj->dev, ctx, 0, ret);
 	list_del(&obj->head);
+	DRM_MODESET_LOCK_ALL_END(obj->dev, ctx, ret);
+
 	obj->funcs->atomic_destroy_state(obj, obj->state);
 	drm_modeset_lock_fini(&obj->lock);
 }

-- 
2.53.0


