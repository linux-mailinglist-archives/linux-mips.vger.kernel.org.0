Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C938E3E96B1
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 19:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhHKRXl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 13:23:41 -0400
Received: from aposti.net ([89.234.176.197]:37416 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhHKRXl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Aug 2021 13:23:41 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 0/6] drm/ingenic: Various improvements v2
Date:   Wed, 11 Aug 2021 19:23:03 +0200
Message-Id: <20210811172309.314287-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

A V2 of my patchset for the ingenic-drm driver.

The patches "drm/ingenic: Remove dead code" and
"drm/ingenic: Use standard drm_atomic_helper_commit_tail"
that were present in V1 have been merged in drm-misc-next,
so they are not in this V2.

Changelog:

[PATCH 1/6]:
    dma_hwdesc_addr() extended to support palette hwdesc. The palette
    hwdesc is now hwdesc[3] to simplify things. Add
    ingenic_drm_configure_hwdesc*() functions to factorize code.

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
2.30.2

