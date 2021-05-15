Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF8D381970
	for <lists+linux-mips@lfdr.de>; Sat, 15 May 2021 16:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhEOOzZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 May 2021 10:55:25 -0400
Received: from aposti.net ([89.234.176.197]:58354 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231386AbhEOOzY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 15 May 2021 10:55:24 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 0/3] Add option to mmap GEM buffers cached
Date:   Sat, 15 May 2021 15:53:56 +0100
Message-Id: <20210515145359.64802-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rework of this morning's v3 patchset.

The drm_gem_cma_prime_mmap() function that was added in v3 is now
replaced, instead we pass a "private" parameter to the
__drm_gem_cma_create() function.

Patches 2/3 and 3/3 are unmodified since v3.

Cheers,
-Paul

Paul Cercueil (3):
  drm: Add support for GEM buffers backed by non-coherent memory
  drm: Add and export function drm_gem_cma_sync_data
  drm/ingenic: Add option to alloc cached GEM buffers

 drivers/gpu/drm/drm_gem_cma_helper.c      | 93 ++++++++++++++++++++---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 56 +++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 18 ++++-
 include/drm/drm_gem_cma_helper.h          |  8 ++
 4 files changed, 160 insertions(+), 15 deletions(-)

-- 
2.30.2

