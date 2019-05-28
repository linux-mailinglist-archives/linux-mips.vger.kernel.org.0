Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C58982CACD
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2019 17:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfE1P6K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 May 2019 11:58:10 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:32984 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfE1P6J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 May 2019 11:58:09 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4SFrsgm131787;
        Tue, 28 May 2019 15:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=TSW5Hn3kRTvgWzVOcFpKtrTx3K8uzf/zHhDE6UkJMhg=;
 b=aE5o2XjlUHuEPSjWqMiGpohpUiDG56sKD1IP525DG6Rta4QOMnUMBqstZq6KiG0AviOJ
 z3cSZigfuKuEBSdOdJrY4wH4/YduqxO8e84LYTrnjmh52FNL70GggsihlrLUW6e9zFR1
 U5Qfsvf02huVroKIQgiArw5hG7xKzDZF7C5ZTmMq9NwEHKRFauk8nWrK67TKs167xUI/
 SAULD82GlnTsfhP5VzlY9gJ4m4c+RYimxS8CyfO+Vs4/eFuSqTwUUqtB0SK6QcJcqc/o
 kk1uWuu44vp/pj598ZqsUa4QDi7Xie95D3zzPOJ+tJ3Yf7yRuTzCC66Xemmkbug5zq0A fw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2spw4tc7pc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 May 2019 15:57:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4SFu00N056848;
        Tue, 28 May 2019 15:57:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2sr31ur9xg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 May 2019 15:57:32 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4SFvTsM023226;
        Tue, 28 May 2019 15:57:29 GMT
Received: from [192.168.1.16] (/24.9.64.241)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 28 May 2019 08:57:29 -0700
Subject: Re: [PATCH 4/6] mm: add a gup_fixup_start_addr hook
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <20190525133203.25853-1-hch@lst.de>
 <20190525133203.25853-5-hch@lst.de>
 <CAHk-=wg-KDU9Gp8NGTAffEO2Vh6F_xA4SE9=PCOMYamnEj0D4w@mail.gmail.com>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <2eecb673-cb18-990e-0a61-900ecd056152@oracle.com>
Date:   Tue, 28 May 2019 09:57:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg-KDU9Gp8NGTAffEO2Vh6F_xA4SE9=PCOMYamnEj0D4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9270 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=864
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905280101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9270 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=883 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905280101
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/25/19 11:05 AM, Linus Torvalds wrote:
> [ Adding Khalid, who added the sparc64 code ]
>=20
> On Sat, May 25, 2019 at 6:32 AM Christoph Hellwig <hch@lst.de> wrote:
>>
>> This will allow sparc64 to override its ADI tags for
>> get_user_pages and get_user_pages_fast.  I have no idea why this
>> is not required for plain old get_user_pages, but it keeps the
>> existing sparc64 behavior.
>=20
> This is actually generic. ARM64 has tagged pointers too. Right now the
> system call interfaces are all supposed to mask off the tags, but
> there's been noise about having the kernel understand them.
>=20
> That said:
>=20
>> +#ifndef gup_fixup_start_addr
>> +#define gup_fixup_start_addr(start)    (start)
>> +#endif
>=20
> I'd rather name this much more specifically (ie make it very much
> about "clean up pointer tags") and I'm also not clear on why sparc64
> actually wants this. I thought the sparc64 rules were the same as the
> (current) arm64 rules: any addresses passed to the kernel have to be
> the non-tagged ones.
>=20
> As you say, nothing *else* in the kernel does that address cleanup,
> why should get_user_pages_fast() do it?
>=20
> David? Khalid? Why does sparc64 actually need this? It looks like the
> generic get_user_pages() doesn't do it.
>=20


There is another discussion going on about tagged pointers on ARM64 and
intersection with sparc64 code. I agree there is a generic need to mask
off tags for kernel use now that ARM64 is also looking into supporting
memory tagging. The need comes from sparc64 not storing tagged address
in VMAs. It is not practical to store tagged addresses in VMAs because
manipulation of address tags is done entirely in userspace on sparc64.
Userspace is free to change tags on an address range at any time without
involving kernel and constantly rotating tags is actually a security
feature even. This makes it impractical for kernel to try to keep up
with constantly changing tagged addresses in VMAs. Untagged addresses in
VMAs means any find_vma() and brethren calls need to be passed an
untagged address.

On sparc64, my intent was to support address tagging for dynamically
allocated data buffers only (malloc, mmap and shm specifically) and not
for any generic system calls which limited the scope and amount of
untagging needed in the kernel. ARM64 is working to add transparent
tagged address support at C library level. Adding tagged addresses to C
library requires every possible call into kernel to either handle tagged
addresses or untag address at some point. Andrey found out it is not as
easy as untagging addresses in functions that search through vma.
Callers of find_vma() and others tend to do address arithmetic on the
address stored in vma that is returned. This requires a more complex
solution than just stripping tags in vma lookup routines.

Since untagging addresses is a generic need required for far more than
gup, I prefer the way Andrey wrote it -
<https://patchwork.kernel.org/patch/10923637/>

--
Khalid



