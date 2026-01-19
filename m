Return-Path: <linux-mips+bounces-12967-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 501BCD3A97A
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jan 2026 13:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 584883093509
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jan 2026 12:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B2235EDA5;
	Mon, 19 Jan 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4GM02ke"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3B35C1A3;
	Mon, 19 Jan 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827011; cv=none; b=PUKEGo/MnWo7i7e2W06G8gvmM5iKXyREly4CzgslSCjXj40cUMus9qAf5VL3UGYyGipMzHXCZYSQAx7ZCxcs3wiC4Og6VHxhStKqKrmfNZEO2nA0Ghl/91xb2sOqmfW6BIwh0ix1Ere4rUvxQXQ2XaqjiwzVNDz0G3GxPt0n8/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827011; c=relaxed/simple;
	bh=W3aAF0frD8s9gqULfEShI0pzXKiJkVcH+I2x5ojS2kA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AA1CrtSk0aKlVhfLRXA6rq+86ugwOr1jwcfkB607J4Ov7rhw+/YNLRD/Kwvk4zekFhPjThHii6HXOco3AEZw++1vDInjsA8qhQQLDjacRqS/8kdsPIyol9qJvLgKJkvNP/mMcLbdo/6Icskzt7r7McdTN+BY7dEKfoZ6DIbawEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4GM02ke; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7647C116C6;
	Mon, 19 Jan 2026 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768827011;
	bh=W3aAF0frD8s9gqULfEShI0pzXKiJkVcH+I2x5ojS2kA=;
	h=From:Subject:Date:To:Cc:From;
	b=D4GM02kefXWeUzYaKH0yGm0m9wA7UWMo0V3M92IPmJLGrj/YSnsoJIaaXbf35kGPz
	 mdpTlSbU0j1pf397M4IWX+fpGuDOEyrjQ18mo/tYGtCnV6VVKyseQItIbBMLPrIxKx
	 4krCwi2O0mXt65VN1SoaScYjkvobgrSisDrDGKh/sqNPzKiqHW0d/EBZekUEK1xfjb
	 xv48cv6yqH8YxiCkbzcsKQDxHVGRHlfE+ZjqFqq7a0/7tObydsT54kPHvr2cp0pWYh
	 xMzGP1JvCUw6ieO93LRIXerswURkN2z0mQtn1LsvWVUyoaMkgrr/xrc7R8cp7PAuLe
	 XoLonoEbR6JSQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/15] drm/atomic: Allocate drm_private_state through a
 callback
Date: Mon, 19 Jan 2026 13:49:56 +0100
Message-Id: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNyw6CMBCF4VcxXTumLZSLK9/DuCh2hPFCyZQ0G
 sK7W1jpwrj8TzLfTCIgEwax30yCMVIg36fIthtx7mzfIpBLLbTURklZgeMHDEzRjgi+uQJjwBE
 sKtRlrqQurUi3A+OFnqt7PKXuKIyeX+ubqJb1nxgVSKiksU2eWSyMPdyQe7zvPLdiIaP+YFT+i
 9GJKZwrJNaVwdp9MfM8vwGMQxoDAgEAAA==
X-Change-ID: 20251008-drm-private-obj-reset-ae1e2741027a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 kernel-list@raspberrypi.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3710; i=mripard@redhat.com;
 h=from:subject:message-id; bh=W3aAF0frD8s9gqULfEShI0pzXKiJkVcH+I2x5ojS2kA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GpU3jDh2zJyzQfdxFYtZzpv3M39H1slKMjQ4byjoC
 J1xwaeuYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExknjdjw2+TjG4p7+cJk91c
 bxbutnk6b92xBI9NfsJ1F4+8n3d/urvkxf/rHy3m3CEY3Gb22PVIHmPD/pSwZSe5oj3Mn3G6vI0
 TeuAlXPW5u2j5XcPQvTfY0m62Wx2w/pXUEHKBvf9kkufTKHYA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

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
Maxime Ripard (15):
      drm/atomic: Make drm_atomic_private_obj_init fallible
      drm/atomic: Add new atomic_create_state callback to drm_private_obj
      drm/atomic-helper: Add private_obj atomic_create_state helper
      drm/bridge: Switch private_obj initialization to atomic_create_state
      drm/dp_mst: Switch private_obj initialization to atomic_create_state
      drm/dp_tunnel: Switch private_obj initialization to atomic_create_state
      drm/amdgpu: Switch private_obj initialization to atomic_create_state
      drm/arm: komeda: Switch private_obj initialization to atomic_create_state
      drm/ingenic: Switch private_obj initialization to atomic_create_state
      drm/msm: mdp5: Switch private_obj initialization to atomic_create_state
      drm/msm: dpu1: Switch private_obj initialization to atomic_create_state
      drm/omapdrm: Switch private_obj initialization to atomic_create_state
      drm/tegra: Switch private_obj initialization to atomic_create_state
      drm/vc4: Switch private_obj initialization to atomic_create_state
      drm/atomic: Remove state argument to drm_atomic_private_obj_init

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  51 ++---
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   2 +
 .../drm/arm/display/komeda/komeda_private_obj.c    | 208 ++++++++++++++-------
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  36 ++--
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  25 ++-
 drivers/gpu/drm/drm_atomic.c                       |  22 ++-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  22 +++
 drivers/gpu/drm/drm_bridge.c                       |  32 ++--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  28 +--
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  28 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  41 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  40 ++--
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  22 ++-
 drivers/gpu/drm/tegra/hub.c                        |  22 ++-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  67 ++++---
 include/drm/drm_atomic.h                           |  20 +-
 include/drm/drm_atomic_state_helper.h              |   3 +
 17 files changed, 437 insertions(+), 232 deletions(-)
---
base-commit: b36178488d479e9a53bbef2b01280378b5586e60
change-id: 20251008-drm-private-obj-reset-ae1e2741027a

Best regards,
-- 
Maxime Ripard <mripard@redhat.com>


