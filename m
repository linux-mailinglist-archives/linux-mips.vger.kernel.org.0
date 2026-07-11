Return-Path: <linux-mips+bounces-15768-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3vg/EhUZUmrjLwMAu9opvQ
	(envelope-from <linux-mips+bounces-15768-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 12:21:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9574134C
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 12:21:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hoC3bElT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15768-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15768-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9A02300FFAD
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 10:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE81C3AB5B7;
	Sat, 11 Jul 2026 10:21:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551D73A7F46;
	Sat, 11 Jul 2026 10:21:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783765265; cv=none; b=lJcZZObbMi629qIGOMH/ec6H4pFu6NFtjx/NYgL+yGMi8WdSt+zCasf1z6BQLJHrbJZWvsQXGBoSROzew8NZrt99vkZVgIYrqWAbxONVr+ivGJHwcZPXNVINB4TOK6d7Hc5mBsqTERd/myvnW4JeueYcDbIOfJb2/M2MhjO9IaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783765265; c=relaxed/simple;
	bh=Pdk7n/gv7WDV585arv1it15NuGPfrFYTgb3IqLH/wTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAtLfSw+1BMLXJyh0XOo074nkunjXVZUXHO5pAqZTkv1kopkQtissFVKvM+pOKHPGUIwaJjgguFHzI2C18spDHhyesxZNf+kB/08KuiT1Ln3uSaQPy1lePnNrQjCaYWg5kACxfZyw5cS0zdGTiUBeTXMStuqSWOAxClkIZy+SSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoC3bElT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E54C1F00A3A;
	Sat, 11 Jul 2026 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783765262;
	bh=m3U/HkqQwesTEFsGEFZ2atwD5gY93zb0ftBz8NMWsNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hoC3bElTfY068wmk8sASR2sgcuSR1b6b2AaK2hZDeaHlTqHU2UKGkZUv3R6IJbQGe
	 vZMfOxK4JfrIPrpNsuxnZdBXG8YXu74NCnkbMUyT5l+CWpYRS1lMaOB3+qSCbs6C90
	 pp7EQETdwneD4vCFKoiMKNJl8c8t+nnYEqmMYRbrTSWo0zm70yS9//WVjpvWKMGqwl
	 DUY8i1Q9fT4HH1l6vlmMo5x+/hOvuCLN9Pp0ml/Zow9iB2rkz0V8C0DGsHxS9h42JB
	 FgdDYzJWavXmXvwOOI0CEenCfwTG1kDR/5xR+Hqyd3SXMtvyjrklKfAv/30s3Y1aiO
	 bPLhcKNy67F/w==
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
Subject: Re: [PATCH 6.1.y] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Date: Sat, 11 Jul 2026 06:20:57 -0400
Message-ID: <20260711061631.agent5-0003@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710225147.24574-1-jelonek.jonas@gmail.com>
References: <20260710225147.24574-1-jelonek.jonas@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15768-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9A9574134C

> commit 9f3f3bdc6d9dac1a5a8262ee7ad0f2ff1527a7e7 upstream.
>
> smp_send_stop() parks all secondary CPUs in stop_this_cpu(). The function
> marks the CPU offline for the scheduler via set_cpu_online(false) but
> never informs RCU, so RCU keeps expecting a quiescent state from CPUs
> that are now spinning forever with interrupts disabled.

Queued for 6.1, thanks.

-- 
Thanks,
Sasha

