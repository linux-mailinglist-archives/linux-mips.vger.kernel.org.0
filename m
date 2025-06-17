Return-Path: <linux-mips+bounces-9337-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4178ADC207
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 08:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B56983A3A03
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 06:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5130B288C30;
	Tue, 17 Jun 2025 06:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3BZtawf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B64C2D1;
	Tue, 17 Jun 2025 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750140354; cv=none; b=apLmnlTsAyNqsIglK8VaC97BAifi01T4GZnvKhq4gDBw5jWN1Ftgl9kd2v/2XSaB9kDpzwh8qY+1o43XeAo9RKPsF75yU3XxDzh51MYginFNdd7I6bB6oJoeF3mZv/Zgg3uXT9IGTDxWTFQolCydoNzOJWenVaGPIehziTKXG0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750140354; c=relaxed/simple;
	bh=NdEJIIDfmHJ1ATQaLMe0WV6YWvExdcsSuFGjNOOoGIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAMGsHWnbMzNGB4CRpvCAIt4aHf0SHvz1TVdic4CLKejxeiNsiIg5b69QcuNX83U4OdzWpQgbAcROnJyvt+oIUM27QcDQkI6qAGBR9s/mSp7KCzoE1j8RK4OlGbT1+3eKuCvPF0FqHvsmXWVEsg0vc75D6qL6wKqMhcb2KqcoE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3BZtawf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48056C4CEE7;
	Tue, 17 Jun 2025 06:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750140353;
	bh=NdEJIIDfmHJ1ATQaLMe0WV6YWvExdcsSuFGjNOOoGIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3BZtawfFfNAxwNgYqwerTEy2C2JB63EFa3FCEVVyQ9GQhcoMPbEk90oxtVULSrjZ
	 L4eNUIVXoeP7+sgk9qm9fL/7N9lrcvz3wrDkQhBN4eirAG/nDTfxJx7xOqAMZ1VgS6
	 5fqwCEiW77gZ6yz6TlaZ0GnyCwpW++sVv659hwnTUhwaoZBHhcd+8PrRm1Nv/m2V1O
	 KABwq8oVHcxJ9HzYIb7Cawz4eu+RTNeVyNL2Rw3pncUGQC7rpFerSeUw6hnMMa/snk
	 9Cv2iWNRtYVIqDXdtVY605IgZBeq+T8VN/Q6zLMjOxWF1C3ScW6/2SHncDPDBjKk2u
	 fK3nx+USjN5CQ==
Date: Mon, 16 Jun 2025 23:05:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250617060523.GH8289@sol>
References: <20250616014019.415791-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>

On Sun, Jun 15, 2025 at 06:40:02PM -0700, Eric Biggers wrote:
> - Tests are KUnit tests, and they are fairly thorough (more thorough
>   than crypto/testmgr.c) and also optionally include benchmarks.

An additional note on testing: I have scripts that build the kernel for all the
arches that have arch-specific code in lib/crc/ or lib/crypto/, launch them in
QEMU with various -cpu options, and gather the results of the tests and any
other issues like warns or panics.

I'll get it into a sharable form at some point.

As far as the coverage of the arch-specific code in this specific patchset goes,
I've verified that my testing strategy covers all sha512_blocks() code paths,
including fallbacks, on arm, arm64, s390, riscv, and x86.

The two incomplete ones are mips and sparc, where I cannot test their optimized
code paths in sha512_blocks() because QEMU does not support it.

Still, I don't expect any issues.  That code is ultimately doing the same thing
as it was before for SHA-512 block processing, just integrated in a simpler way.

FWIW, my policy going forward is that any new arch-specific code in lib/crc/ or
lib/crypto/ *MUST* come with QEMU support so that it can be tested.  It's only
migration of existing code (usually from arch/*/crypto/) like this where I may
tolerate not being able to test it; that code gets "grandfathered in"...

- Eric

