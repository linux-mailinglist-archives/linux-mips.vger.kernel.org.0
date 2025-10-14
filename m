Return-Path: <linux-mips+bounces-11708-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA6BD92A7
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 14:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AE2B3AA1A5
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 12:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2145A2BEC59;
	Tue, 14 Oct 2025 12:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQID+6ZS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67DD31065C;
	Tue, 14 Oct 2025 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443214; cv=none; b=CuQB6l1XHVXZb0cWKcJFYueB51I3cwkxoQa1jy3qa1nEJnnwaKFcEbSxMQe19YBgsDWQUPJn2k4prDNvSEAVvIR4hye2pimV6u130CeJUpUTkwvFmubFIwH3rFtxZSPMx0lDdVW9cwuOK1vic/IOp3dy/JOV0cz5wZZDfGN2Tkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443214; c=relaxed/simple;
	bh=5iz0ou1+ASol84VTatvtY3jJi59Y+CsQjq0q+Affpks=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kCALbpRw96l04qrpgmKZNX2p6z5MKnls1YgXrB1rWp9r7gm3jKJgKlMeD1qkpOzpUoRhu3129m1QUU3TLzg8bgZknHQqbD/N3uGEDlu69XCvZ6qK7Gjzwobo7dc+gxHuLPGPBSCuh54mCILx4EM5N/Kwozvi+xrrUG7bi4GZefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQID+6ZS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40740C4AF09;
	Tue, 14 Oct 2025 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760443213;
	bh=5iz0ou1+ASol84VTatvtY3jJi59Y+CsQjq0q+Affpks=;
	h=From:Subject:Date:To:Cc:From;
	b=tQID+6ZSv4o5ypmvlhPLFxtSJjMLTUxsXr9ncY/wEA9MMnA1Pqb1g3kuKLc5+fxbH
	 NmWGtNGK5GgCOHswHA1GRxLuzlznSyQmXUOLCkQsB+BOkvT8XLPbvdITXxL0n6SHaK
	 vX6LCtZXC4wh5EXjm4KmTTxAfblhcTGBgPODtjOog1X1f67A4YluXao9kCdg1Azr9E
	 CFEtmuJgkn6g1XbdwqW3FACLTbGiTpF1w+EQHV5njwuhHdIQbuMsXdIlgll13HVg+x
	 CpJJvbGP3vhfAno0juCIyyqB6aDauCRu+TSwvVlw631OAkRRne8N2/X14AL8MnQ5j4
	 +877oxOao0nRg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 00/16] drm/atomic: Allocate drm_private_state through a
 callback
Date: Tue, 14 Oct 2025 11:31:44 +0200
Message-Id: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0Jm7Zi2ghBX3sOwGGSE8aclU9JoC
 He3cgGX7yXf+xaIrMIRTsUCykmiBJ/B7Qq4juQHRukzgzOussY02OsLJ5VEM2Po7qgceUZiy64
 urXE1Qd5Oyjd5b91Lm3mUOAf9bDfJ/uy/YrJosDEVdeWB+FjR+cHq+bkPOkC7rusXQU5wM7sAA
 AA=
X-Change-ID: 20251008-drm-private-obj-reset-ae1e2741027a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
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
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 kernel-list@raspberrypi.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3537; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5iz0ou1+ASol84VTatvtY3jJi59Y+CsQjq0q+Affpks=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrC0fZTrft2CdttlkwucWjiln3TU5dk3LYmtUZttV5
 L3ac/3JjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR8PmM9ZmV/2d5F94qvDbl
 dfOHVr0LBXabs2U3vbmUyHK4dj1jz8oVL+V/fUji3/TsHx9zclRDDWOtRK28jvjyQz/t19lOijq
 sv3CzUPWGgplMrUZJ3zR29Hcf+N883VSE+5n0pv2+/bw3A3YCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
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
Changes in v2:
- Switch to a new hook instead of reset since some drm_private_objs want
  to persist across suspends
- Drop the call to drm_private_obj_funcs.reset in
  drm_mode_config_reset()
- Link to v1: https://lore.kernel.org/r/20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org

---
Maxime Ripard (16):
      drm/atomic: Add dev pointer to drm_private_obj
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
 drivers/gpu/drm/drm_atomic.c                       |  24 ++-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  22 +++
 drivers/gpu/drm/drm_bridge.c                       |  32 ++--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  28 +--
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  28 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  41 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  40 ++--
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  22 ++-
 drivers/gpu/drm/tegra/hub.c                        |  22 ++-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  67 ++++---
 include/drm/drm_atomic.h                           |  25 ++-
 include/drm/drm_atomic_state_helper.h              |   3 +
 17 files changed, 444 insertions(+), 232 deletions(-)
---
base-commit: aa1c2b073ad23847dd2e7bdc7d30009f34ed7f59
change-id: 20251008-drm-private-obj-reset-ae1e2741027a

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


