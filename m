Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1F13E1C85
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 21:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242553AbhHETVb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 15:21:31 -0400
Received: from aposti.net ([89.234.176.197]:54850 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242531AbhHETVa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 15:21:30 -0400
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
Subject: [PATCH 0/2] gpu/drm: ingenic: Handle disabled drivers
Date:   Thu,  5 Aug 2021 21:21:07 +0200
Message-Id: <20210805192110.90302-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

A small patchset to make sure that the ingenic-drm driver won't fail to
probe if an optional device (e.g. HDMI chip) has its driver disabled in
the kernel config.

Since most of the boards using the ingenic-drm driver have a LCD panel
attached, the drivers for external devices (be it a HDMI transmitter or
a TV encoder) really are optional and shouldn't prevent the DRM driver
from probing.

Cheers,
-Paul

Paul Cercueil (2):
  drivers core: Export driver_deferred_probe_check_state()
  gpu/drm: ingenic: Add workaround for disabled drivers

 drivers/base/dd.c                         |  1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.30.2

