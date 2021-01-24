Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF05301ABB
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 09:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbhAXI4y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 03:56:54 -0500
Received: from aposti.net ([89.234.176.197]:43562 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726206AbhAXI4q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 03:56:46 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        od@zcrc.me, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 0/4] Fixes to bridge/panel and ingenic-drm
Date:   Sun, 24 Jan 2021 08:55:48 +0000
Message-Id: <20210124085552.29146-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Here are three independent fixes. The first one addresses a
use-after-free in bridge/panel.c; the second one addresses a
use-after-free in the ingenic-drm driver; finally, the third one makes
the ingenic-drm driver work again on older Ingenic SoCs.

Changes from v2:
- patch [1/4] added a FIXME.
- patch [2/4] is new. It introduces a drmm_plain_simple_encoder_alloc()
  macro that will be used in patch [3/4].
- patch [3/4] uses the macro introduced in patch [2/4].
- patch [4/4] is unmodified.

Note to linux-stable guys: patch [v2 2/3] will only apply on the current
drm-misc-next branch, to fix it for v5.11 and older kernels, use the V1
of that patch.

Cheers,
-Paul

Paul Cercueil (4):
  drm: bridge/panel: Cleanup connector on bridge detach
  drm/simple_kms_helper: Add macro drmm_plain_simple_encoder_alloc()
  drm/ingenic: Register devm action to cleanup encoders
  drm/ingenic: Fix non-OSD mode

 drivers/gpu/drm/bridge/panel.c            | 12 +++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 26 +++++++++++------------
 include/drm/drm_simple_kms_helper.h       | 17 +++++++++++++++
 3 files changed, 42 insertions(+), 13 deletions(-)

-- 
2.29.2

