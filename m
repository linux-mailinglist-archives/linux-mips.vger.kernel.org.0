Return-Path: <linux-mips+bounces-15767-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6XGGEywZUmrvLwMAu9opvQ
	(envelope-from <linux-mips+bounces-15767-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 12:21:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82E741358
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 12:21:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=llwCZDfR;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15767-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15767-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F4D3301A39D
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 10:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E0F3ACA46;
	Sat, 11 Jul 2026 10:21:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80439EF25;
	Sat, 11 Jul 2026 10:21:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783765264; cv=none; b=Sq6U2fl5o99oH27NxGk8g7nbbYNTci0s3N4lxAheTLMH6pvw02DmIqKfiWEBaU61bHGXMJ/mxlkwLD4w9Sz4BJsJfkRRLQ/gloYKMIXLOCU0v8uVL8NJkSWtrkFcU/HbSQ7FLQKSheWzAiMPJSp0JTYb7bbljsziOzyxg+7bLzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783765264; c=relaxed/simple;
	bh=dEHl9N2W+Y3yvK+K2EyyGXc4h70OKQlEhr0rRbekom0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PI10IuMfj/P9SBG3CAOo0uUT+dlgnDBfn7h0WhpMlck+U/Qg4LuUlJKcEVOUen4tg8kZdLHQqgLbJHStLmXBDBwQGquqzEDROofKRS5LGIElSZfwudoEStM/frxhgkVW65fhIoVL7oooxIOeXXBYU8bKyS1qeOYHLJb4J4PQGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llwCZDfR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4457E1F00A3D;
	Sat, 11 Jul 2026 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783765261;
	bh=Y5aJ+Qm0JJUYPvStiI2zNIiRrGLRCpzpQqL3fvDD7L4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=llwCZDfRI6L9DGkjO/QyBPXsnvmdDJGsDFjTZaXpX6jyKl86ER65OqWneo1Gq5Xno
	 lEKBIImLJWRUm/rh5toWqMGBpGkPNak38Of5ABK8L4kR8R76mjmMIVvZ7IuLhbkMw6
	 n5Amf1F3WKYQ8LG6wPIqHhqgx7YmmEQ0ky0od75QmGD/MWyrJD8tedkxyhyWfr1nZl
	 O0kOcppziScsm9UnpdqXtmCNhZ8CtUgERReRJUDdizgIEfj5JL5t9WRnDeTJhLU2jm
	 7V7CZzXeBNyiqPB9gyUYFijl+BHrO1/Iflwp5NTQ/kLIFfSz3glSkGvZi7cznOUSY9
	 q9M2YDcXUBa6A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: Re: [PATCH 6.6.y] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Date: Sat, 11 Jul 2026 06:20:56 -0400
Message-ID: <20260711061631.agent5-0002@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710223627.5860-1-jelonek.jonas@gmail.com>
References: <20260710223627.5860-1-jelonek.jonas@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15767-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,alpha.franken.de,linutronix.de,linux.dev,vger.kernel.org,linuxfoundation.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:sashal@kernel.org,m:tsbogend@alpha.franken.de,m:bigeasy@linutronix.de,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jelonek.jonas@gmail.com,m:jelonekjonas@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B82E741358

> commit 9f3f3bdc6d9dac1a5a8262ee7ad0f2ff1527a7e7 upstream.
>
> smp_send_stop() parks all secondary CPUs in stop_this_cpu(). The function
> marks the CPU offline for the scheduler via set_cpu_online(false) but
> never informs RCU, so RCU keeps expecting a quiescent state from CPUs
> that are now spinning forever with interrupts disabled.

Queued for 6.6, thanks.

-- 
Thanks,
Sasha

