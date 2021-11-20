Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356E3457C69
	for <lists+linux-mips@lfdr.de>; Sat, 20 Nov 2021 08:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbhKTICs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Nov 2021 03:02:48 -0500
Received: from ptr.189.cn ([183.61.185.103]:11437 "EHLO 189.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229671AbhKTICs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 20 Nov 2021 03:02:48 -0500
HMM_SOURCE_IP: 10.64.8.43:38516.358279549
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id 8086D1001F1;
        Sat, 20 Nov 2021 15:59:28 +0800 (CST)
Received: from  ([14.17.101.177])
        by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id e7ae1f5f468b4f0e85c4a5c90e49ab27 for l.stach@pengutronix.de;
        Sat, 20 Nov 2021 15:59:30 CST
X-Transaction-ID: e7ae1f5f468b4f0e85c4a5c90e49ab27
X-Real-From: 15330273260@189.cn
X-Receive-IP: 14.17.101.177
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
From:   Sui Jingfeng <15330273260@189.cn>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Qing Zhang <zhangqing@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Xiaochuan Mao <maoxiaochuan@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: drm/etnaviv: add pci device driver support for gpu in LS7A1000 and LS2K1000
Date:   Sat, 20 Nov 2021 15:59:22 +0800
Message-Id: <20211120075926.2671-1-15330273260@189.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

  There is a Vivante GC1000 V5037 in LS2K1000 and LS7A1000,
  the gpu is a PCI device and it have 2D and 3D in the same core.
  Therefore, this patch try to provide PCI device driver wrapper
  for it by mimic the platform counterpart.

  LS7A1000 is a bridge chip, this bridge chip typically use
  with LS3A4000 (4 core 1.8gHz, Mips64r5) and LS3A5000 (4 core
  loongarch 2.5Ghz). While LS2K1000 is a double core 1.0Ghz
  Mips64r2 SoC.

  loongson CPU's cache coherency is maintained by the hardware.

  Both LS7A1000 and LS2K1000 have a display controller integrated,
  named lsdc. The drm driver of this display controller is not
  upstream yet, but we have a demo version and it works.
  By using KMS-RO framework, lsdc and gc1000 made a compatible pair.

suijingfeng (4):
  dt-bindings: ls2k1000: add gpu device node
  drm/etnaviv: add pci device driver support
  loongson3_defconfig: enable etnaviv drm driver on default
  loongson2_defconfig: enable etnaviv drm driver on default

 .../boot/dts/loongson/loongson64-2k1000.dtsi  |  11 +
 arch/mips/configs/loongson2k_defconfig        |   1 +
 arch/mips/configs/loongson3_defconfig         |   1 +
 drivers/gpu/drm/etnaviv/Kconfig               |  12 ++
 drivers/gpu/drm/etnaviv/Makefile              |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 113 +++++++---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   8 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  28 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  94 +++++---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |   6 +
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c     | 203 ++++++++++++++++++
 include/uapi/drm/etnaviv_drm.h                |  11 +-
 12 files changed, 422 insertions(+), 68 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c

-- 
2.20.1

