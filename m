Return-Path: <linux-mips+bounces-9271-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA4CAD8296
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 07:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253011897C68
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 05:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278A020E018;
	Fri, 13 Jun 2025 05:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVFtVRcp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9127082A;
	Fri, 13 Jun 2025 05:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793012; cv=none; b=aA4VoHcofyKH1BvliJbxeElMcs7er7bwkKuKQQbRf/Zu/11IQ0mcqOKCBiB9n2Xhln6PI/0AfP87BUUiTtTOaQRcPR/pxqY3KmIWsj5w/kf3+qoWckFT6sDMwMWdzXWYSftZe3OPNfuekQ0Nj6FSPT3Oa9Yle1mZ/6QRtNpd+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793012; c=relaxed/simple;
	bh=JJcCqKW7LXqyOZrK1HJFUxRa9D1FKrSjC3MG6GISIC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6RD579znklgnx53Ort0mSS5/iRDJj2fbHWESxkG+Xx/991CJJ2LE1XrDCbu/WXDyfkZMr6UjxaDaXj5dXdWOSGYa0Z/lz3muiU1Jd/0Bg+fNuOYUT0LAENctU8XxbokM0aKrLl8QXkwYrjQYC2pSwVBtwhnDbFPRn9rj9ma4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVFtVRcp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD44C4CEE3;
	Fri, 13 Jun 2025 05:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749793011;
	bh=JJcCqKW7LXqyOZrK1HJFUxRa9D1FKrSjC3MG6GISIC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVFtVRcpRQIFO4mHnvudrWjYj+HKuvEE1lRRW865Rh/YuC4AuPraomY3jpJ1Mgioe
	 27LxYK0VXLKuqkY3VxF95GJkwlpNeUobZJpI0eA9EfyssFCuVb/rsH2drEMNSlJZAV
	 EeMOAIQpyL6cciRHEYIEug2c2dzBlEEWw8fC2fRuGu4YTWfCzKV/ffw0iDvBHL/0HW
	 rT2WjUvss4//18xLvlPwHrKosYGf/KAGpbTRQYlOlNTiU7phKS/1Db9DbdAx3v4hlO
	 rH9i8gaA8VSTgrMIS3G96zjIEsaMnAsYIBvQMOvq6M3hNsU0v1/GNZD/YOosrCmVRJ
	 2p5S7tN5Pfd7w==
Date: Thu, 12 Jun 2025 22:36:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250613053624.GA163131@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611035842.GB1484147@sol>

On Tue, Jun 10, 2025 at 08:58:42PM -0700, Eric Biggers wrote:
> On Wed, Jun 11, 2025 at 11:46:47AM +0800, Herbert Xu wrote:
> > On Tue, Jun 10, 2025 at 08:39:57PM -0700, Eric Biggers wrote:
> > >
> > > Do you have a concrete example (meaning, a specific driver) where this actually
> > > matters?  Historically, export and import have always had to be paired for the
> > > same transformation object, i.e. import was called only with the output of
> > > export.  There is, and has never been, any test that tests otherwise.  This
> > > seems like a brand new "requirement" that you've made up unnecessarily.
> > 
> > It's not just drivers that may be using fallbacks, the ahash API
> > code itself now relies on this to provide fallbacks for cases that
> > drivers can't handle, such as linear addresses.
> > 
> > I did add the testing for it, which revealed a few problems with
> > s390 so it was reverted for 6.16.  But I will be adding it back
> > after the s390 issues have been resolved.
> 
> Okay, so it sounds like in practice this is specific to ahash_do_req_chain()
> which you recently added.  I'm not sure what it's meant to be doing.

You do know that most of the sha512 asynchronous hash drivers use custom state
formats and not your new one, right?  So your code in ahash_do_req_chain() is
broken for most asynchronous hash drivers anyway.

- Eric

