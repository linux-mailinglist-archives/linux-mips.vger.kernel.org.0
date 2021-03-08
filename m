Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20A73313DD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 17:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCHQwg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 8 Mar 2021 11:52:36 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:34730 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230135AbhCHQw0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 11:52:26 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-282-p8F5T5RLMuythNy9As2n-g-1; Mon, 08 Mar 2021 16:52:23 +0000
X-MC-Unique: p8F5T5RLMuythNy9As2n-g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 8 Mar 2021 16:52:24 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 8 Mar 2021 16:52:24 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Tiezhu Yang' <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: RE: [PATCH] MIPS: Check __clang__ to avoid performance influence with
 GCC in csum_tcpudp_nofold()
Thread-Topic: [PATCH] MIPS: Check __clang__ to avoid performance influence
 with GCC in csum_tcpudp_nofold()
Thread-Index: AQHXFBmyTl3JNAv/2UywLmyfFV7Ivap6TYNg
Date:   Mon, 8 Mar 2021 16:52:24 +0000
Message-ID: <8d61574e815a4cf098d21eb4d749be0f@AcuMS.aculab.com>
References: <1615207807-29972-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1615207807-29972-1-git-send-email-yangtiezhu@loongson.cn>
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

From: Tiezhu Yang
> Sent: 08 March 2021 12:50
> 
> The asm code in csum_tcpudp_nofold() is performance-critical, I am sorry
> for the poorly considered implementation about the performance influence
> with GCC in the commit 198688edbf77 ("MIPS: Fix inline asm input/output
> type mismatch in checksum.h used with Clang").
> 
> With this patch, we can build successfully by both GCC and Clang,
> at the same time, we can avoid the potential performance influence
> with GCC.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/checksum.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
> index 1e6c135..64d353e 100644
> --- a/arch/mips/include/asm/checksum.h
> +++ b/arch/mips/include/asm/checksum.h
> @@ -130,7 +130,9 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
>  					__u32 len, __u8 proto,
>  					__wsum sum)
>  {
> +#ifdef __clang__
>  	unsigned long tmp = (__force unsigned long)sum;
> +#endif

What happens if you make the above:
#ifdef __clang__
	unsigned long tmp = (__force unsigned long)sum;
#else
	__wsum tmp = sum;
#endif
	
and then leave the rest of the function the same for both compilers.
Maybe do s/sum/sum_in/,s/tmp/sum/ to reduce the changes.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

