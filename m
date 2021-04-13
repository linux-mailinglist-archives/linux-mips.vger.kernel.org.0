Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A65E35DF03
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 14:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhDMMh4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 13 Apr 2021 08:37:56 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:34273 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237594AbhDMMhz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 08:37:55 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-54--zvhWPgkNZK9FoYlq-tgjA-1; Tue, 13 Apr 2021 13:37:26 +0100
X-MC-Unique: -zvhWPgkNZK9FoYlq-tgjA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 13:37:25 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 13:37:25 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Thomas Bogendoerfer' <tsbogend@alpha.franken.de>,
        Jinyang He <hejinyang@loongson.cn>
CC:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] MIPS: Fix strnlen_user access check
Thread-Topic: [PATCH] MIPS: Fix strnlen_user access check
Thread-Index: AQHXMFYxYikh9GetHkGcA/EmeWNB36qyYICA
Date:   Tue, 13 Apr 2021 12:37:25 +0000
Message-ID: <069e524dbad2412f9e74fd234f40fff5@AcuMS.aculab.com>
References: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
 <cbe5e79b-ee6c-5c59-0051-28e4d1152666@loongson.cn>
 <20210412142730.GA23146@alpha.franken.de>
 <2fd31420-1f96-9165-23ea-fdccac1b522a@loongson.cn>
 <20210413111438.GA9472@alpha.franken.de>
In-Reply-To: <20210413111438.GA9472@alpha.franken.de>
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

From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Sent: 13 April 2021 12:15
...
> > The __access_ok() is noted with `Ensure that the range [addr, addr+size)
> > is within the process's address space`. Does the range checked by
> > __access_ok() on MIPS is [addr, addr+size]. So if we want to use
> > access_ok(s, 1), should we modify __access_ok()? Or my misunderstanding?
> 
> you are right, I'm going to apply
> 
> https://patchwork.kernel.org/project/linux-mips/patch/20190209194718.1294-1-paul.burton@mips.com/
> 
> to fix that.

Isn't that still wrong?
If an application does:
	write(fd, (void *)0xffff0000, 0);
it should return 0, not -1 and EFAULT/SIGSEGV.

There is also the question about why this makes any difference
to the original problem of logging in via the graphical interface.

ISTM that it is very unlikely that the length passed to strnlen_user()
is long enough to take potential buffer beyond the end of user
address space.
It might be that it is passing 'huge' to do strlen_user().
But since the remove set_fs() changes are reported to have
broken it, was it actually being called for a kernel buffer?

There is more going on here.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

