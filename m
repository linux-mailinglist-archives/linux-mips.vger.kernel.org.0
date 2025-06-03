Return-Path: <linux-mips+bounces-9156-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FF0ACC25A
	for <lists+linux-mips@lfdr.de>; Tue,  3 Jun 2025 10:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9558518919F3
	for <lists+linux-mips@lfdr.de>; Tue,  3 Jun 2025 08:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A9D271452;
	Tue,  3 Jun 2025 08:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="W43ANvm/"
X-Original-To: linux-mips@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D071E4A4;
	Tue,  3 Jun 2025 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748940468; cv=none; b=XJrXu5jO5gbuDEypAo+Lhal4xwXtKSjfCiPHRzI2sn7N//PGMGm8h5dwbpv9UqayvNIefhsKX4lzmPI+fCaKpeEIIHAJpROTNOuCejbolJBFP7olxZc73jLE1PKBlKLpXM9WwT+e1V1Q0YSdwZZMkJ+Hq30etDP5Y6rd34jwHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748940468; c=relaxed/simple;
	bh=jJl7zNe61UoVTJuk1dJpds0EqaxQd/Bjp7rrpdF3Vrg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O1RWHlQeNIO3lztG2SYP+QNSM01u40WvUMPuBGRjInPJs69hGDJZnG3R5JnsOb/mGzn3MDDt66DbQxVbbb9KM3R/sWKODdkeD3QjMjYizgQgbpNp8M2DkeY6zLkUcDenNavqbq67ndu9CkqSb0+SHFcJNKLYxUdnB+4LQ7bq+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=W43ANvm/; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ll9HQg8JHducpOZaqvXxVZxIxZ1+gNQW3g36PYXusgc=;
	t=1748940467; x=1750150067; b=W43ANvm/jK2PCmf4C1oXzPDqDDSRZ1zVHQkxCJcm6w/HiYB
	VW6658f7aklLrNQNLom+gJ1hRl9ycgnkPhERK9THyfshpc23RtOAqz2ZZ5qXxBJFlMPmeEYm1aZc+
	O3IwiVjeRbdDUMTZfWQ4hCj4K0XskBvgHmH1GHqA8Pou+aX60Bni5Wi2OhDgCrMZcAhl5CBv3T2qe
	FIYjR8//KG0nDEQm8XjikFkzgD2xIiQ3nqdB0QIPpyepc9QBEOtY7gRcaoEkej0SlaTJOUpOrpGp4
	661ZL7FYZuhoI6EweKtt83zB67dvOKFPnNR0VaBxJHGY+lfKfxM0cHnOpdP9SdcQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uMNIR-00000009mC8-119O;
	Tue, 03 Jun 2025 10:46:59 +0200
Message-ID: <b4fe62d12be677dc047ee2fce4a65284a5f915e8.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
From: Johannes Berg <johannes@sipsolutions.net>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev	
 <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, Andreas Larsson	
 <andreas@gaisler.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Borislav Petkov	 <bp@alien8.de>, Brian Cain <bcain@kernel.org>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen	 <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren	 <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens	 <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen	 <chenhuacai@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, John Paul Adrian Glaubitz	
 <glaubitz@physik.fu-berlin.de>, Jonas Bonn <jonas@southpole.se>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>,  Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Naveen N Rao <naveen@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley	 <paul.walmsley@sifive.com>, Rich Felker <dalias@libc.org>,
 Richard Henderson	 <richard.henderson@linaro.org>, Richard Weinberger
 <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Stafford Horne
 <shorne@gmail.com>, Stefan Kristiansson	
 <stefan.kristiansson@saunalahti.fi>, Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,  Vineet Gupta
 <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Will Deacon
 <will@kernel.org>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Date: Tue, 03 Jun 2025 10:46:57 +0200
In-Reply-To: <20250602181256.529033-2-masahiroy@kernel.org>
References: <20250602181256.529033-1-masahiroy@kernel.org>
	 <20250602181256.529033-2-masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2025-06-03 at 03:12 +0900, Masahiro Yamada wrote:
> The extra-y syntax is deprecated. Instead, use always-$(KBUILD_BUILTIN),
> which behaves equivalently.

OK, whatever you say ;-)

>  arch/um/kernel/Makefile         | 2 +-

Acked-by: Johannes Berg <johannes@sipsolutions.net>

johannes

