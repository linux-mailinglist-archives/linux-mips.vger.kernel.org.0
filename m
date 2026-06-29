Return-Path: <linux-mips+bounces-15312-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l0L0Ii+GQmp29AkAu9opvQ
	(envelope-from <linux-mips+bounces-15312-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 16:50:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AD46DC488
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 16:50:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="dhEFk/h4";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15312-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15312-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 041EB313FAF7
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 14:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25743BBFCC;
	Mon, 29 Jun 2026 14:39:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A941C31E;
	Mon, 29 Jun 2026 14:39:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743989; cv=none; b=VzY8pYea7Kw3abxUH+A97YkivT1L6f7idgBYj5gUhpu/I6+aO9jLhFX6wfpiZDLY19Hpx6xXT5VHz5LuwfUldkwzxh0uA5wm3sM9Liu7mExr+BOlEK51nr2x57cuOXSWPaMos0LRPsPmtAsnTamILCwWD1J9NZvNlAg9+6HbLrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743989; c=relaxed/simple;
	bh=LGbov2NvJE1ResFXnzG+QCtwr6YHgaOVs5run/zWxTY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ba2Uqlx5PhoXim36UjNzbdSytx02H08yDDFsU7mmISNB8Bksb2YYDYBOr76Jv1HBc6R8RUNQgZQTE3VPuv4OBCq1HjI3M0/5BYyZJ7aiCpBu2dEQwRIebyuaDT5zVjHInGYljIy7WlSyt3QhbrJcJPl+gW7ynhKea0e+Dj/jnEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dhEFk/h4; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 16D754E407AE;
	Mon, 29 Jun 2026 14:39:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE14B5FF96;
	Mon, 29 Jun 2026 14:39:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F59C106F1891;
	Mon, 29 Jun 2026 16:39:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743985; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CxLFtvCxdYSFAPcpJcazY/yhqcVAil9tTOJddYaijQc=;
	b=dhEFk/h4ct5Td/9XznMsILliAmNzGCJ5e8ziQJ1+kPtNdY+10p/ebVZt4TEOUx1UaWlDfm
	daijYsWoCHi1YxN+tXbsX905cs8syjNUocoaCzo4r+tjiDwM1T2fOpRuVSOwIfTljG5ZhI
	rWA7lWHEtDSyUETGuHqywHd8Hl+/drq5NKec+W7afCDCtxAMn8wG8/3e7e2N1p7Za/2QXX
	B9VtbBUiaBesqCroRSQQt7LiL4bEklZlFmQlpuHXaov00fFV4oliIh2YrEh8nXvXKb9aQ3
	9pPTUNFltz9a5LBL503q81BRqCmZv4GGFXh0SGbLA0qQgFdUOgbRlxmM66akgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615063332.48127-1-pengpeng@iscas.ac.cn>
References: <20260615063332.48127-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: ingenic: handle ECC clock enable
 failures
Message-Id: <178274398430.256048.6316758564651286522.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:39:44 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15312-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[crapouillou.net,gmail.com,nod.at,ti.com,vger.kernel.org,lists.infradead.org,iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:paul@crapouillou.net,m:harveyhuntnexus@gmail.com,m:richard@nod.at,m:vigneshr@ti.com,m:linux-mips@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6AD46DC488

On Mon, 15 Jun 2026 14:33:32 +0800, Pengpeng Hou wrote:
> ingenic_ecc_get() obtains a provider device reference and then enables
> the ECC clock before returning the ECC handle.
> 
> The clk_prepare_enable() return value is currently ignored.  If enabling
> the clock fails, the function still returns the ECC handle and keeps the
> provider device reference even though the acquire operation did not
> complete.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: ingenic: handle ECC clock enable failures
      commit: 1a8b2951ba3c35824ff4df0ea7d9f7a554c964a2

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


