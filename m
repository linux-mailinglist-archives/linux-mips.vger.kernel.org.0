Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45E135DA2B
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 10:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243181AbhDMIe4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 13 Apr 2021 04:34:56 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:23531 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243154AbhDMIey (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 04:34:54 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-5-bF6YM675PiCIR3nXuaRTwg-1; Tue, 13 Apr 2021 09:34:30 +0100
X-MC-Unique: bF6YM675PiCIR3nXuaRTwg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 09:34:30 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 09:34:29 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Jinyang He' <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] MIPS: Fix strnlen_user access check
Thread-Topic: [PATCH] MIPS: Fix strnlen_user access check
Thread-Index: AQHXMAKOYikh9GetHkGcA/EmeWNB36qyHTfQ
Date:   Tue, 13 Apr 2021 08:34:29 +0000
Message-ID: <4e6c077c130c43d5b7e0fc84c979f8b4@AcuMS.aculab.com>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
 <20210412142730.GA23146@alpha.franken.de>
 <2fd31420-1f96-9165-23ea-fdccac1b522a@loongson.cn>
In-Reply-To: <2fd31420-1f96-9165-23ea-fdccac1b522a@loongson.cn>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jinyang He
> Sent: 13 April 2021 02:16
> 
> > On Mon, Apr 12, 2021 at 11:02:19AM +0800, Tiezhu Yang wrote:
> >> On 04/11/2021 07:04 PM, Jinyang He wrote:
> >>> Commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs") brought a problem for
> >>> strnlen_user(). Jump out when checking access_ok() with condition that
> >>> (s + strlen(s)) < __UA_LIMIT <= (s + n). The old __strnlen_user_asm()
> >>> just checked (ua_limit & s) without checking (ua_limit & (s + n)).
> >>> Therefore, find strlen form s to __UA_LIMIT - 1 in that condition.
> >>>
> >>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> >>> ---
> >>>    arch/mips/include/asm/uaccess.h | 11 +++++++++--
> >>>    1 file changed, 9 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> >>> index 91bc7fb..85ba0c8 100644
> >>> --- a/arch/mips/include/asm/uaccess.h
> >>> +++ b/arch/mips/include/asm/uaccess.h
> >>> @@ -630,8 +630,15 @@ static inline long strnlen_user(const char __user *s, long n)
> >>>    {
> >>>    	long res;
> >>> -	if (!access_ok(s, n))
> >>> -		return -0;
> >>> +	if (unlikely(n <= 0))
> >>> +		return 0;
> >>> +
> >>> +	if (!access_ok(s, n)) {
> >>> +		if (!access_ok(s, 0))
> >>> +			return 0;
> >>> +
> >>> +		n = __UA_LIMIT - (unsigned long)s - 1;
> >>> +	}
> >>>    	might_fault();
> >>>    	__asm__ __volatile__(
> >> The following simple changes are OK to fix this issue?
> >>
> >> diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> >> index 91bc7fb..eafc99b 100644
> >> --- a/arch/mips/include/asm/uaccess.h
> >> +++ b/arch/mips/include/asm/uaccess.h
> >> @@ -630,8 +630,8 @@ static inline long strnlen_user(const char __user *s, long n)
> >>   {
> >>          long res;
> >> -       if (!access_ok(s, n))
> >> -               return -0;
> >> +       if (!access_ok(s, 1))
> >> +               return 0;
> >>          might_fault();
> >>          __asm__ __volatile__(
> > that's the fix I'd like to apply. Could someone send it as a formal
> > patch ? Thanks.
> >
> > Thomas.
> >
> Hi, Thomas,
> 
> Thank you for bringing me more thinking.
> 
> I always think it is better to use access_ok(s, 0) on MIPS. I have been
> curious about the difference between access_ok(s, 0) and access_ok(s, 1)
> until I saw __access_ok() on RISCV at arch/riscv/include/asm/uaccess.h
> 
> The __access_ok() is noted with `Ensure that the range [addr, addr+size)
> is within the process's address space`. Does the range checked by
> __access_ok() on MIPS is [addr, addr+size]. So if we want to use
> access_ok(s, 1), should we modify __access_ok()? Or my misunderstanding?

ISTR that access_ok(xxx, 0) is unconditionally true on some architectures.
The range checked should be [addr, addr+size).
These are needed so that write(fd, random(), 0) doesn't ever fault.

> More importantly, the implementation of strnlen_user in lib/strnlen_user.c
> is noted `we hit the address space limit, and we still had more characters
> the caller would have wanted. That's 0.` Does it make sense? It is not
> achieved on MIPS when hit __ua_limit, if only access_ok(s, 1) is used.

There is the question of whether one call to access_ok(addr, 1) is
sufficient for any code that does sequential accesses.
It is if there is an unmapped page between the last valid user page
and the first valid kernel page.
IIRC x86 has such an unmapped page because 'horrid things' (tm) happen
if the cpu prefetches across the user-kernel boundary.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

