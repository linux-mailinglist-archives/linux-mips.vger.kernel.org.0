Return-Path: <linux-mips+bounces-13184-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGb+Nvbel2ne9gIAu9opvQ
	(envelope-from <linux-mips+bounces-13184-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 05:11:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B7164893
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 05:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9BA6301370A
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 04:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587743016E2;
	Fri, 20 Feb 2026 04:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BY31bXLu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B37301002;
	Fri, 20 Feb 2026 04:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771560634; cv=none; b=Yb+Zx5ZVSzcIqFe22v+A00Xb/+RqOJhVXdngDb508ICx//stbUJHo7AVayxKszk32v/MSYpmFxUOGFbWPTc6ytMGCCnJLs4o3rJHFPIOzOU5ednRb6utQHuB0+TlNEBdMnaxLhbO6MLQeOERMioROMrimU01taG9+uEYtKkY4jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771560634; c=relaxed/simple;
	bh=im5T2AhfGDyXaPXyhpLfgJGQ91DbQgM5VZmwKBunt1A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dEI4sm+VOycTpuitjCQ/wrmNPOcbOz2yr5KO/k2xCthHTHHiIMT1/qms04XsEHuG4qu+JnaHBCmZqGidapT4BEWh1gwMHAimws//u+C0OQg2vzBpRqoDB/aBqCk+oV24azh38cq+n4rPukrfIZnlVxQl6lbA6K80PlI6549GMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BY31bXLu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3828C19421;
	Fri, 20 Feb 2026 04:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560633;
	bh=im5T2AhfGDyXaPXyhpLfgJGQ91DbQgM5VZmwKBunt1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BY31bXLuYwaDNUvbU0KhmqMJP3M/Awj2XilOUUrqfd5tse5Bs+Sof47ei7f2ySnfn
	 tFNi7q7K9gluSvI0HlMVWVeaLxpkyoeKBDi/rrNOewr0OuAFpDC7j/iRqwMKPlJ5Wa
	 P3ScJYlX18vFMmmARgpPLIChzrvUE2kp6Q3jnE9jYkAe7srv3PTOOcxMtCzqbU7qAw
	 IToOjDmvHez/A8mTg3Q3sBsLUBSNAWxLa0iZsksGoJ/G/rax+WVfDfh7lH4OceXS15
	 qVM1jLAxgENfoZP8fJU+Wp+4V3bOt53kAg6T75fF/G3mbGiObvL/fXyvhcTJ2XNYm0
	 uwW0QrKe9zoGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CFE83809A88;
	Fri, 20 Feb 2026 04:10:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156064229.189817.6698956997773300471.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:42 +0000
References: <20260111082105.290734-1-rppt@kernel.org>
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 alexs@kernel.org, agordeev@linux.ibm.com, andreas@gaisler.com, bp@alien8.de,
 bcain@kernel.org, chleroy@kernel.org, catalin.marinas@arm.com,
 davem@davemloft.net, dave.hansen@linux.intel.com, david@kernel.org,
 dinguyen@kernel.org, geert@linux-m68k.org, guoren@kernel.org,
 hca@linux.ibm.com, deller@gmx.de, chenhuacai@kernel.org, mingo@redhat.com,
 johannes@sipsolutions.net, glaubitz@physik.fu-berlin.de, corbet@lwn.net,
 klarasmodin@gmail.com, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 linmag7@gmail.com, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, mhocko@suse.com, monstr@monstr.eu, muchun.song@linux.dev,
 osalvador@suse.de, palmer@dabbelt.com, pratyush@kernel.org, richard@nod.at,
 ritesh.list@gmail.com, linux@armlinux.org.uk, shorne@gmail.com,
 surenb@google.com, tsbogend@alpha.franken.de, tglx@linutronix.de,
 gor@linux.ibm.com, vgupta@kernel.org, vbabka@suse.cz, will@kernel.org,
 x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux-foundation.org,kernel.org,linux.ibm.com,gaisler.com,alien8.de,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,lwn.net,gmail.com,oracle.com,ellerman.id.au,suse.com,monstr.eu,linux.dev,suse.de,dabbelt.com,nod.at,armlinux.org.uk,google.com,alpha.franken.de,linutronix.de,suse.cz,vger.kernel.org,lists.linux-m68k.org,kvack.org,lists.ozlabs.org,lists.linux.dev];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-13184-lists,linux-mips=lfdr.de,linux-riscv];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_GT_50(0.00)[67];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-foundation.org:email]
X-Rspamd-Queue-Id: 542B7164893
X-Rspamd-Action: no action

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sun, 11 Jan 2026 10:20:34 +0200 you wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> Order in which early memory reservation for hugetlb happens depends on
> architecture, on configuration options and on command line parameters.
> 
> [...]

Here is the summary with links:
  - [v3,01/29] alpha: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/ba1c86874e25
  - [v3,02/29] arc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/7988e8518904
  - [v3,03/29] arm: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/30a66f8a8cd3
  - [v3,04/29] arm: make initialization of zero page independent of the memory map
    https://git.kernel.org/riscv/c/18b7cc70dea8
  - [v3,05/29] arm64: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/60b35af0a6aa
  - [v3,06/29] csky: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/37318eb97f23
  - [v3,07/29] hexagon: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/934afdf7f4cc
  - [v3,08/29] loongarch: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/63cadcb731c9
  - [v3,09/29] m68k: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/41b08a7abf89
  - [v3,10/29] microblaze: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/2ce38c9ae840
  - [v3,11/29] mips: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/f61385e29444
  - [v3,12/29] nios2: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/3b1b0e5797bd
  - [v3,13/29] openrisc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/1d28b1142383
  - [v3,14/29] parisc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/950696afe400
  - [v3,15/29] powerpc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/27bebe446f8d
  - [v3,16/29] riscv: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/db8cdb0ad603
  - [v3,17/29] s390: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/76c4c463bbc0
  - [v3,18/29] sh: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/8bfa6c2259f4
  - [v3,19/29] sparc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/6ad7ea22cf6f
  - [v3,20/29] um: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/531de7f02d51
  - [v3,21/29] x86: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/34f6b9c6e417
  - [v3,22/29] xtensa: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/2d3c8c5f33e0
  - [v3,23/29] arch, mm: consolidate initialization of nodes, zones and memory map
    https://git.kernel.org/riscv/c/d49004c5f0c1
  - [v3,24/29] arch, mm: consolidate initialization of SPARSE memory model
    https://git.kernel.org/riscv/c/4267739cabb8
  - [v3,25/29] mips: drop paging_init()
    https://git.kernel.org/riscv/c/5dea39496c68
  - [v3,26/29] x86: don't reserve hugetlb memory in setup_arch()
    https://git.kernel.org/riscv/c/6632314fddc4
  - [v3,27/29] mm, arch: consolidate hugetlb CMA reservation
    https://git.kernel.org/riscv/c/9fac145b6d3f
  - [v3,28/29] mm/hugetlb: drop hugetlb_cma_check()
    https://git.kernel.org/riscv/c/7a9c0bf0aec6
  - [v3,29/29] Revert "mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc"
    https://git.kernel.org/riscv/c/743758ccf8be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



