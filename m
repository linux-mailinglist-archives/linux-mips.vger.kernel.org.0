Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDF633F51D
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 17:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbhCQQJj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 17 Mar 2021 12:09:39 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:29295 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232374AbhCQQJV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Mar 2021 12:09:21 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-141-CgiPIEZCN1CWsvSmGNeuiQ-1; Wed, 17 Mar 2021 16:09:17 +0000
X-MC-Unique: CgiPIEZCN1CWsvSmGNeuiQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 17 Mar 2021 16:09:17 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Wed, 17 Mar 2021 16:09:17 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'Maciej W. Rozycki'" <macro@orcam.me.uk>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: RE: [PATCH v2] MIPS: Check __clang__ to avoid performance influence
 with GCC in csum_tcpudp_nofold()
Thread-Topic: [PATCH v2] MIPS: Check __clang__ to avoid performance influence
 with GCC in csum_tcpudp_nofold()
Thread-Index: AQHXGZZkp8sV3w87mU2VG3u7laRZUqqE/LVwgANWf5KAAAUfwA==
Date:   Wed, 17 Mar 2021 16:09:17 +0000
Message-ID: <6e7bc85a3f92419f89117fc1381511be@AcuMS.aculab.com>
References: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn>
 <alpine.DEB.2.21.2103142140000.33195@angie.orcam.me.uk>
 <bdfe753d-0ef2-8f66-7716-acadfc3917a5@loongson.cn>
 <913665e71fd44c5d810d006cd179725c@AcuMS.aculab.com>
 <5ee86b3b-81d2-790c-f67b-e250f60272fd@loongson.cn>
 <alpine.DEB.2.21.2103171541590.21463@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2103171541590.21463@angie.orcam.me.uk>
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

From: Maciej W. Rozycki
> Sent: 17 March 2021 15:36
..
> > > Not that I grok the mips opcodes.
> > > But that code has horridness on its side.
> 
>  It's a 32-bit one's-complement addition.  The use of 64-bit operations
> reduces the number of calculations as any 32-bit carries accumulate in the
> high 32-bit word allowing one instruction to be saved total compared to
> the 32-bit variant.  Nothing particularly unusual for me here; I've seen
> worse stuff with x86.

The 'problem' is that mips doesn't have a carry flag.
So the 64-bit maths is 'tricky'.
It may well be that a loop based on:
	do {
		val = *ptr++;
		sum += val;
		carry += sum < val;
	} while (ptr != limit)
will generate much better code.
I think there is a 'setlt' instruction for the compare.
It certainly would on the nios (which is mips-like).
That is (probably) 6 instructions for 4 bytes.
I suspect there may be a data stall after the memory read.
So an interleaved unroll would remove that stall.
That would be 10 clocks for 8 bytes.

The x86-64 code is 'interesting'.
It has repeated 'add carry' instructions.
On Intel cpus prior to (at least) Haswell they take two clocks each.
So the code is no faster than adding 32bit values to a 64bit sum.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

