Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2B12D052D
	for <lists+linux-mips@lfdr.de>; Sun,  6 Dec 2020 14:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727748AbgLFNbF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Dec 2020 08:31:05 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:38133 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbgLFNbF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Dec 2020 08:31:05 -0500
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 55FA32008F;
        Sun,  6 Dec 2020 13:30:11 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 9F1903F201;
        Sun,  6 Dec 2020 13:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id E34602A916;
        Sun,  6 Dec 2020 14:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1607261317;
        bh=Ly9UGq+bI+N0Y21Mnayo4gBWQr7v4a8tlzKDl/MPtZo=;
        h=From:To:Cc:Subject:Date:From;
        b=rS2KLn9W92nP/sMfCz9QoHh4sw6IS6TzbKpB7TV29BvU/GCxvdmrcJXgLnjlER4L4
         P0GyLz5BmxDGKJZBaG4MEV+I4oN69OLypp+muoPU3E7RokmVG23AZXSSNFNtD2LAlq
         7zy5mRoVRAFdFo78HJKbD+IxX/pHoh8WWMEaIGFA=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LUCSz8kkQbED; Sun,  6 Dec 2020 14:28:36 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Sun,  6 Dec 2020 14:28:36 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id D6372400B4;
        Sun,  6 Dec 2020 13:28:33 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="c4g6g56e";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [112.65.61.233])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id A4097400B4;
        Sun,  6 Dec 2020 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1607261307;
        bh=Ly9UGq+bI+N0Y21Mnayo4gBWQr7v4a8tlzKDl/MPtZo=;
        h=From:To:Cc:Subject:Date:From;
        b=c4g6g56eOmefP5IklL7Kec2uX0vLM3PQwpq1XoL+Y4+sFch5fDio1JJmtdxFgP+5q
         k+CUT4MfvWkPqX/CrraeBjsWxfAO7rv8H7JYTWnzp2WeIF5ZMqP1AFY3INyyZsgKHF
         53X9ym/AFV6WQOeFIo9ppnhnsackwS8Y4mcQjVEA=
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, Paul Cercueil <paul@crapouillou.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, YunQiang Su <syq@debian.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: Add vulnerabilities
Date:   Sun,  6 Dec 2020 21:27:36 +0800
Message-Id: <20201206132748.6646-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D6372400B4
X-Spamd-Result: default: False [4.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[112.65.61.233:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_TWELVE(0.00)[13];
         MID_CONTAINS_FROM(1.00)[];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add vulnerabilities display for MIPS.

Jiaxun Yang (3):
  MIPS: Add vulnerabilities infrastructure
  MIPS: cpu-probe: Vulnerabilities for MIPS cores
  MIPS: cpu-probe: Vulnerabilities for Loongson cores

 arch/mips/Kconfig                |  1 +
 arch/mips/include/asm/cpu-info.h |  5 ++++
 arch/mips/include/asm/cpu.h      |  7 +++++
 arch/mips/kernel/Makefile        |  2 +-
 arch/mips/kernel/cpu-probe.c     |  9 +++++++
 arch/mips/kernel/vulnbl.c        | 46 ++++++++++++++++++++++++++++++++
 6 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/kernel/vulnbl.c

-- 
2.29.2
