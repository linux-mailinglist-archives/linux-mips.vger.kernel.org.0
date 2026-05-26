Return-Path: <linux-mips+bounces-14775-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLlrLyPFFWqxawcAu9opvQ
	(envelope-from <linux-mips+bounces-14775-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:06:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CBD5D94EE
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 880A7311668D
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 15:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F4D36F8E8;
	Tue, 26 May 2026 15:36:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344A9371CE0;
	Tue, 26 May 2026 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809772; cv=none; b=QXEj5ykn3dLaDt+AG0RR9GNQcaMK+hWFGU3XvwmzQ3WsTFjgXJ4l3RQX2wT3tgXNs8zyCtVAsUd8HoN6xlP8Y2KBhsp8VQfKHzAoGx/kX6ANpRYqUqiDrI9oPSAFzDcsvBwqz8zyeja0pDVpUn07NBr4LBW4H4NSyuPmRTVpQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809772; c=relaxed/simple;
	bh=ZGN5KfScNcpR0/tJA9G0Ct5OtIryvTTsC0FRzhX//vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mx6ALDCbWVeNhLFadCnSAC3yt/hMNOW3pyD2qL0m+17oeyVkyKU6x0ca6tG7AZ7bjXj/B77kLTsCaxpMqpNr8Lu+gZFwMwdsCBnLm/e+TTgQREmOhAXkhxsRRMfq9qs7PQhsoNoRMV4vQX61g7V8BizYQW5MxwSnN3qyMh7JTfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRtp9-0003HQ-00; Tue, 26 May 2026 17:36:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A1BD0C0154; Tue, 26 May 2026 16:53:39 +0200 (CEST)
Date: Tue, 26 May 2026 16:53:39 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] mips: cps: Assemble jr.hb with an R2 ISA level
Message-ID: <ahWz82FORj2pshsD@alpha.franken.de>
References: <20260507232323.489383-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507232323.489383-1-rosenp@gmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,google.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-14775-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.784];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 32CBD5D94EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 07, 2026 at 04:23:23PM -0700, Rosen Penev wrote:
> A MIPS allmodconfig built with LLVM can select CPU_MIPS32_R1 together
> with MIPS_MT_SMP. In that configuration clang invokes the integrated
> assembler with -march=mips32, and the MIPS MT path in cps-vec.S fails
> to assemble two jr.hb instructions:
> 
>   arch/mips/kernel/cps-vec.S:376:2: error: instruction requires
>   a CPU feature not currently enabled
> 
>   arch/mips/kernel/cps-vec.S:490:4: error: instruction requires
>   a CPU feature not currently enabled
> 
> The earlier jr.hb in the same file is already assembled inside a .set
> MIPS_ISA_LEVEL_RAW scope. The two failing sites are reached after
> popping back to the file's base ISA level, so LLVM correctly rejects
> them for an R1 target.
> 
> Wrap those jr.hb instructions in the same ISA-level push/pop used by
> the working site. This keeps the MT code unchanged while making the
> required R2 hazard-branch encoding explicit to the assembler.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/kernel/cps-vec.S | 6 ++++++
>  1 file changed, 6 insertions(+)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

