Return-Path: <linux-mips+bounces-13905-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JSd3LoiPwmkXfAQAu9opvQ
	(envelope-from <linux-mips+bounces-13905-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 14:20:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20F309398
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 14:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27B2931B93D7
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 13:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902373F7E6F;
	Tue, 24 Mar 2026 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lasowkfk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF43EF659;
	Tue, 24 Mar 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357671; cv=none; b=eBG2G3dl/SIE7OzkbWTRCOLRNSi+bu6NdrpRwbC1vm7yWmqnrw4DYYl/pMpnZlvUjEdZa4aIin6ZAOud7L4bAFzuSCgjHLA2qC+KrcQqVuSI0/nffqVD9FRZWeyD7+dLjAuOvwMx4DlzbEWj9rjShDseOQ/e0v1Yu6rJL95F1FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357671; c=relaxed/simple;
	bh=D0kkGEEvgIWqvEXF3XQOv1BGYWjXImrZui2cUNlsEHo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NWpeRl1Jb/vgZJ4SNI/HLoINLZbZCfTIQXKtdrSgXPvbbOnJKdff1FkDzUXVbHvMhRh0icHZ1k6oa276yZPi085PSWSxJ9ubXc5RgggTJ4v4Wc3cBVzDewExK7BUE9qdUK9MunoR19y4hbW2OC/JM2FcMpkIJ4XzNH9ZL0OVzuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lasowkfk; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E76944E427CC;
	Tue, 24 Mar 2026 13:07:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0D5C6011D;
	Tue, 24 Mar 2026 13:07:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3F4110451273;
	Tue, 24 Mar 2026 14:07:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774357664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=oz2n6EGzzohxeupK2HnEka+WLJWsM35paHY/3OjrXOI=;
	b=lasowkfkGR1jPvF44IgZjk2NBlO2y0FNCjB+SkEGW4alIwhrJQJfOPfZzMT4yUoQhUMzqg
	K7MGJqRyFTlm/3+Pi3fRvYQosVj3YHVev4QC+4Y/8yxtUk4ax7bhwO3OKXCCXSPvtrp2mi
	zmPXG6uFwucE3VMM9yWvSJPOVnrTmg6IjswG6i29GemocuisliWWSi7aKzPUNzRhYDSa8f
	IitiYmZuesN+f8nAm4yFp2dabTZELhgIOSfVmsFKSMB6owRGcHaUT4RXTIII13a4LE/inW
	K3GZWVpEB/O+2XIxmxOOlUpfdbFgIBhC0HZG0hpd6AFQFnsqDuAQl9xEji1eJA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3] drm/atomic: protect bridge private_obj during bridge
 removal
Date: Tue, 24 Mar 2026 14:07:29 +0100
Message-Id: <20260324-drm-bridge-atomic-vs-remove-private_obj-v3-0-64deefe84044@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJGMwmkC/5WQy07DMBBFfyXymkEeu0mcrvgPhJAfEzoIx8U2F
 qjqv+O2G9jB8s6VztGdkyiUmYrYDyeRqXHhtPWg7wbhD3Z7IeDQs1BSjShRQ8gRXObQG1tTZA+
 tQKaYGsExc7OVnpN7hTAvysjRkQtedNox08qfV9PjU88HLjXlr6u44eX6f0dDkICrVzQalIrkg
 0upvvF271MUF0tTP8gK/05WgLBDZdHoZXHW/yafb4MyvX/0j9XbKuFsIeh95LofZrJyNxltunb
 yKN2sJ63dMk9Ba1qt8aiCnscOO38DQlj9HYYBAAA=
X-Change-ID: 20251013-drm-bridge-atomic-vs-remove-private_obj-d792805bebdc
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
	TAGGED_FROM(0.00)[bounces-13905-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 3F20F309398
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series prevents a race between DRM bridge removal and usage of the
bridge private_obj during DRM_MODESET_LOCK_ALL_BEGIN/END() and other
locking operations.

== Series description

The need for this series emerged during testing of DRM bridge
hot-plugging. Very rarely on hot-unplug the following warning has appeared:

  WARNING: CPU: 0 PID: 123 at include/drm/drm_modeset_lock.h:114 drm_atomic_private_obj_fini+0x64/0x80
  ...
  Call trace:
   drm_atomic_private_obj_fini+0x64/0x80
   drm_bridge_detach+0x38/0x98

This series does not depend on other series.

== Grand plan

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. … add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. … add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. … of_drm_find_bridge
          a. ✔ add of_drm_get_bridge() (v7.0),
	       convert basic direct users (v7.0-v7.1)
	  b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
	  c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
	  d. ✔… convert direct of_drm_get_bridge() users, part 4
	        (some v7.1, some pending)
	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. ➜ handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
    B. ➜ protect private_obj removal from list
    C. ✔ Add drm_bridge_clear_and_put() (v7.1)
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. … Migrate i.MX LCDIF driver to bridge-connector
 6.   DRM bridge hotplug
    A.   Bridge hotplug management in the DRM core
    B.   Device tree description

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- Rebased on current drm-misc-next (on 7.0-rc3)
- Small commit message clarification
- Link to v2: https://lore.kernel.org/r/20251021-drm-bridge-atomic-vs-remove-private_obj-v2-1-412a18399bac@bootlin.com

Changes in v2:
- Adapted to work on top of "drm/atomic: Add dev pointer to drm_private_obj"
- Removed 'To: jessica.zhang@oss.qualcomm.com', invalid address
- Link to v1: https://lore.kernel.org/r/20251013-drm-bridge-atomic-vs-remove-private_obj-v1-0-1fc2e58102e0@bootlin.com

---
Luca Ceresoli (1):
      drm/atomic: drm_atomic_private_obj_fini: protect private_obj removal from list

 drivers/gpu/drm/drm_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)
---
base-commit: 7ea0468380216c10b73633b976d33efa8c12d375
change-id: 20251013-drm-bridge-atomic-vs-remove-private_obj-d792805bebdc

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>


