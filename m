Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF98E154F38
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 00:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgBFXGy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Feb 2020 18:06:54 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:45226 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgBFXGx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 18:06:53 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id EB04229A99; Thu,  6 Feb 2020 18:06:52 -0500 (EST)
Message-Id: <cover.1581030073.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 0/3] Improve MIPS Magnum support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date:   Fri, 07 Feb 2020 10:01:13 +1100
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bartlomiej Zolnierkiewicz" <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A few minor patches are needed to more easily boot a MIPS Magnum build
under QEMU. This series fixes a build failure in the g364fb driver and
modifies jazz_defconfig for use with 'qemu-system-mips64el -M magnum'.

Note that QEMU's dp8393x implementation has bugs, one of which prevents
the Linux jazzsonic driver from probing the chip. I have fixed the bugs
that I know of in a series of patches at,
https://github.com/fthain/qemu/commits/sonic

Changed since v1:
 - Added reviewed-by and tested-by tags from Philippe Mathieu-Daudé.
 - Rebased.


Finn Thain (3):
  fbdev/g364fb: Fix build failure
  mips/jazz: Remove redundant settings and shrink jazz_defconfig
  mips/jazz: Update jazz_defconfig for MIPS Magnum

 arch/mips/configs/jazz_defconfig | 267 ++-----------------------------
 drivers/video/fbdev/g364fb.c     |  29 +---
 2 files changed, 15 insertions(+), 281 deletions(-)

-- 
2.24.1

