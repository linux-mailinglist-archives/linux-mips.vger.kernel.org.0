Return-Path: <linux-mips+bounces-15569-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UZJHBhObTGrZmwEAu9opvQ
	(envelope-from <linux-mips+bounces-15569-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 08:22:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44115717E68
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 08:22:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KX6oQElB;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15569-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15569-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11C4E30315CC
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 06:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEAC1A9FA8;
	Tue,  7 Jul 2026 06:22:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F41C2771E;
	Tue,  7 Jul 2026 06:22:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405328; cv=none; b=MGtnSrCmYKtpDyjnmDmUBsx6LX5mKbjl6OjRBKN2mVcxgRoSdBsHvulp/c/0T/KXs+4aiBJwFH5IyTaP+CFJ7lehBVMiO4t5b9kbx3i9qXLnDa/lpaImWrxKGIImWe4V5sikIvO1NTIOAVogM+wpeV/tYhzb9O741qDgm5YvKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405328; c=relaxed/simple;
	bh=RvgyL+jT7ZBf3+nwcbXQoOpkUUnRchDvFvUEvmmySfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC53xsBC+ugtRwm++Tr15RaktUEnP+34iTk71OcGxGkrAU4DFoMvgt1RsxkM38FYW2GM5fs38byGH1tPw0yKa9jnq0787Y2saI/SvuG51WzGLQwVboAv3+uGKcB6AJOZ7O4MNTRcY1zftRRLYZt/FU+OXnrGnF1nZjM6FwzG3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX6oQElB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E881F00A3A;
	Tue,  7 Jul 2026 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783405327;
	bh=yn/kZO4u9dWBVxPs71FKMvr7XU7SEACJ62k7H7NLLHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KX6oQElB50riJguELkN1/oM9JSIx8kufrjmms3fiXJNuW5KspQJmZPSt5txAZwfZ2
	 qmwzwv32TZ5VQ3oVo86MzmGlBTLY0Bult2je9cYUNm2GumxPfXXh02U5/eP8vmHATh
	 l0yk6hi+eNbFC6j4Z2RJlqcTzZ7DOp8Uj1YjkWzycPc4UWvkIAm4v5o6S6kgQnsXsC
	 E5uOMqlHsQQayQziHVuprBAfwDQOqDDMnD6V8Q0bGxtuBz+B3iFjgb7Li8Vf9AlbpN
	 RpGXmnITZ7hRagUJHFpM3AfnuqLKeiy/VdtNQMbB8VYinItP9T+2lm4M+HfkO2i1RE
	 HQyPN68VjyoBw==
Date: Tue, 7 Jul 2026 09:21:58 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pnina Feder <pnina.feder@mobileye.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Message-ID: <akybBoCAm-kJbfHL@kernel.org>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622211430.4008899-1-pnina.feder@mobileye.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pnina.feder@mobileye.com,m:akpm@linux-foundation.org,m:baoquan.he@linux.dev,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:ruirui.yang@linux.dev,m:corbet@lwn.net,m:alex@ghiti.fr,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-15569-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44115717E68

(adding new Baoquan's email)

Hi Pnina,
On Tue, Jun 23, 2026 at 12:14:26AM +0300, Pnina Feder wrote:
> This series extends vmcoreinfo with struct offsets and sizes needed by
> the vmcore-tasks userspace tool to extract per-task state from a vmcore
> dump without requiring kernel debug symbols (DWARF/BTF).
> 
> The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore file) and
> reconstructs, for each task:
>   - task name, pid, state, flags
>   - VMA list (start, end, flags, backing file)
>   - user register state (saved on the kernel stack at kernel entry)
>   - user-space backtrace with VMA/filename mapping
>   - kernel dmesg buffer
> 
> This provides a lightweight post-mortem crash analysis capability for
> production environments where full debug info (DWARF/BTF) is not
> available.
> 
> The companion userspace tool is submitted to kexec-tools:
>   https://lore.kernel.org/all/20260622205550.1087163-1-pnina.feder@mobileye.com/

Sorry for the delay, this fell between the cracks somehow.

The kernel side looks fine overall, but to merge it there should be an agreement
from the userspace side maintainers that vmcore-tasks is something they are
wishing to accept.

-- 
Sincerely yours,
Mike.

