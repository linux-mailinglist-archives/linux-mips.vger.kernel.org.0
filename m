Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5021A2293
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 15:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbgDHNGk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 09:06:40 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17893 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727902AbgDHNGk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 09:06:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586351026; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Xt3QlKHF9gAfs7PFxUfbfSkP2aVAC/tz3Gtn21Vxl34OaxdveVAogbirOWQxjbWyvWuNKvM9EA+oIzKP0hAKyK9keQCVyvtL8Deq/+x3WBcNPj755XaYkAd1Y7bYAyB1LsxBBkNzkhLBGXl25PA+/sKjHm/drvMlIP9cn2IlA7M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586351026; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=CuiH5YcI6tCfhJK48jBjzSJsIlmqrJPGhHGDuUriybY=; 
        b=BvmgYeHKzI358gNXXMatE4R1i71CDcQkWEDt5jfAiSXCugqPHN3bU+6b7QgDbsga98pZlnvyq7UpqADjp3CZYAlmSX+7Sw9OjEzRAJ7E0601qcJsBcbCnBtVpbGg8H6CbksjNjAxbkX1ZeBe2puyLhTEWRNGIwh+fVOEMJXI2A8=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586351026;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=CuiH5YcI6tCfhJK48jBjzSJsIlmqrJPGhHGDuUriybY=;
        b=JkkmTwA1xtnZOnvPqGgtJ0KvVe6ewM+F5dVZNsZSTsX9Ms1EI4MxqtL7JHf30NxI
        8hmOZefcI7oPuh4T+8PLqukQLZgxX3VUx8ArFRvVJNEJqKHKhUl8+PktXp4ir7eJHSs
        44ZBGWMRoTHvXf0EWiZy1VoLp8Sr9/TAvSqUn4kQ=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 15863510255787.563914307152345; Wed, 8 Apr 2020 21:03:45 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Robert Richter <rric@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408130024.2529220-7-jiaxun.yang@flygoat.com>
Subject: [PATCH 12/12] MIPS: ip27: Fix includes
Date:   Wed,  8 Apr 2020 20:59:54 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Somehow changes in topology messed up headers.
So just add necessary headers to make it compile again.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-ip27/mmzone.h   | 2 ++
 arch/mips/include/asm/mach-ip27/topology.h | 2 ++
 arch/mips/include/asm/sn/addrs.h           | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/a=
sm/mach-ip27/mmzone.h
index 08c36e50a860..e0a53b97b4a8 100644
--- a/arch/mips/include/asm/mach-ip27/mmzone.h
+++ b/arch/mips/include/asm/mach-ip27/mmzone.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_MACH_MMZONE_H
 #define _ASM_MACH_MMZONE_H
=20
+#include <linux/mmzone.h>
+
 #include <asm/sn/addrs.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/agent.h>
diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include=
/asm/mach-ip27/topology.h
index d66cc53feab8..601e350908f7 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_MACH_TOPOLOGY_H
 #define _ASM_MACH_TOPOLOGY_H=091
=20
+#include <linux/numa.h>
+
 #include <asm/sn/types.h>
 #include <asm/mmzone.h>
=20
diff --git a/arch/mips/include/asm/sn/addrs.h b/arch/mips/include/asm/sn/ad=
drs.h
index 837d23e24976..1d3945ef2ca4 100644
--- a/arch/mips/include/asm/sn/addrs.h
+++ b/arch/mips/include/asm/sn/addrs.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/smp.h>
 #include <linux/types.h>
+#include <asm/io.h>
 #endif /* !__ASSEMBLY__ */
=20
 #include <asm/addrspace.h>
--=20
2.26.0.rc2


