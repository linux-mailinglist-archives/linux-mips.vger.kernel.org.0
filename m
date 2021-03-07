Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA48433048A
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 21:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbhCGU3B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 15:29:01 -0500
Received: from aposti.net ([89.234.176.197]:49564 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232858AbhCGU3B (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 15:29:01 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 0/5] Add option to mmap GEM buffers cached
Date:   Sun,  7 Mar 2021 20:28:30 +0000
Message-Id: <20210307202835.253907-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rework of my previous patchset which added support for GEM buffers
backed by non-coherent memory to the ingenic-drm driver.

Having GEM buffers backed by non-coherent memory is interesting in
the particular case where it is faster to render to a non-coherent
buffer then sync the data cache, than to render to a write-combine
buffer, and (by extension) much faster than using a shadow buffer.
This is true for instance on some Ingenic SoCs, where even simple
blits (e.g. memcpy) are about three times faster using this method.

For the record, the previous patchset was accepted for 5.10 then had
to be reverted, as it conflicted with some changes made to the DMA API.

This new patchset is pretty different as it adds the functionality to
the DRM core. The first three patches add variants to existing functions
but with the "non-coherent memory" twist, exported as GPL symbols. The
fourth patch adds a function to be used with the damage helpers.
Finally, the last patch adds support for non-coherent GEM buffers to the
ingenic-drm driver. The functionality is enabled through a module
parameter, and is disabled by default.

Cheers,
-Paul

Paul Cercueil (5):
  drm: Add and export function drm_gem_cma_create_noncoherent
  drm: Add and export function drm_gem_cma_dumb_create_noncoherent
  drm: Add and export function drm_gem_cma_mmap_noncoherent
  drm: Add and export function drm_gem_cma_sync_data
  drm/ingenic: Add option to alloc cached GEM buffers

 drivers/gpu/drm/drm_gem_cma_helper.c      | 223 +++++++++++++++++++---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  49 ++++-
 drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c     |  14 +-
 include/drm/drm_gem_cma_helper.h          |  13 ++
 5 files changed, 273 insertions(+), 30 deletions(-)

-- 
2.30.1

