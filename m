Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3053E173F4E
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 19:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgB1STl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 13:19:41 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:21610 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1STk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 13:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913978;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=mtibfl3if76oFyUx4VaWIyxio7nt25pVHxLuChFLvDo=;
        b=aZ75bPb3UYuN4N9aN0YBIWyrBOK/iZY8Ir6WhYzlfk445MnNbt/XqzVeFpHOQeHqYu
        XpeqYIQ6uaOu08zU/kkP+WidWdRPzzcmHA0gwY4PIcIlzF4URVYwReZ+zcNnPOb43sYb
        44Az9IukV0TptjcO3EI1bBW6S3pfh0cUQs7iVaZQZfuA0qrfFYc4asptQZKhyWcEjMjL
        fp0pYh57py+WLFb5k1R9k4j+hsiUjV811aHdzKf5TtCIZNyXUgldWhAebHTMsE7OUZIC
        0S36kvn3doNRlyuhZRgWCQwLyEcvarBp5G5BhLoz8kuaaNhwv7vJTpEVmjs0m2i09wab
        JZ8A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SIJY2Lm
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 19:19:34 +0100 (CET)
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
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [RFC v2 0/8] MIPS: CI20: add HDMI out support 
Date:   Fri, 28 Feb 2020 19:19:25 +0100
Message-Id: <cover.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* Converted .txt bindings to .yaml (by Sam Ravnborg <sam@ravnborg.org> - big THANKS)

RFC V1 2020-02-26 20:13:06:
This patch series adds HDMI output to the jz4780/CI20 board.

It is based on taking the old 3.18 vendor kernel and trying
to achieve the same with modern DTS setup and new/modified
drivers.

Unfortunately, in this first RFC, only EDID and creation of
/dev/fb0 are working. Also, HDMI hot plugging is detected.

But there is no HDMI output signal. So some tiny piece seems
to be missing to enable/configure the Synposys HDMI controller.

We need help from the community to fix this.

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

Sam Ravnborg (2):
  dt-bindings: display: add ingenic-jz4780-lcd DT Schema
  dt-bindings: display: add ingenic-jz4780-hdmi DT Schema

 .../bindings/display/ingenic-jz4780-hdmi.yaml |  83 ++++++++++++
 .../bindings/display/ingenic-jz4780-lcd.yaml  |  78 ++++++++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  64 ++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  32 +++++
 arch/mips/configs/ci20_defconfig              |   3 +
 drivers/gpu/drm/ingenic/Kconfig               |   8 ++
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c      | 120 ++++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +
 drivers/pinctrl/pinctrl-ingenic.c             |   7 +
 10 files changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
 create mode 100644 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c

-- 
2.23.0

