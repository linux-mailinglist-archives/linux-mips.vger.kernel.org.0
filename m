Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BB134B6EE
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 12:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhC0L6O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 07:58:14 -0400
Received: from aposti.net ([89.234.176.197]:58582 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230322AbhC0L6N (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Mar 2021 07:58:13 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 2/3] drm/encoder: Add macro drmm_plain_encoder_alloc()
Date:   Sat, 27 Mar 2021 11:57:41 +0000
Message-Id: <20210327115742.18986-3-paul@crapouillou.net>
In-Reply-To: <20210327115742.18986-1-paul@crapouillou.net>
References: <20210327115742.18986-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This performs the same operation as drmm_encoder_alloc(), but
only allocates and returns a struct drm_encoder instance.

v4: Rename macro drmm_plain_encoder_alloc() and move to
    <drm/drm_encoder.h>. Since it's not "simple" anymore it
    will now take funcs/name arguments as well.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/drm/drm_encoder.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 5bf78b5bcb2b..6e91a0280f31 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -224,6 +224,24 @@ void *__drmm_encoder_alloc(struct drm_device *dev,
 				      offsetof(type, member), funcs, \
 				      encoder_type, name, ##__VA_ARGS__))
 
+/**
+ * drmm_plain_encoder_alloc - Allocate and initialize an encoder
+ * @dev: drm device
+ * @funcs: callbacks for this encoder (optional)
+ * @encoder_type: user visible type of the encoder
+ * @name: printf style format string for the encoder name, or NULL for default name
+ *
+ * This is a simplified version of drmm_encoder_alloc(), which only allocates
+ * and returns a struct drm_encoder instance, with no subclassing.
+ *
+ * Returns:
+ * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
+ */
+#define drmm_plain_encoder_alloc(dev, funcs, encoder_type, name, ...) \
+	((struct drm_encoder *) \
+	 __drmm_encoder_alloc(dev, sizeof(struct drm_encoder), \
+			      0, funcs, encoder_type, name, ##__VA_ARGS__))
+
 /**
  * drm_encoder_index - find the index of a registered encoder
  * @encoder: encoder to find index for
-- 
2.30.2

