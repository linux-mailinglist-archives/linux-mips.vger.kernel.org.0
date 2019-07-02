Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D8E5DA2D
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 03:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbfGCBDO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jul 2019 21:03:14 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54794 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfGCBDO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Jul 2019 21:03:14 -0400
Received: by mail-wm1-f66.google.com with SMTP id g135so405872wme.4;
        Tue, 02 Jul 2019 18:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LBWB6uQ0LpQxJc9ymoFNG6XGEMqz0HTQ0I21d3MdiIY=;
        b=Ob8OAm8l+LEYVwr57X3OufsI0zkT79AT5Jut2x7UTyTugJd7r1yIb8W3bBQrg2Abru
         3yXhkZtVb6uVC4BJ8Fx9CF87O3PO32pmt8i0eAHJpcLMz0OmL8tmtrlFthK8QgWiNeiP
         ZtUviQ6hQxJACJ99tQ3I8eyz0zPBl5BO9xQ9tiwkdapagV0XAVHvQ9PWNDOt7W4NZHFi
         S9umhTYjJH4M8ODI/AkEIxrM0/vWhdyFtPCmI4XA0y/qZP0O2mv/GDPF643CpgFQR5Sy
         tuCPRygfybpytV0rhxmsfKq5sYMe1la5gSd7Gbz2Rb6s8oPXelTwdj1wjgc/jRlura4V
         gzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LBWB6uQ0LpQxJc9ymoFNG6XGEMqz0HTQ0I21d3MdiIY=;
        b=Ri4HEi0PY+6ZXToUY7fshGGxErH39rQgZN8VUzaIapZ/1S6pa92NAePgP3lsCzrk+f
         5ZvFFLq+qcxd81CTVynIEDY0YeEiirSwUkZRw8uca9jvgtnxSIbBLFjqSlGLKv0OykcK
         EnShwLJ6QNm+XjcELgjYta+tNj8D1foNrCUxG9WfnooIfqKLVGqGOuAVzsnbRJ4NH1Ma
         M5NiaQWjPchuQiFaIrD/UWga69cE3YZZc6X2aPqtAuRZYu/0WzIbFSjdMK/LOjw2uTTM
         NmjM3bNSAf18OH6COckc5yy+iHeSpw2BrNYtwKmz/BgnbcX7ZnFnryHuAl8JSOm3jWUE
         wNIA==
X-Gm-Message-State: APjAAAWjgvQiUYlcmeRNntJprVdNocjHB/dayNmDV8YVEbIC/Z+3OSJx
        8LwkAhaN1bRpotdha0I3wCmvUAkv
X-Google-Smtp-Source: APXvYqxOUC2uNqK6Z/BzGBTWsn4YGIpPODSbFR6VlbGZ1L/KD+v0vnSxOXKnwHJsTkYKaXf58GCbjA==
X-Received: by 2002:a7b:c3d5:: with SMTP id t21mr4048369wmj.87.1562099728934;
        Tue, 02 Jul 2019 13:35:28 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D62000A09003363445C98E.dip0.t-ipconnect.de. [2003:f1:33d6:2000:a090:336:3445:c98e])
        by smtp.googlemail.com with ESMTPSA id s12sm100041wmh.34.2019.07.02.13.35.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 13:35:28 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com,
        ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/4] Lantiq VRX200/ARX300 PCIe PHY driver
Date:   Tue,  2 Jul 2019 22:35:19 +0200
Message-Id: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
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


[0] https://github.com/xdarklight/openwrt/commits/lantiq-mainline-pcie-phy-20190702


Martin Blumenstingl (4):
  dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe
    PHYs
  phy: lantiq: vrx200-pcie: add a driver for the Lantiq VRX200 PCIe PHY
  phy: enable compile-testing for the Lantiq PHY drivers
  MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver

 .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  |  87 +++
 arch/mips/lantiq/xway/sysctrl.c               |  16 +-
 drivers/phy/Makefile                          |   2 +-
 drivers/phy/lantiq/Kconfig                    |  11 +
 drivers/phy/lantiq/Makefile                   |   1 +
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c   | 495 ++++++++++++++++++
 .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  |  11 +
 7 files changed, 614 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
 create mode 100644 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
 create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h

-- 
2.22.0

