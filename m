Return-Path: <linux-mips+bounces-13380-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP1+MSHQqGlOxgAAu9opvQ
	(envelope-from <linux-mips+bounces-13380-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Mar 2026 01:36:49 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E32097F0
	for <lists+linux-mips@lfdr.de>; Thu, 05 Mar 2026 01:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 650FB3014747
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2026 00:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFAB1DC985;
	Thu,  5 Mar 2026 00:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KToGiCmv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF81494C3;
	Thu,  5 Mar 2026 00:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772671005; cv=none; b=kdXvbGDuaaQjD/NHVqe/mk7Gzp4vuKenXGmkVXZLiFIm0UompskYwsk/yk1Q919syQiQbi2v87Wg06apPFRxe/h488j+QT5u1sarXVM6ODP64I/uNi/2vr/p/Ol2EECPOz28L/cNm5JJPBgEVjUTRi/zEOxxyN19olScvgIkEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772671005; c=relaxed/simple;
	bh=dufxbUIyr7d8ExFT8JscxBc90VyX6BXpvMXaMHirGFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NuB/2colSWq/IScSq18GNiHE9njLfWu1FVHPyCKCfmAb6AmgXUadRwqUf50X1RmW/1rsLk2jtZO5xkdokw2u1nz0C6TxUfd60zK7ai+EisGPgfYxcymmEq5W9xrVF8c5AeTab/97dQitXFTA8IhdeHrMUVAAH0BGU7V1LwlRAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KToGiCmv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C0CC4CEF7;
	Thu,  5 Mar 2026 00:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772671004;
	bh=dufxbUIyr7d8ExFT8JscxBc90VyX6BXpvMXaMHirGFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KToGiCmvRjrVNqFH9bmGJHeZ38P88LzG7roLZL+LfIaWcpEiN2r+2cd8LeoKKP35z
	 U1kZMnp2GF5lnZ/nU+B3HGi0hmJYpifkPnaIttjOzC0p4MJWgdE7whcAtStb71A/hR
	 PWMEoeZUETbXXgqKLd947UqscZTCqE7PdSGVXWHEJVzdsA5P/GL+TYntigcrzmPu9S
	 bwFDNJowrmaquHt0GQepYaacF/aqErDIPLaR1+ZJBBxnDoRwltgCLkyg6X/do1S70f
	 /t3wS/hkSXMAn5Ptc3L2X59NGkKMvuLeUJNxpcdH9xAkM1JdLfqBeN7u7tjz5Udo9K
	 2yvhogx3J8MSA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Sam Creasey <sammy@sammy.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 stable@vger.kernel.org, Ed W <lists@wildgooses.com>
In-Reply-To: <20260225-separate-modinfo-from-elf-details-v1-1-387ced6baf4b@kernel.org>
References: <20260225-separate-modinfo-from-elf-details-v1-1-387ced6baf4b@kernel.org>
Subject: Re: [PATCH] kbuild: Split .modinfo out from ELF_DETAILS
Message-Id: <177267099220.1730256.13119170390082704508.b4-ty@kernel.org>
Date: Wed, 04 Mar 2026 17:36:32 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Queue-Id: 888E32097F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,kernel.org,arm.com,xen0n.name,linux-m68k.org,sammy.net,alpha.franken.de,southpole.se,saunalahti.fi,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,wildgooses.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13380-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[72];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 15:02:51 -0700, Nathan Chancellor wrote:
> Commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
> vmlinux.unstripped") added .modinfo to ELF_DETAILS while removing it
> from DISCARDS, as it was needed in vmlinux.unstripped and ELF_DETAILS
> was present in all architecture specific vmlinux linker scripts. While
> this shuffle is fine for vmlinux, ELF_DETAILS and DISCARDS may be used
> by other linker scripts, such as the s390 and x86 compressed boot
> images, which may not expect to have a modinfo section. In certain
> circumstances, this could result in a bootloader failing to load the
> compressed kernel [1].
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: Split .modinfo out from ELF_DETAILS
      https://git.kernel.org/kbuild/c/8678591b47469

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


