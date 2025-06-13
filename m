Return-Path: <linux-mips+bounces-9270-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E0AD8293
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 07:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17CFE1897D01
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 05:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6E6239E63;
	Fri, 13 Jun 2025 05:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="CRILlFRG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E412AD0F;
	Fri, 13 Jun 2025 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792948; cv=none; b=FTMi6aSUiAXklpnri4UDlSVW/5cKBrr+zgFE6tTMEBSH4NXB3k7s4I4pztpAuKrRNDsKQGoOnN5XOwjV5i8TJDE8fsZr2EDr01rvDvqwYm5TZhkFDIfILeeeLetdxXgitwFq0eQHTcSlE+lzSgvTndDaNywey5W3UZM7XHkJ91o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792948; c=relaxed/simple;
	bh=vEiC11IhY3quwTmkoEagUIhwdtjX1mRA6dZ/rCvy/WA=;
	h=From:To:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=XzS6K8alPaIsyR5UBH+agztk4TCadpghYhr6kRQ4xzzmnu0kTDDrPp2y/Q+jhpEEnVfwWETQh5C2CEgU75Rue+JQ53qj/nuqeN51oQ3iTD+Rr3F7fgCyP91iRb1fmskEkLTmMkaGW58idRUirdjspCOQ0IHCMG44WO9gcJBMvMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=CRILlFRG; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749792933; x=1750397733;
	i=markus.stockhausen@gmx.de;
	bh=vEiC11IhY3quwTmkoEagUIhwdtjX1mRA6dZ/rCvy/WA=;
	h=X-UI-Sender-Class:From:To:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CRILlFRGpypQfULuHsoDWLs74pGeV388Nz9s3ItD0gFZz53py+ckoyBU6WbK6GLN
	 JW+6Q0oFsfLLJJ6Z370/eM29O1kA4dGDLDYbQW9VOxwRTNjVbItuk0jqOwY/dCzEh
	 rAoxLHjLVB6MlcfevA0Tlxd7UDxHjxOxyTq/CVEsrzSmpiHEv4QUNSyrm7UMgD6IA
	 wbt0tamh9LfR3M2QXn4Srj2dNUrIUrURXVw8KpVEI5VaqPtjC2db7Nw1gsobVAoCZ
	 zbV7Hosk6f3aiIQX/a1fqwxvDsoWZOSJTBSbOi6GIFrTwz6u1BJKrFpSIieeo0tVs
	 yrICVyjTY7HgO3JT6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzFx-1u89Ey0wt7-00S1j1; Fri, 13
 Jun 2025 07:35:33 +0200
From: <markus.stockhausen@gmx.de>
To: "'Thomas Gleixner'" <tglx@linutronix.de>,
	<tsbogend@alpha.franken.de>,
	<linux-mips@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<s.gottschall@dd-wrt.com>
References: <20250526134149.3239623-1-markus.stockhausen@gmx.de> <87bjqtrtkq.ffs@tglx>
In-Reply-To: <87bjqtrtkq.ffs@tglx>
Subject: AW: [PATCH v2] irqchip/mips-gic: allow forced affinity
Date: Fri, 13 Jun 2025 07:35:32 +0200
Message-ID: <25e101dbdc24$fb5cd4e0$f2167ea0$@gmx.de>
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
Thread-Index: AQGqT2GOijjdrn74TijIilOdIHqaNAJgqQSWtFCjpoA=
Content-Language: de
X-Provags-ID: V03:K1:4qWfK6lRXm5v92ynuyx1sSs4rRhvJc+E44/vY1P4+9l6N8Kn0cP
 xfrqQrNkPIkKammhd0hrnMD7/2xTM5Ks06YKLOxktDciID3VpHmz/W2Ri/+bs0KqeDbNdvY
 +bURxWSHefHfNkpfEu8GE+a10Vti+Rs7Ku5A4ThwO9s+VuF+rqWomtUYV5/BuGUM3emEXe0
 QbIXqAXzx7ShCdizhakrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:61NHjhkzbEE=;9O9Kvx+wlIDPLZlEUzN/aVJPTHO
 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
 khJp0/L3kQALwb39Ho9ecIwMM

> Von: Thomas Gleixner <tglx@linutronix.de>=20
> Gesendet: Donnerstag, 12. Juni 2025 15:14
>=20
> On Mon, May 26 2025 at 09:41, Markus Stockhausen wrote:
> >
> > Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> > Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>
> This Signed-off-by chain is broken.
>
>
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sig=
n-
your-work-the-developer-s-certificate-of-origin
>
> and the following paragraphs explain it.

This is my first co-authorship. So want to make sure that I understand it
correctly.

- I developed the patched and
- Sebastian gave helpful input for it.

So it should be like this?

Co-developed-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Thanks in advance.

Markus





