Return-Path: <linux-mips+bounces-10020-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA18B1AD62
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 06:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 988727AA674
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 04:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABFD20CCCA;
	Tue,  5 Aug 2025 04:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sibsd5Ib"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930F288DB;
	Tue,  5 Aug 2025 04:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369983; cv=none; b=HtBUSllvUVfxvZfL81TeVg39tj7YWJsVoRESO9rhKYHhlah9MXs/7tP4N2Gbt0BDP5XAM/0sOp0x1lfMiDVryXyXcFY929Atg2NdJi/vrcyP2+6x1uK3tUcnxI+EmVlKDhbsc5v/8i/IYNf3X1ffpLfqkPpm3OmtZa7P3kw4E34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369983; c=relaxed/simple;
	bh=eaxnvmVTMli/ZAZQbfboGasvLy0/KdIKJiwUt3cWC1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2X77a+YRJGUV1kgDdMRyqv6wqgYk0E7WPW6jsxTVhwPuophyM3KUMmaHcYV6FiC2OmZIpeJNMkroh8DMXYO5v8dzjJpkYiVRrkgWqG6K+W1hTA41CeiIkT1wXv03bidEmoGbJtxux9c3DUue2lcZweOSPe/GoS1YmNSVroy2Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sibsd5Ib; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67AFC4CEF4;
	Tue,  5 Aug 2025 04:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754369983;
	bh=eaxnvmVTMli/ZAZQbfboGasvLy0/KdIKJiwUt3cWC1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sibsd5Ib8TIGgpCHzIQtPVqgLjZvCWfmrAOeyow9dEzOgIiMYKQeDwgG0kONbFyb+
	 BkUJhZT5mPRwGIX0jc8tTiE4Z8V3nkVCmFKZbE/jrng1GDORa2IfVAQ7X9IiqaCOMF
	 pRDS8RDKRcYWhdiDPIazvkh2+5LpYA6xaRP26jnu2Hb6/JMAKxejHQVi4oYUadAfv3
	 g9tkSHBfE6NAl/VEIMcpdr/Q/ICHWsp+sOrnNt8Zm/NwIKNGxGn4U3FhKTcjo6k1wG
	 8MRjZOLfKaTCi7Ch9t6qeiyk1EEUEAvCriVyKTTgX0RjBtL+JK2yopuTYbRwIY341j
	 xhT3F5a6adiRw==
Date: Mon, 4 Aug 2025 21:58:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: Crypto use cases (was: Remove PowerPC optimized MD5 code)
Message-ID: <20250805045846.GA10695@sol>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
 <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>

On Tue, Aug 05, 2025 at 01:49:31PM +0900, Simon Richter wrote:
> Hi,
> 
> On 8/5/25 07:59, Eric Biggers wrote:
> 
> > > md5sum uses the kernel's MD5 code:
> 
> > What?  That's crazy.  Userspace MD5 code would be faster and more
> > reliable.  No need to make syscalls, transfer data to and from the
> > kernel, have an external dependency, etc.  Is this the coreutils md5sum?
> > We need to get this reported and fixed.
> 
> The userspace API allows zero-copy transfers from userspace, and AFAIK also
> directly operating on files without ever transferring the data to userspace
> (so we save one copy).
> 
> Userspace requests are also where the asynchronous hardware offload units
> get to chomp on large blocks of data while the CPU is doing something else:
> 
> $ time dd if=test.bin of=/dev/zero bs=1G     # warm up caches
> real    0m1.541s
> user    0m0.000s
> sys     0m0.732s
> 
> $ time gzip -9 <test.bin >test.bin.gz        # compress with the CPU
> real    2m57.789s
> user    2m55.986s
> sys     0m1.508s
> 
> $ time ./gzfht_test test.bin                 # compress with NEST unit
> real    0m3.207s
> user    0m0.584s
> sys     0m2.487s
> 
> $ time gzip -d <test.bin.nx.gz >test.bin.nx  # decompress with CPU
> real    1m0.103s
> user    0m57.990s
> sys     0m1.878s
> 
> $ time ./gunz_test test.bin.gz               # decompress with NEST unit
> real    0m2.722s
> user    0m0.200s
> sys     0m1.872s
> 
> That's why I'm objecting to measuring the general usefulness of hardware
> crypto units by the standards of fscrypt, which has an artificial limitation
> of never submitting blocks larger than 4kB: there are other use cases that
> don't have that limitation, and where the overhead is negligible because it
> is incurred only once for a few gigabytes of data.
> 
> That's why I suggested changing from a priority field to "speed" and
> "overhead" fields, and calculate priority for each application as
> (size/speed+overhead) -- smallest number wins, size is what the application
> expects to use as the typical request size (which for fscrypt and IPsec is
> on the small side, so it would always select the CPU unless there was a
> low-overhead offload engine available)
> 
> This probably needs some adjustment to allow selecting a low-power
> implementation (e.g. on mobile, I'd want to use offloading for fscrypt even
> if it is slower), and model request batching which reduces the overhead in a
> busy system, but it should be a good start.

What does this have to do with this thread, which is about the PowerPC
optimized MD5 code?

- Eric

