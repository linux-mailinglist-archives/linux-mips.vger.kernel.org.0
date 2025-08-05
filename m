Return-Path: <linux-mips+bounces-10023-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10594B1AF46
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 09:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98A31896E13
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 07:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E2F22FE06;
	Tue,  5 Aug 2025 07:18:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD7E23CB;
	Tue,  5 Aug 2025 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754378281; cv=none; b=V8Mtle+rwkL8AWsH3K23vauZD5x3LSrXmMfB7S7fTBrGEsWulPrcoy8Ky/KgKYQFNa1mpBORi+tBsLk8XADwgBP0DUCrNhQLeWlR0HVkQqP9j2sXJdJbLd4Wqtgf7sTkqNv9Ekr6s7O08Buk25EBtkPdQHcjOkAXYSWgzC6IYuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754378281; c=relaxed/simple;
	bh=JWpkPDMP/XcbYXBGzgFW382I6Op+l3UeEugKQkfmymY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPQTkY/jAdA1Mf3eQTX8kFGDBZ7xg4/Ab0UcAyZhNOutwBmR/DVVULdSuMbW83NsNxaLPWGKb6bJYqD7ocAxcJ17Ekifuhx5F+R2JvKXXqUh+I1kMTrKV0nAGZr3bP/LiOv9eyYmwV8ixmATMfRS5CJagA6XaPFQ4xWVmVVzwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id AE0C53F1DF;
	Tue,  5 Aug 2025 09:17:52 +0200 (CEST)
Message-ID: <854efc41-c40f-46c9-b8ae-84bda9d17faa@hogyros.de>
Date: Tue, 5 Aug 2025 16:17:49 +0900
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Crypto use cases
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
 <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
 <20250805045846.GA10695@sol>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250805045846.GA10695@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/5/25 13:58, Eric Biggers wrote:

> What does this have to do with this thread, which is about the PowerPC
> optimized MD5 code?

Hence the new subject. It is still related to removal of code, but asks 
about the bigger picture.

The code removal changes you've been pushing lately absolutely make 
sense in the context of "the crypto subsystem is for internal use by the 
kernel, and all known users will only ever submit small work items."

However, there is also the userspace API, and hardware accelerators also 
register with the crypto subsystem, so it is *also* the way for 
userspace to use specialized hardware.

If these are separate, then it makes sense to acknowledge that the 
kernel will never use asynchronous transforms for anything, simplify the 
internal API, and move all the hardware support to a separate registry 
that is for userspace applications only.

However if we don't want separate registries, then it makes no sense for 
the kernel to set policy for userspace here; it should offer all the 
alternatives. The kernel can, and should, define policy for itself, and 
I wholeheartedly agree that offloading small requests does not make 
sense, unless we're on battery power.

I'm also not convinced that fscrypt cannot ever learn to submit a single 
large request or a large batch of small requests if it is asked to 
decrypt a large file, so in my opinion the common registry makes more sense.

Making sure that hardware support actually works and is tested is the 
responsibility of the driver and port maintainers. We understand that 
subsystem maintainers do not have all the hardware available, but the 
same goes for all the other subsystems -- the DRM maintainers routinely 
merge drivers for hardware they do not own, because the changes come 
from people who *do* own the hardware, and have tested the changes.

The latter is a project management issue, mostly: if there is a lack of 
working relationships with driver and port maintainers, then that needs 
to be fixed, not assumed to be an unchangeable part of the environment 
that technical decisions are made in.

    Simon

