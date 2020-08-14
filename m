Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105A7244A43
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 15:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgHNNRf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 09:17:35 -0400
Received: from relay4.mymailcheap.com ([137.74.199.117]:58859 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgHNNRe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Aug 2020 09:17:34 -0400
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 959473F1CF;
        Fri, 14 Aug 2020 15:17:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 65FF42A90D;
        Fri, 14 Aug 2020 15:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1597411050;
        bh=IcYLmM1Z+UqrYNRg8xD5mwKVC7aY5FFV7KvTuaNdKAQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EO9IE2ss2RVn5U9o83Idh0tNcBmvu28hQ1Cr3WBFkZyQHhDeWjEwOkbkus2bdUIo8
         Iq40YLGJbbRh/qoLpyTiSZqYkxTCpuri7CRfAlCF5V4OBHOLdWSf9efTum50UU0CIr
         jJl1YcOFcMga6H6pg/ohy+CE6z2sjYx1KYl9zn7g=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6Ejky4RMV03d; Fri, 14 Aug 2020 15:17:29 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 14 Aug 2020 15:17:28 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id C5E4340EDF;
        Fri, 14 Aug 2020 13:17:26 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="ZmbKh93L";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 372FC40E9C;
        Fri, 14 Aug 2020 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1597411004;
        bh=IcYLmM1Z+UqrYNRg8xD5mwKVC7aY5FFV7KvTuaNdKAQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZmbKh93LccEs2djsUBenNQeGF7LXXdMvNNQCosYdnk2PmYUc3w/1AZ741iFQpnM/B
         gRoYvcmAyLB4UIdGIJk/ASMIOMBNEO0WBbj91Yv7yCsjR8ATSDqaZ8yKPmMuTvyjJC
         iNp+QraZKEjxb4BbphDZyyHLiPAW8VsQvb8Hskrk=
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
References: <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
 <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
 <20200807131357.GA11979@alpha.franken.de>
 <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
 <96dbe0be-7af6-b182-bbe0-534883539812@flygoat.com>
 <20200810141219.GA2844@alpha.franken.de>
 <106e65f5-d456-deaa-b47b-45b2a461b048@flygoat.com>
 <CAAhV-H7xJXX7V18ZUKw6RdEOtKUF49itrXY0PBNFAcSBbr4idQ@mail.gmail.com>
 <20200811120645.GA6199@alpha.franken.de>
 <CAAhV-H5YqF5dcdFiBgVSXzu67QOKTFq3FME8ernswGts45GHfQ@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <f4cb6def-4b65-b829-5878-75dae95b0c39@flygoat.com>
Date:   Fri, 14 Aug 2020 21:16:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5YqF5dcdFiBgVSXzu67QOKTFq3FME8ernswGts45GHfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: C5E4340EDF
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
         FROM_HAS_DN(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[148.251.23.173];
         TO_DN_ALL(0.00)[];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lemote.com,gmail.com];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/14 下午5:44, Huacai Chen 写道:
> Hi, Thomas,
>
> On Tue, Aug 11, 2020 at 8:08 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
>> On Tue, Aug 11, 2020 at 02:45:05PM +0800, Huacai Chen wrote:
>>> Hi, Thomas and Jiaxun,
>>>
>>> On Tue, Aug 11, 2020 at 10:18 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>>>
>>>>
>>>> 在 2020/8/10 22:12, Thomas Bogendoerfer 写道:
>>>>> On Sun, Aug 09, 2020 at 10:53:13PM +0800, Jiaxun Yang wrote:
>>>>>> Thus we still need to enable CU2 with exception for user space, and we can
>>>>>> always enable CU2 in
>>>>>> kernel since kernel won't be compiled with hard-float. :-)
>>>>> I see, how about the patch below
>>>> That looks fine for me.
>>>> Is it good with you, Huacai?
>>> There are two problems:
>>> 1, zboot (arch/mips/boot/compressed/head.S) should be considered,
>>> because the initial value of Status may or may not contain CU2.
>> this comes with it's own memcpy/memset and stuff, I don't see a reason why
>> COP2 needs to be enabled there,
> gslq/gssq can also be generated by toolchains.

To correct myself, GSLQ/GSSQ won't be generated by current upstream GCC
with msoft-float but it is possible to happen with Loongson's GCC 4.9/7 
fork.

And I think we should care this case as well....

Thanks.

- Jiaxun
