Return-Path: <linux-mips+bounces-10022-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C32B1AEBE
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 08:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 836A216526C
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 06:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F8021CA1D;
	Tue,  5 Aug 2025 06:50:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8773F1C861A;
	Tue,  5 Aug 2025 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376645; cv=none; b=G12cWLg81s4+ho1jv6HOANoQapKPX2AArvw68rgbJtLQnJEUW4jPgw7aplFbOAsO+7v5B+HFGcvEKaip5CH+uqgUGZQEVJOAP55ACrn4xb/ErC4iahGgRhFLizdEjQVd222n3CPFr9JCN8jp8rf32KnOkL21+zbwaQpOUoKjbpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376645; c=relaxed/simple;
	bh=GlMP83qOoRkreWYcN68itbSBxtM6loXtd7T4zZW7mQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioejTzPt8r0rAVO6QorjarqoX51mgna8QqYAxpaDn48fv5wr1gel6JtZeGJUrWGG9oYgkVuNvzWMoWrgOhgPd0ux3ZgzjApDrqhT21TQTi9Gqjn/NPwYZ9xJG43T1Vm7EPd+4+0Lykih5aj2M17JS2MH9/6NnXCzgKGdFFBqErs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bx3PH42tYz9sRp;
	Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOt6ej6e3T4G; Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bx3PH34F3z9sHR;
	Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 62F0C8B765;
	Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yZAG-jS96Z85; Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F07C08B763;
	Tue,  5 Aug 2025 08:27:14 +0200 (CEST)
Message-ID: <c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu>
Date: Tue, 5 Aug 2025 08:27:14 +0200
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
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250804225901.GC54248@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 05/08/2025 à 00:59, Eric Biggers a écrit :
> On Mon, Aug 04, 2025 at 09:02:27PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 04/08/2025 à 20:09, Eric Biggers a écrit :
>>> On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 03/08/2025 à 22:44, Eric Biggers a écrit :
>>>>> MD5 is insecure, is no longer commonly used, and has never been
>>>>> optimized for the most common architectures in the kernel.  Only mips,
>>>>> powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
>>>>> only the powerpc one is actually testable in QEMU.  The mips one works
>>>>> only on Cavium Octeon SoCs.
>>>>>
>>>>> Taken together, it's clear that it's time to retire these additional MD5
>>>>> implementations, and focus maintenance on the MD5 generic C code.
>>>>
>>>> Sorry, for me it is not that clear. Even if MD5 is depracated we still have
>>>> several applications that use MD5 for various reasons on our boards.
>>>>
>>>> I ran the test on kernel v6.16 with following file:
>>>>
>>>> # ls -l avion.au
>>>> -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
>>>>
>>>> With CONFIG_CRYPTO_MD5_PPC:
>>>>
>>>> # time md5sum avion.au
>>>> 6513851d6109d42477b20cd56bf57f28  avion.au
>>>> real    0m 1.02s
>>>> user    0m 0.01s
>>>> sys     0m 1.01s
>>>>
>>>> Without CONFIG_CRYPTO_MD5_PPC:
>>>>
>>>> # time md5sum avion.au
>>>> 6513851d6109d42477b20cd56bf57f28  avion.au
>>>> real    0m 1.35s
>>>> user    0m 0.01s
>>>> sys     0m 1.34s
>>>>
>>>> I think the difference is big enough to consider keeping optimised MD5 code.
>>>
>>> But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
>>> it has any effect on md5sum.  The difference you saw must be due to an
>>> unrelated reason like I/O caching, CPU frequency, etc.  Try running your
>>> test multiple times to eliminate other sources of variation.
>>
>> md5sum uses the kernel's MD5 code:
> 
> What?  That's crazy.  Userspace MD5 code would be faster and more
> reliable.  No need to make syscalls, transfer data to and from the
> kernel, have an external dependency, etc.  Is this the coreutils md5sum?
> We need to get this reported and fixed.


Content of files is already buffered inside the kernel. likcapi doesn't 
tranfer data, it uses splice().

As far as I know, coreutil is not able to use the TALITOS Security 
engine we have on the mpc885 and mpc8321 microcontroleurs. We primarily 
use libkcapi for that.

In order to keep things consistant, we use the same userspace on boards 
which don't have a security engine, ie the mpc866, we rely on the kernel 
providing an optimised software implementation fallback.

Christophe

