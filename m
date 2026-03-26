Return-Path: <linux-mips+bounces-13961-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKxMOEG6xWkeBAUAu9opvQ
	(envelope-from <linux-mips+bounces-13961-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 23:59:13 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE67A33CD8A
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 23:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08EF7303AD0F
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 22:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAF5341AD6;
	Thu, 26 Mar 2026 22:46:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C89315D40;
	Thu, 26 Mar 2026 22:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774565214; cv=none; b=uX0LOWkkTQeouclHOnrS1BvJzHPdHyiiqmt4z1vP965tnWZ6qaVNIe3mVHXVcr/rjd7K61uIARsQD5TETNH8pQwMyRvs3eGxKPIkIuhtHNBs0Lss+HpyBsV+Dcj18OpKDqVj7d3S0VTNLY25UOFoXwC2+eJnOWFS17nZ/lajJCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774565214; c=relaxed/simple;
	bh=jPeS7Hz/OZoONDvOoUxwObQ2rk7SW5d2Xjyob7BXJSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMOQV6aSJjJUotaVZZuzlFRN9v0PXhyPRim+cMkM3reh77n4TC2TbmpxwIAIn/VfP9hjNdNTQU50Y5s7tSSnTlKPFL6HWyMto1YTlNCNu9UoVturwyZrgsKjNANRnoO/6dff283LEfRGDcanITaiSvHveK90tRoi5ROygdd5pTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w5tTI-0004YP-00; Thu, 26 Mar 2026 23:46:36 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5D484C0256; Thu, 26 Mar 2026 23:46:28 +0100 (CET)
Date: Thu, 26 Mar 2026 23:46:28 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, loongarch@lists.linux.dev,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v4 1/6] MIPS: loongson64: Override
 arch_dynirq_lower_bound to reserve LPC IRQs
Message-ID: <acW3RMKjA194cyHm@alpha.franken.de>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
 <20260321092032.3502701-2-zhengxingda@iscas.ac.cn>
 <a8cb7352-2d1e-46e9-b526-de4d4dd7b460@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8cb7352-2d1e-46e9-b526-de4d4dd7b460@app.fastmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-13961-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alpha.franken.de:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,flygoat.com:email,iscas.ac.cn:email]
X-Rspamd-Queue-Id: CE67A33CD8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 09:40:09PM +0000, Jiaxun Yang wrote:
> 
> 
> On Sat, 21 Mar 2026, at 9:20 AM, Icenowy Zheng wrote:
> > On some Loongson 3A devices, a LPC bus is present and some legacy
> > devices (e.g. 8259) on it expect hardcoded low interrupt numbers. However
> > currently the expected low range interrupt numbers are not exempted from
> > the dynamic allocation, which leads to confliction when registering LPC
> > interrupts in the fixed range.
> >
> > Override arch_dynirq_lower_bound() to reserve these low range interrupt
> > numbers and prevent them from being dynamically allocated.
> >
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> 
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> @Thomas Bogendoerfer, do you mind picking this over MIPS tree?

https://lore.kernel.org/all/177453852024.1647592.16054697624437632741.tip-bot2@tip-bot2/

IMHO this in tip tree already

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

