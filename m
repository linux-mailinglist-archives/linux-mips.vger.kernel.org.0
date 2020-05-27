Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB6C1E3964
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 08:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgE0Gfy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 02:35:54 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34452 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgE0Gfx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 02:35:53 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 0E1DC20D2B;
        Wed, 27 May 2020 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590561353; bh=tyvvfagfsu9f7HfjLvutuI+UZCSBQKRjuuJghsFVXtc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AxjKv/AYhtwFnruQiU0qiXFvZT1o7SdfPSUZQjZXQlBP89uwqTG9sczmrSJUbCasS
         74xjKLUxv3gN8IfSjMFvzb51i+6FQAQ5co0ESKak2/pdU3K4oeC9oWms2ouwIiEKD3
         aRB4CmCh9kgUu7wPnyDVOqab3ClqKcvswa9vH9kTjfXEZTURwaZmdlbB22xyJ+4lc2
         vCCyc47iU5JKvN0wtg9OcO6mLFKOSZaARXBnWqiWwv/zp9BDc5rt3B1otvrFVWReF2
         rbJP0I1OdMu7BPA3xiuEAdrQtYmpRir9XGGDEkC22ZfJ0RbJc+MaO5ccR04VJqKgON
         rKiEf1qrFWQjA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] MIPS: Loongson64: select NO_EXCEPT_FILL
Date:   Wed, 27 May 2020 14:34:34 +0800
Message-Id: <20200527063438.391949-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200527063438.391949-1-jiaxun.yang@flygoat.com>
References: <20200527063438.391949-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson64 load kernel at 0x82000000 and allocate exception vectors
by ebase. So we don't need to reserve space for exception vectors
at head of kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3ca59b610a67..0e385f7b7691 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -462,6 +462,7 @@ config MACH_LOONGSON64
 	select IRQ_MIPS_CPU
 	select NR_CPUS_DEFAULT_64
 	select USE_GENERIC_EARLY_PRINTK_8250
+	select NO_EXCEPT_FILL
 	select SYS_HAS_CPU_LOONGSON64
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_SMP
-- 
2.27.0.rc0

