Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D804643B920
	for <lists+linux-mips@lfdr.de>; Tue, 26 Oct 2021 20:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238106AbhJZSPR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Oct 2021 14:15:17 -0400
Received: from aposti.net ([89.234.176.197]:40196 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238100AbhJZSPQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Oct 2021 14:15:16 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [RESEND PATCH v3 0/6] drm/ingenic: Various improvements v3
Date:   Tue, 26 Oct 2021 19:12:34 +0100
Message-Id: <20211026181240.213806-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

I resend the V3 of my patchset for drm/ingenic, verbatim.

The previous submission of my V3 received a lot of replies, but none of
these replies were actually talking about the patches themselves.

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

