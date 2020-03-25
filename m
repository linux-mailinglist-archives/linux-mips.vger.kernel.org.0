Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B75192007
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 05:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgCYECt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 00:02:49 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17826 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725939AbgCYECt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 00:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585108919;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=CobqPhmR8+Dbb6mCWhIWt3fIG017REwXbaViNjjyZSc=;
        b=ZQj4lfHzdf3Efgm+WiUGJFcg6b64/W8t8vNiJFk3U/JXEuzj83A7FoeZ51IpCDoN
        N7libCvkyAnOjR1yTSfXl58RMSvVf8SohPHzACm9Gf9xbxJVuGMwctkLuyXhZOOaR7v
        mDvqqTEnQWC94KFH2TYxI2BHzvlB5Fqy349iYMeg=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585108918331810.7566212679819; Wed, 25 Mar 2020 12:01:58 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200325035537.156911-12-jiaxun.yang@flygoat.com>
Subject: [PATCH v8 11/11] MAINTAINERS: Update Loongson64 entry
Date:   Wed, 25 Mar 2020 11:55:04 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

To include newly added irqchip drivers.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53d6ba9f7029..ba1ab3bfe18b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11169,6 +11169,7 @@ S:=09Maintained
 F:=09arch/mips/loongson64/
 F:=09arch/mips/include/asm/mach-loongson64/
 F:=09drivers/platform/mips/cpu_hwmon.c
+F:=09drivers/irqchip/irq-loongson*
 F:=09drivers/*/*loongson3*
 F:=09drivers/*/*/*loongson3*
=20
--=20
2.26.0.rc2


