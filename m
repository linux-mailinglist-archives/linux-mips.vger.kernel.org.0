Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2C866BF69
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jan 2023 14:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbjAPNP6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Jan 2023 08:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjAPNPf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Jan 2023 08:15:35 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4670B1D934;
        Mon, 16 Jan 2023 05:12:43 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E9D0D67777;
        Mon, 16 Jan 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1673874761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D+84Yocus/rHqFinyKAgXDadevtPY35U+9l3s56/nC4=;
        b=TAek5Ith12OIB3p1oT2YdarI2Rv8otFm9PfgTdOAT39TtOqKs7u3WEPR3Ti+93zI/IZkzp
        r3kVYHrDxzcZciGceYLUI/G1hDCNIFUrecJbq28iFhDerOoCAzeJfFMmDQ1/syvlL3991N
        4e5J2AkgnK7tXdFZhdNoFLIRBthSqKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1673874761;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D+84Yocus/rHqFinyKAgXDadevtPY35U+9l3s56/nC4=;
        b=5FTsz845/YgFtmhfN4xH7Znpuy6jxgLrk33mZcDjQOCW3Dac9vRz6bgac196Kq/3sQXlnf
        VIlsdTC7otIhMzBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA4B1139C3;
        Mon, 16 Jan 2023 13:12:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +PSPKElNxWNrNQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 13:12:41 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sam@ravnborg.org, daniel@ffwll.ch, airlied@gmail.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 15/22] drm/rockchip: Remove unnecessary include statements for drm_crtc_helper.h
Date:   Mon, 16 Jan 2023 14:12:28 +0100
Message-Id: <20230116131235.18917-16-tzimmermann@suse.de>
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
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8cecf81a5ae0..ba3b81789509 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -25,7 +25,6 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_flip_work.h>
 #include <drm/drm_framebuffer.h>
-- 
2.39.0

