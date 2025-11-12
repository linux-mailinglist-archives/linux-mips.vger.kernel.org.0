Return-Path: <linux-mips+bounces-12211-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0135C54567
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 21:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D316C345CFA
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 20:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E42D2BF016;
	Wed, 12 Nov 2025 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccIrzsBu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DAC279334;
	Wed, 12 Nov 2025 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762977822; cv=none; b=KBQD98/KTzoSdZ+TUr4uyCKjU9znpFQAuGplpQ6Vp4xfgGfVuwRRfHYi3T8h5pGjdiW/KqPA6Dfi1SuzHI70REOYvPIqht9RJKWGqx6oJwliQaoZLWZhbZ4QwTGVUwCI/H1jTJhfuSaIlfGv9WDW2KZ9ijU5FrRa68REcMG7S6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762977822; c=relaxed/simple;
	bh=Krdas9AzGSECOCFA2WfUlzdX75hmmwim4vrl3G2LHP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdihMIOSwEv9gEm3f2t43E7+yhXSo/tO1dHvKQZWN1yWyqOBwvTIVcnnqDi/EIG0cfG8O3U4Mjk3o3LmVv+b/cGktg7bmvIwqA+R9AuUTXfC5lSjthjZWRUR6mWBql/OTYjGWngpxoK5ZQcfMhCesqV2U1lzqhJdZ1kNrAPb/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccIrzsBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB406C16AAE;
	Wed, 12 Nov 2025 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977821;
	bh=Krdas9AzGSECOCFA2WfUlzdX75hmmwim4vrl3G2LHP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccIrzsBu2sfaHL8EwE2+XzXAm+mSMhbBgAeiXJyPaOGTProGPgOQ81EjsiD/vkuJ4
	 QzAsAniJY1RexfM/F66rsQeFRzK77ivQC547WLrUhU8Q9ShngnZe61HJpkojC3tPRa
	 frNdTBKI3g29VGiHlHHpmGxYVkdiDL5WEO8y7NyaWL1P3XoB2S0lAlUQPcJ8z+K2b5
	 16pXiKl/FScrxzrW3onwGDarm71eUAIrMkkdyfOQItHCaDiHooPRUBdvhi+DVScKO0
	 ZuMkWCnzSMioRC9My5WYdAJlMCScrRC+w9btXbUu1NxxmHhehoQjfNJ34KdLNchkTv
	 Gqbh3kbJ/tMzQ==
Date: Wed, 12 Nov 2025 20:56:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 02/10] init: deduplicate cc-can-link.sh invocations
Message-ID: <aRTmVAcGpqcyjU26@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>

On Tue, Oct 14, 2025 at 03:05:17PM +0200, Thomas Weiﬂschuh wrote:
> The command to invoke scripts/cc-can-link.sh is very long and new usages
> are about to be added.
> 
> Add a helper variable to make the code easier to read and maintain.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  init/Kconfig            | 4 ++--
>  scripts/Kconfig.include | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

