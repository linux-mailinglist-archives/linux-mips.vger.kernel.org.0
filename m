Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50A90381181
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 22:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbhENUNE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 16:13:04 -0400
Received: from aposti.net ([89.234.176.197]:49208 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229681AbhENUND (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 May 2021 16:13:03 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>, od@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 0/3] Add option to mmap GEM buffers cached
Date:   Fri, 14 May 2021 21:11:35 +0100
Message-Id: <20210514201138.162230-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

oRework of my previous patchset which added support for GEM buffers
backed by non-coherent memory to the ingenic-drm driver.

Having GEM buffers backed by non-coherent memory is interesting in
the particular case where it is faster to render to a non-coherent
buffer then sync the data cache, than to render to a write-combine
buffer, and (by extension) much faster than using a shadow buffer.
This is true for instance on some Ingenic SoCs, where even simple
blits (e.g. memcpy) are about three times faster using this method.

For the record, a previous patchset was accepted for 5.10 then had
to be reverted, as it conflicted with some changes made to the DMA API.

The first two patches add support for cached GEM buffers in the DRM
core, the third patch adds support for this functionality in the
ingenic-drm driver for the JZ4770 SoC.

Cheers,
-Paul


Paul Cercueil (3):
  drm: Add support for GEM buffers backed by non-coherent memory
  drm: Add and export function drm_gem_cma_sync_data
  drm/ingenic: Add option to alloc cached GEM buffers

 drivers/gpu/drm/drm_gem_cma_helper.c      | 96 ++++++++++++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 56 ++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 18 ++++-
 include/drm/drm_gem_cma_helper.h          | 12 ++-
 4 files changed, 171 insertions(+), 11 deletions(-)

-- 
2.30.2

