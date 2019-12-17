Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7894F123436
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 19:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfLQSCd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 13:02:33 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:33798 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbfLQSCd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 13:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605749;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=E41u3NSIeHGMOgXDLzty+HWrhO7ZjL4x/137ZGXUXA8=;
        b=qhQxEUEyOYLa2rwyJ/mkEVJSfU/QG4KTnsz0mdtqQKSxXTB+nFleat7OzECMu58+Y3
        Ef/kyJxGMKiXUxH/cChdPGmKSxWgL3OPOtAYUCFZ5Cgj6bYrDuVVZH/Yr2lLgYESCuHW
        sO6TCUPkudnX09WJQfnogpr0t1hXzqbzap36fwBoywWAOfMcTC5JPXDROuTA6rmRmsIJ
        YUr9Ljm+Z/wQoCfPBM29qYWews1cfxouKjIvAOjzg25Xku+8eLkQA90JA32uCIcoPx7O
        19CjUbidk37Ba5m6kX4p6Z+PEAWqS7Wk6SINPY8esViTM2aS0qzSKDlXcF/qGf3q1HNi
        XyHQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id q020e2vBHI272dT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 17 Dec 2019 19:02:07 +0100 (CET)
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
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v4 0/8] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Date:   Tue, 17 Dec 2019 19:01:58 +0100
Message-Id: <cover.1576605726.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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
  ARM: DTS: omap3: add sgx gpu child node
  ARM: DTS: omap36xx: add sgx gpu child node
  ARM: DTS: omap4: add sgx gpu child node
  ARM: DTS: omap5: add sgx gpu child node
  MIPS: DTS: jz4780: add sgx gpu node

 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 80 +++++++++++++++++++
 arch/arm/boot/dts/am33xx.dtsi                 |  9 ++-
 arch/arm/boot/dts/am3517.dtsi                 | 11 +--
 arch/arm/boot/dts/omap34xx.dtsi               | 11 +--
 arch/arm/boot/dts/omap36xx.dtsi               | 11 +--
 arch/arm/boot/dts/omap4.dtsi                  |  9 ++-
 arch/arm/boot/dts/omap4470.dts                | 15 ++++
 arch/arm/boot/dts/omap5.dtsi                  |  9 ++-
 arch/mips/boot/dts/ingenic/jz4780.dtsi        | 11 +++
 9 files changed, 139 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
 create mode 100644 arch/arm/boot/dts/omap4470.dts

-- 
2.23.0

