Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6541708BA
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 20:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgBZTNN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 14:13:13 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:34487 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbgBZTNN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 14:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582744390;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=Vdb7nlCxfqY9kDUQ+U3Vms96RRuZQL4A0e+CPRkPLwo=;
        b=W+KwYSL5yaeIIKCaL2Tp11ufJA0OsTYPWOQVGuuD0sXvCOQPiTHX/p7D8gSjD3RI+y
        3zy+BRo2F4aW2q4WOr/1xxspcEmpbPztp142wDxcRa+lxXshzn3b4n5KKOYKdkRsxret
        xmO6zMb7BoZ2yIkuNkFyywiaMbMmEmfQWuqr57PZ5kqNW1seWbX36oAQwIPKxUcwXt3J
        OLhTo21fATVcKEWrn0aVeNNQWk2fCTGCAKgtuyWheLpF5cTAM+fI9jBeuBviHTgRKd/K
        twgDsMveqRsBaYblHzv0OGvha4rJ59O9CcYM94NNfiy10Sv6xqfxtFJg9MxPcTv5yPNP
        LlTQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QJD06bJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 20:13:00 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [RFC 0/8] MIPS: CI20: add HDMI out support 
Date:   Wed, 26 Feb 2020 20:12:52 +0100
Message-Id: <cover.1582744379.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series adds HDMI output to the jz4780/CI20 board.

It is based on taking the old 3.18 vendor kernel and trying
to achieve the same with modern DTS setup and new/modified
drivers.

Unfortunately, in this first RFC, only EDID and creation of
/dev/fb0 are working. Also, HDMI hot plugging is detected.

But there is no HDMI output signal. So some tiny piece seems
to be missing to enable/configure the Synposys HDMI controller.

We need help from the community to fix this.

Note: device tree bindings are from 2015 and still seem to
fit - except they are not in yaml format.

Original authors of most patches are
* Paul Boddie <paul@boddie.org.uk>
* Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>


H. Nikolaus Schaller (2):
  drm: ingenic-drm: add MODULE_DEVICE_TABLE
  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780

Paul Boddie (4):
  drm: ingenic: add jz4780 Synopsys HDMI driver.
  pinctrl: ingenic: add hdmi-ddc pin control group
  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
  MIPS: DTS: CI20: add HDMI setup

Zubair Lutfullah Kakakhel (2):
  dt-bindings: video: Add jz4780-lcd binding
  dt-bindings: video: Add jz4780-hdmi binding

 .../bindings/display/ingenic-jz4780-hdmi.txt  |  41 ++++++
 .../bindings/display/ingenic-jz4780-lcd.txt   |  39 ++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  64 ++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  32 +++++
 arch/mips/configs/ci20_defconfig              |   3 +
 drivers/gpu/drm/ingenic/Kconfig               |   8 ++
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c      | 120 ++++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +
 drivers/pinctrl/pinctrl-ingenic.c             |   7 +
 10 files changed, 317 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
 create mode 100644 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c

-- 
2.23.0

