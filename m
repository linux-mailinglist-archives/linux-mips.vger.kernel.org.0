Return-Path: <linux-mips+bounces-9930-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06997B1459A
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 03:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4E5354306A
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 01:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67AE1B3925;
	Tue, 29 Jul 2025 01:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYacduDB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF21A3179;
	Tue, 29 Jul 2025 01:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753751496; cv=none; b=RVpD+xGwXaZxurLmjchsBAqEqWExB29AytC+MKATHC3dkrWJfm+XLk8hquTlGPVQrzm8ez3C/PAOfOWiSghsacnHXw70RFlcBKY1e6FO+fhcIeI1rKCGCubn5Puh04Od3Wyuhnb7oBLlukmN8xrqV8qqHgmD5P95WYT4tyUtIS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753751496; c=relaxed/simple;
	bh=8ZaxoHBTEhVL12axKf/WX+LwUM3Y/BFGh5lAMOgD5zg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UTZZzhhFFmnHGy8MNxOlmms2pMURZYHdtKvwv0UpDYQU9lfj91GU3qIo4VDYcJfmG7+q2m2wUqDlVojK1TpJEpnTKKEb0HGqAlcx6jaBYhXwgwTaadWEtTRJRkhB8dzbDVX+NLY4i40IC+gcGsZ92xznkGXwsdEYHgAT+pMfZ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYacduDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A163C4CEE7;
	Tue, 29 Jul 2025 01:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753751496;
	bh=8ZaxoHBTEhVL12axKf/WX+LwUM3Y/BFGh5lAMOgD5zg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VYacduDBsz15Xg+SgB5nuf2LLCwR/ZQLnHAeY89QssQwJkwueQk+gOc3P9X3M8ERc
	 StQHaCIjU+ApLe7jJ1kkQ1SZSrlnoE0XfZBTw8Yh+roL1ES9ZIfl3oMlPK7Nd5vIme
	 keZEIUjTWzO7k+Xn5laz3kmccx4u/wXUQCxvKazPAkCcbgCoN5asGQOK49wsxNUWzg
	 4V8Tr4vXYS3H1wOaKUIe57TRZzvYstxc8p2ZRo6fWA+RbWlSndzB3fEL4aGd9Fgn3b
	 ZBNnQvFR6RJKhSTgEfjDhuJgvmCxPS2qK55MY85inxik6zCKjNO7RH2cHI8IhVIhst
	 yOtThARlrGBsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34A0C383BF5F;
	Tue, 29 Jul 2025 01:11:54 +0000 (UTC)
Subject: Re: [GIT PULL] execve updates for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <202507261437.F2079B3B7@keescook>
References: <202507261437.F2079B3B7@keescook>
X-PR-Tracked-List-Id: <linux-sh.vger.kernel.org>
X-PR-Tracked-Message-Id: <202507261437.F2079B3B7@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.17
X-PR-Tracked-Commit-Id: 7f71195c15dcf5f34c4c7f056603659374e3a525
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d900c4ce638d707f09c7e5c2afa71e035c0bb33d
Message-Id: <175375151288.918485.7118599213274098690.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 01:11:52 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Akihiko Odaki <akihiko.odaki@daynix.com>, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, Andreas Larsson <andreas@gaisler.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Chris Zankel <chris@zankel.net>, Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Dishank Jogi <dishank.jogi@siqol.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, "H. Peter Anvin" <hpa@
 zytor.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonas Bonn <jonas@southpole.se>, Kees Cook <kees@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, loongarch@lists.linux.dev, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov
  <oleg@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>, sparclinux@vger.kernel.org, Stafford Horne <shorne@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, x86@kernel.org, Yin Fengwei <fengwei_yin@linux.alibaba.com>, Yoshinori Sato <ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Jul 2025 14:39:20 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d900c4ce638d707f09c7e5c2afa71e035c0bb33d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

