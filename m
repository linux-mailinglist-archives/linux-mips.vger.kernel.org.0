Return-Path: <linux-mips+bounces-10017-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C7B1AB3C
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 01:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 260297A1DEE
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 23:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377802248B0;
	Mon,  4 Aug 2025 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsLAxxIT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB81BC4E;
	Mon,  4 Aug 2025 23:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754348969; cv=none; b=k/9OY7RjQU3sXYNUuUS+v1G2SlYwlY9LSIrsvmPnhLR9ASSK2O3ncEuAwFqtmw/dtVUNoe3NlMf6Od5Z+1NJim0Ae+mFydsD/oKjllFVgqX66hVaOI4aCQe6fvMb13dlK229LPqrJGEzRijm22ZM/y/nAY5Yfl22MXT37Kflmik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754348969; c=relaxed/simple;
	bh=wYEx1h5rVCSwEkjK7MIqFH7taTkIsjQXMHcC71M4+Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZaYaai/k54HL7Q5g58i6+wPBnWQ/gVB4ygRd9PgSmmxjUZaUXpoRv3YqOsC6HdYgCi+/WJo/O4gwDSDlKRI6Jm+GWkJouYFvGtHRt6CdoLQHqstcun/av/Q3l7jNtyi5VRZ8sEzWP9CII6XAbSa1Sa7n9kxh0ncFmi3xwXhXg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsLAxxIT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34094C4CEE7;
	Mon,  4 Aug 2025 23:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754348968;
	bh=wYEx1h5rVCSwEkjK7MIqFH7taTkIsjQXMHcC71M4+Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsLAxxIT9ZwgvBbuv3BAKO4M+ZNIygr5J3TkX5LIs9gIczO+D0YxLWOgZ/ykDtYoK
	 6U7EpvB9B1u6DJ+kJtpgn02WfQ2/bDJaWwhiR4Erfu8W/KtXhpj6FOkzDvMKwyJsfj
	 Gb+6JUrjpFLUpauJ/hMSHT/U35N31WaMKcsgh043ubWHaq24IHN9cVrzRBADkIMyVY
	 P1BdOlaqO4WjIH3zjBTyN950LbmW6oubAyvBXOcu/swYiM8jh1dtBWd536Kco2VGH/
	 DvYYzy2Fc7jbbd8eVNqJ+rWN7mJ2JnXbbp+J/GOEfwi9aGCucqIxIYK2iIGXYfqH6Q
	 EZcglPq6m/z2A==
Date: Mon, 4 Aug 2025 23:09:26 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250804230926.GD54248@google.com>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250804225901.GC54248@google.com>

On Mon, Aug 04, 2025 at 10:59:01PM +0000, Eric Biggers wrote:
> On Mon, Aug 04, 2025 at 09:02:27PM +0200, Christophe Leroy wrote:
> > 
> > 
> > Le 04/08/2025 à 20:09, Eric Biggers a écrit :
> > > On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
> > > > 
> > > > 
> > > > Le 03/08/2025 à 22:44, Eric Biggers a écrit :
> > > > > MD5 is insecure, is no longer commonly used, and has never been
> > > > > optimized for the most common architectures in the kernel.  Only mips,
> > > > > powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
> > > > > only the powerpc one is actually testable in QEMU.  The mips one works
> > > > > only on Cavium Octeon SoCs.
> > > > > 
> > > > > Taken together, it's clear that it's time to retire these additional MD5
> > > > > implementations, and focus maintenance on the MD5 generic C code.
> > > > 
> > > > Sorry, for me it is not that clear. Even if MD5 is depracated we still have
> > > > several applications that use MD5 for various reasons on our boards.
> > > > 
> > > > I ran the test on kernel v6.16 with following file:
> > > > 
> > > > # ls -l avion.au
> > > > -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
> > > > 
> > > > With CONFIG_CRYPTO_MD5_PPC:
> > > > 
> > > > # time md5sum avion.au
> > > > 6513851d6109d42477b20cd56bf57f28  avion.au
> > > > real    0m 1.02s
> > > > user    0m 0.01s
> > > > sys     0m 1.01s
> > > > 
> > > > Without CONFIG_CRYPTO_MD5_PPC:
> > > > 
> > > > # time md5sum avion.au
> > > > 6513851d6109d42477b20cd56bf57f28  avion.au
> > > > real    0m 1.35s
> > > > user    0m 0.01s
> > > > sys     0m 1.34s
> > > > 
> > > > I think the difference is big enough to consider keeping optimised MD5 code.
> > > 
> > > But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
> > > it has any effect on md5sum.  The difference you saw must be due to an
> > > unrelated reason like I/O caching, CPU frequency, etc.  Try running your
> > > test multiple times to eliminate other sources of variation.
> > 
> > md5sum uses the kernel's MD5 code:
> >
> > libkcapi.so.1 => /usr/lib/libkcapi.so.1 (0x6ffa0000)    <==

Oh, I think you used the obscure implementation of md5sum from
libkcapi-tools, instead of the normal md5sum.  Why?  Did you check how
the normal md5sum performs too?  Just doing the calculation in userspace
is much more efficient.

- Eric

