Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB273D6E7
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 21:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405740AbfFKTgk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 15:36:40 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:34666 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404788AbfFKTgj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 15:36:39 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BJZPgx146908;
        Tue, 11 Jun 2019 19:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=XR1k9/hTeFVGViPolkZIUh6rCPEU/P3ZeUnAtKG13/o=;
 b=z2zysy0TfCRFWv/zp3KooZKViDyYjCldDHO+HJRgr+UAo5HIbqpSKTBhD/M2QMVNFSLb
 PtSUW9Ul/yqC7srLx1ziPrf8qNvqdcHM7dHLCOAB0gu5M5XQ9CLeP41fpZdpVCacLdDd
 95fQd3fPeoFlC3Yk93XaxE68TBMKZ6E9Zq/2M1fzpHLF8OuvAoRqYua1cgWVyQ0Mc7Da
 fDlt7/N57QY718wHpPzl7C+c4cy8ox13bsfKh1ne99YEJfbCf3RKy3v9dKqViIL6PlJX
 Eus+jkJzPhx0V0DpELovHgQ6h8ghK5PPWC8OKSWAeD/H2lJMfuzoQchkurcLsKW8DDCI YQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2t04etqb59-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jun 2019 19:36:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BJYvmT077059;
        Tue, 11 Jun 2019 19:36:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2t04hyhkj0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jun 2019 19:36:02 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5BJa0YV031560;
        Tue, 11 Jun 2019 19:36:00 GMT
Received: from [10.154.187.61] (/10.154.187.61)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 Jun 2019 12:36:00 -0700
Subject: Re: [PATCH 10/16] mm: rename CONFIG_HAVE_GENERIC_GUP to
 CONFIG_HAVE_FAST_GUP
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
 <20190611144102.8848-11-hch@lst.de>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <98e75b14-89f4-91b4-e836-2fdff188535b@oracle.com>
Date:   Tue, 11 Jun 2019 13:35:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611144102.8848-11-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906110125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110125
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/11/19 8:40 AM, Christoph Hellwig wrote:
> We only support the generic GUP now, so rename the config option to
> be more clear, and always use the mm/Kconfig definition of the
> symbol and select it from the arch Kconfigs.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/Kconfig     | 5 +----
>  arch/arm64/Kconfig   | 4 +---
>  arch/mips/Kconfig    | 2 +-
>  arch/powerpc/Kconfig | 2 +-
>  arch/s390/Kconfig    | 2 +-
>  arch/sh/Kconfig      | 2 +-
>  arch/sparc/Kconfig   | 2 +-
>  arch/x86/Kconfig     | 4 +---
>  mm/Kconfig           | 2 +-
>  mm/gup.c             | 4 ++--
>  10 files changed, 11 insertions(+), 18 deletions(-)
>=20

Looks good.

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>


