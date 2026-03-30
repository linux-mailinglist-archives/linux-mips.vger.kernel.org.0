Return-Path: <linux-mips+bounces-13992-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPtQKXTfymnEAwYAu9opvQ
	(envelope-from <linux-mips+bounces-13992-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 22:39:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C8C361059
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 22:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E57183004C47
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 20:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671E4393DC0;
	Mon, 30 Mar 2026 20:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWflGqvE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED6364E84;
	Mon, 30 Mar 2026 20:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903121; cv=none; b=iOvIuNxqrAEnmSljAZrpe+xAOjT0q9VZpMB81tPinpq3nOyHSCtpkaXL/1ubyH/9xKwygfjVy264z9GdC8WNMKXu04bFKWtbbUSCQ3xTYIi8Flm6O0qjFHRjhx4Kzc8Ja53PP5Hiyx6N+BZ8t/ZDBmyMJ6EFddRi/W59fSPqi1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903121; c=relaxed/simple;
	bh=EA/qsJArmY2vR4r+p45ag7M2irsxNLsjIMDQ9zdgW9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPcnunu8idz4Iki3+qgPrijcPzY25VjHZIzi9XUgjYGldMoNk4zi+f90c/5i93s4ZWapl7+x2Cx3q1btZ7cUE1D5t9wSIEsykwd+aoUVSgphgwl0UqNiW2RfOxJFcctAA3OFo1V6jIP6xdPEH0XGlnJvS+kS4NrxCyjYJwtKKFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWflGqvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEDDC4CEF7;
	Mon, 30 Mar 2026 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774903120;
	bh=EA/qsJArmY2vR4r+p45ag7M2irsxNLsjIMDQ9zdgW9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWflGqvEnyKB82ohcdbMYVAJUlX275KEVABa3P/xHatrzJTlTXrty5XPD1hT9+c6z
	 Oo0phFp1oEaMRCqyZ50V09vJz7XQ5FVM+6SOjpVsMt929G7VrobIemffUqVlDDEdw4
	 kQbLMKfRjn063w8Jk0l73ym78yE+LFQeScbZyFMxhv+Ni5KkcYIIHri1iXm4ZFXU3W
	 oFl+LVIGUqZ/oLK/UMdi01YplqdO26iqpAW5huV5iX1epTOCkyfqgOdI/XkF4LaDEO
	 JwOdKSRViB2/P03HVPPe3r3rH+ik+qUHyihN5AtasTtGsHFSaP3126btWF+5ydTTJS
	 xWYEkydsUor8Q==
Date: Mon, 30 Mar 2026 13:37:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sohil Mehta <sohil.mehta@intel.com>, linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: lib/crypto/mips/poly1305-core.S:95: Error: opcode not supported
 on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
Message-ID: <20260330203731.GG4303@sol>
References: <202603210105.sdD4rsTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603210105.sdD4rsTq-lkp@intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13992-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 04C8C361059
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[+Cc linux-mips and linux-crypto]

On Sat, Mar 21, 2026 at 01:47:15AM +0800, kernel test robot wrote:
> Hi Eric,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0e4f8f1a3d081e834be5fd0a62bdb2554fadd307
> commit: 7e54e993ab8c98d912f54ad6f46bfcc9dcd65368 lib/crypto: mips: Move arch/mips/lib/crypto/ into lib/crypto/
> date:   9 months ago
> config: mips-randconfig-r131-20260320 (https://download.01.org/0day-ci/archive/20260321/202603210105.sdD4rsTq-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 11.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210105.sdD4rsTq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603210105.sdD4rsTq-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    lib/crypto/mips/poly1305-core.S: Assembler messages:
> >> lib/crypto/mips/poly1305-core.S:95: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
>    lib/crypto/mips/poly1305-core.S:96: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $9,4+3($5)'
>    lib/crypto/mips/poly1305-core.S:97: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $10,8+3($5)'
>    lib/crypto/mips/poly1305-core.S:98: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $11,12+3($5)'

This isn't new.  It was first reported in 2021:
https://lore.kernel.org/all/202108040636.P6t1LvPP-lkp@intel.com/

It's caused by:

CONFIG_64BIT=n causes the 32-bit Poly1305 assembly code to be generated.
That code checks the _MIPS_ARCH_MIPS32R6 macro.  But, the code is
actually built with -march=mips64r6, due to CONFIG_CPU_MIPS64_R6=y.
Thus _MIPS_ARCH_MIPS32R6 is not defined; _MIPS_ARCH_MIPS64R6 is defined
instead.  So the wrong code gets built.

Maybe someone from linux-mips@vger.kernel.org can confirm whether
CONFIG_64BIT=n && CONFIG_CPU_MIPS64_R6=y actually makes sense?

- Eric

