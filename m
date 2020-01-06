Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF530131726
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jan 2020 19:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgAFSAp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jan 2020 13:00:45 -0500
Received: from terminus.zytor.com ([198.137.202.136]:41273 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgAFSAp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 6 Jan 2020 13:00:45 -0500
Received: from carbon-x1.hos.anvin.org ([IPv6:2601:646:8600:3280:1098:42a1:36db:233c])
        (authenticated bits=0)
        by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 006HxLts2985803
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Mon, 6 Jan 2020 09:59:21 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 006HxLts2985803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2019122001; t=1578333565;
        bh=uFGtgLW/eUGZosJDUZ4/JsFg07VyLBe7Sl07+mpDDgQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZMVxUZ9JlU6up34Nb4pGcpMjDZpUuWN8ck9Y4jYgVb+4bZERRqJiFzIJhbIfziB1k
         ZNW7gtaTuWxOa78mC5Z+zWvyvNL35mkSsEZQpPBJS0ncqNieAs6YCfbCKRbkrwQtVp
         RcNn3KAZoKEYAi4ef6eQLTWSuxUbKuM7RXuWfbUO5ZflxcLL1hn2UBbGPOSqDE+xOY
         wijrfyuPLvBiBZoiKnCdjHJ9U/s6x0xqbbT7g3nNy9Gk9o9TiqnutL8djSuCUX49Qi
         Oy4XDW1jzUdxSDSG813dTCGe2xdRD1rCCDjOpb+PwCTaq1SfwtxgOn+n2Mp0OYFc4L
         +gnXlUsMkLtVw==
Subject: Re: [PATCH v3 02/22] compat: provide compat_ptr() on all
 architectures
To:     Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Robert Richter <rric@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, oprofile-list@lists.sf.net,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20200102145552.1853992-1-arnd@arndb.de>
 <20200102145552.1853992-3-arnd@arndb.de>
From:   "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <e2c7b4d7-587e-f71c-f0df-810e8d9869f2@zytor.com>
Date:   Mon, 6 Jan 2020 09:59:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200102145552.1853992-3-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-01-02 06:55, Arnd Bergmann wrote:
> In order to avoid needless #ifdef CONFIG_COMPAT checks,
> move the compat_ptr() definition to linux/compat.h
> where it can be seen by any file regardless of the
> architecture.
> 
> Only s390 needs a special definition, this can use the
> self-#define trick we have elsewhere.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/compat.h   | 17 -----------------
>  arch/mips/include/asm/compat.h    | 18 ------------------
>  arch/parisc/include/asm/compat.h  | 17 -----------------
>  arch/powerpc/include/asm/compat.h | 17 -----------------
>  arch/powerpc/oprofile/backtrace.c |  2 +-
>  arch/s390/include/asm/compat.h    |  6 +-----
>  arch/sparc/include/asm/compat.h   | 17 -----------------
>  arch/x86/include/asm/compat.h     | 17 -----------------
>  include/linux/compat.h            | 18 ++++++++++++++++++
>  9 files changed, 20 insertions(+), 109 deletions(-)
> 

For x86:

Reviewed-by: H. Peter Anvin <hpa@zytor.com>

It still suffers from the zero-one-infinity rule failure of the compat
architecture as a whole, but that is a very different problem. In this case
"compat" is obviously meaning "a 32-on-64 ABI" and simply centralizes a common
API, which is a Good Thing[TM].

	-hpa

