Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFFB66BF58
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jan 2023 14:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjAPNPu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Jan 2023 08:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjAPNPc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Jan 2023 08:15:32 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5A01D923;
        Mon, 16 Jan 2023 05:12:38 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6377167773;
        Mon, 16 Jan 2023 13:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1673874757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=YQ1YlOVInu6WsLhZgXbEIaFPrF+YO75TAo9I3Omn8lU=;
        b=Dkv3ssXgPwtN3kjuLt7Xxr/dpn86Y80sgPw+gQlpFgefvho7hRs6ljDYQCyek6cMEtIUnp
        SGEO72jh9B2QUiQxGcZyPKQaYAjaBkQX6BEYNtY97jAsb7ULX/NOuF6qTPbpybqJn3siaP
        eD2uYvokqxFn1uMu5oUg76PGtAveSj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1673874757;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=YQ1YlOVInu6WsLhZgXbEIaFPrF+YO75TAo9I3Omn8lU=;
        b=YKR9ZNdxeA1F59bn4EWw8CGDO8y6VBcLVvAazzlL5QGqy3h8+ATlpHDblpJITTnrXS4Km0
        xUgsEi/Z9reSwIDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E2A3138FA;
        Mon, 16 Jan 2023 13:12:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CRPmBUVNxWNrNQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 13:12:37 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sam@ravnborg.org, daniel@ffwll.ch, airlied@gmail.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
Date:   Mon, 16 Jan 2023 14:12:13 +0100
Message-Id: <20230116131235.18917-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A lot of source files include drm_crtc_helper.h for its contained
include statements. This leads to excessive compile-time dependencies.

Where possible, remove the include statements for drm_crtc_helper.h
and include the required source files directly. Also remove the
include statements from drm_crtc_helper.h itself, which doesn't need
most of them.

I built this patchset on x86-64, aarch64 and arm. Hopefully I found
all include dependencies.

Thanks to Sam Ravnborg for bringing this to my attention.

Thomas Zimmermann (22):
  drm/amdgpu: Fix coding style
  drm: Remove unnecessary include statements for drm_crtc_helper.h
  drm/amdgpu: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/arm/komeda: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/aspeed: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/ast: Remove unnecessary include statements for drm_crtc_helper.h
  drm/bridge: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/gma500: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/i2c/ch7006: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/ingenic: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/kmb: Remove unnecessary include statements for drm_crtc_helper.h
  drm/logicvc: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/nouveau: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/radeon: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/rockchip: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/shmobile: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/sprd: Remove unnecessary include statements for drm_crtc_helper.h
  drm/sun4i: Remove unnecessary include statements for drm_crtc_helper.h
  drm/tidss: Remove unnecessary include statements for drm_crtc_helper.h
  drm/udl: Remove unnecessary include statements for drm_crtc_helper.h
  drm/vboxvideo: Remove unnecessary include statements for
    drm_crtc_helper.h
  drm/crtc-helper: Remove most include statements from drm_crtc_helper.h

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |  1 -
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |  1 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  2 ++
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |  1 -
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |  1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |  1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |  1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c            |  1 -
 drivers/gpu/drm/ast/ast_drv.c                      |  1 -
 drivers/gpu/drm/ast/ast_main.c                     |  1 -
 drivers/gpu/drm/ast/ast_mode.c                     |  1 -
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  1 -
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  1 -
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  1 -
 drivers/gpu/drm/bridge/ite-it6505.c                |  1 -
 drivers/gpu/drm/bridge/ite-it66121.c               |  1 -
 drivers/gpu/drm/bridge/tc358768.c                  |  1 -
 drivers/gpu/drm/bridge/tc358775.c                  |  1 -
 drivers/gpu/drm/drm_crtc_helper.c                  |  1 -
 drivers/gpu/drm/drm_lease.c                        |  2 +-
 drivers/gpu/drm/drm_plane_helper.c                 |  1 -
 drivers/gpu/drm/gma500/cdv_device.c                |  1 +
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |  2 ++
 drivers/gpu/drm/gma500/cdv_intel_display.c         |  1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |  1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |  2 ++
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |  2 ++
 drivers/gpu/drm/gma500/framebuffer.c               |  2 ++
 drivers/gpu/drm/gma500/gma_display.c               |  2 ++
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |  1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |  2 ++
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |  1 +
 drivers/gpu/drm/gma500/psb_device.c                |  1 +
 drivers/gpu/drm/gma500/psb_intel_display.c         |  3 +++
 drivers/gpu/drm/gma500/psb_intel_drv.h             |  1 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |  2 ++
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |  2 ++
 drivers/gpu/drm/i2c/ch7006_drv.c                   |  2 ++
 drivers/gpu/drm/i2c/ch7006_priv.h                  |  1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  1 -
 drivers/gpu/drm/kmb/kmb_crtc.c                     |  1 -
 drivers/gpu/drm/kmb/kmb_plane.c                    |  1 -
 drivers/gpu/drm/logicvc/logicvc_interface.c        |  1 -
 drivers/gpu/drm/logicvc/logicvc_mode.c             |  1 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |  1 +
 drivers/gpu/drm/nouveau/dispnv04/dac.c             |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c     |  1 -
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |  1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |  1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c              |  1 -
 drivers/gpu/drm/radeon/atombios_crtc.c             |  2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |  1 +
 drivers/gpu/drm/radeon/r300.c                      |  1 -
 drivers/gpu/drm/radeon/radeon_asic.c               |  1 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |  1 +
 drivers/gpu/drm/radeon/radeon_display.c            |  1 +
 drivers/gpu/drm/radeon/radeon_drv.c                |  1 -
 drivers/gpu/drm/radeon/radeon_encoders.c           |  1 -
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |  1 -
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_legacy_tv.c          |  1 -
 drivers/gpu/drm/radeon/radeon_mode.h               |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  1 -
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |  2 ++
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |  1 -
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |  1 -
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  1 -
 drivers/gpu/drm/sprd/sprd_drm.c                    |  1 -
 drivers/gpu/drm/sprd/sprd_dsi.c                    |  1 -
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |  2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  1 -
 drivers/gpu/drm/tidss/tidss_drv.c                  |  1 -
 drivers/gpu/drm/tidss/tidss_encoder.c              |  2 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |  1 -
 drivers/gpu/drm/tidss/tidss_plane.c                |  1 -
 drivers/gpu/drm/udl/udl_drv.c                      |  2 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |  1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c              |  1 -
 include/drm/drm_crtc_helper.h                      | 14 +++++++++-----
 include/drm/drm_fixed.h                            |  1 +
 94 files changed, 70 insertions(+), 70 deletions(-)


base-commit: 68d139b609a97a83e7c231189d4864aba4e1679b
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.39.0

