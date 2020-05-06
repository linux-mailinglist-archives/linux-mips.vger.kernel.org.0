Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA1A1C6778
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 07:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgEFFa1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 01:30:27 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17727 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726464AbgEFFa0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 01:30:26 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588742999; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=hjuMonbDm31qaE0dHGTuiHEYDwH0wM64wP1v/cfZA7PxU0ntXHukohIOlTUUZk4xvDnZTqIXLO/j0SikOb5bFUMr20eJxO0w5Fb3TypAsXNk7fAlSXLJ2YypLFc72E7idJhYGtJxDkFKX09a2X5oVAJuXD9ICxVPjx6bCTA17qw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588742999; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=WUAiAvXRjYoUQdnq56S71ExyACRlB4fLmT9HCdqLSbI=; 
        b=TRy7wUkaA7BbiEd1wbTSsohVJh4B+sUpdWU6f7U2FoSXBKnGVWRhigW0iysXZqzLvdHqIxBaRQEqS1GIbnLUPZBwWdQSgg5XkVJXfAaJhmoyv+GB2NEoUgvkRmvuKbpOqo6jp8kY5LxuGZBLu/0SkdbgEVu7STMLBMND+XuxFvs=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588742999;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=WUAiAvXRjYoUQdnq56S71ExyACRlB4fLmT9HCdqLSbI=;
        b=Z2e3COXr4zU429GSoGbuwhAl54L2nHuaRq8+0ExEmknKI2iUO8Sv1xdD9yEqurs5
        K9+QKqREtw3KiOTs/o4awtNRH4FxTTmDWCXKbI8qErID9uF734lNXfrrwb7pIu+Aq82
        l6fgtOz0Ww3z8nI/LzfsvwRjv6ugR3lVUmS8fII8=
Received: from [127.0.0.1] (223.104.5.243 [223.104.5.243]) by mx.zoho.com.cn
        with SMTPS id 1588742995960827.1530476550961; Wed, 6 May 2020 13:29:55 +0800 (CST)
Date:   Wed, 06 May 2020 13:29:51 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
Message-ID: <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8812=
:55:43, Huacai Chen <chenhc@lemote=2Ecom> =E5=86=99=E5=88=B0:
>Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
>mode by default=2E However, gslq/gssq (16-bytes load/store instructions)
>overrides the instruction format of lwc2/swc2=2E If we wan't to use gslq/
>gssq for optimization in kernel, we should enable COP2 usage in kernel=2E
>
>Please pay attention that in this patch we only enable COP2 in kernel,
>which means it will lose ST0_CU2 when a process go to user space (try
>to use COP2 in user space will trigger an exception and then grab COP2,
>which is similar to FPU)=2E And as a result, we need to modify the contex=
t
>switching code because the new scheduled process doesn't contain ST0_CU2
>in its THERAD_STATUS probably=2E
>
>Signed-off-by: Huacai Chen <chenhc@lemote=2Ecom>

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>


>---
>V3: Stop using ST0_MM and use ST0_CU2 instead (Thank Thomas and Maciej)=
=2E
>
> arch/mips/boot/compressed/head=2ES   |  7 +++++++
> arch/mips/include/asm/stackframe=2Eh | 12 +++++++++---
> arch/mips/kernel/head=2ES            | 18 +++++++++---------
> arch/mips/kernel/r4k_switch=2ES      |  3 +++
> arch/mips/kernel/traps=2Ec           |  8 +++++++-
> 5 files changed, 35 insertions(+), 13 deletions(-)
>
>diff --git a/arch/mips/boot/compressed/head=2ES b/arch/mips/boot/compress=
ed/head=2ES
>index 409cb48=2E=2E4580316 100644
>--- a/arch/mips/boot/compressed/head=2ES
>+++ b/arch/mips/boot/compressed/head=2ES
>@@ -14,11 +14,18 @@
>=20
> #include <asm/asm=2Eh>
> #include <asm/regdef=2Eh>
>+#include <asm/mipsregs=2Eh>
>=20
> 	=2Eset noreorder
> 	=2Ecprestore
> 	LEAF(start)
> start:
>+#ifdef CONFIG_CPU_LOONGSON64
>+	mfc0    t0, CP0_STATUS
>+	or	t0, ST0_CU2   /* make 16-bytes load/store instructions usable */
>+	mtc0    t0, CP0_STATUS
>+#endif
>+
> 	/* Save boot rom start args */
> 	move	s0, a0
> 	move	s1, a1
>diff --git a/arch/mips/include/asm/stackframe=2Eh b/arch/mips/include/asm=
/stackframe=2Eh
>index 4d6ad90=2E=2Ec9ee7de 100644
>--- a/arch/mips/include/asm/stackframe=2Eh
>+++ b/arch/mips/include/asm/stackframe=2Eh
>@@ -42,6 +42,12 @@
> 	cfi_restore \reg \offset \docfi
> 	=2Eendm
>=20
>+#ifdef CONFIG_CPU_LOONGSON64
>+#define ST0_CUMASK (ST0_CU0 | ST0_CU2)
>+#else
>+#define ST0_CUMASK ST0_CU0
>+#endif
>+
> #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> #define STATMASK 0x3f
> #else
>@@ -450,7 +456,7 @@
>  */
> 		=2Emacro	CLI
> 		mfc0	t0, CP0_STATUS
>-		li	t1, ST0_CU0 | STATMASK
>+		li	t1, ST0_CUMASK | STATMASK
> 		or	t0, t1
> 		xori	t0, STATMASK
> 		mtc0	t0, CP0_STATUS
>@@ -463,7 +469,7 @@
>  */
> 		=2Emacro	STI
> 		mfc0	t0, CP0_STATUS
>-		li	t1, ST0_CU0 | STATMASK
>+		li	t1, ST0_CUMASK | STATMASK
> 		or	t0, t1
> 		xori	t0, STATMASK & ~1
> 		mtc0	t0, CP0_STATUS
>@@ -477,7 +483,7 @@
>  */
> 		=2Emacro	KMODE
> 		mfc0	t0, CP0_STATUS
>-		li	t1, ST0_CU0 | (STATMASK & ~1)
>+		li	t1, ST0_CUMASK | (STATMASK & ~1)
> #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> 		andi	t2, t0, ST0_IEP
> 		srl	t2, 2
>diff --git a/arch/mips/kernel/head=2ES b/arch/mips/kernel/head=2ES
>index 3b02ffe=2E=2Ebca6399 100644
>--- a/arch/mips/kernel/head=2ES
>+++ b/arch/mips/kernel/head=2ES
>@@ -43,20 +43,20 @@
> 	=2Eset	pop
> 	=2Eendm
>=20
>-	=2Emacro	setup_c0_status_pri
>-#ifdef CONFIG_64BIT
>-	setup_c0_status ST0_KX 0
>+#ifdef CONFIG_CPU_LOONGSON64
>+#define ST0_SET ST0_KX | ST0_CU2
>+#elif defined(CONFIG_64BIT)
>+#define ST0_SET ST0_KX
> #else
>-	setup_c0_status 0 0
>+#define ST0_SET 0
> #endif
>+
>+	=2Emacro	setup_c0_status_pri
>+	setup_c0_status ST0_SET 0
> 	=2Eendm
>=20
> 	=2Emacro	setup_c0_status_sec
>-#ifdef CONFIG_64BIT
>-	setup_c0_status ST0_KX ST0_BEV
>-#else
>-	setup_c0_status 0 ST0_BEV
>-#endif
>+	setup_c0_status ST0_SET ST0_BEV
> 	=2Eendm
>=20
> #ifndef CONFIG_NO_EXCEPT_FILL
>diff --git a/arch/mips/kernel/r4k_switch=2ES b/arch/mips/kernel/r4k_switc=
h=2ES
>index 58232ae=2E=2Ec2fde40 100644
>--- a/arch/mips/kernel/r4k_switch=2ES
>+++ b/arch/mips/kernel/r4k_switch=2ES
>@@ -53,6 +53,9 @@
> 	nor	a3, $0, a3
> 	and	a2, a3
> 	or	a2, t1
>+#ifdef CONFIG_CPU_LOONGSON64
>+	or	a2, ST0_CU2   /* make 16-bytes load/store instructions usable */
>+#endif
> 	mtc0	a2, CP0_STATUS
> 	move	v0, a0
> 	jr	ra
>diff --git a/arch/mips/kernel/traps=2Ec b/arch/mips/kernel/traps=2Ec
>index 31968cb=2E=2E5efc525 100644
>--- a/arch/mips/kernel/traps=2Ec
>+++ b/arch/mips/kernel/traps=2Ec
>@@ -2108,9 +2108,15 @@ static void configure_status(void)
> 	 * Disable coprocessors and select 32-bit or 64-bit addressing
> 	 * and the 16/32 or 32/32 FPR register model=2E  Reset the BEV
> 	 * flag that some firmware may have left set and the TS bit (for
>-	 * IP27)=2E  Set XX for ISA IV code to work=2E
>+	 * IP27)=2E Set XX for ISA IV code to work, and enable CU2 for
>+	 * Loongson-3 to make 16-bytes load/store instructions usable=2E
> 	 */
>+#ifndef CONFIG_CPU_LOONGSON64
> 	unsigned int status_set =3D ST0_CU0;
>+#else
>+	unsigned int status_set =3D ST0_CU0 | ST0_CU2;
>+#endif
>+
> #ifdef CONFIG_64BIT
> 	status_set |=3D ST0_FR|ST0_KX|ST0_SX|ST0_UX;
> #endif

--=20
Jiaxun Yang
