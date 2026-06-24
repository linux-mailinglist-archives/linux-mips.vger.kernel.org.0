Return-Path: <linux-mips+bounces-15196-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lkn/Gmr0O2qIgQgAu9opvQ
	(envelope-from <linux-mips+bounces-15196-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 17:14:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E06BF883
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 17:14:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alien8.de header.s=alien8 header.b=TPyy9zma;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15196-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15196-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=alien8.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B21F3304DFDC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 15:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3B53DB636;
	Wed, 24 Jun 2026 15:01:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DE3D9048;
	Wed, 24 Jun 2026 15:00:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313266; cv=none; b=OjfV73wOLuDDRp7Cucm35GKHdeKGVs/NEP72+8XDd2dQHIHV2jcKjhMMitOPcoLLj170c1jxXj6Jd8ZD5S7IOZ7WPu3t9+d9vvyClSuDb4s/gkxLnaNIy0KrpHRLF2npEcf0ouQBJO+d19xdOXvxOACcagFUbalUlskE9h4v7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313266; c=relaxed/simple;
	bh=2UJjZ8pRC2MR4ByhM0A1bX/sFowSIuXQKGolHyjIUkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgSin6/oDyc/D8tuTnh66Jo4ADadoUfxt+0a6yyccp1UJ74aRspR26C5SwulmaW4iwxr8mPiZ7cW+X4hFhbdlabl+Hgyf0WWA2yoWtaltHdTxdk2UGf2HZiZrzFx7t9GySslsGDLwYZc55jH3ghebsA3DlVGmq0buiFsbJKu2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=TPyy9zma; arc=none smtp.client-ip=65.109.113.108
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A5FB940E0140;
	Wed, 24 Jun 2026 15:00:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FUCDcAsTcbFn; Wed, 24 Jun 2026 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782313237; bh=ixANeKyt6wrxouLZA6axnl4DzfjEV12z3GBkxlFaUhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPyy9zmaoOk93HRdbVBuaw0eyhfm3pcIRo3ulnBApi7YwlWpafnF3csPJdBiASsmc
	 TUZPaTNjNX5dXi0gq9AB7OkFt5an6SO1pDA2+Q3vHrihQLbPYujtO4/YLRPKHRefpx
	 6+rNjgax1zS7Pa3s+KeLdvYcC553vxP18PdfEE3e0y0m4+3ECI1A3yw54iVmQnFlZd
	 lSj3jORK7ll6iQn64a5GBezIUurwfzo8Rzj28r7Gh806FVt5/d5zUVIX1NzmhdAsLV
	 BHjaf3uxz2QZehXWkWGmXu2M3Kqk91YAbXZflWHhbLFYTWPwZcor3bzMsmbeTfk2Xl
	 gColhiwQ96uZiFoWuxV3MgwKV08+cnfQO41LGvs1JxOl2LOxgRsIuHf5dG4mUDsWoK
	 N7My+5ffBmunNTIKME9VyvoFGWQdt0RK5OxVtxb09xgScf78vi5U1vuBzxzmkNjiCq
	 jM0y7G/Zeosnoz/EOPQHSPnR415zlHR2OkyJ1Vx1Zr7a/vFKzi2DeLAo9/KMmnNhCc
	 6NxqAn6j6HyQ69T9bBgx6BvDmzKJAmU1G/FQK94tznkCXab3I9Ci/WZRFRf9btXira
	 zev3TJnwR5tjnrQA8IIFKN7q9BOpRcBtpljkgyXCnX/y0FWhRWFzIhO/mIgckNpqZQ
	 150Ye43Cvr8msP2TZaqPrkAk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 037AE40E0031;
	Wed, 24 Jun 2026 14:59:47 +0000 (UTC)
Date: Wed, 24 Jun 2026 07:59:45 -0700
From: Borislav Petkov <bp@alien8.de>
To: Will Deacon <will@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	tsbogend@alpha.franken.de, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, hpa@zytor.com, peterz@infradead.org,
	kees@kernel.org, nathan@kernel.org, linusw@kernel.org,
	ojeda@kernel.org, david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <20260624145945.GBajvw4cQVt845-se2@fat_crate.local>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajvKkLw5bL-FT5JC@willie-the-truck>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15196-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@inte
 l.com,m:tim.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bp@alien8.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[huawei.com,arm.com,alpha.franken.de,kernel.org,redhat.com,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[alien8.de:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:dkim,alien8.de:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fat_crate.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A77E06BF883

On Wed, Jun 24, 2026 at 01:16:16PM +0100, Will Deacon wrote:
> If you want to help out in the meantime, there are plenty of patches that
> need reviewing...

I would loooove it if git send-email speed and rate of sending mail is
proportional to how many other patches the sender has really reviewed...

:-P :-P :-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

