Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A462614FB41
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2020 03:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgBBCiT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Feb 2020 21:38:19 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:40180 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgBBCiT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Feb 2020 21:38:19 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id C87F129AFA; Sat,  1 Feb 2020 21:38:15 -0500 (EST)
Message-Id: <cover.1580610812.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 0/3] Improve MIPS Magnum support
Date:   Sun, 02 Feb 2020 13:33:32 +1100
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bartlomiej Zolnierkiewicz" <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A few minor patches are needed to more easily boot a MIPS Magnum build
under 'qemu-system-mips64el -M magnum'. This series fixes a build failure
in the g364fb driver and modifies jazz_defconfig for use with QEMU.

Note that QEMU's dp8393x implementation has bugs, one of which prevents
the Linux jazzsonic driver from probing the chip. I have fixed the bugs
that I know of in a series of patches at,
https://github.com/fthain/qemu/commits/sonic


Finn Thain (3):
  fbdev/g364fb: Fix build failure
  mips/jazz: Remove redundant settings and shrink jazz_defconfig
  mips/jazz: Update jazz_defconfig for MIPS Magnum

 arch/mips/configs/jazz_defconfig | 267 ++-----------------------------
 drivers/video/fbdev/g364fb.c     |  29 +---
 2 files changed, 15 insertions(+), 281 deletions(-)

-- 
2.24.1

