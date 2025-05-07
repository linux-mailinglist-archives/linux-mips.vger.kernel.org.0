Return-Path: <linux-mips+bounces-8963-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C941AAEEA0
	for <lists+linux-mips@lfdr.de>; Thu,  8 May 2025 00:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E8BB9862A1
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 22:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A8928C2CB;
	Wed,  7 May 2025 22:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HW9i1+ZW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55222F759;
	Wed,  7 May 2025 22:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746656332; cv=none; b=iFWVPV1bIIPqmcF808KsqRK7TNLP3VieRdTOt9l+gWXpPWzU/yHOfpxF1xWWHjWgkElcYqwjzBWwjrpwOe9qqnKxE1tA5ZqdR/1JRrljCkWFLTS+KKWdVQwDIKjRUYhPXl93/Ukg/wN2/kVkVGp5UXui0ZuoGV/EQMA7jin9pJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746656332; c=relaxed/simple;
	bh=EEgrVpV+dxmZpKE2aC2GH0LMPotoCq/ED7mZZZVPrOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGXKbEFi5KGePAD9siyYhme7jeJpdkN4/LIgSvGMwZqX3fZ2txDokFYBbqQbMCaKyk75vyMI0TUiff1G/A/rMv/ht0ywKd7rEUi4jMlcahdr9GmBRt7Cn0v4wtO3F7tmo2dqENcXLgECOTf5Z9AwOjHuMydGSswfqRMBgUjRnLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HW9i1+ZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7031BC4CEE2;
	Wed,  7 May 2025 22:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746656331;
	bh=EEgrVpV+dxmZpKE2aC2GH0LMPotoCq/ED7mZZZVPrOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HW9i1+ZWzoLd/e9bujf1qVWc4oLPzoIis/DMPHIjPG4Lg+v2TPdqTr9QUjrfy3xA6
	 LilZNWBQntwYzZV1RPplD4NAwhlcoCFs+Z+bFj5U2bi1PwPgblDNphdOhRJdm5EtCy
	 Cw60wLu8RYdoLYzMoGZIdU47QksD3fVhi9bqZ5jHQixh3LYtQq3gLI1W1cHdys5QKK
	 9/F0GzkplXSU36PJNe3pXjxhJpGny5aOaj3aWnq27QG91pMqJZyUjkOlEmYjHZkCGT
	 LSn3niecaNRjbjhwe/MAUWzR4BKj4fKUqm3qDUbCOTt/mpAWdNOuY4BZKZNd1gjo6T
	 nGhlayET1r+dg==
Date: Wed, 7 May 2025 15:18:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [linux-next:master 6141/9308]
 arch/mips/lib/crypto/chacha-core.S:264:118: error: unknown instruction, did
 you mean: rol, rotr?
Message-ID: <20250507221846.GA526360@sol>
References: <202505080409.EujEBwA0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505080409.EujEBwA0-lkp@intel.com>

[+Cc linux-crypto, linux-mips, and the authors of the mips chacha-core.S]

On Thu, May 08, 2025 at 04:36:30AM +0800, kernel test robot wrote:
> Hi Eric,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   08710e696081d58163c8078e0e096be6d35c5fad
> commit: 939a54ac073808db15ed411d563dfadb3ef12798 [6141/9308] crypto: mips - move library functions to arch/mips/lib/crypto/
> config: mips-randconfig-r111-20250501 (https://download.01.org/0day-ci/archive/20250508/202505080409.EujEBwA0-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce: (https://download.01.org/0day-ci/archive/20250508/202505080409.EujEBwA0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505080409.EujEBwA0-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/mips/lib/crypto/chacha-core.S:264:118: error: unknown instruction, did you mean: rol, rotr?
>     addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 16; rotl $s4, 16; rotl $s3, 16; rotl $s2, 16;;

This build error actually occurs before my commit too, and even on current
mainline.  I don't know why it's just getting reported now.  It occurs only with
clang, which is why I didn't notice it before (I did the mips build with gcc).
Anyway, I don't really speak MIPS, but it looks like what's going on is the CPU
only has a right rotate instruction, and binutils translates left rotates into
right rotates, but clang doesn't.

'mips-linux-gnu-gcc -c -march=mips32r2' successfully compiles the following:

    rotl $a0, 5

... and with 'mips-linux-gnu-objdump' it comes back as:

    ror	a0,a0,0x1b

But 'clang -c -target mips-linux-gnu -march=mips32r2' errors out:

    test.S:1:1: error: unknown instruction, did you mean: rol, rotr?
    rotl $a0, 5

I don't know if 'rotl' is "supposed" to work or not.  But either way, we could
make the assembly code use right rotates only.

- Eric

