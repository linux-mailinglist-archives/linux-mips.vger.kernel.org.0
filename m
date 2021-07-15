Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EA73C9C57
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 12:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241090AbhGOKFz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 06:05:55 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59564 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240948AbhGOKFz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 06:05:55 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 937582292E;
        Thu, 15 Jul 2021 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626343381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TTJiLS1SqZqXUpzarqa9iMdem2gom5jB+GbHREAEndo=;
        b=ompT4TVYfygAeL+16TklyknkJ3GUtUmDQsyogyYLrTVjJ2eL+yvX/rBf2atpPPjEuSq9Zk
        r1LEUKLtFlMOKIUHjQodm17AYdAsLNjTa5pF7GmkqLsTSmXG9AGl1Q8H4kbSSQsBPd9okJ
        e/DIBL6GeyeqIWr/wU0Nl3GVg27Phgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626343381;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TTJiLS1SqZqXUpzarqa9iMdem2gom5jB+GbHREAEndo=;
        b=F5iMgUiYf/qaamh8p7kjtDd9iEeEXzwij4iXp+hEdkw3P7nMlKAvs0+1HQ/rjYeBu7iIAz
        Nmxwvqet7ihLpADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 634FD13C31;
        Thu, 15 Jul 2021 10:03:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id XlNAF9UH8GCMEQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 10:03:01 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     paul@crapouillou.net, airlied@linux.ie, daniel@ffwll.ch,
        sam@ravnborg.org
Cc:     linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm/ingenic: Convert to Linux IRQ interfaces
Date:   Thu, 15 Jul 2021 12:02:58 +0200
Message-Id: <20210715100258.6638-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

This patch also fixes a bug where the driver didn't release the
IRQ.

v2:
	* automatically release IRQ via devm_request_irq() (Paul)
	* mention the bugfix (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index c296472164d9..857ed070b21b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -33,7 +33,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -799,8 +798,6 @@ static const struct drm_driver ingenic_drm_driver_data = {
 	.fops			= &ingenic_drm_fops,
 	.gem_create_object	= ingenic_drm_gem_create_object,
 	DRM_GEM_CMA_DRIVER_OPS,
-
-	.irq_handler		= ingenic_drm_irq_handler,
 };
 
 static const struct drm_plane_funcs ingenic_drm_primary_plane_funcs = {
@@ -1098,7 +1095,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		encoder->possible_clones = clone_mask;
 	}
 
-	ret = drm_irq_install(drm, irq);
+	ret = devm_request_irq(dev, irq, ingenic_drm_irq_handler, 0, drm->driver->name, drm);
 	if (ret) {
 		dev_err(dev, "Unable to install IRQ handler\n");
 		return ret;
-- 
2.32.0

