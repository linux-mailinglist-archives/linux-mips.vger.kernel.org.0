Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0460334B6E7
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 12:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhC0L6A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 07:58:00 -0400
Received: from aposti.net ([89.234.176.197]:58512 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230322AbhC0L6A (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Mar 2021 07:58:00 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 0/3] Fixes to bridge/panel and ingenic-drm
Date:   Sat, 27 Mar 2021 11:57:39 +0000
Message-Id: <20210327115742.18986-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This is the V4 of my patchset that attempts to fix use-after-free errors
in bridge/panel.c and in the ingenic-drm driver.

Changes from v3:
- [1/3]: the code now checks (connector->dev) instead of
  (!!panel_bridge->connector.dev)
- [2/3]: the macro is now called drmm_plain_encoder_alloc(), and moved
  to <drm/drm_encoder.h>. It also takes funcs/name parameters to be more
  similar to drmm_encoder_alloc(), although these parameters can very
  well be NULL.
- [3/3] uses the new macro.

V3 had a 4th patch, which was already applied as it received a
reviewed-by tag and could be applied independently.

Cheers,
-Paul

Paul Cercueil (3):
  drm: bridge/panel: Cleanup connector on bridge detach
  drm/encoder: Add macro drmm_plain_encoder_alloc()
  drm/ingenic: Register devm action to cleanup encoders

 drivers/gpu/drm/bridge/panel.c            | 12 ++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 17 +++++++----------
 include/drm/drm_encoder.h                 | 18 ++++++++++++++++++
 3 files changed, 37 insertions(+), 10 deletions(-)

-- 
2.30.2

