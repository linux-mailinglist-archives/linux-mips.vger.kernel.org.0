Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCBC6180EC
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 16:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbiKCPOz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 11:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbiKCPOw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 11:14:52 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C00165B1;
        Thu,  3 Nov 2022 08:14:52 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 97A1F1F8AC;
        Thu,  3 Nov 2022 15:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1667488490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uVFjCJGoNw4AfgA4Wmezl+t3QboOrXGyxnyiCXI4wgY=;
        b=aeitxOzIfZfT9Dkg3Da9tXRthbRhimHuVy9WXpetW5HFYCVf9XNDxHwWQKoTcjy5rUDVTf
        T8vGhO0LviIspWzGSdxZXQhxZhS06j+XUc8qb4+FqFgvFLsaN1sUUalnSyudvRe2x6zPXE
        IZ9De10TJD23YVpx9fDJjyqhcg3WM+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1667488490;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uVFjCJGoNw4AfgA4Wmezl+t3QboOrXGyxnyiCXI4wgY=;
        b=YMFXnRboIun21V1JVenmGaFy/T7fqydIIheoE7IDub++43bUFId0c4nXqptJxELAHV4w58
        v5yHUKBLT2Df2NDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11CBE13AAF;
        Thu,  3 Nov 2022 15:14:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wOZpA+raY2PBGgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 03 Nov 2022 15:14:50 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
        javierm@redhat.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     "linux-hyperv@vger.kernel.orglinux-hyperv"@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 02/23] drm/mcde: Don't set struct drm_driver.lastclose
Date:   Thu,  3 Nov 2022 16:14:25 +0100
Message-Id: <20221103151446.2638-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221103151446.2638-1-tzimmermann@suse.de>
References: <20221103151446.2638-1-tzimmermann@suse.de>
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

Don't set struct drm_driver.lastclose. It's used to restore the
fbdev console. But as mcde uses generic fbdev emulation, the
console is being restored by the DRM client helpers already. See
the call to drm_client_dev_restore() in drm_lastclose().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 1c4482ad507d9..38c3907bb151a 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -203,7 +203,6 @@ DEFINE_DRM_GEM_DMA_FOPS(drm_fops);
 static const struct drm_driver mcde_drm_driver = {
 	.driver_features =
 		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
-	.lastclose = drm_fb_helper_lastclose,
 	.ioctls = NULL,
 	.fops = &drm_fops,
 	.name = "mcde",
-- 
2.38.0

