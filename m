Return-Path: <linux-mips+bounces-9987-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9916B19AD1
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 06:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9474018921F4
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 04:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F32A21B9FD;
	Mon,  4 Aug 2025 04:44:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA4D2135D1;
	Mon,  4 Aug 2025 04:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754282680; cv=none; b=sZU0a7tNEfRgoXa9cva7qqMxoejewJQF1l1c3yx55hEo688CTzCZCpSPzH6g/SzeY3CP6Jx0eBvgKwdDEtN7aO9bLSIz48zNk6/DL5/3Bj2+MotMTQN12lfxrl6aUtMy9bx6i4faJ665ckGUEXY5eYOIDwlS3urpG/MwHWFt+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754282680; c=relaxed/simple;
	bh=/fK2AvQOoffITyYjdaMvldvMBIUtdVYOpA6/1XEkmFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWMjQXiJezJTY3pWz/jmE/eZvV2RPlWdvrijFN8ZAKVP2QUnkMzJuJf3XZo/YXI9ubKtDi9UdqynbUxn0p28rGhAIN+uEtBYeMnXHTBOo95CH/4i3uirnZxxfh9LVj5r/o5688ZeW4NPOoGIl5Wf8FBUAYqV8M426oGWotHMdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 8D25B3F108;
	Mon,  4 Aug 2025 06:44:24 +0200 (CEST)
Message-ID: <3de7cc4d-cb88-4107-9265-066cbedd4561@hogyros.de>
Date: Mon, 4 Aug 2025 13:44:21 +0900
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] crypto: sparc/md5 - Remove SPARC64 optimized MD5 code
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-5-ebiggers@kernel.org>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250803204433.75703-5-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/4/25 05:44, Eric Biggers wrote:

> Taken together, it's clear that it's time to retire these additional MD5
> implementations, and focus maintenance on the MD5 generic C code.

[...]

> -	ldd	[%o1 + 0x00], %f8
> -	ldd	[%o1 + 0x08], %f10
> -	ldd	[%o1 + 0x10], %f12
> -	ldd	[%o1 + 0x18], %f14
> -	ldd	[%o1 + 0x20], %f16
> -	ldd	[%o1 + 0x28], %f18
> -	ldd	[%o1 + 0x30], %f20
> -	ldd	[%o1 + 0x38], %f22
> -
> -	MD5

This is a literal CPU instruction that ingests sixteen registers (f8 to 
f23) and updates the hash state in f0 to f3.

I can see the point of removing hand-optimized assembler code when a 
compiler can generate something that runs just as well from generic 
code, but this here is using CPU extensions that were made for this 
specific purpose.

This is exactly the kind of thing you would point to as an argument why 
asynchronous hardware offload support is unnecessary.

    Simon

