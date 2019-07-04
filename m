Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186715F7EC
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2019 14:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfGDMXk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Jul 2019 08:23:40 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36012 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbfGDMXk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Jul 2019 08:23:40 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so6456754wrs.3;
        Thu, 04 Jul 2019 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qwx+amj3WRfYzgXNR4PosQkjB/DhPpsKz3xM2MWOuhg=;
        b=lB60wAvdwAXQPsIs0rxtxyLdOEgh4rYG/iTiyWUT0RtuRSl0vJcW+Q7bSy73jbhUtF
         +sIwLa+L+VPr4NiFKwfd96eSh6e+gqu/qZz7HWAqF+/5chuK3EPKhx+n+6H5X/JGNH/2
         o1Q2yvzbViaPnvp4bFLrNfA2TY3vfbHILazOdDHZ+pGqKy2+BqPBPM3Uyjl5OuEyE2NH
         3RZW1TBWpgkQaoQ3zm/malU4rhSP1Ke/DjuP3TOw7LsAuBJLCvJ+9toT+ObF3dvIor5V
         dm/aaAEgNo7XKIIkc1uGx3RT8k3vduNC1UXOPcNPRSX25DVYXxl3N3sZ3JV4pnsW/Fqs
         oQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qwx+amj3WRfYzgXNR4PosQkjB/DhPpsKz3xM2MWOuhg=;
        b=jOnQk3XFNFpHqKNOqRU8EdcxLHdTvhZ4nZtYnal+MlIsCYJN/mWroDRuo41iQU5FC1
         PMU/QPa3fEo3RL7qZNeED+HGwdYjILOflUS3U6QUyhbyWerTINstkVqccYc7zLdCYTQL
         NRoD/XoJDD80t/24sazwfQeCG4QHCcdTTrXoud7cPVoKwKoZn+7jws/hcuZAVdJajpOZ
         1vxezMtQh9HgWV9+64/r/IH3tg0ItH8jM+UBEe7I2OLmdksLnvkjPg1Rcg5CQROG6SFC
         /w4XJ4rlVlxQlkHDVtpOIk+Ol1GQTotYd8ewFuYfbNmUG683qPL6FtG5IKg1wzgAxIfs
         +HAA==
X-Gm-Message-State: APjAAAXU5vBZ+gc7gP7j9sZmHiBYMTW8Bdj2hchdCUinmvSyJ18FLI5h
        WoFbPMuNrI8f+YMF1c4shDXNIiqL
X-Google-Smtp-Source: APXvYqyZv+I/AMA5X7FL1cYGtfnx1spJoOe0Vjclwt6jhT7+cAjxbhj3KltZ0L/0ZqM8W8mqrA/1JQ==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr28646159wrq.37.1562243017363;
        Thu, 04 Jul 2019 05:23:37 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D6200090FB6F2A0C02D39B.dip0.t-ipconnect.de. [2003:f1:33d6:2000:90fb:6f2a:c02:d39b])
        by smtp.googlemail.com with ESMTPSA id w10sm5141825wru.76.2019.07.04.05.23.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 05:23:36 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com,
        ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/4] Lantiq VRX200/ARX300 PCIe PHY driver
Date:   Thu,  4 Jul 2019 14:23:15 +0200
Message-Id: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Various Lantiq (now Intel) SoCs contain one or more PCIe controllers
and PHYs.
This adds a driver for the PCIe PHYs found on the Lantiq VRX200 and
ARX300 SoCs. GRX390 should also be supported as far as I can tell,
but I don't have any of these devices to further verify that.

I have tested this PCIe PHY driver with the out-of-tree PCIe controller
driver in OpenWrt: [0]

dependencies for this series:
none

patches 1-3 should go through the PHY tree
patch 4 should go through the mips tree

I am aware that this series is too late for the v5.3 development cycle.
Getting review comments is still appreciated so this can be queued early
in the v5.4 development cycle.

Changes since v1 at [1]:
- many thanks to Rob for giving me many hints regarding the .yaml bindings!
- update the .yaml binding license to (GPL-2.0-only OR BSD-2-Clause)
- changed the property lantiq,rcu to type phandle
- add the optional big-endian and little-endian boolean properties
- use numeric values for the clock phandles in the example to make the
  dt_binding_check build happy
- replaced two mdelay(1); with usleep_range(1000, 2000); in patch #2
  (spotted and reported by Hauke off-list)


[0] https://github.com/xdarklight/openwrt/commits/lantiq-mainline-pcie-phy-20190702
[1] https://patchwork.kernel.org/cover/11028797/


Martin Blumenstingl (4):
  dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe
    PHYs
  phy: lantiq: vrx200-pcie: add a driver for the Lantiq VRX200 PCIe PHY
  phy: enable compile-testing for the Lantiq PHY drivers
  MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver

 .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  |  95 ++++
 arch/mips/lantiq/xway/sysctrl.c               |  16 +-
 drivers/phy/Makefile                          |   2 +-
 drivers/phy/lantiq/Kconfig                    |  11 +
 drivers/phy/lantiq/Makefile                   |   1 +
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c   | 494 ++++++++++++++++++
 .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  |  11 +
 7 files changed, 621 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
 create mode 100644 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
 create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h

-- 
2.22.0

