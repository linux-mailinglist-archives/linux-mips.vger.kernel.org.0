Return-Path: <linux-mips+bounces-13777-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKjoKLfWumkXcgIAu9opvQ
	(envelope-from <linux-mips+bounces-13777-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:45:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AFA2BF883
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B09930D8390
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 16:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974023FF8AB;
	Wed, 18 Mar 2026 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpeluXyx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC323A451C;
	Wed, 18 Mar 2026 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850948; cv=none; b=WaxkUCM8rX+o8T3aEhCimbUBXrp+ZYxkmfSdt8jugZBDgc/ecW/Y7sGau/1W0m7LAxzWsJGas0nL+CupSU/MU3KbgdG+EsD50ymjezmZRTlUULBl8KVqQ74nNfz8CwywB/avSrHpdsc7e55eOPkKluk3CpvWJZWFcYH/8koTMGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850948; c=relaxed/simple;
	bh=FGNSu4DlIfiUMZa5ZkmaJp/QIn2lggE4u2Ndygv6FBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4XoJgBvGk8omxqUHeKagTRikK27RSZd7Ir73QUJ4hDq0GWJkuKj7gI0EyOijKNpwmSGSiNbZhDQ4qDTfckutjc2zJm92VlA6qzqdqRn8PIZArJqbsgkJBOqosQ6VLoYhH8o/apWUXzkegYN5bhVHLMzZN4TK3od8IqG2VYPJsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpeluXyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC48C19421;
	Wed, 18 Mar 2026 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773850947;
	bh=FGNSu4DlIfiUMZa5ZkmaJp/QIn2lggE4u2Ndygv6FBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpeluXyxDsZzF3NAmckdqJwpVkaAqttUopjBMOigcEjrW9PG4hOk9bFNjIu2+1hu1
	 IcsDTmGhCVATBRixcmNQQhBpayz2AxBxUoh+MbYsjRcLuorNTLiwBf6/k0JgHJn6Wz
	 raA3nLiznqIL8OBq0mPUTLKCPd5eb3Bv2V64KLPcxM+MrRFRw5yx4UwmNfiJttbMZO
	 J7HUEZM+SLsx9D5/aRBj0upZmqFXxEgFHzFGt2zHtfm6J4HCe4vfApVE0dgUg61GmQ
	 0lp53wfP1tgknNDPDCf1MumSabgXnKYpdnqZftaDNWH4frl/QojAulg09IVXxCoww0
	 l5WkFd3jbD+kg==
Date: Wed, 18 Mar 2026 09:22:26 -0700
From: Kees Cook <kees@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org
Subject: Re: [PATCH 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Message-ID: <202603180921.1B52D626@keescook>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13777-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Queue-Id: 64AFA2BF883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 02, 2026 at 01:25:24PM +0100, Thomas Weiﬂschuh wrote:
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
> 
> Move the symbol to kernel-internal headers.
> 
> Meant to be applied through the asm-generic tree.
> The default recipient list was huge. I trimmed it to only the
> architecture lists.

I don't see anything in Debian Code Search that actually uses this
symbol, so that seems fine. Userspace already parses auxvec looking for
AT_NULL, so length isn't useful.

Reviewed-by: Kees Cook <kees@kernel.org>

> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Thomas Weiﬂschuh (15):
>       MAINTAINERS: exec: Add more auxvec.h variants
>       auxvec.h: Move AT_VECTOR_SIZE definitions to linux/auxvec.h
>       asm-generic: add an in-kernel auxvec.h header
>       ARM: drop custom asm/auxvec.h
>       x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       LoongArch: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       s390: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       MIPS: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
>       alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
>       auxvec.h: Drop fallback AT_VECTOR_SIZE_ARCH
> 
>  MAINTAINERS                              |  5 +++++
>  arch/alpha/include/asm/auxvec.h          |  7 +++++++
>  arch/alpha/include/uapi/asm/auxvec.h     |  8 +++-----
>  arch/arm/include/asm/auxvec.h            |  1 -
>  arch/arm64/include/asm/auxvec.h          |  7 +++++++
>  arch/arm64/include/uapi/asm/auxvec.h     |  6 ++----
>  arch/loongarch/include/asm/auxvec.h      | 14 ++++++++++++++
>  arch/loongarch/include/uapi/asm/auxvec.h |  8 +++-----
>  arch/mips/include/asm/auxvec.h           | 17 +++++++++++++++++
>  arch/mips/include/uapi/asm/auxvec.h      |  8 +++-----
>  arch/powerpc/include/asm/auxvec.h        |  7 +++++++
>  arch/powerpc/include/uapi/asm/auxvec.h   |  6 ++----
>  arch/riscv/include/asm/auxvec.h          | 13 +++++++++++++
>  arch/riscv/include/uapi/asm/auxvec.h     |  2 --
>  arch/s390/include/asm/auxvec.h           |  7 +++++++
>  arch/s390/include/uapi/asm/auxvec.h      |  6 ++----
>  arch/sh/include/asm/auxvec.h             |  7 +++++++
>  arch/sh/include/uapi/asm/auxvec.h        |  8 +++-----
>  arch/sparc/include/asm/auxvec.h          |  6 ++++++
>  arch/sparc/include/uapi/asm/auxvec.h     |  8 +++-----
>  arch/x86/include/asm/auxvec.h            | 12 ++++++++++++
>  arch/x86/include/uapi/asm/auxvec.h       | 13 +++----------
>  include/asm-generic/Kbuild               |  1 +
>  include/asm-generic/auxvec.h             |  7 +++++++
>  include/linux/auxvec.h                   |  5 +++++
>  include/linux/mm_types.h                 |  6 ------
>  26 files changed, 139 insertions(+), 56 deletions(-)
> ---
> base-commit: f6b3b0a4c85882ad75bce3b093173203e3f39f28
> change-id: 20260109-at-vector-size-arch-6e0f2e9ff8b6
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

-- 
Kees Cook

