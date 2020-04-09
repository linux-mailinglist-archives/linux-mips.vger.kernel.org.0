Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 658691A3B89
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 22:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgDIUsr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 16:48:47 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17846 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726650AbgDIUsq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 16:48:46 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586465306; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=YlfU/ZLjvK1Na/tap//Goz97Lpo0r+FRNLa9VZx+D4BqCREdgmz881mmg3RXubqlQM4mbkM442JXDqfHJXcMzuvSvQKWK6/fTqJRMwSHE3T+qeP3Zk7OMH/aYcsd6Rf/00XXEEZ3SlKYLLTVM9PEkG/lQleLQ1ob7bNBWNavoGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586465306; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=U0pq0JEPCR1+7zJuPhI3a++HaEktJMT6prJ5o5utijU=; 
        b=SNCJUtJth8MFokubqEONHn5/sXe/a95XSieeknM7hhR83+YEB2ZOYDPvvLY3fIwRD+VY6TxQogFbMJNwS7nBt+2l1VzatS5gTWxpAKid7XgIPiLewrmCqD+n//lpop7WpkOi/OV3ECK+x9Zng/RSTEu2TmYTSbPaOB2T691PZrw=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586465306;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=U0pq0JEPCR1+7zJuPhI3a++HaEktJMT6prJ5o5utijU=;
        b=BtQUv/OsYeLeeQp+rqPMrYREWLLLinWGVTOMYqQyFluaxL9IU8+eG+b7eRKR4VvQ
        EPi9XZQONhtukY7Fkw1Rw+rzmWhXbJabAmV5ZzblTQ0a0m4t3fCHR94ztaZG/nOATTr
        0ETqFfuKAxoM6miMWGZGbmepBKgspjXzG2hmyang=
Received: from [26.26.26.1] (122.235.212.87 [122.235.212.87]) by mx.zoho.com.cn
        with SMTPS id 1586465304314253.90545532683097; Fri, 10 Apr 2020 04:48:24 +0800 (CST)
Date:   Fri, 10 Apr 2020 04:48:21 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.LFD.2.21.2004091704570.596385@eddie.linux-mips.org>
References: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn> <CAKcpw6XywbOs-rh5ko0uz9vLz9nkgrJ0LiRTSkQQaU9dZbg7oQ@mail.gmail.com> <20200409150923.5b224361@flygoat-x1e> <alpine.LFD.2.21.2004091540450.596385@eddie.linux-mips.org> <7A98E39B-EDCF-496D-9525-0160A368361B@flygoat.com> <alpine.LFD.2.21.2004091704570.596385@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Limit check_bugs32() under CONFIG_32BIT
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     YunQiang Su <wzssyqa@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <27B762B9-ABD9-495A-B9A6-74541FEB8F2F@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8810=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
2:15:27, "Maciej W=2E Rozycki" <macro@linux-mips=2Eorg> =E5=86=99=E5=88=B0:
>On Thu, 9 Apr 2020, Jiaxun Yang wrote:
>
>> > Why is using Kconfig supposed to be better?  Several configurations
>
>> >support multiple processor types (e=2Eg=2E swappable CPU daugthercards
>or
>> >FPGA=20
>> >soft-cores) and having to list CPU types across platforms as CPUs
>are=20
>> >added is going to be a maintenance nightmare=2E  Whereas having
>> >workarounds=20
>> >or panics associated with run-time determination of the actual CPU
>type
>> >
>> >guarantees they will trigger where necessary=2E  The use of `init'
>> >sections=20
>> >assures the reclaim of memory for use after bootstrap=2E
>>=20
>> Actually I meant let bug checks depends on Kconfig's CPU selection=2E
>>=20
>> It's guaranteed that you can only select one kind of CPU one time,
>> to prevent the overhead of checking bugs on irrelevant processors=2E
>
>That makes no sense to me sorry=2E  When you select say a MIPS32r2 CPU
>for=20
>a Malta configuration, you can run it with a 4KE, 24K, 24KE, 34K, 74K,=20
>1004K, M14K, and probably a few other CPUs I have forgotten about=2E  Are
>
>you suggesting now that you want to require a separate kernel=20
>configuration for each of these CPUs?

Nope=2E As the Kconfig is telling about the possibility,
the real CPUTYPE check is still done during boot=2E

Thanks=2E
--=20
Jiaxun Yang
