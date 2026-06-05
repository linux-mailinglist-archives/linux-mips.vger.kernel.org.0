Return-Path: <linux-mips+bounces-14922-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZnQAW/YImpneQEAu9opvQ
	(envelope-from <linux-mips+bounces-14922-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 16:08:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B544648BAB
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 16:08:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Cu554xrP;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14922-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14922-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371193060329
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 14:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D569333A6E0;
	Fri,  5 Jun 2026 14:00:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D496530D3F2
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 14:00:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668019; cv=none; b=uKcegG8dMc0evKgtaRqPXpqNgH2vL2BpKkrQO4cjVe/5U+0xzqSZfX+AJaccfvIrr2fZr0KT76HjXtOiABCKxdGqexzjRiUh0qSZUeuVpwdfqISOeLNoRbuvNXCy6Atci4o7s5IMeDuZGuQFeZzBDcJHOg++79mn5y7qCYiKfYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668019; c=relaxed/simple;
	bh=ebywEsxxKbL2+zsAIchA15obBZB4MLLsCZr+gFmuelA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puKVEC9RkKegQGQxlqO/+cCQywGdn9S3iAYIEQI/Ppmw6cN/NnYs4hPxu82h1Uct5Kabbm+WQbVZZXrPct9o6IAYnKNG+YTMLp6SfhkweaF6Hwnh70pd8ioDJfs4kkPwRBEV5s/M0Wi6EydLL7JqYosnOVJJGQKtb5pAnUbUoxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cu554xrP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A621F00893
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780668018;
	bh=ebywEsxxKbL2+zsAIchA15obBZB4MLLsCZr+gFmuelA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cu554xrPEYXRxYOMCuS7upLvXT+tb9DHc7DXLinqNos6IRwxD2UvQ8k++fnjPLnGp
	 lFc7X3UbYNURobBRhiXAzUulSH12f+Y5VUf9XKudY6NOn8GBm1h5purhS6RJsOeIw9
	 t73tHXpWoo6SHnK2F1NPgtOQni3pRRF5vvOw4VRxyPBLM13h5mZnpieXvwD4/sA56g
	 9S5YgVFjHNxo35UzkOrM3qSkXw6Pky7oHe4IfpXKVzphBN8jHOkDxTg27EyKSaL/11
	 t9+hORLFsqGHj/i6upTZOaNGQ4IsG2hhUf1ew+DtqTFJe5C2WrDkomF1Ok381SoGav
	 m5LjgYkhb9chg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso318964466b.0
        for <linux-mips@vger.kernel.org>; Fri, 05 Jun 2026 07:00:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8yZ2Unw8tYY15XdqscfH3Hd52EG5O7bxh/ShjxzpGpi3NLOagrNCsOIqbmKRipp1+s4Y7u6Hhk+BTE@vger.kernel.org
X-Gm-Message-State: AOJu0YxVA7I/bky3vqc8Hx0p2hzzSxholdWDkjqRgKc8eJwyfROOW/ao
	cUfqcXObQeng1R9pfZ2LVkW8mYaUuXEOAtrWATb1Sq+vtWOxnCyNKJbmKEwNi3J6SireGdaIh0z
	iQ4Xz7+S39QNxBudw26G8EorNpyXy1sc=
X-Received: by 2002:a17:907:6eac:b0:bee:e2a2:bdbf with SMTP id
 a640c23a62f3a-bf37234cfe1mr192070966b.29.1780668017308; Fri, 05 Jun 2026
 07:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
 <20260605064250.q0aRKkon@linutronix.de> <02b1e77e-5b7e-41cb-95b6-731ed00d9e74@gmail.com>
In-Reply-To: <02b1e77e-5b7e-41cb-95b6-731ed00d9e74@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Jun 2026 22:00:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7_hQXJ4MDrA0UK15s8XmN5O9WCzFUTYcG2+hxfaCv1fw@mail.gmail.com>
X-Gm-Features: AVVi8Ccj2ID3S2NrbDXgi-84Inp_5CSLtHYPff-HzGOCcbZyzbO8RRJT77sw1x0
Message-ID: <CAAhV-H7_hQXJ4MDrA0UK15s8XmN5O9WCzFUTYcG2+hxfaCv1fw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14922-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jelonek.jonas@gmail.com,m:bigeasy@linutronix.de,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B544648BAB

On Fri, Jun 5, 2026 at 3:28=E2=80=AFPM Jonas Jelonek <jelonek.jonas@gmail.c=
om> wrote:
>
> Hi Sebastian,
>
> I'm not an expert in this area so please correct me if some claim or
> explanation is wrong.
>
> On 05.06.26 08:42, Sebastian Andrzej Siewior wrote:
> > On 2026-06-04 18:24:07 [+0000], Jonas Jelonek wrote:
> > =E2=80=A6
> >> This issue popped up during kernel bump downstream in OpenWrt from
> >> 6.18.33 to 6.18.34, since the suspected change has been backported to
> >> 6.18 stable branch [1].
> > I would avoid the link and simply write after the backport of the patch
> > or so.
>
> Fine with that, I can adjust that in a v2.
>
> >> Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring=
 the
> >> generic CPU-hotplug offline path (and arm64's stop handling), so RCU s=
tops
> >> waiting on the parked CPUs and grace periods can still complete.
> > This is part of cpuhp_report_idle_dead(). Is it now invoked twice? Or i=
s
> > something else missing/ different?
>
> Those seem to be two different paths. To be honest I'm not confident
> under which circumstances which of those paths is used to take down
> a CPU. In my case, issuing a reboot command reaches smp_send_stop()
> where the issue explained in the patch message then happens.
I think I know the reason. Halt/poweroff/reboot doesn't call cpu
hotplug functions to disable non-boot cpus, instead it only calls
migrate_to_reboot_cpu() and then goto the arch-specific code. And
arch-specific code also doesn't call cpu hotplug functions, it only
calls smp_send_stop() to send IPIs to non-boot cpus, then non-boot
cpus call stop_this_cpu(). This is why stop_this_cpu() needs
rcutree_report_cpu_dead().

Huacai


>
> > Sebastian
>
> Best,
> Jonas
>

