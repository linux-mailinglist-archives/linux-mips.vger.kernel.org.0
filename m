Return-Path: <linux-mips+bounces-9440-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE9AE1D33
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 16:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E49B3B7B97
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 14:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB8528A3E4;
	Fri, 20 Jun 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="gxzipLsn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5759428CF6D
	for <linux-mips@vger.kernel.org>; Fri, 20 Jun 2025 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429180; cv=none; b=YUmGWa7Cz6hQVfe33cQU9lCp2zTIWMSm6eSlyvMYbAo+QJBgU3+bJ7nhQmp9lp5mI9D63LP/oqySFWA2Fr1XlHmZ8A7rVyMBSMk7KjtxUfKfko7zBEH7g5PRJHeS88/aHsA6PGEhB5j2eCfHeHqHwcafot4rfUnIj0BJeyc9rmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429180; c=relaxed/simple;
	bh=otVgixSen/JG2rWUUAH4+Ts6qyUPthUOkiwK97dUGyY=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=IX7sH9SJZ0oXzQHHZygkgMQxv/4y03U9WPgAFMdWIJCNKcG4F9mSMCSRqcZil9BjmjLfUx9w6EK3mPpA/L9AjeheuDPWdW6BFJF7rfc6AnJihi5HmwTNhsA/udaseqREg/wjnSbiDnWz24hzxprVUY3kX/52c1KOiuNqwt9eh4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=gxzipLsn; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750429158; x=1751033958;
	i=markus.stockhausen@gmx.de;
	bh=otVgixSen/JG2rWUUAH4+Ts6qyUPthUOkiwK97dUGyY=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gxzipLsnuwgRqeFQd6QanpjsXMYcODk1EqyVYWFFvGoNAJT40hUoh6Sk9veQY1bc
	 jybajhyl69cikLUnlsysXG15lYgk1mpSUav2TS6FpBqWrSz7f8U8HtpCUHHsk6i/V
	 E0nvSuvj9S8ukmS4nif8Dl/e3olZTsZlp6vLWcHnYZK1N2bBHE+g3kVGNgucGw9ra
	 SIKapNkLrSss0IV3GRCrQqBYeRfqkBoJAlPUjnch3zByc+ijSUsqUgkryVzINvwEe
	 n6GkgEwzmqT0hZwoeEno9BWCu2tvyEXXerLCgPoVx7kkuBaZGd2Iw6djXJkXIZ9dJ
	 j2fWIi3b13l3EWjE+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUUm-1v7QRm1hjo-00foyD; Fri, 20
 Jun 2025 16:19:18 +0200
From: <markus.stockhausen@gmx.de>
To: "'Thomas Gleixner'" <tglx@linutronix.de>
Cc: <tsbogend@alpha.franken.de>,
	<linux-mips@vger.kernel.org>,
	<s.gottschall@dd-wrt.com>
References: <20250526134149.3239623-1-markus.stockhausen@gmx.de> <87bjqtrtkq.ffs@tglx> 
In-Reply-To: 
Subject: AW: [PATCH v2] irqchip/mips-gic: allow forced affinity
Date: Fri, 20 Jun 2025 16:19:18 +0200
Message-ID: <1022e01dbe1ee$4f7a9020$ee6fb060$@gmx.de>
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
Content-Language: de
Thread-Index: AQGqT2GOijjdrn74TijIilOdIHqaNAJgqQSWAdKWn/i0TaMkAA==
X-Provags-ID: V03:K1:q1trwNkRGOnXch14hAyawPjRyWqMGMh+1g8amL6PhDOdum7COeI
 9Ty4AePHvzinoEf6DE/vYKVlP5wwfnzPEHQuy/9Tj/SSihtWcCMy/HRO4hIBMcuPdc49RsC
 kGnktZUjTmapgkDy0qlUhRKt3qUTU25k5lfkS1HAoBtgjueboyGayxS2LxX5VslnUlyH4E4
 vSy+zL7Ezt7BVL69FJg4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D74FFlRyJ74=;ljG+aUpVMGWlkI2kzlUOi0S89wL
 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
 F4+Obb6Gb6CdUbTHaDC7Wabxh

Hi Thomas.

> Von: markus.stockhausen@gmx.de <markus.stockhausen@gmx.de>=20
> Gesendet: Freitag, 13. Juni 2025 07:36
> Betreff: AW: [PATCH v2] irqchip/mips-gic: allow forced affinity
>
> > Von: Thomas Gleixner <tglx@linutronix.de>=20
> > Gesendet: Donnerstag, 12. Juni 2025 15:14
> >=20
> > On Mon, May 26 2025 at 09:41, Markus Stockhausen wrote:
> > >
> > > Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> > > Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> >
> > This Signed-off-by chain is broken.
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > #sign-your-work-the-developer-s-certificate-of-origin>
> >
> > and the following paragraphs explain it.
>
> This is my first co-authorship. So want to make sure that I understand i=
t
correctly.
>
> - I developed the patched and
> - Sebastian gave helpful input for it.
>
> So it should be like this?
>
> Co-developed-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
>
> Thanks in advance.
>
> Markus

Ping on this one.

Markus



