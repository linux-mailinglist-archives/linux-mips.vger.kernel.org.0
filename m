Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDCC44EC20
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 17:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfFUPgP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 11:36:15 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45212 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfFUPgP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 11:36:15 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LFOCdN084301;
        Fri, 21 Jun 2019 15:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=6t/T0oCX3FYtWnSX59C7RPueclXGYaVh3ih9FejJyy8=;
 b=n7PC265Dn1bw/BeVQsMjARhjLsH2Q5nXXw5HrQQxZRruJV3Pk3wuDJoJppdU8WjTwsE5
 IFOO4VQ1ALO3Tkqca1A1aKFr2myITmN65QxfOid1gg19CyyUUp5tW5p0gcveHhrEOhRp
 bccPzjsBjxJ37TIq0DEoxTFJ3GSerzNRpyQgmcNIrgRZcWIJi6frNAUKxJQrh1B7Domg
 h+0kFLkrc++e4VL6uWl+SqEVobF25+Aly2yk1RoVooheayqd01ChzxdKKr3O9if86pf1
 0CuQzsjTBC6fhX2gfPmrldWHTXgV8F98JdJPt1DFwiWomTWPOxESNbF+r+mTo403B7Bo dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2t7809q6yq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jun 2019 15:35:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LFZJQK100494;
        Fri, 21 Jun 2019 15:35:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2t7rdxtbm7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jun 2019 15:35:19 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5LFZDpA005218;
        Fri, 21 Jun 2019 15:35:13 GMT
Received: from [10.154.105.108] (/10.154.105.108)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 21 Jun 2019 08:35:13 -0700
Subject: Re: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
To:     Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-2-hch@lst.de> <20190621133911.GL19891@ziepe.ca>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <9a4e1485-4683-92b0-3d26-73f26896d646@oracle.com>
Date:   Fri, 21 Jun 2019 09:35:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621133911.GL19891@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9295 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=857
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906210125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9295 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=897 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210125
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/21/19 7:39 AM, Jason Gunthorpe wrote:
> On Tue, Jun 11, 2019 at 04:40:47PM +0200, Christoph Hellwig wrote:
>> This will allow sparc64 to override its ADI tags for
>> get_user_pages and get_user_pages_fast.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>  mm/gup.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index ddde097cf9e4..6bb521db67ec 100644
>> +++ b/mm/gup.c
>> @@ -2146,7 +2146,7 @@ int __get_user_pages_fast(unsigned long start, i=
nt nr_pages, int write,
>>  	unsigned long flags;
>>  	int nr =3D 0;
>> =20
>> -	start &=3D PAGE_MASK;
>> +	start =3D untagged_addr(start) & PAGE_MASK;
>>  	len =3D (unsigned long) nr_pages << PAGE_SHIFT;
>>  	end =3D start + len;
>=20
> Hmm, this function, and the other, goes on to do:
>=20
>         if (unlikely(!access_ok((void __user *)start, len)))
>                 return 0;
>=20
> and I thought that access_ok takes in the tagged pointer?
>=20
> How about re-order it a bit?

access_ok() can handle tagged or untagged pointers. It just strips the
tag bits from the top bits. Current order doesn't really matter from
functionality point of view. There might be minor gain in delaying
untagging in __get_user_pages_fast() but I could go either way.

--
Khalid

>=20
> diff --git a/mm/gup.c b/mm/gup.c
> index ddde097cf9e410..f48747ced4723b 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2148,11 +2148,12 @@ int __get_user_pages_fast(unsigned long start, =
int nr_pages, int write,
> =20
>  	start &=3D PAGE_MASK;
>  	len =3D (unsigned long) nr_pages << PAGE_SHIFT;
> -	end =3D start + len;
> -
>  	if (unlikely(!access_ok((void __user *)start, len)))
>  		return 0;
> =20
> +	start =3D untagged_ptr(start);
> +	end =3D start + len;
> +
>  	/*
>  	 * Disable interrupts.  We use the nested form as we can already have=

>  	 * interrupts disabled by get_futex_key.
>=20


