Return-Path: <linux-mips+bounces-13993-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH3wK/4cy2kEEAYAu9opvQ
	(envelope-from <linux-mips+bounces-13993-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 03:01:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10165362F57
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 03:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDB793009B24
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 01:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5422B2FE566;
	Tue, 31 Mar 2026 01:01:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0514240DFC6;
	Tue, 31 Mar 2026 01:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774918908; cv=none; b=Qac6zubNj/kkiN1Tlo2SQbtnN2a37GP5QDB7oGq6mkdb6xkIaLhej5FrzYpRg6kiJJInhpWI/V/NIxtV6SiFjf9/QmMyT8VuXr3yBwJ66K9NFeA8ZhgVhvCSmE9vCpPv0PvWfQtm5oKSICg82p74ICZkDc4oJsY/2LCaGhl1GiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774918908; c=relaxed/simple;
	bh=lr82PEA3e4soq1JzFgqyOWI1Revv4CceLPPiCuTZ7YU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZUsHc70Sw64gK9DcfjeKU5fKmI0f58xt2iy5SIymv8991QHhXNw7V45YBNYEtSb+1DCg+2/f7yjWLFLng58Ihdqzf9EnNUqpou60oKCgV+PwAB7tsUOre9gn4zkYN3F22z0NR4qt0JzY8abCiq01O0X1uXtM+ttnHY3AT6XQi3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9298692009C; Tue, 31 Mar 2026 03:01:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8E00C92009B;
	Tue, 31 Mar 2026 02:01:44 +0100 (BST)
Date: Tue, 31 Mar 2026 02:01:44 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Eric Biggers <ebiggers@kernel.org>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, 
    "Martin K. Petersen" <martin.petersen@oracle.com>, 
    Sohil Mehta <sohil.mehta@intel.com>, linux-crypto@vger.kernel.org, 
    linux-mips@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: lib/crypto/mips/poly1305-core.S:95: Error: opcode not supported
 on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
In-Reply-To: <20260330203731.GG4303@sol>
Message-ID: <alpine.DEB.2.21.2603310147220.60268@angie.orcam.me.uk>
References: <202603210105.sdD4rsTq-lkp@intel.com> <20260330203731.GG4303@sol>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13993-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DMARC_NA(0.00)[orcam.me.uk];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,angie.orcam.me.uk:mid]
X-Rspamd-Queue-Id: 10165362F57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026, Eric Biggers wrote:

> > All errors (new ones prefixed by >>):
> > 
> >    lib/crypto/mips/poly1305-core.S: Assembler messages:
> > >> lib/crypto/mips/poly1305-core.S:95: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
> >    lib/crypto/mips/poly1305-core.S:96: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $9,4+3($5)'
> >    lib/crypto/mips/poly1305-core.S:97: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $10,8+3($5)'
> >    lib/crypto/mips/poly1305-core.S:98: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $11,12+3($5)'
> 
> This isn't new.  It was first reported in 2021:
> https://lore.kernel.org/all/202108040636.P6t1LvPP-lkp@intel.com/
> 
> It's caused by:
> 
> CONFIG_64BIT=n causes the 32-bit Poly1305 assembly code to be generated.
> That code checks the _MIPS_ARCH_MIPS32R6 macro.  But, the code is
> actually built with -march=mips64r6, due to CONFIG_CPU_MIPS64_R6=y.
> Thus _MIPS_ARCH_MIPS32R6 is not defined; _MIPS_ARCH_MIPS64R6 is defined
> instead.  So the wrong code gets built.
> 
> Maybe someone from linux-mips@vger.kernel.org can confirm whether
> CONFIG_64BIT=n && CONFIG_CPU_MIPS64_R6=y actually makes sense?

 Absolutely, you can build a 32-bit kernel for and run on 64-bit hardware 
and we have supported it since forever across all the MIPS architecture 
revisions.

 You probably want to check for CONFIG_CPU_MIPSR6 instead (and similarly 
for CONFIG_CPU_MIPSR2, etc.).

  Maciej

