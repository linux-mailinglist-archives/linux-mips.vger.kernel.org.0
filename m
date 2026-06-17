Return-Path: <linux-mips+bounces-15127-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y1pxLsMaM2pt9gUAu9opvQ
	(envelope-from <linux-mips+bounces-15127-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 00:08:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DF569CA13
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 00:08:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XNxowSn0;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15127-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15127-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D2E63021607
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 22:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E019449EC2;
	Wed, 17 Jun 2026 22:07:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763233B14B8;
	Wed, 17 Jun 2026 22:07:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781734067; cv=none; b=Qr6RTaT/C+4W+sFXq1DqjYvgmk1LECeI3iR8eQQluRrZRTgahHSB+RBdwL4duYKtzBlJDZBBMTj3KR/Hq9ljbIjb9UL3BDhuw3roCK+pwhjiq27kxB51Z6gqspabzNpOF8AZ1hCMeYm0sDyl0GfnoHBtp0nMHZ5KMsDB8/d6fpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781734067; c=relaxed/simple;
	bh=QD9+BuX8vNnlpmK7MBUF8BffYmSDp+kgIN1GCWUfQ4c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k4PkSoSFXIkf7geygyDP3b898ZXPygrC2mhuqUbGl7OZpTwKfSwghq/sEKNv955i9tEMlPrk2K8ozrjyL0SWTNcTdjgwGuUhbjdlVCnPWLoh8qZsJcdJdkKuQbhV2iHCzCF1mAKIiyQpttZrZFSnlCTU8wRMIj5eji4is4cbQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNxowSn0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE301F000E9;
	Wed, 17 Jun 2026 22:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781734066;
	bh=CqN76L0GmoGTlUxyqmYpYwkQVk5OIJLansyMs93EdPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XNxowSn0OJP7I2CIW2JV0Oo+0Rb+Kin3QNSOcQuHP6QKaSXwJYNG4kFgHdWzc6Kdf
	 2pVYVBMVbEft9I+hqRuLM45mXxtDKkIrE16UXxKkNjSPtiG0cNyVdWldzciE/3B/Lg
	 dxmDRcDjInvW5G/O+L5ZZ2G8zkczw4R31UbnwJ/UclDCiyAl0ng5d7bpd777pgunfq
	 wEI2dW2j+0XDGEpTVhUup+ZP8N7/EzprERi1gqb9r29KVHngQmWAiFWLOLK0y/EQo+
	 sQc92qNEXX27qZIhquXOuI/QZ49TFfmsRnXHvh5qclJjht0ry/VefZz5qfZQLLtCR2
	 qWca2TTAx2Y6A==
Date: Wed, 17 Jun 2026 15:07:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: <keguang.zhang@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 "Paolo Abeni" <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-mips@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: stmmac: loongson1: Use dev_err_probe()
Message-ID: <20260617150744.05756f0b@kernel.org>
In-Reply-To: <6b8db599-5bb2-47f9-ab53-a0b5141af2e5@intel.com>
References: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
	<31630db0-85cb-421b-8ebe-bbae07521533@intel.com>
	<20260617135407.6ff54e27@kernel.org>
	<6b8db599-5bb2-47f9-ab53-a0b5141af2e5@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15127-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jacob.e.keller@intel.com,m:keguang.zhang@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-mips@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:keguangzhang@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8DF569CA13

On Wed, 17 Jun 2026 14:26:25 -0700 Jacob Keller wrote:
> It does claim that it has benefit since you get the error code emitted
> symbolically. But we have %pe for that. I wonder if dev_err_probe
> predates %pe?

I'd argue

  No of match data provided: -EINVAL

is more confusing than just:

  No of match data provided

the EINVAL is meaningless and hardcoded in this case?

