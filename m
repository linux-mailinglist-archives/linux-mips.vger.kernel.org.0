Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CFD2827B8
	for <lists+linux-mips@lfdr.de>; Sun,  4 Oct 2020 03:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgJDBRU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Oct 2020 21:17:20 -0400
Received: from relay2.mymailcheap.com ([217.182.66.162]:52687 "EHLO
        relay2.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgJDBRU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Oct 2020 21:17:20 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id BA9C23ECDA;
        Sun,  4 Oct 2020 03:17:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id E51C02A0FC;
        Sat,  3 Oct 2020 21:17:16 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1601774236;
        bh=VpNMNzNhPvGmh9lm2Wahvlf6X8ISFXLwDCrgseSglWY=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=Uypc8fsxSwoHaVfw+r29RzKfwkn2DhhGm4yTEIICGCJWe/KGc4mGkVZeWfakYXmg8
         i5uafZMomjgORp+zGaztOH0KwH5+VusPmxpNEBWn8mDHoaHvUFmsVSve4rHYP4MU+K
         kSXR311VRWizk6150l9OO3ji4RLnVUeM1fJYd250=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZB5GRAQkPbZ2; Sat,  3 Oct 2020 21:17:15 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Sat,  3 Oct 2020 21:17:15 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 5D13E4085B;
        Sun,  4 Oct 2020 01:17:13 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="EQdCy5pM";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (unknown [36.18.114.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2BC664085B;
        Sun,  4 Oct 2020 01:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1601774228;
        bh=VpNMNzNhPvGmh9lm2Wahvlf6X8ISFXLwDCrgseSglWY=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=EQdCy5pM+KJ4Pd40DhZyIm3WdCi7cqRPoPZsn3fhGWlWYjr1h7CXDhbKTf4jtgEEw
         R8Jbf2LUuFzOzO5J9KzuRZ1j1fKwa7GdwydoWDXFdPhSF8vfGN888LEDVfFVURXqHL
         H6n54TCE8fIM/PG/d2d2pTy9yz+R9vJJeXKRSYEg=
Date:   Sat, 03 Oct 2020 14:25:42 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        Paul Burton <paulburton@kernel.org>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: cevt-r4k: Enable intimer for Loongson64 CPUs with extimer
User-Agent: K-9 Mail for Android
In-Reply-To: <20201002132721.GA12295@alpha.franken.de>
References: <20200923110301.58125-1-jiaxun.yang@flygoat.com> <20201002132721.GA12295@alpha.franken.de>
Message-ID: <CA420A99-C226-4A22-B3A6-4464DD8CFA1D@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5D13E4085B
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_TWELVE(0.00)[12];
         RECEIVED_SPAMHAUS_PBL(0.00)[36.18.114.162:received];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lemote.com,baikalelectronics.ru,xen0n.name,kernel.org,wanyeetech.com,gmail.com,crapouillou.net];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B410=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=889=
:27:21, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=
=B0:
>On Wed, Sep 23, 2020 at 07:02:54PM +0800, Jiaxun Yang wrote:
>> =20
>> +#ifdef CONFIG_CPU_LOONGSON64
>> +static int c0_compare_int_enable(struct clock_event_device *cd)
>> +{
>> +	if (cpu_has_extimer)
>> +		set_c0_config6(LOONGSON_CONF6_INTIMER);
>
>why are you not simply do this in loognson64 board setup code and avoid
>the whole cluttering of #ifdef CONFIG_CPU_LOONGSON64 over common code ?

Because I'm going to add extimer support later that require dynamic switch=
 of cevt-r4k=2E

This callback is required=2E

Thanks=2E

- Jiaxun

>
>Thomas=2E
>
