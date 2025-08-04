Return-Path: <linux-mips+bounces-10015-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6791B1AB0A
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 00:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A85C318A28EA
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 22:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C99328D849;
	Mon,  4 Aug 2025 22:50:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA65323E;
	Mon,  4 Aug 2025 22:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754347838; cv=none; b=OQqcTRaw3GBwp0dAeQJZwEWhrW4WW7/3WPFghoDjnbz9VN8zQKjvDt3jiegRLqf1HSR2m7iq7sJ1mPYyOlmqPcl3Cz2qlH2JzyW185NQBdEaQZti+E1D1VPtUiDeDnMDuWQez3eVPsPFovB0Vnc+/uAVbHNuBX+Sc4l0MFG28wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754347838; c=relaxed/simple;
	bh=lISH+n0jo+DtMvMOOnB9QUSLRxlCjqrGr9XQZv2c8so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HT5TYcwqsJKy9j0HykaqYnq4I0/yNQ91Qch7m5MD2N5iqI9p3OYFxj4Xf12xCFVYTBu8nGLVRWAdgyZ3Zcki+VRbnwjLvvxsUwaZmgpOGrUWI8LSw7PJbrRhm4OJs7W1mbhAHtIOxvtwBSnq3Or/AVuYDWvngAfpURy+zw+lT1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bwmCH6vkyz9vF1;
	Mon,  4 Aug 2025 21:02:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzPhUKf9CYtV; Mon,  4 Aug 2025 21:02:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bwmCF5SFSz9vDl;
	Mon,  4 Aug 2025 21:02:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 695098B765;
	Mon,  4 Aug 2025 21:02:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KC5YIf5SR_OU; Mon,  4 Aug 2025 21:02:28 +0200 (CEST)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B770B8B763;
	Mon,  4 Aug 2025 21:02:27 +0200 (CEST)
Message-ID: <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
Date: Mon, 4 Aug 2025 21:02:27 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250804180923.GA54248@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 04/08/2025 à 20:09, Eric Biggers a écrit :
> On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 03/08/2025 à 22:44, Eric Biggers a écrit :
>>> MD5 is insecure, is no longer commonly used, and has never been
>>> optimized for the most common architectures in the kernel.  Only mips,
>>> powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
>>> only the powerpc one is actually testable in QEMU.  The mips one works
>>> only on Cavium Octeon SoCs.
>>>
>>> Taken together, it's clear that it's time to retire these additional MD5
>>> implementations, and focus maintenance on the MD5 generic C code.
>>
>> Sorry, for me it is not that clear. Even if MD5 is depracated we still have
>> several applications that use MD5 for various reasons on our boards.
>>
>> I ran the test on kernel v6.16 with following file:
>>
>> # ls -l avion.au
>> -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
>>
>> With CONFIG_CRYPTO_MD5_PPC:
>>
>> # time md5sum avion.au
>> 6513851d6109d42477b20cd56bf57f28  avion.au
>> real    0m 1.02s
>> user    0m 0.01s
>> sys     0m 1.01s
>>
>> Without CONFIG_CRYPTO_MD5_PPC:
>>
>> # time md5sum avion.au
>> 6513851d6109d42477b20cd56bf57f28  avion.au
>> real    0m 1.35s
>> user    0m 0.01s
>> sys     0m 1.34s
>>
>> I think the difference is big enough to consider keeping optimised MD5 code.
> 
> But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
> it has any effect on md5sum.  The difference you saw must be due to an
> unrelated reason like I/O caching, CPU frequency, etc.  Try running your
> test multiple times to eliminate other sources of variation.

md5sum uses the kernel's MD5 code:

# ldd `which md5sum`
         linux-vdso32.so.1 (0x77b90000)
         libkcapi.so.1 => /usr/lib/libkcapi.so.1 (0x6ffa0000)    <==
         libcrypt.so.1 => /lib/libcrypt.so.1 (0x6ff50000)
         libc.so.6 => /lib/libc.so.6 (0x6fd10000)
         /lib/ld.so.1 => //lib/ld.so.1 (0x77ba0000)

Previous test was on an mpc8xx.

I now did the test on mpc832x and the difference is even bigger:

With CONFIG_CRYPTO_MD5_PPC:

# time md5sum avion.au
6513851d6109d42477b20cd56bf57f28  avion.au
real    0m 0.41s
user    0m 0.00s
sys     0m 0.34s

Without CONFIG_CRYPTO_MD5_PPC:

# time md5sum avion.au
6513851d6109d42477b20cd56bf57f28  avion.au
real    0m 0.58s
user    0m 0.00s
sys     0m 0.47s

Christophe

