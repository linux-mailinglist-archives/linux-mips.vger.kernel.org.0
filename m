Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B5117C786
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 22:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgCFVGl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 16:06:41 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:14564 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCFVGk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 16:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583528798;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=RYyZHfcW0YbAe2JPXL0qNVQFiP9UrPP2fw064FG2p+g=;
        b=L0TdQB4yQ87ezY/vdwzLp+Vjci8iz1b2lP3PMBj8twTDONdVIOrMn2tk1TOUG06h94
        RcGPc/Tj3jluNO5fPx3Ifm5MXww/ILPWq/xUbgIxYalW3/K2VN0pkRmeNSr1++6/e0lg
        Kx1y438tHBtJFMAnFJPHioNV+JhmucKTO1k7goV7eLUOlmzevlWL8xsI/Oft6aGm4fRO
        FPLPY0eqzgYQ04oaJnfIQBDFd1YICO+15cYoC2P7BLGhwULnAgCyhTXwZwzE/F72TKHa
        LdUzeMRaQQALZx7U1Gqg4rDHsO21R00EhX+4SnAQ1xXYCa4Mlf/fKj72y1ujh07cnt4n
        BnZw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6GQjzrz4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw26L6ZaJb
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 6 Mar 2020 22:06:35 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH v7 0/3] MIPS: Fixes and improvements for CI20 board (JZ4780)
Date:   Fri,  6 Mar 2020 22:06:30 +0100
Message-Id: <cover.1583528793.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* renamed DT node for IR receiver from ir-receiver to ir (suggested by Paul Cercueil <paul@crapouillou.net>)

PATCH V6 2020-03-06 18:29:34:
* reordered patches and send Fixes as separate ones (requested by Thomas Bogendoerfer <tsbogend@alpha.franken.de>)
* fixed Checkpatch issue with comments in PMU patch (suggested by Thomas Bogendoerfer <tsbogend@alpha.franken.de>)

PATCH V5 2020-02-29 20:45:52:
* add #include irq.h not in PMU patch but in RTC patch
* added Reviewed-by: Paul Cercueil <paul@crapouillou.net>

PATCH V4 2020-02-28 19:02:57:
* use KEY_F13 for SW1 button to avoid conflict with Enter of an USB keyboard (suggested by Paul Cercueil <paul@crapouillou.net>)
* tidy up all new #includes to be at beginning of file and alphabetically sorted (suggested by Paul Cercueil <paul@crapouillou.net>)
* add new #include to DTS only when needed (suggested by Paul Cercueil <paul@crapouillou.net>)

PATCH V3 2020-02-16 21:21:07:
* dropped "drm: ingenic-drm: add MODULE_DEVICE_TABLE" because it will be resubmitted
  with a HDMI driver solution
* added Cc: stable@vger.kernel.org where appropriate (suggested by Paul Cercueil <paul@crapouillou.net>)
* squashed all other DTS and CONFIG changes into single patches (suggested by Paul Cercueil <paul@crapouillou.net>)

PATCH V2 2020-02-14 17:10:33:
* dropped "net: davicom: dm9000: allow to pass MAC address through mac_addr module parameter"
  from this series because it goes through the netdev tree
  (suggested by Andrew Lunn <andrew@lunn.ch>)
* added a "fixes:" for "MIPS: DTS: CI20: fix PMU definitions for ACT8600"
  and "MIPS: DTS: CI20: fix interrupt for pcf8563 RTC"
  (suggested by Andreas Kemnade <andreas@kemnade.info>)
* "i2c: jz4780: silence log flood on txabrt" dropped because it is
  replaced by a new version in v5.6 by Wolfram Sang <wsa@the-dreams.de>

PATCH V1 2020-02-11 22:41:43:
This patch set provides several improvements for the CI20 board:

* suppress warnings from i2c if device is not responding
* make ingenic-drm found through DT
* allow davicom dm9000 ethernet controller to use MAC address provided by U-Boot
* fix #include in jz4780.dtsi
* configure for loadable kernel modules
* add DTS for IR sensor and SW1 button
* configure so that LEDs, IR sensor, SW1 button have drivers
* fix DTS for ACT8600 PMU and configure driver
* fix interrupt of nxp,pcf8563

There is another patch set in our queue to add HDMI support on top of this work.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>


Alex Smith (1):
  MIPS: DTS: CI20: add DT node for IR sensor

H. Nikolaus Schaller (2):
  MIPS: DTS: CI20: multiple DTS improvements
  MIPS: CI20: defconfig: multiple improvements

 arch/mips/boot/dts/ingenic/ci20.dts | 19 +++++++++++++++++++
 arch/mips/configs/ci20_defconfig    | 21 +++++++++++++++++++++
 2 files changed, 40 insertions(+)

-- 
2.23.0

