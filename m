Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646541B91FB
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 19:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgDZRJj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 13:09:39 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:46274 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgDZRJj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 13:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587920977; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CNV6l4isjrOBsCEJPV/4tGbmk1UULky87Fc71u/Vgqo=;
        b=JeZ7oaABfsBG/baBMbr6RXayjhNYmmLA/gwNVNjmbxr3AW68cqlfiTggs2Y59zuQUGL5Vg
        U5lFB9GzsDI7EroRJRc/IAbyonmEC2OteeKUGcvkiWC4ccvl4s7VXyyza6I4tZBrRYH80p
        yVdZ0m6fdd3i6OyB/j2bjgBdPc0QaI0=
Date:   Sun, 26 Apr 2020 19:09:26 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mips/mm: Add page soft dirty tracking
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Guoyun Sun <sunguoyun@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Price <steven.price@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        TieZhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Message-Id: <QNNE9Q.WIYO7ZSN6WHE@crapouillou.net>
In-Reply-To: <20200426165441.GA10053@alpha.franken.de>
References: <1587460527-13986-1-git-send-email-sunguoyun@loongson.cn>
        <20200426165441.GA10053@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Le dim. 26 avril 2020 =E0 18:54, Thomas Bogendoerfer=20
<tsbogend@alpha.franken.de> a =E9crit :
> On Tue, Apr 21, 2020 at 05:15:27PM +0800, Guoyun Sun wrote:
>>  User space checkpoint and restart tool (CRIU) needs the page's=20
>> change
>>  to be soft tracked. This allows to do a pre checkpoint and then dump
>>  only touched pages.
>>=20
>>  Signed-off-by: Guoyun Sun <sunguoyun@loongson.cn>
>>  ---
>>   arch/mips/Kconfig                    |  1 +
>>   arch/mips/include/asm/pgtable-bits.h |  8 ++++--
>>   arch/mips/include/asm/pgtable.h      | 48=20
>> ++++++++++++++++++++++++++++++++++--
>=20
> this breaks all 32bit builds where CPU support RIXI, because it=20
> overflows
> pgtable_bits.

I think we'd need to make PTEs 64-bit at some point.

We wanted to add support for huge-pages on 32-bit MIPS and faced the=20
same issue.

-Paul

> Thomas.
>=20
> --
> Crap can work. Given enough thrust pigs will fly, but it's not=20
> necessarily a
> good idea.                                                [ RFC1925,=20
> 2.3 ]


