Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5346F1E2750
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 18:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgEZQnB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 12:43:01 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17798 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728350AbgEZQnB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 12:43:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1590511335; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=KTBxlxzjzYnUXVI/RULLuufyZgrV/EDUPIW/xP1xEljlxKqGtl3BGyUkRRioj6BF16yR11LafKW5eFp0Mv4w5C4IJziasa7cOKzB3UsWC93452+Md66mAD+R/G2q7X6mhooDlAA+4Bm22oFYnaRzl04WZHi6Hhyk4aZ8CJ+b6Z4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1590511335; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=z07e3ZVvSUxeTOaOOf4CjWtLYzMxmG81l7EZZP4sZc0=; 
        b=DxfqyEUZkvpyQn4DHvBkFLpwtqdNIjblf4x8lhknnEoBrA522vFf+/ROjMQJMqjwvBinNUX1jy8JNfiEOXC2hJTHJipbpHouwbzGwOxx1+6fqTFo9sPK5tJO60PXziKli2nr+U9n5sz1ucNfo+67rqVhYTZvqBqhg1nSyVArdnc=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1590511335;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=z07e3ZVvSUxeTOaOOf4CjWtLYzMxmG81l7EZZP4sZc0=;
        b=fS0cQBE+b6uEhcuOZjojqDAw/hiiwOeTaQeeGRrt+aQlXh32ooZRT384ue5cGq4D
        HRM8oQnkewjgQ40BcBqnu4OdbOnWN1WDVzFn04uYGtIKF+pL0JIVl4puB0tKMIXCJWC
        ff8md8e4YsZf8nfTc29gLRLaibflHqwrJ15JgVqI=
Received: from [127.0.0.1] (60.177.188.90 [60.177.188.90]) by mx.zoho.com.cn
        with SMTPS id 1590511334420243.9202782836336; Wed, 27 May 2020 00:42:14 +0800 (CST)
Date:   Wed, 27 May 2020 00:42:12 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Robin Murphy <robin.murphy@arm.com>,
        Lichao Liu <liulichao@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache consistency
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <20200526160045.GA12325@alpha.franken.de>
References: <20200526111438.3788-1-liulichao@loongson.cn> <20200526193859.0adaea3b@halation.net.flygoat.com> <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn> <20200526130128.GA8487@alpha.franken.de> <1d594568-e457-533e-122a-c7e449c0f05d@arm.com> <20200526232556.14a40f6c@halation.net.flygoat.com> <20200526160045.GA12325@alpha.franken.de>
Message-ID: <42B7DD7E-4B77-4874-B932-95236D304CFB@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
2:00:45, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=
=88=B0:
>On Tue, May 26, 2020 at 11:25:56PM +0800, Jiaxun Yang wrote:
>> On Tue, 26 May 2020 14:29:50 +0100
>> Robin Murphy <robin=2Emurphy@arm=2Ecom> wrote:
>>=20
>> > On 2020-05-26 14:01, Thomas Bogendoerfer wrote:
>> > > On Tue, May 26, 2020 at 08:40:28PM +0800, Lichao Liu wrote: =20
>> > >> Loongson-2EF need software maintain cache consistency, So when
>> > >> using streaming DMA, software needs to maintain consistency=2E
>> > >>
>> > >> dma_map_single() is correct, but dma_unmap_single is wrong=2E
>> > >>
>> > >> The function call path:
>> > >> 'dma_unmap_single->dma_unmap_page_attrs->dma_direct_unmap_page->
>> > >>   dma_direct_sync_single_for_cpu->arch_sync_dma_for_cpu->
>> > >>   cpu_needs_post_dma_flush'
>> > >>
>> > >> In current version, 'cpu_needs_post_dma_flush' will return false
>> > >> at Loongon-2EF platform, and dma_unmap_single will not invalidate
>> > >> cache, driver may access wrong dma data=2E =20
>> > >=20
>> > > why should it ? CPU must not touch data while it's mapped for DMA=
=2E
>> > >  =20
>> > >> I don't know what's the exact meaning of "fill random cachelines
>> > >> with stale data at any time"=2E I always think
>> > >> 'cpu_needs_post_dma_flush()' means whether this platform needs
>> > >> software to maintain cache consistency=2E =20
>> > >=20
>> > > this will only happen, if cpu speculates creates dirty cache lines
>> > > by speculation as R10k type of CPUs do=2E =20
>> >=20
>> > Will it? The usual pattern for this problem is that the CPU=20
>> > speculatively fills a (clean) cache line after a DMA_FROM_DEVICE=20
>> > operation has begun, but before the device has actually written to
>> > that part of the buffer=2E Thus a subsequent CPU read after the
>> > operation is complete can hit in the cache and return the previous
>> > data rather than the updated data that the device wrote=2E I don't kn=
ow
>> > about MIPS specifically, but that can certainly happen on Arm=2E
>>=20
>> Checked the manual of Loongson-2F again and I must admit the case may
>> happen on Loongson-2EF processor=2E
>
>so the patch is correct ?

I'm not sure=2E If we only have to care the case raised by Robin
then we just need to care DMA_FROM_DEVICE=2E

But sync unconditionally seems much more safer=2E

Thanks=2E

>>=20
>> R4k manual didn't show the details of speculative policy but I think
>> that should be applied to all R4k like processors?
>
>R4k doesn't speculate at all=2E
>
>Thomas=2E
>

--=20
Jiaxun Yang
