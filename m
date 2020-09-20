Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F4C271366
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgITLJs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:09:48 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53228 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgITLJs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:09:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 623D580307CB;
        Sun, 20 Sep 2020 11:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hA1g_TpMWcI0; Sun, 20 Sep 2020 14:09:45 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        <linux-mips@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] hwmon: bt1-pvt: Fix PVT sensor being unpowered
Date:   Sun, 20 Sep 2020 14:09:20 +0300
Message-ID: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 PVT sensor has got a dedicated power domain with 1.8V intended
to be supplied via the external GPVT and VPVT_18 pins. In case if the
power isn't supplied, the sensor IO registers will be accessible, but the
data conversion just won't happen. The situation of the power loss
currently will cause the temperature and voltage read procedures to hang
up. The problem is fixed in the framework of this patchset firstly by
checking whether the conversion works at the sensor probe procedure, and
secondly by keeping the current conversion update timeout in the private
driver data cache and using it to set the wait-completion timeout.

Fixes: 87976ce2825d ("hwmon: Add Baikal-T1 PVT sensor driver")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: linux-mips@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (3):
  hwmon: bt1-pvt: Test sensor power supply on probe
  hwmon: bt1-pvt: Cache current update timeout
  hwmon: bt1-pvt: Wait for the completion with timeout

 drivers/hwmon/bt1-pvt.c | 138 ++++++++++++++++++++++++++++------------
 drivers/hwmon/bt1-pvt.h |   3 +
 2 files changed, 101 insertions(+), 40 deletions(-)

-- 
2.27.0

