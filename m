Return-Path: <linux-mips+bounces-13991-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P/NDLnRymmsAQYAu9opvQ
	(envelope-from <linux-mips+bounces-13991-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 21:40:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A473608BF
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 21:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A3F2300AD68
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 19:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D3F39A078;
	Mon, 30 Mar 2026 19:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVzLr6Co"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA2399354;
	Mon, 30 Mar 2026 19:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899470; cv=none; b=gasYN05HSCF4TfnV8kKFpJ3GFArgFdWHIBQrcthO8Ltihbv8Epx/nln9hvZFB1nK4TIPG62pwsrL/CqlV9IwmsY1yUAOFI7WkCbLIkE5rv2pHt2hujnF0L+HEqlPBep72i/tc6H18z6d3gX6I+vYJ3a6JeBi9YbHegKPTHrOunA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899470; c=relaxed/simple;
	bh=HcPfb3mUQYlrygZRolUZecA4/UgyE3xPkjXDPzjCIFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYWm3vVAhx0e0sJZf+cQnPa+vKR5wDIcYdx4ducSY/TIIqOVHv/09O6eNnjYC0YKbNCPveFx09/rSumBzrkdIG19uy69jtuHDWtMaRF+JoTdqdffIi+9VGZMXXbYdpbZeA2w4pDIEVvAEV/5wW3kLOoeVHrhs3+xea8wxls/xLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVzLr6Co; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B3BC4CEF7;
	Mon, 30 Mar 2026 19:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774899470;
	bh=HcPfb3mUQYlrygZRolUZecA4/UgyE3xPkjXDPzjCIFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVzLr6CoWsODYt4pAj5Te3R7GDslta5b4Y/aFJhhgL3KYA43wvsEEfPe+SIPALhbv
	 XLL3sGO43tDRylb3UmTW0L3qGHOQda1GzCibZ98EbnDOJEtqw7W0Mtc2FaRuOPEm70
	 t89447QRzczhqaBB6G9G2bM0BqEtekkrk82HdGCGZjjVauES57xOP/70qqsw9gEhKZ
	 DRD76dYpU31snBzJwqpaqWUCLS+vKus6OcCkP2qxK3/HuDzlPR/q/X16VNDAOCFEbF
	 1ROp3fme6zygQAveKSOD+L44cg1FA80CZXZb9vfyj6Uw9kSoONiQYU1HgjNoji/s6I
	 sB5CHNpFJJwFw==
Date: Mon, 30 Mar 2026 12:36:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] lib/crypto: mips: Drop optimized MD5 code
Message-ID: <20260330193641.GA4303@sol>
References: <20260326204824.62010-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326204824.62010-1-ebiggers@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13991-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21A473608BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 01:48:24PM -0700, Eric Biggers wrote:
> MD5 is obsolete.  Continuing to maintain architecture-optimized
> implementations of MD5 is unnecessary and risky.  It diverts resources
> from the modern algorithms that are actually important.
> 
> While there was demand for continuing to maintain the PowerPC optimized
> MD5 code to accommodate userspace programs that are misusing AF_ALG
> (https://lore.kernel.org/linux-crypto/c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu/),
> no such demand has been seen for the MIPS Cavium Octeon optimized MD5
> code.  Note that this code runs on only one particular line of SoCs.
> 
> Thus, let's drop it and focus effort on the more modern SHA algorithms,
> which already have optimized code for the same SoCs.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is targeting libcrypto-next

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

