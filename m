Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2523BC767
	for <lists+linux-mips@lfdr.de>; Tue,  6 Jul 2021 09:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhGFHqv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 03:46:51 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:54992 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhGFHqu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 03:46:50 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5C5A81FF25;
        Tue,  6 Jul 2021 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1625557451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=VKVOGHuEAlOsw7PB8kP5M02bNzlLbAmjcNjAcjaCAUE=;
        b=Ah4rdhnkyd8mVv1PXZUbhXuglU7dyoxT/vMJQvSsrxOyIaAQ5uVQuQp3dzycYKunp7N5tO
        Pf/uEb9sFDwoEBO5HpDtY6dEjl3ZlkUtJ2ivDHnl1OG58uzbpjJ2FeyHiGifmsCkWWciT9
        eNzSRINdVHeGVUEVXfvlWPJc9txQ9p0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1625557451;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=VKVOGHuEAlOsw7PB8kP5M02bNzlLbAmjcNjAcjaCAUE=;
        b=M/ex3Urk71faGuM90e6Hmzb0wv14ruPHFXUhisXEI+PSezykeMvvqTitzTfuEn/THHyuPD
        7npVUsvKxSck9XDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3131C13A42;
        Tue,  6 Jul 2021 07:44:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8UPVCssJ5GD/bAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:44:11 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     paul@crapouillou.net, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/ingenic: Convert to Linux IRQ interfaces
Date:   Tue,  6 Jul 2021 09:44:09 +0200
Message-Id: <20210706074409.8664-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
don't benefit from using it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index c296472164d9..a09b7da21b53 100644
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
+	ret = request_irq(irq, ingenic_drm_irq_handler, 0, drm->driver->name, drm);
 	if (ret) {
 		dev_err(dev, "Unable to install IRQ handler\n");
 		return ret;
@@ -1192,14 +1189,18 @@ static void ingenic_drm_unbind(struct device *dev)
 {
 	struct ingenic_drm *priv = dev_get_drvdata(dev);
 	struct clk *parent_clk = clk_get_parent(priv->pix_clk);
+	struct drm_device *drm = &priv->drm;
+	struct platform_device *pdev = to_platform_device(drm->dev);
+
+	free_irq(platform_get_irq(pdev, 0), drm);
 
 	clk_notifier_unregister(parent_clk, &priv->clock_nb);
 	if (priv->lcd_clk)
 		clk_disable_unprepare(priv->lcd_clk);
 	clk_disable_unprepare(priv->pix_clk);
 
-	drm_dev_unregister(&priv->drm);
-	drm_atomic_helper_shutdown(&priv->drm);
+	drm_dev_unregister(drm);
+	drm_atomic_helper_shutdown(drm);
 }
 
 static const struct component_master_ops ingenic_master_ops = {
-- 
2.32.0

