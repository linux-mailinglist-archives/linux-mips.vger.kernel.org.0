Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1FC35E35B
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 18:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346269AbhDMQBl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 13 Apr 2021 12:01:41 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:24205 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346221AbhDMQBh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 12:01:37 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-262-Pg1s1P4GM6y7shOfGvuMGA-1; Tue, 13 Apr 2021 17:01:14 +0100
X-MC-Unique: Pg1s1P4GM6y7shOfGvuMGA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 17:01:13 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 17:01:13 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Thomas Bogendoerfer' <tsbogend@alpha.franken.de>
CC:     Jinyang He <hejinyang@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] MIPS: Fix strnlen_user access check
Thread-Topic: [PATCH] MIPS: Fix strnlen_user access check
Thread-Index: AQHXMFYxYikh9GetHkGcA/EmeWNB36qyYICAgAAew4CAABuDEA==
Date:   Tue, 13 Apr 2021 16:01:13 +0000
Message-ID: <c2d2980ede424038ac0e1e5184857407@AcuMS.aculab.com>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
 <20210412142730.GA23146@alpha.franken.de>
 <2fd31420-1f96-9165-23ea-fdccac1b522a@loongson.cn>
 <20210413111438.GA9472@alpha.franken.de>
 <069e524dbad2412f9e74fd234f40fff5@AcuMS.aculab.com>
 <20210413151909.GA13549@alpha.franken.de>
In-Reply-To: <20210413151909.GA13549@alpha.franken.de>
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

From: Thomas Bogendoerfer
> Sent: 13 April 2021 16:19
> 
> On Tue, Apr 13, 2021 at 12:37:25PM +0000, David Laight wrote:
> > From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Sent: 13 April 2021 12:15
> > ...
> > > > The __access_ok() is noted with `Ensure that the range [addr, addr+size)
> > > > is within the process's address space`. Does the range checked by
> > > > __access_ok() on MIPS is [addr, addr+size]. So if we want to use
> > > > access_ok(s, 1), should we modify __access_ok()? Or my misunderstanding?
> > >
> > > you are right, I'm going to apply
> > >
> > > https://patchwork.kernel.org/project/linux-mips/patch/20190209194718.1294-1-paul.burton@mips.com/
> > >
> > > to fix that.
> >
> > Isn't that still wrong?
> > If an application does:
> > 	write(fd, (void *)0xffff0000, 0);
> > it should return 0, not -1 and EFAULT/SIGSEGV.
> 
> WRITE(2)                   Linux Programmer's Manual                  WRITE(2)
> [...]
>        If  count  is  zero  and  fd refers to a regular file, then write() may
>        return a failure status if one of the errors below is detected.  If  no
>        errors  are  detected,  or  error detection is not performed, 0 will be
>        returned without causing any other effect.  If count  is  zero  and  fd
>        refers  to a file other than a regular file, the results are not speci-
>        fied.
> [...]
>        EFAULT buf is outside your accessible address space.
> 
> at least it's covered by the man page on my Linux system.

Something related definitely caused grief in the setsockopt() changes.

> > There is also the question about why this makes any difference
> > to the original problem of logging in via the graphical interface.
> 
> kernel/module.c:        mod->args = strndup_user(uargs, ~0UL >> 1);
> 
> and strndup_user does a strnlen_user.

That call is just gross.
Why did it work before the removal of set_fs() etc.

Or was there another change that affected strndup_user() ?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

