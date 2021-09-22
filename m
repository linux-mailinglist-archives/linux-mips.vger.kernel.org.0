Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0060415227
	for <lists+linux-mips@lfdr.de>; Wed, 22 Sep 2021 22:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237972AbhIVU5v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Sep 2021 16:57:51 -0400
Received: from aposti.net ([89.234.176.197]:47210 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238063AbhIVU5d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Sep 2021 16:57:33 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-mips@vger.kernel.org, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 0/6] drm/ingenic: Various improvements v3
Date:   Wed, 22 Sep 2021 21:55:49 +0100
Message-Id: <20210922205555.496871-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

A V3 of my patchset for the ingenic-drm driver.

The patches "drm/ingenic: Remove dead code" and
"drm/ingenic: Use standard drm_atomic_helper_commit_tail"
that were present in V1 have been merged in drm-misc-next,
so they are not in this V3.

Changelog since V2:

[PATCH 5/6]:
    Fix ingenic_drm_get_new_priv_state() called instead of
    ingenic_drm_get_priv_state()

Cheers,
-Paul

Paul Cercueil (6):
  drm/ingenic: Simplify code by using hwdescs array
  drm/ingenic: Add support for private objects
  drm/ingenic: Move IPU scale settings to private state
  drm/ingenic: Set DMA descriptor chain register when starting CRTC
  drm/ingenic: Upload palette before frame
  drm/ingenic: Attach bridge chain to encoders

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 278 +++++++++++++++++-----
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 127 ++++++++--
 2 files changed, 333 insertions(+), 72 deletions(-)

-- 
2.33.0

