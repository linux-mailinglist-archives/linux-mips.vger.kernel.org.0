Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343912FB907
	for <lists+linux-mips@lfdr.de>; Tue, 19 Jan 2021 15:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732504AbhASORO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Jan 2021 09:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732576AbhASJW0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Jan 2021 04:22:26 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A981C0613C1
        for <linux-mips@vger.kernel.org>; Tue, 19 Jan 2021 01:21:46 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCq-00EDvb-IR
        for linux-mips@vger.kernel.org; Tue, 19 Jan 2021 10:21:44 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCP-00EDri-E3; Tue, 19 Jan 2021 10:21:17 +0100
Received: from bert by sumner.biot.com with local (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCO-000mDG-V7; Tue, 19 Jan 2021 10:21:16 +0100
From:   Bert Vermeulen <bert@biot.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        John Crispin <john@phrozen.org>,
        Birger Koblitz <mail@birger-koblitz.de>
Cc:     Bert Vermeulen <bert@biot.com>
Subject: [PATCH v4 0/5] Add support for Realtek RTL838x/RTL839x switch SoCs
Date:   Tue, 19 Jan 2021 10:21:04 +0100
Message-Id: <20210119092109.185282-1-bert@biot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v4:
- Device tree bindings for SoC in separate patch.
- Removed ioremap.h, and declare physical address bases in device tree.

v3:
- all code removed, the base system is now only device tree files and docs
   and some build config.
- ioremap.h restored to the v1 version, with hardcoded I/O ranges, since I
   got flak on changing that as suggested. This brings it in line with other
   systems in arch/mips/generic.

v2:
- Removed all new arch/mips/ code, using arch/mips/generic/ instead.
- Use device tree ranges instead of hardcoded addresses for ioremap.
- Moved IRQ driver to drivers/irqchip/
- Removed reset handling code, will be replaced by device tree config.
- All SoC family id code moved to new soc driver.
- Header moved to realtek/ instead of mach-realtek/
- As more of the base system now depends on device tree, a sample
  dts for the Cisco SG220-26 switch is included. This will be further
  filled out, and bindings documented, as drivers get merged.

Bert Vermeulen (5):
  dt-bindings: mips: Add support for RTL83xx SoC series
  Add support for Realtek RTL838x/RTL839x switch SoCs
  MIPS: Add Realtek RTL838x/RTL839x support as generic MIPS system
  dt-bindings: Add Cisco prefix to vendor list
  mips: dts: Add support for Cisco SG220-26 switch

 .../devicetree/bindings/mips/realtek-rtl.yaml | 24 ++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/mips/Kconfig                             | 31 ++++++++++
 arch/mips/boot/dts/Makefile                   |  1 +
 arch/mips/boot/dts/realtek/Makefile           |  2 +
 arch/mips/boot/dts/realtek/cisco_sg220-26.dts | 25 ++++++++
 arch/mips/boot/dts/realtek/rtl838x.dtsi       | 21 +++++++
 arch/mips/boot/dts/realtek/rtl83xx.dtsi       | 59 +++++++++++++++++++
 8 files changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/realtek-rtl.yaml
 create mode 100644 arch/mips/boot/dts/realtek/Makefile
 create mode 100644 arch/mips/boot/dts/realtek/cisco_sg220-26.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl838x.dtsi
 create mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi

-- 
2.25.1

