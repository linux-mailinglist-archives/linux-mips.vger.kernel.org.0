Return-Path: <linux-mips+bounces-10019-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368BB1AD3E
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 06:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEFF27A4203
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 04:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EC22139B5;
	Tue,  5 Aug 2025 04:49:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1391201269;
	Tue,  5 Aug 2025 04:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369389; cv=none; b=gf8otMaktAHORa+xTDT2LAGMCY5iXhBI8FtLXpnliB9+cIxPHRykkFHL82wINBOdGcKmE2gIKdzTC5ya8TsEKbFU9GErZGTQMFQns3VplfhSGHuOC3oQNGgMKF4z5zEuRz3yaEuGryJUHR2RCB56Vn6fZspRMIE2KaIVzZpFemI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369389; c=relaxed/simple;
	bh=RpVs470lDpe/a5lN9G8uFqnn3AXm640J77i8M+2Kf4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXqcU8Fofu5Kq4DiIl0yckxK1of5VxsRGUBdfVW/WN2grpAW3rZZGCTPDhUiuum5ysxoOOgLED4uqASm5BLCtobizFQZI24QY2LYgGxX/bda0s8VxP/8dFEObOvQCrXSv+dSfrOx2CUebmkwgTp2Jw+Pit1GjtOuL0B49BLaP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 8DD1B3F1DF;
	Tue,  5 Aug 2025 06:49:34 +0200 (CEST)
Message-ID: <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
Date: Tue, 5 Aug 2025 13:49:31 +0900
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Crypto use cases (was: Remove PowerPC optimized MD5 code)
To: Eric Biggers <ebiggers@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
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
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250804225901.GC54248@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/5/25 07:59, Eric Biggers wrote:

>> md5sum uses the kernel's MD5 code:

> What?  That's crazy.  Userspace MD5 code would be faster and more
> reliable.  No need to make syscalls, transfer data to and from the
> kernel, have an external dependency, etc.  Is this the coreutils md5sum?
> We need to get this reported and fixed.

The userspace API allows zero-copy transfers from userspace, and AFAIK 
also directly operating on files without ever transferring the data to 
userspace (so we save one copy).

Userspace requests are also where the asynchronous hardware offload 
units get to chomp on large blocks of data while the CPU is doing 
something else:

$ time dd if=test.bin of=/dev/zero bs=1G     # warm up caches
real    0m1.541s
user    0m0.000s
sys     0m0.732s

$ time gzip -9 <test.bin >test.bin.gz        # compress with the CPU
real    2m57.789s
user    2m55.986s
sys     0m1.508s

$ time ./gzfht_test test.bin                 # compress with NEST unit
real    0m3.207s
user    0m0.584s
sys     0m2.487s

$ time gzip -d <test.bin.nx.gz >test.bin.nx  # decompress with CPU
real    1m0.103s
user    0m57.990s
sys     0m1.878s

$ time ./gunz_test test.bin.gz               # decompress with NEST unit
real    0m2.722s
user    0m0.200s
sys     0m1.872s

That's why I'm objecting to measuring the general usefulness of hardware 
crypto units by the standards of fscrypt, which has an artificial 
limitation of never submitting blocks larger than 4kB: there are other 
use cases that don't have that limitation, and where the overhead is 
negligible because it is incurred only once for a few gigabytes of data.

That's why I suggested changing from a priority field to "speed" and 
"overhead" fields, and calculate priority for each application as 
(size/speed+overhead) -- smallest number wins, size is what the 
application expects to use as the typical request size (which for 
fscrypt and IPsec is on the small side, so it would always select the 
CPU unless there was a low-overhead offload engine available)

This probably needs some adjustment to allow selecting a low-power 
implementation (e.g. on mobile, I'd want to use offloading for fscrypt 
even if it is slower), and model request batching which reduces the 
overhead in a busy system, but it should be a good start.

    Simon

