Return-Path: <linux-mips+bounces-13197-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNg/IIPNnWn4SAQAu9opvQ
	(envelope-from <linux-mips+bounces-13197-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 17:10:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9342D189924
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 17:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4940300C6E4
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 16:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6F13A7831;
	Tue, 24 Feb 2026 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTB1im2V"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A6F3A6405;
	Tue, 24 Feb 2026 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949438; cv=none; b=SVGZxxCG+2YP/iwuSwQtoadzp7llBH3E/offINOok0Q3T+mIzTNVlr0aWa0SEc550YbtnHRI8nuA/TyhjnbldHeJKQhuyGG+BepoyL0Anovgj0OZQub3w89RreQguCaoRgPnS/v5TyQBSMoUYPeMvZ0ZC6umT6aSF7HQH3DXQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949438; c=relaxed/simple;
	bh=T0YWfymtQNrEs5hzUd88lUy+/hAsWJqHQKQFm7O92Hk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=toczqXIMkOwoNY/402gIJhtSeDVlSsv8HuTvccYUF2PktSfScW+URwRV0M/9EErJVMHxMSakT3zuj8BoBU0lfxDngcjZKIDSEoqFTwIudqxm8mI2NqZ5byp0RWzzE6vriDosnh6cRsIMphmOfS/XhAFeo/s/+e8mld/eguXn45E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTB1im2V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C47FC116D0;
	Tue, 24 Feb 2026 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771949438;
	bh=T0YWfymtQNrEs5hzUd88lUy+/hAsWJqHQKQFm7O92Hk=;
	h=From:Subject:Date:To:Cc:From;
	b=uTB1im2V9ydk0nAKQ2NkEDLDwJgN/sce2uY+KOIsYFlUnxBoUKJLKqIfL1Zpcvk3a
	 R/UcyVTIIwVNw/aKgIMXLAUI3M1gtk4rdCr5Ndd0xyj0AsOuZV+dnFZ1ClI3XM3Me6
	 L9TsxkgHnQ0yAzjicfdg4qMqL2lrtX5k+TTRg1E7WxeYTH8oT1j4phRUQuvYkZqcIl
	 YXLD+N8PNE8M013osfW38PsoY2BT8y52xvk5E8qoUJWYr5/N63BqemqivtcEH2zTDN
	 w6gPv44Zjnsd50tdhBaEFOX1M2n/krWWKaoXXDcSokMyYWusIuN4mAQLroevNF1/Ms
	 Q/a0jNuOIgjqg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v5 0/4] drm/atomic: Allocate drm_private_state through a
 callback
Date: Tue, 24 Feb 2026 17:10:25 +0100
Message-Id: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XPzWoCMRDA8VeRnBuZfK0bT75H6WFiRjdt3chkC
 YrsuzdaCpay9PgfmN8wN1GIExWxXd0EU00l5bGFe1mJ/YDjkWSKrYUG7RRALyOf5JlTxYlkDu+
 SqdAkkRTpjVWgNyja7pnpkC4P9/Wt9ZDKlPn6OFPVffqfWJUE2YPDYA1S53D3QTzS5zrzUdzJq
 p8YZZcY3Zguxg7I9458/MOYH6YDpfwSYxoTvFEYyKAjs2OKA07rfT59M/aJ0YtP2cZ46L06oIk
 mwC9mnucvuvl8LJABAAA=
X-Change-ID: 20251008-drm-private-obj-reset-ae1e2741027a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3150; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T0YWfymtQNrEs5hzUd88lUy+/hAsWJqHQKQFm7O92Hk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzz1YKZUacTc/dqc6Ys/3mK/GX/umPzza7ntbhrOcTX
 DmvzT6/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkK4Kx4eL/u7nd68/KLpZL
 0uszcA3/HaCUfV/GXI+Bv/zWnbyL2QGSPeejd8fHRrVunnhrQ5ILY8OpTjah2Ufq9e+v6ryhWrT
 qq584p4DWylkHOqeVvej0tb4UoPT6gc7DBe8FJy9Xqa/RPwQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13197-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,amd.com,igalia.com,ideasonboard.com,gmail.com,nvidia.com,vger.kernel.org,oss.qualcomm.com,arm.com,intel.com,linaro.org,crapouillou.net,raspberrypi.com,kwiboo.se,linux.dev,poorly.run,somainline.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9342D189924
X-Rspamd-Action: no action

Hi,

This series started from my work on the hardware state readout[1], and
was suggested by Dmitry[2].

This series deal with the fact that drm_private_obj (and thus bridges)
are not initialized using the same pattern than any other object. This
series solves that inconsistency by aligning it to what we're doing for
all the other objects.

This was tested on a TI SK-AM62, with three bridges.

Let me know what you think,
Maxime

1: https://lore.kernel.org/dri-devel/20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org/
2: https://lore.kernel.org/dri-devel/zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x/

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v5:
- Rebase to drm-misc-next
- Link to v4: https://lore.kernel.org/r/20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com

Changes in v4:
- Fix a circular dependencies between modules by calling
  __drm_atomic_helper_private_obj_create_state from
  __drm_atomic_helper_bridge_reset instead of
  drm_bridge_atomic_create_priv_state()
- Link to v3: https://lore.kernel.org/r/20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com

Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org

Changes in v2:
- Switch to a new hook instead of reset since some drm_private_objs want
  to persist across suspends
- Drop the call to drm_private_obj_funcs.reset in
  drm_mode_config_reset()
- Link to v1: https://lore.kernel.org/r/20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org

---
Maxime Ripard (4):
      drm/amdgpu: Switch private_obj initialization to atomic_create_state
      drm/omapdrm: Switch private_obj initialization to atomic_create_state
      drm/tegra: Switch private_obj initialization to atomic_create_state
      drm/atomic: Remove state argument to drm_atomic_private_obj_init

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 51 ++++++++++++----------
 .../drm/arm/display/komeda/komeda_private_obj.c    | 16 +++----
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  1 -
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  2 +-
 drivers/gpu/drm/drm_atomic.c                       | 22 +++-------
 drivers/gpu/drm/drm_bridge.c                       |  1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  1 -
 drivers/gpu/drm/omapdrm/omap_drv.c                 | 22 +++++++---
 drivers/gpu/drm/tegra/hub.c                        | 22 +++++++---
 drivers/gpu/drm/vc4/vc4_kms.c                      |  4 +-
 include/drm/drm_atomic.h                           |  1 -
 14 files changed, 76 insertions(+), 72 deletions(-)
---
base-commit: 196b2b95fec447c2c4460f753b277d840633fbef
change-id: 20251008-drm-private-obj-reset-ae1e2741027a

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


