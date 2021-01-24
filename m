Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F185A301AC2
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 09:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbhAXI6h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 03:58:37 -0500
Received: from aposti.net ([89.234.176.197]:43698 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbhAXI6a (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 03:58:30 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        od@zcrc.me, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 2/4] drm/simple_kms_helper: Add macro drmm_plain_simple_encoder_alloc()
Date:   Sun, 24 Jan 2021 08:55:50 +0000
Message-Id: <20210124085552.29146-3-paul@crapouillou.net>
In-Reply-To: <20210124085552.29146-1-paul@crapouillou.net>
References: <20210124085552.29146-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This performs the same operation as drmm_simple_encoder_alloc(), but
only allocates and returns a struct drm_encoder instance.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/drm/drm_simple_kms_helper.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index e6dbf3161c2f..f07e70303cfb 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -209,4 +209,21 @@ void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 					     offsetof(type, member), \
 					     encoder_type))
 
+/**
+ * drmm_plain_simple_encoder_alloc - Allocate and initialize a drm_encoder
+ *                                   struct with basic functionality.
+ * @dev: drm device
+ * @encoder_type: user visible type of the encoder
+ *
+ * This performs the same operation as drmm_simple_encoder_alloc(), but
+ * only allocates and returns a struct drm_encoder instance.
+ *
+ * Returns:
+ * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
+ */
+#define drmm_plain_simple_encoder_alloc(dev, encoder_type) \
+	((struct drm_encoder *) \
+	 __drmm_simple_encoder_alloc(dev, sizeof(struct drm_encoder), \
+				     0, encoder_type))
+
 #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */
-- 
2.29.2

