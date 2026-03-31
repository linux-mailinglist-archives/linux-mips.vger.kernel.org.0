Return-Path: <linux-mips+bounces-14001-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ9CIE5DzGm+RgYAu9opvQ
	(envelope-from <linux-mips+bounces-14001-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 23:57:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0823723F1
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 23:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F8293003303
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 21:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754283F7E85;
	Tue, 31 Mar 2026 21:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHzGy69w"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D6D28150F;
	Tue, 31 Mar 2026 21:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994180; cv=none; b=fGggLF4aRdq+V3cpQ24Yos5sb7EO1lmKjrCQV5suVeWbVrrsZuVq5hK1OyCPBioadu5P/sm3t9hkigrwnbCA/S2B6JLIhbuRuLIwcaqT1blvNEYnBWfiKg/rrb5cZG8qdgQQSlbSwKdJPO+7qZsfSwEzpbAjAYLqLed8OcL6sRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994180; c=relaxed/simple;
	bh=AecbD9Gzc/KYKjUSMEDrWYsKf9jEKDEzQ/3mqSuBteg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeWw31rz92ucRnCpFluS1qxZzlNCa5HL7zakYTDFWI6DNESGMOvqhrMYB/+045xWgP9IbXruWmnX5sW0OcMUaaIr6pwGTY7wPkkgq0TZ+a8bT9j9tEKPI3R1hLoTFaPeGVVHAh5iuRUusMyCpxaM7tR4XpSzgiJO7KwfSyJXGAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHzGy69w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13A1C19423;
	Tue, 31 Mar 2026 21:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774994180;
	bh=AecbD9Gzc/KYKjUSMEDrWYsKf9jEKDEzQ/3mqSuBteg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHzGy69wTg2lHOKXv4rPtC2oQAxl+RHBil09l5IRdse2j54+2NlF4Cs8mCg13nyRU
	 jgiDBB0yKimz05STMl1YWxovMBABIso5tejM+/LY4gy/3iD/QqJyCyYHuElEey2gqc
	 L3NZR9X3W4Objc5SO3on4qlAtqTGkgK3GRuQfiHYpyG6AKW2hKRJYHdmqvE8hLDCig
	 YO56R2XS0oQGEPkalXKCRqPcqY2qVRnLFELXmR3HoXgFDwe9agChSnrt2iMgp/vvul
	 C+H5ju0FlWPrn6sVlfUiubjKChfAPS8Bs4do0QrIlAFX0jr3hkbfzmWL9mQUW8PhbR
	 2gmSnkJJBZNBA==
Date: Tue, 31 Mar 2026 14:56:19 -0700
From: Kees Cook <kees@kernel.org>
To: Bingwu Zhang <xtex@envs.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matt Redfearn <matt.redfearn@mips.com>, Yao Zi <me@ziyao.cc>,
	Icenowy Zheng <uwu@icenowy.me>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bingwu Zhang <xtex@astrafall.org>
Subject: Re: [PATCH] MIPS: Increase default mmap randomization bits for 64-bit
Message-ID: <202603311456.95207C9F@keescook>
References: <20260328225738.51613-2-xtex@envs.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328225738.51613-2-xtex@envs.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14001-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA0823723F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 06:57:39AM +0800, Bingwu Zhang wrote:
> From: Bingwu Zhang <xtex@astrafall.org>
> 
> Increase mmap randomization bits on 64-bit from [12,18] to [18,20] for
> better strength.
> 
> The original default, 12, means that ASLR offset has only (1 << 12) =
> 4096 possibilities. On average, it can be brute-forced in 2048 attempts.
> If a service is configured to restart automatically or can be started
> easily (e.g. execve a suid program), then trying for 4k times can be
> done in one day even when each attempt takes 20s.
> Increasing it to 18 makes brute-force much more difficult and leaves
> more time for operators to find out attacks.
> 
> On 64-bit platforms, virtual address space is cheap, so the
> randomization bits can be increased safely without disturbing userland.
> 
> In 1091458d09e1 ("MIPS: Randomize mmap if randomize_va_space is set")
> where mmap randomization was first introduced to MIPS, the randomization
> range was 256 MiB, equivalent to 16 randomization bits (if 4K page size).
> In 109c32ffd89d ("MIPS: Add support for ARCH_MMAP_RND_{COMPAT_}BITS")
> where MIPS begin to use ARCH_MMAP_RND_BITS, commit message claimed:
> > The minimum(default) for 64bit is 12bits, again with 4k
> > pagesize this is the same as the current 256MB.
> which is incorrect. (1 << 12) * page_size is 256 MiB only when page size
> is 64 KiB, so the strength of mmap randomization was reduced by 4b.
> 
> Fixes: 109c32ffd89d ("MIPS: Add support for ARCH_MMAP_RND_{COMPAT_}BITS")
> Signed-off-by: Bingwu Zhang <xtex@astrafall.org>

I defer to MIPS maintainers, but yeah, let's turn it up if possible.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

