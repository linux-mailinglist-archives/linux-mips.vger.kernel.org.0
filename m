Return-Path: <linux-mips+bounces-13120-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDw3Dl5khGkh2wMAu9opvQ
	(envelope-from <linux-mips+bounces-13120-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 10:35:26 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC83F0DE1
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 10:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D853042777
	for <lists+linux-mips@lfdr.de>; Thu,  5 Feb 2026 09:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AAE3939BE;
	Thu,  5 Feb 2026 09:06:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1AB38F256;
	Thu,  5 Feb 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282395; cv=none; b=sCYL1PIp7P0vCxFnZlPqlf/B01XsigX5f5+khGvG6oIV6YoTvXIxYO8rX4MSdkDNmU5YgBGNF9Mx2eqZR3KAqi+ZftUqtb+oG51Y6fAlP2cDMQhTUP2Gs0C8WWYHudbOHphTQKMTenrm922PulVGYCvTQMWloswg5c9ViMmQQm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282395; c=relaxed/simple;
	bh=aNZR5UYSydqVp6UGd3wElbfHROnH9fin45gMpxa+Les=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVzmV09FPZL6dAgIblNW0nYhQMyZH/4npzt/JoCJXRa1kU46D8WKHC3qGIvT2FkPldxp17jIHlBwmTeGj60/+VzCHGGsCSUfIauY5AxQ6cII89ecYxwWgn8DAenChB4lvuddquwcsESpjchWK1kvR3/O63gnHhpYH92K3aCHnQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vnvJi-0001MX-00; Thu, 05 Feb 2026 10:06:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D84FBC0907; Thu,  5 Feb 2026 10:06:12 +0100 (CET)
Date: Thu, 5 Feb 2026 10:06:12 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yao Zi <me@ziyao.cc>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: env: Fixup serial clock-frequency when
 using LEFI
Message-ID: <aYRdhLOAZN21VIwc@alpha.franken.de>
References: <20260202045322.64105-1-me@ziyao.cc>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202045322.64105-1-me@ziyao.cc>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.34 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	TAGGED_FROM(0.00)[bounces-13120-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.952];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alpha.franken.de:mid,ziyao.cc:email]
X-Rspamd-Queue-Id: 9FC83F0DE1
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, Feb 02, 2026 at 04:53:22AM +0000, Yao Zi wrote:
> When booting from LEFI firmware, the devicetree is chosen by matching
> bridge type and CPU PRID. However, serials on Loongson devices may not
> have the same clock frequency across different boards. For example,
> CPU UARTs found on Loongson 3A4000 is supplied by the system clock,
> which may be either 25MHz or 100MHz.
> 
> Luckily, LEFI firmware interface provides information about UART
> address and corresponding clock frequency. Let's fixup clock-frequency
> properties for serials after FDT selection by matching FDT nodes with
> addresses provided by firmware.
> 
> Signed-off-by: Yao Zi <me@ziyao.cc>
> ---
> 
> This is tested on LS3A4000_7A1000_NUC_BOARD_V2.1, which utilizes a 25MHz
> oscillator as system clock input. Without the patch, serial output is
> completely broken after kernel initialization.
> 
>  arch/mips/loongson64/env.c | 98 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)

applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

