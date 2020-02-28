Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDAA173F0F
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 19:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgB1SDM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 13:03:12 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:9181 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgB1SDH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 13:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582912984;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=VQR/AR51ZqPMdswJK+tBk7F8NHNJi8NvdVEENw3L72s=;
        b=k/MuodBJO9+NIRCPAcvXlWKiGCSWy06fAtTiKKSn2koYP2TZcPwtE8sdMGm32wwiAi
        2Dh5qeeRhZBlo5Gm/hzqPIV0m1m8c3OJg3j9AF4dxMXb0vFQKtos1OL8IaGG2+nnqkfd
        fHOSXpkYa4zkRqVKc2KLLw0tjVYX0EZhpTwrd0I+5lD3ymXUvXv44sKe+Xmo4Vz6XDlS
        PjatYG1mIWD6Om9rAawtZret5Zwek91AKPvyvRspsl6TQHZsBlOWJBRuhEvCqRRz+raM
        I3SRSSThkRbqwQZJBRKlyB8sbALSKc3yL+fvKUXobIIJkO2wMqMFe1qCoBGltRl0UWDS
        sJ4A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SI2r2JH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 19:02:53 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH v4 0/5] MIPS: Fixes and improvements for CI20 board (JZ4780)
Date:   Fri, 28 Feb 2020 19:02:48 +0100
Message-Id: <cover.1582912972.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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

H. Nikolaus Schaller (4):
  MIPS: DTS: CI20: fix PMU definitions for ACT8600
  MIPS: DTS: CI20: fix interrupt for pcf8563 RTC
  MIPS: DTS: CI20: multiple DTS improvements
  MIPS: CI20: defconfig: multiple improvements

 arch/mips/boot/dts/ingenic/ci20.dts | 71 ++++++++++++++++++++++-------
 arch/mips/configs/ci20_defconfig    | 21 +++++++++
 2 files changed, 76 insertions(+), 16 deletions(-)

-- 
2.23.0

