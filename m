Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C34D1DDDE3
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 05:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgEVDef (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 23:34:35 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17458 "EHLO
        sender2-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727024AbgEVDef (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 May 2020 23:34:35 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1590118458; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=f321WCI81Nr4YddSXFVf7OybzzBWdGx0tevUS8JXLvYzI5gki2CsTN3Tgi679oG3n0iV5+jkL06b113Sr+Gyh/ydsBqQ7IYvgWEXQKJucE6dSYa8lxn32AH03/X9oOvzCDMbejazLbxAJH7780Zt74/FX25Osy5GMBk5PJFayuY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1590118458; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=lqAeoEhR+9sNVfn+9XDC2hp29MtKECmjwqLOkBqcrDA=; 
        b=RVGFp/EjVZYDDyZk+zziOCVylbuzZ0ZPIXQMKeRlpohzKkp3xLUpw9t6tO1XgEnItffKlr1uAcMJWl+1YpJEfFwbfcHr3uEOb6JKKS6yEwZbh4TpETWFX8IGF9+pvvir1/EsYzmQVfQXREu18JxQweI7LtB/MA8e+wnIFGbLz2k=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590118458;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=lqAeoEhR+9sNVfn+9XDC2hp29MtKECmjwqLOkBqcrDA=;
        b=ZE9m2r6zdC8tn6sxn1JYoAUH3wgjT3IdhYCVE/CthMFnYzTLVWhLD8g9jIlfTqZG
        mA7i2gYJsOITKUEAXAiO/gXxEDCZYSpd/6FGih60P2Zl+nnhqFeSUX2QwMKpW09IATE
        5ynViSwjmvIsq62NQ6fSfjS/XvRJLsvvAvnugeok=
Received: from [127.0.0.1] (223.104.213.109 [223.104.213.109]) by mx.zoho.com.cn
        with SMTPS id 1590118455002465.542000662218; Fri, 22 May 2020 11:34:15 +0800 (CST)
Date:   Fri, 22 May 2020 11:34:12 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
CC:     Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v3 1/1] MIPS: emulate CPUCFG instruction on older Loongson64 cores
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200521181403.6078-2-git@xen0n.name>
References: <20200521181403.6078-1-git@xen0n.name> <20200521181403.6078-2-git@xen0n.name>
Message-ID: <06190BF2-6290-46A6-A707-8809362A95D9@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882=
:14:03, WANG Xuerui <git@xen0n=2Ename> =E5=86=99=E5=88=B0:
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
>Cc: Huacai Chen <chenhc@lemote=2Ecom>
>Cc: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>Cc: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>---
> arch/mips/Kconfig                             |  12 +
> arch/mips/include/asm/cpu-info=2Eh              |   9 +
> =2E=2E=2E/include/asm/mach-loongson64/cpucfg-emul=2Eh |  65 ++++++
> arch/mips/kernel/cpu-probe=2Ec                  |   9 +
> arch/mips/kernel/traps=2Ec                      |  45 ++++

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

LGTM, Thanks!
--=20
Jiaxun Yang
