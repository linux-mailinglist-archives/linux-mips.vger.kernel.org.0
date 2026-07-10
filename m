Return-Path: <linux-mips+bounces-15751-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C75MEjVeUWo3DQMAu9opvQ
	(envelope-from <linux-mips+bounces-15751-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 23:03:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D056A73E97B
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 23:03:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PqkovEHB;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15751-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15751-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D02223021742
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 21:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3532E3B27FF;
	Fri, 10 Jul 2026 21:03:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFBE3B1EF1;
	Fri, 10 Jul 2026 21:03:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717420; cv=none; b=VNC1ctWAhGXgw3k2krQcOM/mCQi487qycs5Nh/jmyDeo4y0eHnbGb7Rdw9T9t4hm4UWVz1Dh6/AL6E+ESbn9mxWR6j335swBraESk1UssMh2gtmBY9fONCm64mxooivRJh62PMyxpw11sRXFnLC8l3cNsyQlL72LmJDuYRlpzD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717420; c=relaxed/simple;
	bh=GbvMHZrhRDmOQztmKZrutuz12wBZDa9HQp9ssMvXPCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRc9rcE8b6S7kLbAebfgujze+48WI78ysVbU7fV1ejHEnN3JYWO0VjdiMDxTs9QB1e3OJuCNQvoK8Kt7tYYZlAYgn1lchvsnPUPum6sTLNwlKLqNXVNEQ/+xcEzqVJXyNdipvaLgRXfY9Ruxrtcba8lrVuWvMd0MgqqcKtEUaSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqkovEHB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF951F00A3D;
	Fri, 10 Jul 2026 21:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783717419;
	bh=80whcJasJ8UZ+ghvImoI8kqyUMJlafpf2qxBVaC3ewg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PqkovEHBiVYdGh7U8mht2uMdE9W9ex8yIgoKH8UQG/wNa27iptoJFbTMiVUws/s8C
	 GjH8BqhOzqgIbTgxSl065QCqubEWG7PCS/h99oZJ/47YGlh1oUoBrSH0PbFKh5KeYJ
	 hwZ2htPN7k8MqKd7Nsg7FWkssqQVYTvQIaEwLTpWf5vXBd1FT0rcZk5B/mp5/53nUt
	 0aeRNp6U+92+o2jAdeAx2l3D8wTFh1NglwapztkHmxsRghy8yQL+ldVfQzU1BCqLWF
	 2Bz1CY5HK9Y8v78eveW864WdFxcsrThx3vCPMie3pELQlPOaGD2XvKAfwSbt+K1XeG
	 +0S69Fj++wo9Q==
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	akpm@linux-foundation.org,
	linux@roeck-us.net,
	shuah@kernel.org,
	patches@kernelci.org,
	lkft-triage@lists.linaro.org,
	pavel@nabladev.com,
	jonathanh@nvidia.com,
	sudipm.mukherjee@gmail.com,
	rwarsow@gmx.de,
	conor@kernel.org,
	hargar@microsoft.com,
	broonie@kernel.org,
	achill@achill.org,
	sr@sladewatkins.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 6.6 000/175] 6.6.144-rc1 review
Date: Fri, 10 Jul 2026 17:03:09 -0400
Message-ID: <20260710163023.agent5-0013@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <34b7e26f-df63-4523-b4d2-5de13c192a8c@gmail.com>
References: <20260702155115.766838875@linuxfoundation.org> <34b7e26f-df63-4523-b4d2-5de13c192a8c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,m:sashal@kernel.org,m:patches@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:torvalds@linux-foundation.org,m:akpm@linux-foundation.org,m:linux@roeck-us.net,m:shuah@kernel.org,m:patches@kernelci.org,m:lkft-triage@lists.linaro.org,m:pavel@nabladev.com,m:jonathanh@nvidia.com,m:sudipm.mukherjee@gmail.com,m:rwarsow@gmx.de,m:conor@kernel.org,m:hargar@microsoft.com,m:broonie@kernel.org,m:achill@achill.org,m:sr@sladewatkins.com,m:f.fainelli@gmail.com,m:jelonek.jonas@gmail.com,m:linux-mips@vger.kernel.org,m:sudipmmukherjee@gmail.com,m:ffainelli@gmail.com,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15751-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-mips@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,vger.kernel.org,linux-foundation.org,roeck-us.net,kernelci.org,lists.linaro.org,nabladev.com,nvidia.com,gmail.com,gmx.de,microsoft.com,achill.org,sladewatkins.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D056A73E97B

On Thu, Jul 09, 2026 at 11:45:14AM +0200, Florian Fainelli wrote:
> On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, same build failure
> as 6.1 for MIPS:
>
> arch/mips/kernel/smp.c: In function 'stop_this_cpu':
> arch/mips/kernel/smp.c:396:2: error: implicit declaration of function
> 'rcutree_report_cpu_dead'; did you mean 'rcutree_prepare_cpu'?
> [-Werror=implicit-function-declaration]
>    rcutree_report_cpu_dead();
>    ^~~~~~~~~~~~~~~~~~~~~~~
>    rcutree_prepare_cpu

The offending backport was dropped before 6.6.144 was released, so the
build failure itself is gone.

That still leaves 6.6.y and 6.1.y without 9f3f3bdc6d9d ("MIPS: smp:
report dying CPU to RCU in stop_this_cpu()") while both trees already
ship 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single()
on PREEMPT_RT"), which is what exposes the MIPS reboot hang that
9f3f3bdc6d9d fixes.

Jonas, could you send backports of 9f3f3bdc6d9d for 6.6.y and 6.1.y
with that adaptation? I'd rather take the author's version than adapt
it here.

-- 
Thanks,
Sasha

