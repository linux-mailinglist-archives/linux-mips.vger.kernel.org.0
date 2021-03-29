Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2031334D64E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 19:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhC2Rve (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 13:51:34 -0400
Received: from aposti.net ([89.234.176.197]:38800 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhC2RvF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 13:51:05 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simon Ser <contact@emersion.fr>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/2] drm/ingenic: IPU plane fixes
Date:   Mon, 29 Mar 2021 18:50:44 +0100
Message-Id: <20210329175046.214629-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

A set of two fixes for the IPU plane of the ingenic-drm driver.

Patch [1/2] changes the type of the IPU plane from PRIMARY to OVERLAY,
since there can only be one PRIMARY plane per CRTC.

Patch [2/2] enforces that a full modeset is only performed when the
"sharpness" property is modified.

Cheers,
-Paul

Paul Cercueil (2):
  drm/ingenic: Switch IPU plane to type OVERLAY
  drm/ingenic: Don't request full modeset if property is not modified

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 11 +++++------
 drivers/gpu/drm/ingenic/ingenic-ipu.c     |  6 ++++--
 2 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.30.2

