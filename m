Return-Path: <linux-mips+bounces-13048-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMmMOQL3e2nWJgIAu9opvQ
	(envelope-from <linux-mips+bounces-13048-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 01:10:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 492ECB5CCD
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 01:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3F9D3016247
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jan 2026 00:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D741DF736;
	Fri, 30 Jan 2026 00:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+7Rhbzh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A71BD9D0;
	Fri, 30 Jan 2026 00:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769731834; cv=none; b=DN4pVLQlLaj4EKnj8K8jpH+5eJPXnYd3AweQPN4nx/ZIgwVYxRYMuK6EK8ZaqPYSPbW3MfFqjd4nNbEK3DWS6Oai/Ry+WKPUVwLl4GQlBLOUWo5kkz9LNcxO1uSLmuenJXEGvwYSzBgZGbw2b+LYIDUiHc6SoJBLXn3ESWO77rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769731834; c=relaxed/simple;
	bh=PWynZwimuG+0Ms0GuPD3HOTG5tOoe7YputW33/OhNY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AULTWd/iX6odKp+Te1/jL13BGGJM6Kda7VxQGW7GPKlgiRxVheuPUElupXVMYIIp0zzkGojwzYr/I+u6vQDZzgM0Y12BxyYV6/6oweHfRFIAIhiGdgXpZQW5nMHLMYlODD9sZKLKv4mFw58QlrMqmjUSob+YkjlP8o9/yJzNEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+7Rhbzh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA01C16AAE;
	Fri, 30 Jan 2026 00:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769731833;
	bh=PWynZwimuG+0Ms0GuPD3HOTG5tOoe7YputW33/OhNY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y+7RhbzhmvJRxWUvIZXRw5ufdxMQ0QAahrYsbPkquIfhRoFBzgmtuPGkp5rgnzuec
	 MMoLFT2yOsnw7q8bm4dACBac8qJ12lzqwLyur68+1TNfrb9RRLap9eZWQiyuzjzzKw
	 JP8JCLtPPfRYsPS7gaEvWfiC778X3Fd7d1EjH0o+C/1lKUUTGwpG2Y6gQPjSW2Fpas
	 anBLnWK/R5XKE0TzZn6g8rPju/YMkSCvNyVa84uNGlJIGYJn0egdk+hBdGfgx5tT50
	 AGFJUPDCigy/jEXDiOfXSzmM1BnbT3irezqdFgu9yy3Fos918LqSu7w3FHBJvQ2gm6
	 IwRtialxxDlYg==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb+git@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Kees Cook <kees@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mips@vger.kernel.org
In-Reply-To: <20260116093359.2442297-4-ardb+git@google.com>
References: <20260116093359.2442297-4-ardb+git@google.com>
Subject: Re: [PATCH v2 0/2] Simplify kallsyms offset table generation
Message-Id: <176973183159.175491.9742885221630963935.b4-ty@kernel.org>
Date: Thu, 29 Jan 2026 17:10:31 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13048-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,git];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 492ECB5CCD
X-Rspamd-Action: no action

On Fri, 16 Jan 2026 10:34:00 +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> v2:
> - implement minimal PC32 support for MIPS so it can tolerate the symbol
>   references emitted by kallsyms
> - use signed decimal to represent the offset, so that symbols appearing
>   before _text can be represented correctly.
> - add Kees's ack
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/2] mips: Add support for PC32 relocations in vmlinux
      (no commit info)
[2/2] kallsyms: Get rid of kallsyms relative base
      (no commit info)

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


