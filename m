Return-Path: <linux-mips+bounces-9151-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9666ACB83D
	for <lists+linux-mips@lfdr.de>; Mon,  2 Jun 2025 17:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345454C4A2B
	for <lists+linux-mips@lfdr.de>; Mon,  2 Jun 2025 15:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A8A223DC1;
	Mon,  2 Jun 2025 15:16:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81870222580;
	Mon,  2 Jun 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877387; cv=none; b=fja9PRA0SRQjXQmp1DTekJYFPZwHfYdhQARcYV1jD91i8ChZmb3qQNGHBafRipd6AlfWETbBBrKFkGE3KB872CXgno5HvQbdqFiiPdOGhBdEnpBe0Wte1PlWC+WP2W6vVlKj2NMoqCbPspJ0d9z1JYpk7AbtXnpSOKW4rP4fMcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877387; c=relaxed/simple;
	bh=sXo0fZchsLXDDmAvSZs+zjWtZZHKV72sw40GuR3+5/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VAaOnUx4vTel1Q9yTRtuaIHE7/9HGUach//M7x7VVUwnDfhUdbfXYHCbvuB8jgWe+2VdYTqs/t6sSQbAof5zrdVmw4mAmqMiyKQnNoshqCCDFS5SS6VkWTgE8rYzgBazp6fcrLHbpil+5Zt8X3JaVo0ewhLPI5B3PqJD3NF1cxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A5F393412DE;
	Mon, 02 Jun 2025 15:16:19 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,  linmag7@gmail.com,  Al
 Viro <viro@ftp.linux.org.uk>,  arnd@arndb.de,  chris@zankel.net,
  dinguyen@kernel.org,  glaubitz@physik.fu-berlin.de,  ink@unseen.parts,
  jcmvbkbc@gmail.com,  kees@kernel.org,  linux-alpha@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-csky@vger.kernel.org,
  linux-hexagon@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-m68k@lists.linux-m68k.org,  linux-mips@vger.kernel.org,
  linux-openrisc@vger.kernel.org,  linux-parisc@vger.kernel.org,
  linux-riscv@lists.infradead.org,  linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org,  linux-snps-arc@lists.infradead.org,
  linux-um@lists.infradead.org,  linuxppc-dev@lists.ozlabs.org,
  loongarch@lists.linux.dev,  mattst88@gmail.com,  monstr@monstr.eu,
  richard.henderson@linaro.org,  sparclinux@vger.kernel.org,
  x86@kernel.org
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
In-Reply-To: <20250602041118.GA2675383@ZenIV>
Organization: Gentoo
References: <87cyfejafj.fsf@gentoo.org> <87v7rik020.fsf@gentoo.org>
	<20250602041118.GA2675383@ZenIV>
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Mon, 02 Jun 2025 16:16:14 +0100
Message-ID: <878qma41j5.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Al Viro <viro@zeniv.linux.org.uk> writes:

> On Sat, Apr 05, 2025 at 06:09:11PM +0100, Sam James wrote:
>> Sam James <sam@gentoo.org> writes:
>> 
>> > Lovely cleanup and a great suggestion from Al.
>> >
>> > Reviewed-by: Sam James <sam@gentoo.org>
>> >
>> > I'd suggest adding a:
>> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
>> 
>> Al, were you planning on taking this through your tree?
>
> FWIW, I expected it to get sent to Linus as "please, run this
> sed script before -rc1" kind of thing, script being something
> like
>
> sed -i -e 's/int pte_swp_exclusive/bool pte_swp_exclusive/' \
> 	`git grep -l 'int pte_swp_exclusive'`
>
> with suggested commit message...  It's absolutely regular and
> that kind of tree-wide change is easier handled that way.

Ah, sorry. Both Magnus and I are new and irregular kernel contributors,
but I've seen that before and should've thought of it.

> [...]

cheers,
sam

