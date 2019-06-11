Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A23EB3D6E2
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 21:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405336AbfFKTge (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 15:36:34 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:49628 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404788AbfFKTgd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 15:36:33 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BJXhQl164795;
        Tue, 11 Jun 2019 19:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=qLYfwfJlpK+TVRVU+iZMGBWVWAoBC/qAtoGl4xudlOE=;
 b=v5IyrIAL4mNAq9s2lS0Lg8Q2mqSoIU0iM6PjVn5pKJo20zcHgj3qs2aDCqFfn+f+nP2Q
 /LeMCXu80jWxb3nuvT9fql1f+ZBHbFNZgwXc8dTrwk1tabr1T2DcWED8IvYIaBdCAG03
 2sygUeUMHGima0YdL54kdu1griOhTwKEaj457dvI4uTlnHklIBsNlaPiJRlfNX0Qo891
 88xbsZ0ZVRGt+mcXh5d1AoKVjpdT3ruVHygr317iXj+yHls0fxsl7ng7pv8N6LRQ7Ag0
 zEe0MPNue8hyBx2cwm3amTi4q+JsJMmYRRXwwqmxhTpWqxJ6ZiigoI8ds+9Tz89fbAMV jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 2t02heqfde-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jun 2019 19:35:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BJYsFH076809;
        Tue, 11 Jun 2019 19:35:52 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2t04hyhkfv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jun 2019 19:35:52 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5BJZpEl015518;
        Tue, 11 Jun 2019 19:35:51 GMT
Received: from [10.154.187.61] (/10.154.187.61)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 Jun 2019 12:35:50 -0700
Subject: Re: [PATCH 09/16] sparc64: use the generic get_user_pages_fast code
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
 <20190611144102.8848-10-hch@lst.de>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <3dc8c26b-97b7-aec7-4ac3-2dc3a01d63ad@oracle.com>
Date:   Tue, 11 Jun 2019 13:35:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611144102.8848-10-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=798
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906110125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=844 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110125
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/11/19 8:40 AM, Christoph Hellwig wrote:
> The sparc64 code is mostly equivalent to the generic one, minus various=

> bugfixes and two arch overrides that this patch adds to pgtable.h.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/sparc/Kconfig                  |   1 +
>  arch/sparc/include/asm/pgtable_64.h |  18 ++
>  arch/sparc/mm/Makefile              |   2 +-
>  arch/sparc/mm/gup.c                 | 340 ----------------------------=

>  4 files changed, 20 insertions(+), 341 deletions(-)
>  delete mode 100644 arch/sparc/mm/gup.c
>=20

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>


