Return-Path: <linux-mips+bounces-15144-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3r9LKvgVNGpbOAYAu9opvQ
	(envelope-from <linux-mips+bounces-15144-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 17:59:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5866A1686
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 17:59:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dFbyuhdx;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15144-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15144-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39154316580B
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 15:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832DA32E757;
	Thu, 18 Jun 2026 15:53:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777A4263F5E;
	Thu, 18 Jun 2026 15:53:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798025; cv=none; b=ZLEIMhzjjYPIQtU39ktKVk7v2z8DxelN20F/5foTM/FwMh1Rz32tDr0PI/ILNkV+EV5bZJo+m6hpxSsNSI7G8nsYgeb9aCAyfgX400GcsUEJJPwHPbL4v2qX1BymOkphAnXM3P1OhkU50gaJKYzQso752DLHA1Y0pQGZajTkHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798025; c=relaxed/simple;
	bh=C8eM3uMUMgNK9w1m8n5fuVmzrgnhebKiUyF8XnXWiek=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HI/Ug71ktmERhru+0wgNML0bpjHG0jl5QshNw6geAOCGNK9FvAqIGnpzPx7CAua/LCCAt2gdnfcZdklzuwCPg16TAoHJKx20j/46aSRBx9cpfsnrXb3nCaCWT3AzS7oitgp7wYYxo+LfZcH1eFeeWhOnMJm3a5OlSxjPpQqfNiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFbyuhdx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5851F000E9;
	Thu, 18 Jun 2026 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781798024;
	bh=EwX9mxVgUx4kbF0qZ290eryMIgfNI0MdhJKVS5zuxOw=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=dFbyuhdxS8KRLeKukg6wGxWrZKR7+kw+xqNzs3yRunvw4FB7RQT+K+h6r1RUTVb4a
	 H+XMDkYxvmBiMuqK6N4j1KwALKy4zAVPDNJLrqk5VRjQmKqdBxJSdrP0h3D/m/mb/Y
	 08qVUbjX3v5xmk5PeWvmWNQ7NBaxuUDFHMnmx8qih+TsRiJYrLNTg9orqijFMNJ/zY
	 UYIpbgfnw2o6Wu/fRmaGf38lG5t4n+Y8avnbK9JaZ9rWD+u7xO68HArQRZjlEQIK/U
	 yTyHP2EioUBOSUKbMp9/bDNibaJlaph6Xa8ztrGG4/FL5Ju36LIJsfYUCim8Oa3P8+
	 UMWh6Gg9zlbNA==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, Michael Kelley
 <mhklinux@outlook.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "pjw@kernel.org"
 <pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
 <alex@ghiti.fr>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
 <bp@alien8.de>, "dave.hansen@linux.intel.com"
 <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "kees@kernel.org"
 <kees@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
 "linusw@kernel.org" <linusw@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "david.kaplan@amd.com" <david.kaplan@amd.com>,
 "lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "maz@kernel.org"
 <maz@kernel.org>, "timothy.hayes@arm.com" <timothy.hayes@arm.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "thuth@redhat.com"
 <thuth@redhat.com>, "oupton@kernel.org" <oupton@kernel.org>,
 "yeoreum.yun@arm.com" <yeoreum.yun@arm.com>, "miko.lenczewski@arm.com"
 <miko.lenczewski@arm.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "james.clark@linaro.org"
 <james.clark@linaro.org>, "tabba@google.com" <tabba@google.com>,
 "mrigendra.chaubey@gmail.com" <mrigendra.chaubey@gmail.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "anshuman.khandual@arm.com"
 <anshuman.khandual@arm.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
In-Reply-To: <4588efb4-e757-4ca7-9197-025b67ca9ef6@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <4588efb4-e757-4ca7-9197-025b67ca9ef6@huawei.com>
Date: Thu, 18 Jun 2026 17:53:41 +0200
Message-ID: <874iizdeuy.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[huawei.com,outlook.com,arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:mhklinux@outlook.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15144-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fw13:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B5866A1686

On Mon, Jun 15 2026 at 17:57, Jinjie Ruan wrote:
> On 6/12/2026 11:45 PM, Michael Kelley wrote:
>
> - Default (no patch): Slowest HVC64 handling (126=E2=80=AF=CE=BCs), highe=
st WFx count
> (85k), and most total VM=E2=80=91exits.
>
> - cpuhp.parallel=3D1: HVC64 latency improved to 78=E2=80=AF=CE=BCs (close=
 to
> cpuhp.parallel=3D0), but IRQ exits increased dramatically (12.9k, 2.7=C3=
=97
> that of `cpuhp.parallel=3D0`), accounting for 95% of event time and
> becoming the new bottleneck.
>
> - cpuhp.parallel=3D0: Fastest HVC64 (69=E2=80=AF=CE=BCs), lowest IRQ exit=
s (4.8k), and
> lowest total samples, delivering the best overall boot performance.
>
> Therefor, `cpuhp.parallel=3D1` reduces HVC cost but suffers from a massive
> increase in IRQ exits, while `cpuhp.parallel=3D0` avoids this interrupt
> storm and therefore performs best in a KVM guest.

What's the cause for having this massive interrupt exit rate in parallel
mode? Just because parallel does not give a useful explanation.

Thanks,

        tglx

