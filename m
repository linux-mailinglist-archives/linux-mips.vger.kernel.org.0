Return-Path: <linux-mips+bounces-12533-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D70CD2B45
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 09:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78D293002169
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 08:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8F12F9DBB;
	Sat, 20 Dec 2025 08:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="QlZ0bgSX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F4B2E6CA8
	for <linux-mips@vger.kernel.org>; Sat, 20 Dec 2025 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766221075; cv=none; b=NmQ23G1YPWvFsBXnN1QGMSjm3qbMHd88rcAzWp9vIjKGJYRQyZf5yTIauCYFdShWMqlkNRWGxiI2lcu0DNHFiLvQX1CDnXVQLpfYgzM5nXeUpPFme2fRxag9R9CBRtQ9bj71dZ0T/GgJ9Irokey2Xh/UnKYOgqHjSMOJmN+L1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766221075; c=relaxed/simple;
	bh=PXPsUdsp2mGmxugzQyPGZKN2mCaGl2lBNTY2SZieOUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KqCAgb3w1LCHz6rogmhj2vR2PEeOn1Zwbgx0KQ2Xo1rIpvpEYuj+KOX0LVA/PhB3xeZ7VW2WpHphtoPOfLMsM3F3pgzia9jLz4p2jaTwJoXmaM9l1ry2rfKN6gFDn/ZxfWxEWNjvTx05id/9RA5olIR6mFLuvTZKdeD1GsJwUIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=QlZ0bgSX; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766221063; x=1766825863;
	i=markus.stockhausen@gmx.de;
	bh=PXPsUdsp2mGmxugzQyPGZKN2mCaGl2lBNTY2SZieOUU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QlZ0bgSX+LXf32eRe/AgjsZvTy5rn7EXgK7eZYYDFu8eFh0K4bZQdqnzUERuQuc+
	 koPss4FTROweeDDIUJR1qFJJxxXHG/jRHp6JzJ5Go+wC5x/afHx1PKCArPJajGe1Z
	 qSu8BbGdDCha1Lc6rB56NzH/1wiY50lIF324OGKLi12oiJCakAFzGcGIezlkrRa9P
	 WcpgvlIBGmEnqKIDikp8rxomf1/D7vIF9zlgpIzHVKhs1LTRo4wZ7x9sJX0jLS267
	 E+j/4my4zCufXICijwXDzjTxcwN3al2i384InGn6eF01bTHoXyG2jlyfUynIAdpcU
	 PBaUUX40WDVi9iBOTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.93.28]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeI8-1vMsNv1dWG-00TC7v; Sat, 20
 Dec 2025 09:57:43 +0100
From: <markus.stockhausen@gmx.de>
To: <rppt@kernel.org>,
	<tglx@linutronix.de>
Cc: <linux-mm@kvack.org>,
	<linux-mips@vger.kernel.org>,
	<jelonek.jonas@gmail.com>,
	"'Chris Packham'" <Chris.Packham@alliedtelesis.co.nz>,
	<hauke@hauke-m.de>
Subject: HIGHMEM freeing patch breaks Realtek RTL930x builds
Date: Sat, 20 Dec 2025 09:57:40 +0100
Message-ID: <00bc01dc718e$b4108af0$1c31a0d0$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdxxiTJJwrw/Ns7pRZaadeXRDK5ajg==
Content-Language: de
X-Provags-ID: V03:K1:HNVl8ZPWDm3Fy8gWDdrk1gAG0zWTr8/77oRnF2z9nGzzrdV41pl
 Z08afJRZZFnXYKnmMeEDSW8k6H2sKnvdzdRRkuYa5COKJbOl565aLRQ7lJq616mFu200w4B
 GkUKodWiwmuOtcPMpNKrcSYT6+MaYa3eF7qjMotJIpXe8vE/6csJggeQ9blHQ7uPl9p+ki7
 mYWRqM9qU/Q5pdLQ83wEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uBFT2RogCc4=;VzTZJDMK0MfUqN9aqkPkPWpBz0X
 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
 FaUXOw2IwbcfQegd1Ww40g2LLQ+jPazoWpxzY7

Hi,

sorry for being late on this topic but downstream OpenWrt just started
kernel
conversion from 6.12 to 6.18 these days. During preparation of the PR
https://github.com/openwrt/openwrt/pull/21181 we noticed that Realtek=20
RTL930x soc based devices with more than 256MB (highmem) do not boot=20
any longer.=20

These are MIPS 34k 32bit multithreaded SoC with layout=20
<0x00000000 0x10000000>, /* 256 MiB lowmem */
<0x20000000 0x10000000>; /* 256 MiB highmem */

Bisecting the issue gave " arch, mm: streamline HIGHMEM freeing"=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
?h=3Dv6.15-rc1&id=3D6faea3422e3b4e8de44a55aa3e6e843320da66d2
as the first bad commit. This is back from the 6.15 times.

I have no real idea why removing mem_init_free_highmem() and letting
__free_memory_core() work on the whole memory range gives issues.

We are aligning to upstream very slowly and are still in need of=20
downstream patches so here some additional info.

- Until now we never cared about FLATMEM/SPARSEMEM configs

- We are still using dedicated prom.c/setup.c for the devices
https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dtree;f=3Dtarget/linux=
/
realtek/files-6.12/arch/mips/rtl838x;hb=3DHEAD

Any idea or hint is appreciated.

Thanks in advance.

Markus




