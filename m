Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3981C66BF6F
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jan 2023 14:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbjAPNQE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Jan 2023 08:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjAPNPf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Jan 2023 08:15:35 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796DF1D935;
        Mon, 16 Jan 2023 05:12:43 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3A9426777E;
        Mon, 16 Jan 2023 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1673874762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kJ/7xrLP5uwWcMX3PN81GVaMZX3B0DkAS43Dtz5uzYw=;
        b=aTzNlmo9z+ymdLwIq1sSKww7fRmnCdFiJLYN93Wa/oQ/hlf5wYjffFWZoLQA8s5tQP65bJ
        U/Zyu8lBU/GNt58tc+3pA7ZCYAmYA5XnFwvW/+8mUxTl7Yg65YnfoWRKSh7OhadMyOMAR4
        aVhBd7PSM7aNG659m65d4NxYv3CHWxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1673874762;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kJ/7xrLP5uwWcMX3PN81GVaMZX3B0DkAS43Dtz5uzYw=;
        b=7v5IVaymjuUO685jQmpDV8F1Lo7g091cuLdYqg42SxXejuSw0q8mf7OVFzbhqTZma+f9iq
        4zS4OQqm27FoMFBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDBF0138FA;
        Mon, 16 Jan 2023 13:12:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +NIFOUlNxWNrNQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 13:12:41 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sam@ravnborg.org, daniel@ffwll.ch, airlied@gmail.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 16/22] drm/shmobile: Remove unnecessary include statements for drm_crtc_helper.h
Date:   Mon, 16 Jan 2023 14:12:29 +0100
Message-Id: <20230116131235.18917-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116131235.18917-1-tzimmermann@suse.de>
References: <20230116131235.18917-1-tzimmermann@suse.de>
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

Several source files include drm_crtc_helper.h without needing it or
only to get its transitive include statements; leading to unnecessary
compile-time dependencies.

Directly include required headers and drop drm_crtc_helper.h where
possible.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 2 ++
 drivers/gpu/drm/shmobile/shmob_drm_drv.c   | 1 -
 drivers/gpu/drm/shmobile/shmob_drm_plane.c | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 4624c0aff51f..d354ab3077ce 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -16,6 +16,8 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 337040fa6438..faacfee24763 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -15,7 +15,6 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
index 6c5f0cbe7d95..604ae23825da 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -8,7 +8,6 @@
  */
 
 #include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-- 
2.39.0

