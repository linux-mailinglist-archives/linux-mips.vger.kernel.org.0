Return-Path: <linux-mips+bounces-15709-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oqkGLzeLT2ovjQIAu9opvQ
	(envelope-from <linux-mips+bounces-15709-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:51:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4C87309C7
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:51:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b8lQzUzN;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15709-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15709-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C379E3001455
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B302740BCBD;
	Thu,  9 Jul 2026 11:51:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4E31E826;
	Thu,  9 Jul 2026 11:51:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597864; cv=none; b=qQyNnELVadxZYNS8jUtCp0dvJJtQZDQPHY3rtL3uwGucnSsynBTNZUFekeJSI9OrpUQjUknySRPPyfQTjF9XbrZwIOmr7G4lVHmhKE/ruwW5u6COnBpb230pvpd+czmJweJGqpEyAUSPSmkEt/FjRJ6hJ44nTtHi1rRr0uOuXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597864; c=relaxed/simple;
	bh=JmRhDhqbmSAvKKkO6usOJ6CSLIocA/0NYxM/BFFcjzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hytMW+xwL929+q8y/ngIDy4uDCtjUIAtDIK5LKGoSCXJYmWRq+xmppt8JwbhXsnBdbskCFqTll+w569ZCsgMoj33zd7i8yWj0ArAp5ppvwLckVrDM2gsNXVfvxsCo70IGONGRGIbAwLN1mrUKJ2R+J94PGSgjb/3/e/5YBmh6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8lQzUzN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAC71F000E9;
	Thu,  9 Jul 2026 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597863;
	bh=HLZuilKn15UjlROjcEHBSkIw1f/U3/ZjhuuZ1CowQV8=;
	h=From:Subject:Date:To:Cc;
	b=b8lQzUzNugSFha+J2oAgQmeii3dX/XceaCkhPFiKHVNfsMh3yjL/xV3J6GlJtrIl8
	 dzQQsGqJzJ57R7BsH80KdfPcCu+ALBASeuewJteDehE3tTjoKTcD/RkHIj8FfhE8HL
	 tVYRfJGwoqjPK8SOXH463lg3sWUa9kiINxbJXKW1/r35P6x5XY+U2XxpJe0uh4ZtSc
	 nkrz/r6VkedPz430fF5o2vbdMU24G33v3WPa0tcsuUruhaPuQImo1HMuVmdqju+7bZ
	 ksQTUACIQ7N7mGLZcu+6xB7eYjqc6aewvvWjkzCdEw/TbxgQqC4HqpUGUWun8X+2VJ
	 UrI2Q2Fnv+wAg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/60] drm/plane: Convert all drivers to
 atomic_create_state and remove reset
Date: Thu, 09 Jul 2026 13:50:26 +0200
Message-Id: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxG4atI1gZicRS9irgQ/TsT0FZSEUG8u
 2WW3+K9mxJMkagvbjKcmjSGjKosaP5N4QvWJZucuEYa1/FiG4fIWzTwvk4BbEg4WOruI752kNZ
 TrneD1+t/HsbneQE0wdFXaQAAAA==
X-Change-ID: 20260629-drm-no-more-plane-reset-04950f42e07f
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 javierm@redhat.com, ikerpedrosam@gmail.com, admin@kodeit.net, 
 gargaditya08@proton.me, hamohammed.sa@gmail.com, louis.chauvet@bootlin.com, 
 melissa.srw@gmail.com, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, 
 liviu.dudau@arm.com, alison.wang@nxp.com, stefan@agner.ch, 
 jstultz@google.com, sumit.semwal@linaro.org, xinliang.liu@linaro.org, 
 yongqin.liu@linaro.org, Frank.Li@nxp.com, 
 Sascha Hauer <s.hauer@pengutronix.de>, festevam@gmail.com, 
 imx@lists.linux.dev, kernel@pengutronix.de, victor.liu@nxp.com, 
 l.stach@pengutronix.de, laurentiu.palcu@oss.nxp.com, 
 linux-mips@vger.kernel.org, paul@crapouillou.net, 
 anitha.chrisanthus@intel.com, paulk@sys-base.io, chenhuacai@kernel.org, 
 jeffbai@aosc.io, lvjianmin@loongson.cn, wuqianhai@loongson.cn, 
 xry111@xry111.site, zhengxingda@iscas.ac.cn, jbrunet@baylibre.com, 
 khilman@baylibre.com, linux-amlogic@lists.infradead.org, 
 martin.blumenstingl@googlemail.com, abhinav.kumar@linux.dev, 
 freedreno@lists.freedesktop.org, jesszhan0024@gmail.com, 
 linux-arm-msm@vger.kernel.org, lumag@kernel.org, 
 marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com, 
 sean@poorly.run, marex@denx.de, airlied@redhat.com, kraxel@redhat.com, 
 spice-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 andy.yan@rock-chips.com, heiko@sntech.de, hjc@rock-chips.com, 
 linux-rockchip@lists.infradead.org, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, orsonzhai@gmail.com, 
 zhang.lyra@gmail.com, alain.volmat@foss.st.com, rgallaispou@gmail.com, 
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com, 
 philippe.cornu@foss.st.com, raphael.gallais-pou@foss.st.com, 
 yannick.fertre@foss.st.com, linux-sunxi@lists.linux.dev, 
 samuel@sholland.org, wens@kernel.org, jyri.sarha@iki.fi, 
 tomi.valkeinen@ideasonboard.com, hansg@kernel.org, 
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org, 
 olvaffe@gmail.com, michal.simek@amd.com, harry.wentland@amd.com, 
 siqueira@igalia.com, sunpeng.li@amd.com, linux@armlinux.org.uk, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 dharma.b@microchip.com, manikandan.m@microchip.com, 
 nicolas.ferre@microchip.com, alim.akhtar@samsung.com, inki.dae@samsung.com, 
 krzk@kernel.org, kyungmin.park@samsung.com, 
 linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, 
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, 
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, dakr@kernel.org, 
 lyude@redhat.com, nouveau@lists.freedesktop.org, geert+renesas@glider.be, 
 kieran.bingham+renesas@ideasonboard.com, 
 laurent.pinchart+renesas@ideasonboard.com, 
 linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, 
 tomi.valkeinen+renesas@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 dave.stevenson@raspberrypi.com, kernel-list@raspberrypi.com, 
 mcanal@igalia.com, bcm-kernel-feedback-list@broadcom.com, 
 zack.rusin@broadcom.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, 
 mperttunen@nvidia.com, thierry.reding@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9472; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JmRhDhqbmSAvKKkO6usOJ6CSLIocA/0NYxM/BFFcjzs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn+3ZwXH8zfF77if3wb97yNrHGxvT6+qe94BZTz/y44y
 pFRk8PZMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbypIOx4ROf2yGJb31qtr9v
 iUgGWElk8heukaq+0+V1ms2Na734mtTv9xvmyZeocU2Rip8uV2zGWMWkccCj/1Tp37PWIeKbZI4
 LH7NtEA/X3LTswPQSJv6rK5M4l6e3KQeJ3b2bNkH637TXLgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15709-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:mripard@kernel.org,m:javierm@redhat.com,m:ikerpedrosam@gmail.com,m:admin@kodeit.net,m:gargaditya08@proton.me,m:hamohammed.sa@gmail.com,m:louis.chauvet@bootlin.com,m:melissa.srw@gmail.com,m:alexander.deucher@amd.com,m:amd-gfx@lists.freedesktop.org,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:alison.wang@nxp.com,m:stefan@agner.ch,m:jstultz@google.com,m:sumit.semwal@linaro.org,m:xinliang.liu@linaro.org,m:yongqin.liu@linaro.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:kernel@pengutronix.de,m:victor.liu@nxp.com,m:l.stach@pengutronix.de,m:laurentiu.palcu@oss.nxp.com,m:linux-mips@vger.kernel.org,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:chenhuacai@kernel.org,m:jeffbai@aosc.io,m:lvjianmin@loongson.cn,m:wuqianhai@loongson.cn,m:xry111@xry111.site,m:zhen
 gxingda@iscas.ac.cn,m:jbrunet@baylibre.com,m:khilman@baylibre.com,m:linux-amlogic@lists.infradead.org,m:martin.blumenstingl@googlemail.com,m:abhinav.kumar@linux.dev,m:freedreno@lists.freedesktop.org,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:lumag@kernel.org,m:marijn.suijten@somainline.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:marex@denx.de,m:airlied@redhat.com,m:kraxel@redhat.com,m:spice-devel@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:andy.yan@rock-chips.com,m:heiko@sntech.de,m:hjc@rock-chips.com,m:linux-rockchip@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:orsonzhai@gmail.com,m:zhang.lyra@gmail.com,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:alexandre.torgue@foss.st.com,m:mcoquelin.stm32@gmail.com,m:philippe.cornu@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:yannick.fertre@foss.st.com,m:linux-sunxi@lists.linux.dev,m:samuel@sholland.org,m:wens@kernel.org,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:hansg@ke
 rnel.org,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:michal.simek@amd.com,m:harry.wentland@amd.com,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:linux@armlinux.org.uk,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:dharma.b@microchip.com,m:manikandan.m@microchip.com,m:nicolas.ferre@microchip.com,m:alim.akhtar@samsung.com,m:inki.dae@samsung.com,m:krzk@kernel.org,m:kyungmin.park@samsung.com,m:linux-samsung-soc@vger.kernel.org,m:sw0312.kim@samsung.com,m:p.zabel@pengutronix.de,m:angelogioacchino.delregno@collabora.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,redhat.com,gmail.com,kodeit.net,proton.me,bootlin.com,amd.com,arm.com,nxp.com,agner.ch,google.com,linaro.org,pengutronix.de,lists.linux.dev,oss.nxp.com,vger.kernel.org,crapouillou.net,intel.com,sys-base.io,aosc.io,loongson.cn,xry111.site,iscas.ac.cn,baylibre.com,lists.infradead.org,googlemail.com,linux.dev,somainline.org,oss.qualcomm.com,poorly.run,denx.de,rock-chips.com,sntech.de,linux.alibaba.com,foss.st.com,sholland.org,iki.fi,ideasonboard.com,collabora.com,chromium.org,igalia.com,armlinux.org.uk,tuxon.dev,microchip.com,samsung.com,glider.be,bp.renesas.com,raspberrypi.com,broadcom.com,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[120];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F4C87309C7

This is a follow-up to the bridge reset removal series, and part of a
larger effort to remove the reset hook from all KMS objects.

The plane reset hook is overloaded: it is called both at probe time
to create the initial software state and during suspend/resume to
reset hardware and software state. These two roles have different
requirements, and the reset hook is not fallible, making error
handling difficult for the initial state allocation path.

While reset has the semantics to reset both the software and hardware
state, the vast majority of implementations and all the helpers only
reset the software state, making them equivalent to
atomic_create_state in practice. The atomic_create_state hook makes
this explicit: it only allocates and initializes a pristine state
without any side effect, and returns the state pointer or an ERR_PTR
on failure.

This series first adds the necessary infrastructure in the simple-kms
and GEM atomic helpers, then converts all 51 plane drivers tree-wide
from the reset hook to atomic_create_state. The conversions were done
using a combination of Coccinelle semantic patches and manual
adjustments. Once all drivers are converted, the old helpers and the
reset hook itself are removed from struct drm_plane_funcs.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (60):
      drm/simple-kms: Add create_plane_state hook
      drm/gem-atomic-helper: Create drm_gem_create_shadow_plane_state()
      drm/gem-atomic-helper: Convert simple-kms shadow helpers to create_plane_state
      drm/gem-atomic-helper: Switch DRM_GEM_SHADOW_PLANE_FUNCS to atomic_create_state
      drm/gem-atomic-helper: Remove drm_gem_reset_shadow_plane()
      drm/sysfb: Convert to atomic_create_state
      drm/simple-kms: Switch to atomic_create_state
      drm/ssd130x: Convert to atomic_create_state
      drm/st7920: Convert to atomic_create_state
      drm/appletbdrm: Convert to atomic_create_state
      drm/vkms: Convert to atomic_create_state
      drm/gem-atomic-helper: Remove __drm_gem_reset_shadow_plane()
      drm/amdgpu: Convert to atomic_create_state
      drm/hdlcd: Convert to atomic_create_state
      drm/fsl-dcu: Convert to atomic_create_state
      drm/hisilicon/kirin: Convert to atomic_create_state
      drm/imx/dc: Convert to atomic_create_state
      drm/imx/dcss: Convert to atomic_create_state
      drm/ingenic: Convert to atomic_create_state
      drm/kmb: Convert to atomic_create_state
      drm/logicvc: Convert to atomic_create_state
      drm/loongson: Convert to atomic_create_state
      drm/meson: Convert to atomic_create_state
      drm/msm/mdp4: Convert to atomic_create_state
      drm/lcdif: Convert to atomic_create_state
      drm/mxsfb: Convert to atomic_create_state
      drm/qxl: Convert to atomic_create_state
      drm/rockchip: Convert to atomic_create_state
      drm/sprd: Convert to atomic_create_state
      drm/sti: Convert to atomic_create_state
      drm/stm: Convert to atomic_create_state
      drm/sun4i: sun8i: Convert to atomic_create_state
      drm/tests: kunit: Convert to atomic_create_state
      drm/tilcdc: Convert to atomic_create_state
      drm/vboxvideo: Convert to atomic_create_state
      drm/virtio: Convert to atomic_create_state
      drm/xlnx: Convert to atomic_create_state
      drm/atomic-state-helper: Remove drm_atomic_helper_plane_reset()
      drm/amdgpu_dm: Convert to atomic_create_state
      drm/komeda: Convert to atomic_create_state
      drm/malidp: Convert to atomic_create_state
      drm/armada: Convert to atomic_create_state
      drm/atmel-hlcdc: Convert to atomic_create_state
      drm/exynos: Convert to atomic_create_state
      drm/imx/ipuv3: Convert to atomic_create_state
      drm/mediatek: Convert to atomic_create_state
      drm/msm/dpu1: Convert to atomic_create_state
      drm/msm/mdp5: Convert to atomic_create_state
      drm/nouveau: Convert to atomic_create_state
      drm/omap: Convert to atomic_create_state
      drm/rcar-du: Convert to atomic_create_state
      drm/rz-du: Convert to atomic_create_state
      drm/shmobile: Convert to atomic_create_state
      drm/sun4i: layer: Convert to atomic_create_state
      drm/vc4: Convert to atomic_create_state
      drm/verisilicon: Convert to atomic_create_state
      drm/vmwgfx: Convert to atomic_create_state
      drm/atomic-state-helper: Remove __drm_atomic_helper_plane_reset()
      drm/tegra: Convert to atomic_create_state
      drm/plane: Remove reset

 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  17 ++--
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |  18 ++--
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |   2 +-
 drivers/gpu/drm/arm/malidp_planes.c                |  12 ++-
 drivers/gpu/drm/armada/armada_overlay.c            |  39 ++++----
 drivers/gpu/drm/armada/armada_plane.c              |  15 ++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |  27 +++---
 drivers/gpu/drm/drm_atomic_state_helper.c          |  41 ---------
 drivers/gpu/drm/drm_gem_atomic_helper.c            | 100 +++++++++++----------
 drivers/gpu/drm/drm_mode_config.c                  |   4 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |  11 +--
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |  22 ++---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |   2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   2 +-
 drivers/gpu/drm/imx/dc/dc-plane.c                  |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |   2 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |  19 ++--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |   2 +-
 drivers/gpu/drm/kmb/kmb_plane.c                    |   2 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c            |   2 +-
 drivers/gpu/drm/loongson/lsdc_plane.c              |   2 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |  22 ++---
 drivers/gpu/drm/meson/meson_overlay.c              |   2 +-
 drivers/gpu/drm/meson/meson_plane.c                |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  18 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  16 ++--
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  15 ++--
 drivers/gpu/drm/omapdrm/omap_plane.c               |  13 ++-
 drivers/gpu/drm/qxl/qxl_display.c                  |   4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c    |  15 ++--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c      |  15 ++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |  15 ++--
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |  15 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   2 +-
 drivers/gpu/drm/sitronix/st7920.c                  |  12 +--
 drivers/gpu/drm/solomon/ssd130x.c                  |  12 +--
 drivers/gpu/drm/sprd/sprd_dpu.c                    |   2 +-
 drivers/gpu/drm/sti/sti_cursor.c                   |   2 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   2 +-
 drivers/gpu/drm/stm/ltdc.c                         |   2 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |  12 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   2 +-
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   4 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |  30 +++++--
 drivers/gpu/drm/tegra/plane.c                      |  28 +++---
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
 drivers/gpu/drm/tiny/appletbdrm.c                  |  12 +--
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   2 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  15 ++--
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c      |   2 +-
 drivers/gpu/drm/verisilicon/vs_plane.c             |  14 ++-
 drivers/gpu/drm/verisilicon/vs_plane.h             |   2 +-
 drivers/gpu/drm/verisilicon/vs_primary_plane.c     |   2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   2 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |  15 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  17 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   4 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   2 +-
 include/drm/drm_atomic_state_helper.h              |   3 -
 include/drm/drm_gem_atomic_helper.h                |  13 +--
 include/drm/drm_plane.h                            |  12 ---
 include/drm/drm_simple_kms_helper.h                |   1 +
 74 files changed, 331 insertions(+), 422 deletions(-)
---
base-commit: 671b7825dbfe9ea6e3ad3001003aeee0df48d1b5
change-id: 20260629-drm-no-more-plane-reset-04950f42e07f

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


