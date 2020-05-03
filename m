Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9B51C2DAD
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 17:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgECPvk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 11:51:40 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17462 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728207AbgECPvk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 11:51:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588521024; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=SPnOFObZMtonlaRFPRj00r00oSvBCq2VGST6ntsUlHDEq8TiiwxUtNCFmtCPVwGfZdW/W66ThivInEEiKVw5cJZezaMcVMlxsrhu+8O+k9B37WOmBX0l/05Ts/CWrmJdJSqWL+B7eNBwlMji9GllGq+jYicTc9P42Vth4LxEbh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588521024; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=PRG9PjWmPIb9rReNC9l8ioCROl7tNNyG/LQLSI+Ef0I=; 
        b=CzJG/RrVNaExf6j+r7SjcdV7U9ISUzbVcl6CGGmyGUPLYsJaRjgQVxwydiIAkkb+7Hb+IaOexn/PovdxkIs02giOL73zYB9kNMxIUd8DAaRRAK4qlvBNm9opbyZaP3UYWm4uHrrNFoFgxrQbRs9aQVSY71ttULcJNzUT5HuRxvs=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588521024;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=PRG9PjWmPIb9rReNC9l8ioCROl7tNNyG/LQLSI+Ef0I=;
        b=CtWFrMrYM0zhZCzauJgpDcwhDefkPxdMgoZfRI/AJlgNKAyMOp5qLfa6R0PN4VKX
        ESE4tCmMsuzIEvlqjeODEBm5rAD86qpJf77GlnGuiIBS7rKKjby04N+MATbqdzkFUbG
        giMYsacr+tMyg1jrfXy7wQk5FcBbyDkJ9Zi7rYPg=
Received: from [127.0.0.1] (122.235.211.112 [122.235.211.112]) by mx.zoho.com.cn
        with SMTPS id 1588521013745808.7090818787239; Sun, 3 May 2020 23:50:13 +0800 (CST)
Date:   Sun, 03 May 2020 23:50:09 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
CC:     Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v2 RESEND 4/4] MIPS: emulate CPUCFG instruction on older Loongson64 cores
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200503105012.43246-1-git@xen0n.name>
References: <20200503103304.40678-5-git@xen0n.name> <20200503105012.43246-1-git@xen0n.name>
Message-ID: <3B0FE747-AE18-404B-9CD3-D3401634340C@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=886:=
50:13, WANG Xuerui <git@xen0n=2Ename> =E5=86=99=E5=88=B0:
>CPUCFG is the instruction for querying processor characteristics on
>newer Loongson processors, much like CPUID of x86=2E Since the instructio=
n
>is supposedly designed to provide a unified way to do feature detection
>(without having to, for example, parse /proc/cpuinfo which is too
>heavyweight), it is important to provide compatibility for older cores
>without native support=2E Fortunately, most of the fields can be
>synthesized without changes to semantics=2E Performance is not really big
>a concern, because feature detection logic is not expected to be
>invoked very often in typical userland applications=2E
>
>The instruction can't be emulated on LOONGSON_2EF cores, according to
>FlyGoat's experiments=2E Because the LWC2 opcode is assigned to other
>valid instructions on 2E and 2F, no RI exception is raised for us to
>intercept=2E So compatibility is only extended back furthest to
>Loongson-3A1000=2E Loongson-2K is covered too, as it is basically a remix
>of various blocks from the 3A/3B models from a kernel perspective=2E
>
>This is lightly based on Loongson's work on their Linux 3=2E10 fork, for
>being the authority on the right feature flags to fill in, where things
>aren't otherwise discoverable=2E
>
>Signed-off-by: WANG Xuerui <git@xen0n=2Ename>
>Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>Tested-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom> # Loongson-2K, 3B150=
0
>Cc: Huacai Chen <chenhc@lemote=2Ecom>
>Cc: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>Cc: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>---

Some random thoughts on that:

While cpucfg instruction would not be available on other MIPS
processors, and given that most distros are more willing to provide
general MIPS version instead of Loongson specified version, we'd better
provide user space programs a way to probe emulated/physical cpucfg suppor=
t=2E

Looks like elf_hwcap would be a option? I've already added some flags abou=
t
Loongson's extension and now an extra HWCAP_LOONGSON_CPUCFG can cover ever=
ything=2E

>
>Resend because I forgot to include Jiaxun's review tags=2E Sorry for the
>noise=2E
>
> arch/mips/Kconfig                             |  11 ++
> arch/mips/include/asm/cpu-info=2Eh              |   9 ++
> =2E=2E=2E/include/asm/mach-loongson64/cpucfg-emul=2Eh |  67 +++++++++
> arch/mips/kernel/cpu-probe=2Ec                  | 129 ++++++++++++++++++
> arch/mips/kernel/traps=2Ec                      |  45 ++++++
> arch/mips/loongson64/Makefile                 |   1 +
> arch/mips/loongson64/cpucfg-emul=2Ec            |  80 +++++++++++
> 7 files changed, 342 insertions(+)
> create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul=2Eh
> create mode 100644 arch/mips/loongson64/cpucfg-emul=2Ec

--=20
Jiaxun Yang
