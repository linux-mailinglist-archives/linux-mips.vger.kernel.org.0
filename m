Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7CD38DC06
	for <lists+linux-mips@lfdr.de>; Sun, 23 May 2021 19:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbhEWRGB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 23 May 2021 13:06:01 -0400
Received: from aposti.net ([89.234.176.197]:50352 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231828AbhEWRGA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 23 May 2021 13:06:00 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 0/3] Add option to mmap GEM buffers cached
Date:   Sun, 23 May 2021 18:04:12 +0100
Message-Id: <20210523170415.90410-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

V5 of my patchset which adds the option for having GEM buffers backed by
non-coherent memory.

Changes from V4:

- [2/3]: 
    - Rename to drm_fb_cma_sync_non_coherent
    - Invert loops for better cache locality
    - Only sync BOs that have the non-coherent flag
    - Properly sort includes
    - Move to drm_fb_cma_helper.c to avoid circular dependency

- [3/3]:
    - Fix drm_atomic_get_new_plane_state() used to retrieve the old
      state
    - Use custom drm_gem_fb_create()
    - Only check damage clips and sync DMA buffers if non-coherent
      buffers are used

Cheers,
-Paul

Paul Cercueil (3):
  drm: Add support for GEM buffers backed by non-coherent memory
  drm: Add and export function drm_fb_cma_sync_non_coherent
  drm/ingenic: Add option to alloc cached GEM buffers

 drivers/gpu/drm/drm_fb_cma_helper.c       | 46 ++++++++++++++++++
 drivers/gpu/drm/drm_gem_cma_helper.c      | 38 +++++++++++----
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 59 +++++++++++++++++++++--
 drivers/gpu/drm/ingenic/ingenic-drm.h     |  1 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 21 ++++++--
 include/drm/drm_fb_cma_helper.h           |  4 ++
 include/drm/drm_gem_cma_helper.h          |  3 ++
 7 files changed, 156 insertions(+), 16 deletions(-)

-- 
2.30.2

