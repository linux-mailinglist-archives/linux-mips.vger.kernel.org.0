Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3EE1196EC4
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbgC2RgK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:36:10 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:9920 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgC2RgK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503365;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=o9cl3lo73IupocSaAB1N567LORTRk86aGdGAIUt50w4=;
        b=NoRv7Wi8QNU1agInI4m5RGjdrI9u9YW4/5Dbad/BxKiIcD59qbayZ+pULr1Nccp6HP
        Iky8Hgq54eIcjvKGOIWVAhdYvgMjlbe64xABy9GEkMiCq5Zrw3ELXP/NIm2oxTScv1EO
        FigQLX5lxrjE2o7JpC6+zGoKYxHeEfW2ieq60EWEhkwk0OVhm9KfxqgCG0IulZy/qJqT
        Dtwtvvc/XZNPj/ETWR/JpyNQa4qMqDqrUg2xn4avZvgk34ed87syYGo6Nse7xgpcl+5L
        NphI/RM3X4tIc74fNKZH2qtLaGrltpv7DxKBO1HcHBh/7OE9OP23egf/LOsh6fQk+19r
        M8GQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THZtBM7
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:35:55 +0200 (CEST)
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
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        mips-creator-ci20-dev@googlegroups.com
Subject: [RFC v3 0/8] MIPS: CI20: add HDMI out support
Date:   Sun, 29 Mar 2020 19:35:46 +0200
Message-Id: <cover.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+++ help is needed: driver is not completely working and shows no output signal on the HDMI data and clock lanes
+++ HPD is working and /dev/fb0 does appear
+++ but there is no trigger to initialize the lcdc

* add definition for second jz4780-lcdc
* diverse fixes for yaml schema
* make ingenic-drm driver compatible to ingenic,jz4780-lcd
* converted existing ingenic,lcd.txt to ingenic,lcd.yaml - suggested by Paul Cercueil <paul@crapouillou.net>
* removed blank line before MODULE_DEVICE_TABLE() macro - Paul Cercueil <paul@crapouillou.net>
* added some missing Signed-off:
* removed Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com> from the
  recipients list and Cc: since the address is no longer available.
* removed "pinctrl: ingenic: add hdmi-ddc pin control group" from this patch
  series since it is already applied elsewhere (by Linus Walleij <linus.walleij@linaro.org>)

RFC V2 2020-02-28 19:19:40:
* Converted .txt bindings to .yaml (by Sam Ravnborg <sam@ravnborg.org> - big THANKS)

RFC V1 2020-02-26 20:13:06:
This patch series adds HDMI output to the jz4780/CI20 board.

It is based on taking the old 3.18 vendor kernel as well as
an earlier submission from 2015:
https://lore.kernel.org/patchwork/patch/547872/
and trying to achieve the same with modern DTS setup and new/modified
drivers.

Unfortunately, in this first RFC, only EDID and creation of
/dev/fb0 are working. Also, HDMI hot plugging is detected.

But there is no HDMI output signal. So some tiny piece seems
to be missing to enable/configure the Synposys HDMI controller.

We need help from the community to fix this.

Original authors of most patches are
* Paul Boddie <paul@boddie.org.uk>
* Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>


H. Nikolaus Schaller (4):
  dt-bindings: display: convert ingenic,lcd.txt to ingenic,lcd.yaml
  drm: ingenic-drm: add MODULE_DEVICE_TABLE
  drm: ingenic-drm: add support for ingenic,jz4780-lcd
  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780

Paul Boddie (3):
  drm: ingenic: add jz4780 Synopsys HDMI driver
  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
  MIPS: DTS: CI20: add HDMI setup

Sam Ravnborg (1):
  dt-bindings: display: add ingenic-jz4780-hdmi DT Schema

 .../bindings/display/ingenic,lcd.txt          |  45 ------
 .../bindings/display/ingenic,lcd.yaml         | 128 ++++++++++++++++++
 .../bindings/display/ingenic-jz4780-hdmi.yaml |  82 +++++++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  64 +++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  46 +++++++
 arch/mips/configs/ci20_defconfig              |   3 +
 drivers/gpu/drm/ingenic/Kconfig               |   8 ++
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c      | 120 ++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c         |   8 ++
 10 files changed, 460 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
 create mode 100644 drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c

-- 
2.25.1

