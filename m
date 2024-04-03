Return-Path: <linux-mips+bounces-2568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF566896D72
	for <lists+linux-mips@lfdr.de>; Wed,  3 Apr 2024 12:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F6281F255ED
	for <lists+linux-mips@lfdr.de>; Wed,  3 Apr 2024 10:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C53142E6F;
	Wed,  3 Apr 2024 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bALe99OZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E41420A5;
	Wed,  3 Apr 2024 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141794; cv=none; b=jQwJRcesoSR/R9TNEz5IPoiBqOl9SGZqWFZptZv++1O+VCMFIQt+ghPIE8jb31aK5b3XZiAQDZ3UMw6sUlcYFv5LHYrlP68JNdQPEarsoejat62Pkj0KZ7xJQ2rLHpScpb0tKgNzm40j/i1/eLbg5i8i5d3rc148eLo8Y7xUbh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141794; c=relaxed/simple;
	bh=h5bgpOEOtPoY96rcvWDOPmv5XFEjuq01RDFNPNWlrh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKVCTD7a5qDOXqz72LKywa+5pHypgiLnagsGrQyN5lW6T5aqWJGodfHAzMV7PttBNyWhAYXkFsxHw4gHdr3f9Qo0o3TxkGmpycph88WgsHmltg3rIHDG9KyHV5sPT8JcL5whW571i5fyEAD3l7xhwoi4psAzrCKpPHiewgXKHFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bALe99OZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADA6C433C7;
	Wed,  3 Apr 2024 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712141794;
	bh=h5bgpOEOtPoY96rcvWDOPmv5XFEjuq01RDFNPNWlrh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bALe99OZuVOUK8aAmzBSAUmSfdvaSK+iIYFZh89+w23265BRGIEAftEQMiWz1M2Rw
	 vUy7yZhizOUOQ//Bv5N62IXEnrDrcCOCQRWYn7Zyj1HzzS4BXTwzQKMugAgnDY4shb
	 JgX2KhmSaIjmC5IuTwMFhIpKKcBENnjeXpTZQ3xFltKQPGpO00ysj1YGWTEXhNQwJo
	 StSswgZTKpBfpd5CnLp+LB2gVkCCe2fwUXENQK6Fs9Jhm/0tSf2SjJJ4UY4wfUIQqt
	 bIljyZGxc8ikRXlT8z+Lcxw3UZtHkY0bHz1uOlCHpHkdnLS8wIdiNam9iaY2M+LCfk
	 RLCcaQN9X+hXg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 03 Apr 2024 12:56:19 +0200
Subject: [PATCH 1/7] drm/display: Select DRM_KMS_HELPER for DP helpers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-fix-dw-hdmi-kconfig-v1-1-afbc4a835c38@kernel.org>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=mripard@kernel.org;
 h=from:subject:message-id; bh=h5bgpOEOtPoY96rcvWDOPmv5XFEjuq01RDFNPNWlrh8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGm8pld+CsYcUOp+KfHvvtqjrwmevxnPrv0acSS+WHGmy
 9xPMdKNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAin6czNnwsOOzMqbmwxCc1
 fM3i46IqPyMtBM6uE/9/RXCr4jOzjcqsz2ayL3veaCh45YJEv3HwbsaGI/f2JIkaT+WItLZz6Hp
 7sVWCS2b95qi3k09rOPN1rrjEMzNb7eLu4uMKbdd1b81O/v8aAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The DisplayPort helpers rely on some
(__drm_atomic_helper_private_obj_duplicate_state,
drm_kms_helper_hotplug_event) helpers found in files compiled by
DRM_KMS_HELPER.

Prior to commit d674858ff979 ("drm/display: Make all helpers visible and
switch to depends on"), DRM_DISPLAY_DP_HELPER was only selectable so it
wasn't really a big deal. However, since that commit, it's now something
that can be enabled as is, and since there's no expressed dependency
with DRM_KMS_HELPER, it can break too.

Since DRM_KMS_HELPER is a selectable option for now, let's select it for
DRM_DISPLAY_DP_HELPER.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404021556.0JVcNC13-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202404021700.LbyYZGFd-lkp@intel.com/
Fixes: d674858ff979 ("drm/display: Make all helpers visible and switch to depends on")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 01f2a231aa5f..a38962a556c2 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -37,10 +37,11 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 	  channel.
 
 config DRM_DISPLAY_DP_HELPER
 	bool "DRM DisplayPort Helpers"
 	depends on DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
 	default y
 	help
 	  DRM display helpers for DisplayPort.
 
 config DRM_DISPLAY_DP_TUNNEL

-- 
2.44.0


