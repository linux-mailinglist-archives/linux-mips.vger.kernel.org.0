Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B24E1B9200
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 19:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgDZRL4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 13:11:56 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17718 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726151AbgDZRL4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 13:11:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587921034; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Yo5Lp5gpVcEH9T0DplkYcWSGVqNPmOJB8w1dulm+cUUL/qFCsLlTdzgECR+Fk3uZwq8jtbdgnYS887/J9g/bh/BTpP0AqOpw9aQYQikgO2UyCx7AsoHSjdEG46x2wxP47mzjHAkRUEYjgu7eoQRjiex2+TAWhtyWwbS1cKSma4w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1587921034; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=3moL8OMLSDXgd7jsrnGn07s4xflMblHhr/DKN/+Jgj8=; 
        b=ByXAtlm6lFexh/TJuMEmjkcMW8atxhm/pq49bLwMkjd486rEoYKRXk13nLvXm6Oe7DQ3JTVOG5OGZxJcqzSHMHJh4fV1+5OGlj8RHq8fAGBRPrXr5vK5F5pvAtlXEfCxCB38AHBI7DV57HlJXPK/DgPy3nntA/btnBSQ5xpzgbw=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1587921034;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=3moL8OMLSDXgd7jsrnGn07s4xflMblHhr/DKN/+Jgj8=;
        b=HyqOJRb8u/FN3VfxphaILwfF2/URAmGanE+n86+Gt1XpwWQFv2Qjd95fn69hHwl+
        WSGExIgg8ZtTwxDp8tr9qg1/IY+uROZkVmb+DOvyFmdKuUKyxjv+OLlakCvGSS4tWeP
        1kYdeGmLcw10Ko1Y267jxoIPn1TIZian1HP3U+dY=
Received: from [127.0.0.1] (122.235.213.3 [122.235.213.3]) by mx.zoho.com.cn
        with SMTPS id 1587921032291865.6888527356479; Mon, 27 Apr 2020 01:10:32 +0800 (CST)
Date:   Mon, 27 Apr 2020 01:10:29 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Guoyun Sun <sunguoyun@loongson.cn>
CC:     Paul Burton <paulburton@kernel.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Price <steven.price@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        TieZhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] mips/mm: Add page soft dirty tracking
User-Agent: K-9 Mail for Android
In-Reply-To: <20200426165441.GA10053@alpha.franken.de>
References: <1587460527-13986-1-git-send-email-sunguoyun@loongson.cn> <20200426165441.GA10053@alpha.franken.de>
Message-ID: <92510286-5E77-40EB-8356-17CCA21E8391@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
2:54:42, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=
=88=B0:
>On Tue, Apr 21, 2020 at 05:15:27PM +0800, Guoyun Sun wrote:
>> User space checkpoint and restart tool (CRIU) needs the page's change
>> to be soft tracked=2E This allows to do a pre checkpoint and then dump
>> only touched pages=2E
>>=20
>> Signed-off-by: Guoyun Sun <sunguoyun@loongson=2Ecn>
>> ---
>>  arch/mips/Kconfig                    |  1 +
>>  arch/mips/include/asm/pgtable-bits=2Eh |  8 ++++--
>>  arch/mips/include/asm/pgtable=2Eh      | 48 ++++++++++++++++++++++++++=
++++++++--
>
>this breaks all 32bit builds where CPU support RIXI, because it overflows
>pgtable_bits=2E

Probably make a fixup patch to guard
_PAGE_SOFT_DIRTY_SHIFT with
CONFIG_HAVE_ARCH_SOFT_DIRTY
would be a better option?

Btw: It's really selfish that only enable SOFT_DIRTY for Loongson
but occupied a bit in pagetable for all MIPS systems=2E

I'd suggest select HAVE_ARCH_SOFT_DIRTY for all 64BIT MIPS systems=2E
Or provide config options to let expert users decide what feature they nee=
d=2E

Thanks=2E

>
>Thomas=2E
>

--=20
Jiaxun Yang
