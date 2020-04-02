Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CF819BFB1
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2020 12:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387592AbgDBKwJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Apr 2020 06:52:09 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17858 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728612AbgDBKwI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Apr 2020 06:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585824683;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=4OyVuFjPKoQvzE6pgWT/Zq5DGn/7AUv6X7kRDxmswbo=;
        b=GeOOCFG5cmZpwhwv2DOnN/XuFX/fYvszdnwJQ5F/LWu9E7KtqWDvR97Q4tzRadA7
        OBODACYRcuhyDLkLf2bFXp6RfHhUCBRpKR20JG+ADyh5laZmvW279W1ADxIbPLP0P3B
        4JWkc4JPUuWFf8CWPgPqD0UksTRT7mH5FNKWh4x8=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 158582468178236.83295531682825; Thu, 2 Apr 2020 18:51:21 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <20200402104851.368465-5-jiaxun.yang@flygoat.com>
Subject: [PATCH 5/5] MIPS: Loongson64: Mark RS780 HPET as broken
Date:   Thu,  2 Apr 2020 18:48:43 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200402104851.368465-1-jiaxun.yang@flygoat.com>
References: <20200402104851.368465-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver is using some dangerous hack to set MMIO address for HPET,
which might break systems with other kinds of PCH.

Also, as Loongson-3 cpufreq driver never appeared in mainline,
this driver rarely got used.

So we temporarily mark it as broken until we find a better solution.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index c386b8a3c753..16e6acab8cce 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -4,14 +4,12 @@ if MACH_LOONGSON64
 config RS780_HPET
 =09bool "RS780/SBX00 HPET Timer"
 =09depends on MACH_LOONGSON64
+=09depends on BROKEN
 =09select MIPS_EXTERNAL_TIMER
 =09help
 =09  This option enables the hpet timer of AMD RS780/SBX00.
=20
-=09  If you want to enable the Loongson3 CPUFreq Driver, Please enable
-=09  this option at first, otherwise, You will get wrong system time.
-
-=09  If unsure, say Yes.
-
+=09  Note: This driver is doing some dangerous hack. Please only enable
+=09  it on RS780 systems.
=20
 endif # MACH_LOONGSON64
--=20
2.26.0.rc2


