Return-Path: <linux-mips+bounces-15104-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id obyCG6T5MGpQZwUAu9opvQ
	(envelope-from <linux-mips+bounces-15104-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 09:22:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F422168CCCD
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 09:22:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=strotmann.de (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15104-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15104-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EB3230182DF
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 07:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA7C397338;
	Tue, 16 Jun 2026 07:22:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from strotmann.de (smtp3.strotmann.de [46.38.233.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92950395AE6;
	Tue, 16 Jun 2026 07:22:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594529; cv=none; b=W0RSuoSeEbAhVIOnnUPsB2x0VVpwB3JIhkz1KAci3OqO9mjhdU+q7UxPOUgbHymYhkjHqrT0GwB4PkbYic0BW9iKqTDw0DI+Oe92+WGcUW4rkyCDw+BzCaGbvrduoOahx9woapqz6gkfm+HeSPsxMU5Qv7jzujWq/O5JaCFzqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594529; c=relaxed/simple;
	bh=juhXNLlnPzgyRynEqG91o/WPu2WsUH4/kzqpgpcpPCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5WUzGM31oMENvJAC2CG95dwlnvUlXsPDEKW3w0kxvNQw0P1HNTKVQuqPiYCle/2+kjPnNU1N98pfs39Y/C3pSwfswlSQEgMbdhtkcyySM3CJLzsWv+D920j1QBPCGhKV31pq/mcgrR3gFDAraa7QTfcW5F8x1FVqQ059uXcgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=strotmann.de; spf=pass smtp.mailfrom=strotmann.de; arc=none smtp.client-ip=46.38.233.133
Received: from smtp2.strotmann.de (unknown [IPv6:fd01::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by smtp3.strotmann.de (Postfix) with ESMTPS id 495787FE91;
	Tue, 16 Jun 2026 09:13:56 +0200 (CEST)
Received: from [192.168.8.114] (unknown [IPv6:fd00::1000])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp2.strotmann.de (Postfix) with ESMTPSA id 4gfdWb3KmCzHfrn;
	Tue, 16 Jun 2026 09:13:47 +0200 (CEST)
From: Carsten Strotmann <cas@strotmann.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com,
 mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
Date: Tue, 16 Jun 2026 09:13:46 +0200
Message-ID: <A3590144-073C-46D6-8425-90EE0C4D48E8@strotmann.de>
In-Reply-To: <20260615175535.5bc56cfc@kernel.org>
References: <20260615222935.947233-1-kuba@kernel.org>
 <c3789160609a10e232ba3e27c4b13adbb170956c.camel@physik.fu-berlin.de>
 <20260615175535.5bc56cfc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[strotmann.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,linux-m68k.org,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15104-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[cas@strotmann.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:geert@linux-m68k.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cas@strotmann.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F422168CCCD

Hi,

I'm a user of AppleTalk and other "Retro"-Features in the Linux Kernel.

On 16 Jun 2026, at 2:55, Jakub Kicinski wrote:

> We can complain about the AI slop til the cows comes home.
> I don't like it, you don't like it. What difference does it make?
>
> If y'all have real solutions please share. Complaining about
> "commercial interests" and "nuk[ing] everything in a panic reaction"
> is not helpful.

the solution, as Adrian pointed out, is to leave these features in the Li=
nux kernel but have them disabled by default. Maybe put a warning message=
 in the kernel config tools that people should only enable these if they =
know what they are doing.

These "retro"-features should not pose any security risk of they are not =
compiled into a kernel.

Greetings

Carsten

