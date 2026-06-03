Return-Path: <linux-mips+bounces-14872-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JF8ZLFOZIGp45gAAu9opvQ
	(envelope-from <linux-mips+bounces-14872-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 23:14:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81D63B56D
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 23:14:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14872-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14872-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=collabora.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 298D2301DEDF
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 21:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762E647A0A6;
	Wed,  3 Jun 2026 21:14:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94E38F25E;
	Wed,  3 Jun 2026 21:14:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780521296; cv=none; b=OxfMRpJ6Ln0NZnCaGKDeGxRk4jYrtXNdLTSxwwUAANo8L5cShV27on18073YLmJcfkZ3bjQ/vO5GJGEr2iK5yZnvwuBK+ZhvRqpML8Shnj+qPIcaD4FDayXa2XRz97v4YThM5/drmw0qoc5sglgbwAH1a2GrxArootjz34JGtVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780521296; c=relaxed/simple;
	bh=+glWu5lyCbcRjkIT2bwJUQt8wBgDSFCHqvetEXTp3GU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pMSs+yNFMyExinyw8Q6yVUJ4xROc6cRKzcAFu03Of7OQ/vQnOXOBhKzbC6/rH+NC39muv12nC7gwGjhX4t4ZJs8E9KqG2KQOAi/8AiremtxxuYtaaDejLRHUeiqhFHbTi3J9BnsWCHoiL/vc60bZsSa45juZ+aV77DofHGHHmlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3747A1F00893;
	Wed,  3 Jun 2026 21:14:55 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 1E38B181D83; Wed, 03 Jun 2026 23:14:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>, 
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Costa Shulyupin <costa.shul@redhat.com>
Cc: linux-mips@vger.kernel.org
In-Reply-To: <20260515185043.1523363-1-costa.shul@redhat.com>
References: <20260515185043.1523363-1-costa.shul@redhat.com>
Subject: Re: [PATCH v1] include: Remove unused jz4740-battery.h
Message-Id: <178052129311.2671410.17383042434045118752.b4-ty@collabora.com>
Date: Wed, 03 Jun 2026 23:14:53 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14872-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:paul@crapouillou.net,m:sre@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:costa.shul@redhat.com,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sebastian.reichel@collabora.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:from_mime,collabora.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C81D63B56D


On Fri, 15 May 2026 21:50:41 +0300, Costa Shulyupin wrote:
> The last user was removed in commit aea12071d6fc
> ("power/supply: Drop obsolete JZ4740 driver") and replaced by
> a self-contained IIO-based driver. No file includes this header.
> 
> 

Applied, thanks!

[1/1] include: Remove unused jz4740-battery.h
      commit: 0549c4c01338abe343a4ffaa4733475d0a85d38a

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


