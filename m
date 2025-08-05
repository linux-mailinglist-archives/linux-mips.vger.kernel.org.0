Return-Path: <linux-mips+bounces-10026-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17AB1B847
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 18:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43FE18114B
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 16:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BB0291C03;
	Tue,  5 Aug 2025 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGWeO0hS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E32E371C;
	Tue,  5 Aug 2025 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754410676; cv=none; b=DqXru11NuZIGEKFCXyjz+gDhtGnVklopJWhL3Zx5Feg33xAXR446kCfAf4FaT4fXyOHFUMvKTMyRFFfQvlWnWW8BPeH0MnjRPgLt9FhrAGZEhiSzT1lDaFaLYCMyXTrivbJmlGi02Xczpk+0CHhA0y5/etv+TYJ1yV4FXuErM/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754410676; c=relaxed/simple;
	bh=VEaguF/ogsUg8LpFDpHstynmmvNIK3mlr/svELCRauQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fz9aC5MGKemdYb3YRL7hTrauOzKrK+WL7ZaOSGedLizbEP3rGLy9KYLTG7Qg9e8mP92bQUaUYoATnaUbnDc9uEXDxSAuD4jjZApghF6XZCD2hQFvgSCfQBbq2CEA5f691TeoDy4wbpqFW+YsPVzgE3mHQ9Gk1x7fLXnBY77IAsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGWeO0hS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A72C4CEF0;
	Tue,  5 Aug 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754410676;
	bh=VEaguF/ogsUg8LpFDpHstynmmvNIK3mlr/svELCRauQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGWeO0hStuckHs5WZfjGH0bLLJm+w5iCYk2zGYNrIOgwN/hcs/wFYIwMndWkVSbgo
	 qgZvcmHQt3X/4fCvF/UxmvF9KqJCb7RoFN65U30toLVfyxtkuV+mO9Mh7PK/CD+SIp
	 rb0R8NkR0piFdJdCTdNpHJ1wVhc2jMioJOWGM8UvJEgOvqOnNhgyGBpn8ExFh7rzTA
	 8WZOI8KC63QKsfGbeUrG2MMTHhbwktV9EAxdhBE5COUv5dgdB4B9LkDBeU/H4Ym88L
	 KPaUsNEWXXm0EafpSZ0drDrttdXQ363VINQYNGlWx/xPmS9CDpv+cRMVtTaI81ArkK
	 i0yUCuBtBwl6A==
Date: Tue, 5 Aug 2025 09:16:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250805161657.GB1286@sol>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
 <c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu>

On Tue, Aug 05, 2025 at 08:27:14AM +0200, Christophe Leroy wrote:
> > What?  That's crazy.  Userspace MD5 code would be faster and more
> > reliable.  No need to make syscalls, transfer data to and from the
> > kernel, have an external dependency, etc.  Is this the coreutils md5sum?
> > We need to get this reported and fixed.
> 
> Content of files is already buffered inside the kernel. likcapi doesn't
> tranfer data, it uses splice().
> 
> As far as I know, coreutil is not able to use the TALITOS Security engine we
> have on the mpc885 and mpc8321 microcontroleurs. We primarily use libkcapi
> for that.
> 
> In order to keep things consistant, we use the same userspace on boards
> which don't have a security engine, ie the mpc866, we rely on the kernel
> providing an optimised software implementation fallback.

Even if the data is transferred in a zero-copy manner, the AF_ALG
version still has a lot of overhead from system calls.  Running the
exact same PPC optimized code in userspace would of course be faster.

Now, it sounds like you don't have the PPC optimized MD5 code in
userspace, and that's why you're measuring the AF_ALG based md5sum to be
faster.  But that's just the wrong design, and it does not give optimal
performance.  The fact that the kernel allows access to software code
via AF_ALG is basically a bug.

For now we'll keep the PPC optimized MD5 around in the kernel to
accomodate userspace code that is depending on this bug, but for future
reference we don't add new software implementations purely for use by
userspace.  (And BTW this is nothing new; this has already been the
policy for many years.)  Please work to bring the optimized code you
need into userspace.  For example contribute it to OpenSSL.

- Eric

