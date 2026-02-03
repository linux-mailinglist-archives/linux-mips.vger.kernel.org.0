Return-Path: <linux-mips+bounces-13106-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEV0DgpFgmmERgMAu9opvQ
	(envelope-from <linux-mips+bounces-13106-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 19:57:14 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A10BBDDF93
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 19:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A45083014554
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 18:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4817D299AB3;
	Tue,  3 Feb 2026 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEfvu5kW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BE721A459;
	Tue,  3 Feb 2026 18:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770144788; cv=none; b=LVrAlLkitoQZnOKKu8YAld2gRxyWUYetN2ercuP57eTAQcwttsdu+K48wsArGFzSLEu13uzFPjbOWXZY4vhXeVADdIetGNQ8efZu4DeJmFBOP0UrI94N+gk5r34gW5Y0fimCFWpvFaJiW6qO4a/eQ/yHK4Tkam3lQIzJb7peAMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770144788; c=relaxed/simple;
	bh=z5rIqdSgj70boeBRGQHk7eIU0hmDnFxqYUtdNGpPe/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=II9RG8Av77/po2+cvXY6S/1cXuhP9XoOSvgtYaufDyFe6LzH6EHI2nxWoEZ2sGMWCEh7Emihci3em4VpLfsBbrlRd65shaZpxhW4zFAk4fbrASi9Jzfm7PSh74QXYg700tdExuWxpPqtHu8Bg7rLz0whUgl2hbRgAQPXrJHP5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEfvu5kW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D8FC116D0;
	Tue,  3 Feb 2026 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770144787;
	bh=z5rIqdSgj70boeBRGQHk7eIU0hmDnFxqYUtdNGpPe/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BEfvu5kWSPt/8GAPsSj7zAvL2qCuFo3sO+4QxWCi2iS5eG9LLees6fYV2FjHCX28X
	 fIADg9vwmhyTj+JQMgxSVIJtWwusAiZ68qPHV3W26VFAjCn0mg9JeNVtScuDVB8r5v
	 1p0A3ikHfqFdmRis1+bvDLVft3ZcDIF7/2J6JsKDq6XMONZmLJuJjONZuM6RCWC19F
	 TiKw7ypZEKkFBeHBgtbWbe4oojnys5pIwU0RtIkUtbOCxU/bmPgD02exZcgGiPoCqP
	 qbne6lPKgVKhQi41Etpfdmcj/9yAYvRRlGXGNiblOHcYrVbBVYf9tokwMchV5pMFN2
	 TaYI7cPEWLztg==
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260202041610.61389-1-me@ziyao.cc>
References: <20260202041610.61389-1-me@ziyao.cc>
Subject: Re: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
Message-Id: <177014478629.2310701.14623005254080630046.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 11:53:06 -0700
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13106-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A10BBDDF93
X-Rspamd-Action: no action

On Mon, 02 Feb 2026 04:16:10 +0000, Yao Zi wrote:
> R_MIPS_PC32 is a GNU extension, its definition is available in glibc
> only since 2.39 (released in 2024), and not available in musl libc yet.
> Provide our own definition for R_MIPS_PC32 and use it if necessary to
> fix relocs tool building on musl and older glibc systems.
> 
> 

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
      https://git.kernel.org/kbuild/c/87abe931fbc34

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


