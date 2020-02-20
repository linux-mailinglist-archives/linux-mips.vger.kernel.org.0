Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B521658EA
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 09:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgBTIMi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 03:12:38 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17930 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726541AbgBTIMh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 03:12:37 -0500
X-Greylist: delayed 914 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Feb 2020 03:11:48 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582185365;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=vDUle+bK9nzmqA7ZpDE8hM/Wdy0/mDXfft5rPIpoVc4=;
        b=ILKrNT93qUbRKgQJ4HfWwuDw3BjRJmv4M2hUbdDHWbVg96M76uVMUmkd6DntmP2v
        SL7DXbSroEAL2EMn0FMqi46OuFTItDP2WFG9tvX6lsXShS2vYjtVP/w6TGBJ95IMUsj
        Dl/bbcrIEXxYbVdqJabWKK7kZz+ns7l1kcSVpYDo=
Received: from [26.26.26.1] (183.156.46.156 [183.156.46.156]) by mx.zoho.com.cn
        with SMTPS id 1582185359940116.59226967139227; Thu, 20 Feb 2020 15:55:59 +0800 (CST)
Date:   Thu, 20 Feb 2020 15:55:58 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAhV-H62BKFeh3h7xE3LQLYwLRukG5dE3gu4F7RGZdJcdoNCjg@mail.gmail.com>
References: <20200219191730.1277800-1-paulburton@kernel.org> <20200219191730.1277800-3-paulburton@kernel.org> <cfeab22c0f332418d25e56fa86f5420f5470e4ee.camel@perches.com> <CAAhV-H62BKFeh3h7xE3LQLYwLRukG5dE3gu4F7RGZdJcdoNCjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
To:     Huacai Chen <chenhuacai@gmail.com>
CC:     Paul Burton <paulburton@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ysu@wavecomp.com
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <2A286117-5B5C-4B4D-ADC7-86850AE1FA39@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B42=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=882=
:44:03, Huacai Chen <chenhuacai@gmail=2Ecom> =E5=86=99=E5=88=B0:
>Hi, all,
>
>I suggest Jiaxun Yang to be the new Linux/MIPS maintainer because of
>the following reasons:
>
>1=2E He is familiar with Linux kernel & MIPS architecture=2E
>2=2E He is active and has already contributed many patches=2E
>3=2E He is not an employee of any corporation, so people can expect him
>to be neutral=2E
>4=2E He is young and has enough free time to follow the mainstream
>development closely=2E
>5=2E His English is good and is willing to maintain a good level of
>communication with other contributors=2E
>
>Jiaxun, what's your opinion?

Thanks for your recommendation=2E

It's my pleasure to take this duty if I'm eligible=2E

I have experience in MIPS chips and have already involved in some review p=
rocesses=2E
i=2Ee=2Eloongson, Ingenic/MediaTec & etc=2E

As what Huacai has said, I'm a pure contributor from community,
which means I will able to be neutral
to MIPS family members=2E

[Also added Yunqiang Su to Cc list as he is the
only current MIPS company employee I know=2E]

Thanks=2E
>
>Regards,
>Huacai Chen
--=20
Jiaxun Yang
