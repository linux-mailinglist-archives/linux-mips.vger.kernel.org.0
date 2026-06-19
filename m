Return-Path: <linux-mips+bounces-15156-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KS5rCRyYNWo70wYAu9opvQ
	(envelope-from <linux-mips+bounces-15156-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 21:27:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 147116A7851
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 21:27:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZjZWeR2B;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15156-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15156-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5700E30131A1
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 19:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936C7349CFB;
	Fri, 19 Jun 2026 19:27:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6B349CE1;
	Fri, 19 Jun 2026 19:27:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781897237; cv=none; b=iv6BWwL4La9BnGKdXtYUKIoY3Vaf0KLneYnnLtKJBuWE1Erq+Fa4AkYiXbHtNzk8DpetuLDMmDx1H3AmeWDUc+faPS54F8JW1OBUtyq4Ca1VsYcqaxxUbQp+2uH8Bv7h5SUR7O6tU5uvbbYCUCXgbQHud4uupQxa7SaEEhVoaiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781897237; c=relaxed/simple;
	bh=ghoEKmTDil829+zL6ehi7Ykk/cdKar6C7aAIsEYZWMA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uS98/k3QgsVwhK3bUabelLaPM/n3eyFfk/L0y21XOzmsOjIbfWat1m5qK4+pVU6fa2uMwQI8Lkby/qnlGcX6JWVaPYfAg4red7FHTlwiVWOuzy2AEtzURrAb9GQhJUG7SeW298msW81kjUUpT94wCJtZTUfZNGQuZtg+wHGhcJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjZWeR2B; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AC61F000E9;
	Fri, 19 Jun 2026 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781897234;
	bh=2j25ksHlzzgiJapOxjE0LWoxXkD8fo4E5hLsMP9g7Qg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZjZWeR2B4RDHzs11keZnbEX5GPkDO4ewLXSWIxWl3TtZgmPrYzh/es7rKmPgwLYPc
	 G9/iS15aNLl8yRhv+nscp6GyPkttdugCDo+n+FCaVUJ+BeFCIYtF+Tz1RzU+56fFhI
	 OredVk3jQFGyG1m9pAcuqeECZVannJ2qU5Wst0Xngngfq0xCdq56Jxq14dM30kX2B8
	 gRsKlF7lAAdMILqwQRe9JkuVQEHYr2b2MohI3A2GtWVIyLDHkMeHlNd/PDKS9jbNu9
	 +B+qHCkz1stv2sm/Z5ih0nssJKxSD48jJaDNgnSdRxbHlFulBG38L//Ott12V41Y2X
	 B8d3rWSj0UApA==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, kees@kernel.org, nathan@kernel.org, linusw@kernel.org,
 ojeda@kernel.org, david.kaplan@amd.com, lukas.bulwahn@redhat.com,
 ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
 lpieralisi@kernel.org, thuth@redhat.com, oupton@kernel.org,
 yeoreum.yun@arm.com, miko.lenczewski@arm.com, broonie@kernel.org,
 kevin.brodsky@arm.com, james.clark@linaro.org, tabba@google.com,
 mrigendra.chaubey@gmail.com, arnd@arndb.de, anshuman.khandual@arm.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
In-Reply-To: <20260619094130.GU49951@noisy.programming.kicks-ass.net>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com> <87a4srdgk0.ffs@fw13>
 <20260619094130.GU49951@noisy.programming.kicks-ass.net>
Date: Fri, 19 Jun 2026 21:27:11 +0200
Message-ID: <875x3ecovk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15156-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[huawei.com,arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,fw13:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 147116A7851

On Fri, Jun 19 2026 at 11:41, Peter Zijlstra wrote:
> On Thu, Jun 18, 2026 at 05:17:03PM +0200, Thomas Gleixner wrote:
>
>> Something simple like the uncompiled below should just work, no?
>> 
>> ---
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>>  	bool
>>  	select HOTPLUG_SPLIT_STARTUP
>>  
>> +config HOTPLUG_PARALLEL_SMT
>> +	bool
>> +	select HOTPLUG_PARALLEL
>
> 	depends on ARCH_SUPPORTS_SCHED_SMT ?

Probably. Did not think about that as this has to be anyway selected by
the architecture.

