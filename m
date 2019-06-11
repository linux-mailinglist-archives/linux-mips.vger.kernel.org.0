Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D4A3D6BF
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 21:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391756AbfFKTYG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 15:24:06 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:32810 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387563AbfFKTYG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 15:24:06 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BJNQmO155550;
        Tue, 11 Jun 2019 19:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=YlU5LEmt/4+KLQdtIjWgwQDa+/rDMT79BcosgR9T0To=;
 b=5BNbvdzrXPeQ9vFQYPqzXQGruWABl1v+APKNrwBasCFpe9tEeK2eFTZs76VwqFI1oK/m
 sp7W09J4V/7JoipFOq2yN7QiKvwwtlI8r/hzLYqBVAxo7xCT2XbKMlNRrWH3tN3OfX9Z
 g4UWs60mfpGNy/bK7G6wFXN9FPRIWDQJgdT8LtSLPX9jpVWvulzpQmqG/aDy8wRc0f3/
 6lF9bJXnzzexrGyCo8ydpR2Cbee48THi3gczkbb1D0Q2HRnY9WA//G/MPd8noPnAahml
 QnNVVxRgnfAy2wXwy5/e2ZH1HzQiR2uaqNAUxIkGgaV2sECaKDynp/pPOu6wp47YN3fj kA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 2t02heqdjx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jun 2019 19:23:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BJN264176542;
        Tue, 11 Jun 2019 19:23:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2t1jphmcas-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jun 2019 19:23:22 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5BJNKLx027118;
        Tue, 11 Jun 2019 19:23:20 GMT
Received: from [10.154.187.61] (/10.154.187.61)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 Jun 2019 12:23:20 -0700
Subject: Re: [PATCH 08/16] sparc64: define untagged_addr()
To:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-9-hch@lst.de>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <13f72660-8f7b-a437-e449-6b4267de9c0c@oracle.com>
Date:   Tue, 11 Jun 2019 13:23:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611144102.8848-9-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906110124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110124
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/11/19 8:40 AM, Christoph Hellwig wrote:
> Add a helper to untag a user pointer.  This is needed for ADI support
> in get_user_pages_fast.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/sparc/include/asm/pgtable_64.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Looks good to me.

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>

>=20
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/a=
sm/pgtable_64.h
> index f0dcf991d27f..1904782dcd39 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -1076,6 +1076,28 @@ static inline int io_remap_pfn_range(struct vm_a=
rea_struct *vma,
>  }
>  #define io_remap_pfn_range io_remap_pfn_range=20
> =20
> +static inline unsigned long untagged_addr(unsigned long start)
> +{
> +	if (adi_capable()) {
> +		long addr =3D start;
> +
> +		/* If userspace has passed a versioned address, kernel
> +		 * will not find it in the VMAs since it does not store
> +		 * the version tags in the list of VMAs. Storing version
> +		 * tags in list of VMAs is impractical since they can be
> +		 * changed any time from userspace without dropping into
> +		 * kernel. Any address search in VMAs will be done with
> +		 * non-versioned addresses. Ensure the ADI version bits
> +		 * are dropped here by sign extending the last bit before
> +		 * ADI bits. IOMMU does not implement version tags.
> +		 */
> +		return (addr << (long)adi_nbits()) >> (long)adi_nbits();
> +	}
> +
> +	return start;
> +}
> +#define untagged_addr untagged_addr
> +
>  #include <asm/tlbflush.h>
>  #include <asm-generic/pgtable.h>
> =20
>=20


