Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40CE01523E6
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 01:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbgBEALj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 19:11:39 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:56248 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgBEALj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Feb 2020 19:11:39 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D5346891AB;
        Wed,  5 Feb 2020 13:11:35 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1580861495;
        bh=rWw39W1xcUKR/heVavGcT0nqYJy6F8UnBKGaK5La1fI=;
        h=From:To:Cc:Subject:Date;
        b=ICvsX8CjRGALZEHG4kfCe+IHxZkNYkBA/lAjlNYOKZoYi8de7DuP/p9LugXIM5MOk
         A5vVbn9p0hZb0sn7gYO8CG7LGNXcX99JhEn144aO9v0ORODFfBf4kXt83jXMDbp1P6
         M1o+F2pUvSkXMvtkIg+7g4+ZTWVY44WalVlHGUlQGHiXInoQi6BArOVdMvduzGJJbj
         JP1HAdWJbUM30CymXfYFx/QHDc36T8zJu+xG8juJXwGgAhVdl4PvlfQ8R66Ykgm21g
         XIZnINhc29u9rQwbaHYJRSdf6DDrQM2C1UJPgqgFUil6bJYd9qBohkzxJdDHtzq/5K
         g31qy2MPi9rEQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e3a08380000>; Wed, 05 Feb 2020 13:11:36 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 16E1513EEDE;
        Wed,  5 Feb 2020 13:11:35 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 850D6280038; Wed,  5 Feb 2020 13:11:35 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregkh@linuxfoundation.org, ralf@linux-mips.org,
        paulburton@kernel.org, linux@roeck-us.net,
        dan.carpenter@oracle.com, willy@infradead.org
Cc:     linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/6] Re-instate octeon staging drivers
Date:   Wed,  5 Feb 2020 13:11:10 +1300
Message-Id: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series re-instates the octeon drivers that were recently removed and
addresses the build issues that lead to that decision.

I've approached Cavium/Marvell about taking a more active interest in get=
ting
the code out of staging and into their proper location. No reply on that =
(yet).

Chris Packham (6):
  Revert "staging: octeon-usb: delete the octeon usb host controller
    driver"
  Revert "staging: octeon: delete driver"
  MIPS: octeon: remove typedef declaration for cvmx_wqe
  MIPS: octeon: remove typedef declaration for cvmx_helper_link_info
  MIPS: octeon: remove typedef declaration for cvmx_pko_command_word0
  Revert "staging/octeon: Mark Ethernet driver as BROKEN"

 .../executive/cvmx-helper-board.c             |    4 +-
 .../executive/cvmx-helper-rgmii.c             |    6 +-
 .../executive/cvmx-helper-sgmii.c             |    8 +-
 .../cavium-octeon/executive/cvmx-helper-spi.c |    6 +-
 .../executive/cvmx-helper-xaui.c              |    6 +-
 .../cavium-octeon/executive/cvmx-helper.c     |   10 +-
 .../include/asm/octeon/cvmx-helper-board.h    |    2 +-
 .../include/asm/octeon/cvmx-helper-rgmii.h    |    4 +-
 .../include/asm/octeon/cvmx-helper-sgmii.h    |    4 +-
 .../mips/include/asm/octeon/cvmx-helper-spi.h |    4 +-
 .../include/asm/octeon/cvmx-helper-util.h     |    2 +-
 .../include/asm/octeon/cvmx-helper-xaui.h     |    4 +-
 arch/mips/include/asm/octeon/cvmx-helper.h    |    8 +-
 arch/mips/include/asm/octeon/cvmx-pko.h       |   10 +-
 arch/mips/include/asm/octeon/cvmx-pow.h       |   22 +-
 arch/mips/include/asm/octeon/cvmx-wqe.h       |   16 +-
 drivers/staging/Kconfig                       |    4 +
 drivers/staging/Makefile                      |    2 +
 drivers/staging/octeon-usb/Kconfig            |   11 +
 drivers/staging/octeon-usb/Makefile           |    2 +
 drivers/staging/octeon-usb/TODO               |    8 +
 drivers/staging/octeon-usb/octeon-hcd.c       | 3737 +++++++++++++++++
 drivers/staging/octeon-usb/octeon-hcd.h       | 1847 ++++++++
 drivers/staging/octeon/Kconfig                |   15 +
 drivers/staging/octeon/Makefile               |   19 +
 drivers/staging/octeon/TODO                   |    9 +
 drivers/staging/octeon/ethernet-defines.h     |   40 +
 drivers/staging/octeon/ethernet-mdio.c        |  178 +
 drivers/staging/octeon/ethernet-mdio.h        |   28 +
 drivers/staging/octeon/ethernet-mem.c         |  154 +
 drivers/staging/octeon/ethernet-mem.h         |    9 +
 drivers/staging/octeon/ethernet-rgmii.c       |  158 +
 drivers/staging/octeon/ethernet-rx.c          |  538 +++
 drivers/staging/octeon/ethernet-rx.h          |   31 +
 drivers/staging/octeon/ethernet-sgmii.c       |   30 +
 drivers/staging/octeon/ethernet-spi.c         |  226 +
 drivers/staging/octeon/ethernet-tx.c          |  717 ++++
 drivers/staging/octeon/ethernet-tx.h          |   14 +
 drivers/staging/octeon/ethernet-util.h        |   47 +
 drivers/staging/octeon/ethernet.c             |  992 +++++
 drivers/staging/octeon/octeon-ethernet.h      |  107 +
 drivers/staging/octeon/octeon-stubs.h         | 1433 +++++++
 42 files changed, 10414 insertions(+), 58 deletions(-)
 create mode 100644 drivers/staging/octeon-usb/Kconfig
 create mode 100644 drivers/staging/octeon-usb/Makefile
 create mode 100644 drivers/staging/octeon-usb/TODO
 create mode 100644 drivers/staging/octeon-usb/octeon-hcd.c
 create mode 100644 drivers/staging/octeon-usb/octeon-hcd.h
 create mode 100644 drivers/staging/octeon/Kconfig
 create mode 100644 drivers/staging/octeon/Makefile
 create mode 100644 drivers/staging/octeon/TODO
 create mode 100644 drivers/staging/octeon/ethernet-defines.h
 create mode 100644 drivers/staging/octeon/ethernet-mdio.c
 create mode 100644 drivers/staging/octeon/ethernet-mdio.h
 create mode 100644 drivers/staging/octeon/ethernet-mem.c
 create mode 100644 drivers/staging/octeon/ethernet-mem.h
 create mode 100644 drivers/staging/octeon/ethernet-rgmii.c
 create mode 100644 drivers/staging/octeon/ethernet-rx.c
 create mode 100644 drivers/staging/octeon/ethernet-rx.h
 create mode 100644 drivers/staging/octeon/ethernet-sgmii.c
 create mode 100644 drivers/staging/octeon/ethernet-spi.c
 create mode 100644 drivers/staging/octeon/ethernet-tx.c
 create mode 100644 drivers/staging/octeon/ethernet-tx.h
 create mode 100644 drivers/staging/octeon/ethernet-util.h
 create mode 100644 drivers/staging/octeon/ethernet.c
 create mode 100644 drivers/staging/octeon/octeon-ethernet.h
 create mode 100644 drivers/staging/octeon/octeon-stubs.h

--=20
2.25.0

