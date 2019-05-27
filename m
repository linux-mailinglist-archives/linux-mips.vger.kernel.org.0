Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234B82AFDD
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2019 10:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfE0IRT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 May 2019 04:17:19 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:50680 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE0IRT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 May 2019 04:17:19 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Horatiu.Vultur@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Horatiu.Vultur@microchip.com";
  x-sender="Horatiu.Vultur@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Horatiu.Vultur@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Horatiu.Vultur@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,518,1549954800"; 
   d="scan'208";a="34506061"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2019 01:17:18 -0700
Received: from soft-dev3.microsemi.net (10.10.85.251) by mx.microchip.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1713.5; Mon, 27 May 2019
 01:17:15 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Paul Burton" <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: [PATCH net-next 0/2] Add hw offload of TC flower on MSCC Ocelot
Date:   Mon, 27 May 2019 10:16:34 +0200
Message-ID: <1558944996-23069-1-git-send-email-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series enables hardware offload for flower filter used in
traffic controller on MSCC Ocelot board.

The patch series is based on:
commit 6ab1f192dcb4 ("net: mscc: ocelot: Implement port policers via tc
command")

CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Ralf Baechle <ralf@linux-mips.org>
CC: Paul Burton <paul.burton@mips.com>
CC: James Hogan <jhogan@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>
CC: linux-mips@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org

Horatiu Vultur (2):
  net: mscc: ocelot: Add support for tcam
  net: mscc: ocelot: Hardware ofload for tc flower filter

 arch/mips/boot/dts/mscc/ocelot.dtsi       |   5 +-
 drivers/net/ethernet/mscc/Makefile        |   2 +-
 drivers/net/ethernet/mscc/ocelot.c        |  13 +
 drivers/net/ethernet/mscc/ocelot.h        |   8 +
 drivers/net/ethernet/mscc/ocelot_ace.c    | 779 ++++++++++++++++++++++++++++++
 drivers/net/ethernet/mscc/ocelot_ace.h    | 232 +++++++++
 drivers/net/ethernet/mscc/ocelot_board.c  |   1 +
 drivers/net/ethernet/mscc/ocelot_flower.c | 345 +++++++++++++
 drivers/net/ethernet/mscc/ocelot_regs.c   |  11 +
 drivers/net/ethernet/mscc/ocelot_s2.h     |  64 +++
 drivers/net/ethernet/mscc/ocelot_tc.c     |  16 +-
 drivers/net/ethernet/mscc/ocelot_vcap.h   | 403 ++++++++++++++++
 12 files changed, 1870 insertions(+), 9 deletions(-)
 create mode 100644 drivers/net/ethernet/mscc/ocelot_ace.c
 create mode 100644 drivers/net/ethernet/mscc/ocelot_ace.h
 create mode 100644 drivers/net/ethernet/mscc/ocelot_flower.c
 create mode 100644 drivers/net/ethernet/mscc/ocelot_s2.h
 create mode 100644 drivers/net/ethernet/mscc/ocelot_vcap.h

-- 
2.7.4

