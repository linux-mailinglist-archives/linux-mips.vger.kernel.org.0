Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBCE196EF1
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbgC2Rij (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:38:39 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121]:30757 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgC2Rii (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503516;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=R1w1keMan8GZ4iGSxV6rA+DYe4euaOTpkYDsZPH99so=;
        b=m0QHDHF+15VNDxx9/hyYLn/SoIrHayXduQtb1eeutSTZUM7Ua9CSpIr24HK5p59Q1x
        4LvKWd9nF7XrMv4h6YDbtpIHQDQ0fL4Bd401/cBVyLUKQ+S8f2Qa6/M5Ws6xguz8wGti
        9DUlfDO2gwOaJTwriHFaq0NtajlwezlFihL+kN7vQvMWpWByDVhYRu58J5pbNrxyWdt1
        vCVPyZzWKAnMjglPCOIsoZGtNTMb4DcpE1dwjd6+jTAPlrkPN8GNe1LKZPX/wr8AqntI
        WhIdqSJq73RIrM5AakSkxulKVdnrYmb7zjpuDLdoE6CsDV3sQ2H3Cg/U0MzCLBcWaDm4
        7eMQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THcQBMi
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:38:26 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v5 0/8] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Date:   Sun, 29 Mar 2020 19:38:18 +0200
Message-Id: <cover.1585503505.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* reworked YAML bindings to pass dt_binding_check and be better grouped
* rename all nodes to "gpu: gpu@<address>"
* removed "img,sgx5" from example - suggested by Rob Herring <robh+dt@kernel.org>

PATCH V4 2019-12-17 19:02:11:
* MIPS: DTS: jz4780: removed "img,sgx5" from bindings
* YAML bindings: updated according to suggestions by Rob Herring
* MIPS: DTS: jz4780: insert-sorted gpu node by register address - suggested by Paul Cercueil

PATCH V3 2019-11-24 12:40:33:
* reworked YAML format with help by Rob Herring
* removed .txt binding document
* change compatible "ti,am335x-sgx" to "ti,am3352-sgx" - suggested by Tony Lindgren

PATCH V2 2019-11-07 12:06:17:
* tried to convert bindings to YAML format - suggested by Rob Herring
* added JZ4780 DTS node (proven to load the driver)
* removed timer and img,cores properties until we know we really need them - suggested by Rob Herring

PATCH V1 2019-10-18 20:46:35:

This patch series defines child nodes for the SGX5xx interface inside
different SoC so that a driver can be found and probed by the
compatible strings and can retrieve information about the SGX revision
that is included in a specific SoC. It also defines the interrupt number
to be used by the SGX driver.

There is currently no mainline driver for these GPUs, but a project [1]
is ongoing with the goal to get the open-source part as provided by TI/IMG
and others into drivers/gpu/drm/pvrsgx.

The kernel modules built from this project have successfully demonstrated
to work with the DTS definitions from this patch set on AM335x BeagleBone
Black, DM3730 and OMAP5 Pyra and Droid 4. They partially work on OMAP3530 and
PandaBoard ES but that is likely a problem in the kernel driver or the
(non-free) user-space libraries and binaries.

Wotk for JZ4780 (CI20 board) is in progress and there is potential to extend
this work to e.g. BananaPi-M3 (A83) and  some Intel Poulsbo and CedarView
devices.

[1]: https://github.com/openpvrsgx-devgroup


H. Nikolaus Schaller (8):
  dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
  ARM: DTS: am33xx: add sgx gpu child node
  ARM: DTS: am3517: add sgx gpu child node
  ARM: DTS: omap34xx: add sgx gpu child node
  ARM: DTS: omap36xx: add sgx gpu child node
  ARM: DTS: omap4: add sgx gpu child node
  ARM: DTS: omap5: add sgx gpu child node
  MIPS: DTS: jz4780: add sgx gpu node

 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 109 ++++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi                 |  11 +-
 arch/arm/boot/dts/am3517.dtsi                 |   9 +-
 arch/arm/boot/dts/omap34xx.dtsi               |  11 +-
 arch/arm/boot/dts/omap36xx.dtsi               |   9 +-
 arch/arm/boot/dts/omap4.dtsi                  |  11 +-
 arch/arm/boot/dts/omap4470.dts                |  15 +++
 arch/arm/boot/dts/omap5.dtsi                  |  11 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  11 ++
 9 files changed, 169 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
 create mode 100644 arch/arm/boot/dts/omap4470.dts

-- 
2.25.1

