Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6B23E1C8C
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 21:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242509AbhHETVr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 15:21:47 -0400
Received: from aposti.net ([89.234.176.197]:54888 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242592AbhHETVm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 15:21:42 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     list@opendingux.net, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
Date:   Thu,  5 Aug 2021 21:21:09 +0200
Message-Id: <20210805192110.90302-3-paul@crapouillou.net>
In-Reply-To: <20210805192110.90302-1-paul@crapouillou.net>
References: <20210805192110.90302-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When the drivers of remote devices (e.g. HDMI chip) are disabled in the
config, we want the ingenic-drm driver to be able to probe nonetheless
with the other devices (e.g. internal LCD panel) that are enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index d261f7a03b18..5e1fdbb0ba6b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	for (i = 0; ; i++) {
 		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, i, &panel, &bridge);
 		if (ret) {
+			/*
+			 * Workaround for the case where the drivers for the
+			 * remote devices are not enabled. When that happens,
+			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
+			 * endlessly, which prevents the ingenic-drm driver from
+			 * working at all.
+			 */
+			if (ret == -EPROBE_DEFER) {
+				ret = driver_deferred_probe_check_state(dev);
+				if (ret == -ENODEV || ret == -ETIMEDOUT)
+					continue;
+			}
 			if (ret == -ENODEV)
 				break; /* we're done */
 			if (ret != -EPROBE_DEFER)
-- 
2.30.2

