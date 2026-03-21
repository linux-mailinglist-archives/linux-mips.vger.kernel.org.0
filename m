Return-Path: <linux-mips+bounces-13850-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iApVO71hvml4OAMAu9opvQ
	(envelope-from <linux-mips+bounces-13850-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 10:15:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 700612E4534
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 10:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B77301951A
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C7F2472A6;
	Sat, 21 Mar 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="TXfgG11E"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F8A1459FA;
	Sat, 21 Mar 2026 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774084538; cv=pass; b=bfXJxbL0eSz6m6AfizrhKmyDLcF3tyKuzG0YDR4WO/qusNKxdB985wkP9tUCv3daofgYLnGrX9qIPPVWdkKdy1fjVyZpcBGeRIC1TMwJ2PQarV4BMmXnRdUFIKUXYs52+n8Dci3UEubJIH4QiXMG8owmZjanMRzDv1cLEbk5K+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774084538; c=relaxed/simple;
	bh=WmwVbMKfkcbeIrba3xAAx3ApJ4JHyUDZUdKMCLnKEqM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sti/fZGw6vmm3kqAX+BvACoW3vE7ikTgYcUpu2x1bQ28EYjrbzIr4sKq3C8NO+ymKonX4aoVJeZe27LnKy9sPsaQh1JUOBAihTCK2HD2TEENTO0rbNjjEDNc2jpVUHzVY9k6XHJFEfi/d3ZZX2DC0uKxSbqP7kv76kzlhijYOds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=TXfgG11E; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1774084515; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XUsmdMmzgegC4CdweLdlh+no3tDu8j9AxD3mKnwO1h42Mjks4o8dRBsXhlelSPmzae3odYu1msLriVweGMudqhHy//9R1LDE/YTaeol5KIPvvvf+72Yejjf3dsR4kCAdEbvykQtFfo0Ofs+BnVRB1NGdqra7DDLGQuhDSji3xGs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774084515; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WmwVbMKfkcbeIrba3xAAx3ApJ4JHyUDZUdKMCLnKEqM=; 
	b=EotlQH4lNcPkyOoQ7oZoVV69NRTEmOV1y3647YQybLtod8u4opxGphEKyFbZ8yOv2HI8LgbnPlF0DVpCWMIA2GQmKrKuqSVagyPA5aqeMXS/GkMlozONyROTqEXOxulEFHc8mdpGzILSdY9jfHdEKbR9P99ebsH1fOq2h7U7uZU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774084515;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=WmwVbMKfkcbeIrba3xAAx3ApJ4JHyUDZUdKMCLnKEqM=;
	b=TXfgG11ErVzQL70BQlys1uoB4fnUjnClpLw2jLvl7/1mfkQ0SGywSrJ0vnWj5NCP
	thr4UnvhkGnGX5YTtVLnmfBv1cU0h4eAtmoVwiwYQdjuSPIBxZitAzuHiZ1lg7HLsYg
	dj7+8FfXRAz6nYAxJdguugWDKhm9dNmwEX/eb8+ZBSN/rvN/8JXBuXNeZaY3cSoLKLh
	iQqZke6xX8GxA++XPVN7uVv8g5jz2+XLcb5C2ETqVK4xKjhL5UK6SXZ833zf3AObBdj
	0KznnHvrisk0JKJEJYZu7/qhiMUFOEwRQwGRMTwpMuE7vi/LGKHwL74qE0ZVt30g5cl
	1fREnPkQ1Q==
Received: by mx.zohomail.com with SMTPS id 1774084513012509.29549878929595;
	Sat, 21 Mar 2026 02:15:13 -0700 (PDT)
Message-ID: <04f8471accc8e2f71969df336a6c2fe40ae1178c.camel@icenowy.me>
Subject: Re: [PATCH v3 0/8] Add support for LS7A LPC IRQ for MIPS Loongson
 systems
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer	 <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Yao Zi	 <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Date: Sat, 21 Mar 2026 17:15:03 +0800
In-Reply-To: <874imalv2h.ffs@tglx>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
	 <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
	 <874imalv2h.ffs@tglx>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13850-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,icenowy.me:dkim,icenowy.me:mid]
X-Rspamd-Queue-Id: 700612E4534
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=E5=9C=A8 2026-03-20=E4=BA=94=E7=9A=84 10:16 +0100=EF=BC=8CThomas Gleixner=
=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Mar 18 2026 at 21:57, Huacai Chen wrote:
> > > =C2=A0 MIPS: Loongson64: dts: sort nodes
> > s/sort/Sort/g
> >=20
> > > =C2=A0 MIPS: Loongson64: dts: add node for LS7A PCH LPC
> > s/add/Add/g
> >=20
> > In addition, I think the last two patches should be in another
> > series
> > because they won't go to the irqchip tree.
>=20
> Correct.

To be honest, I don't know whether the first two patches should go to
the irqchip tree either; but the irqchip driver refactor depends on
these two patches.

Thanks,
Icenowy


