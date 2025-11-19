Return-Path: <linux-mips+bounces-12282-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B1FC6D9BD
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 10:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA9FD4E8DBB
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 09:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14E33314DA;
	Wed, 19 Nov 2025 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=novencio.pl header.i=@novencio.pl header.b="t0yva/Rb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.novencio.pl (mail.novencio.pl [162.19.155.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF03314CC
	for <linux-mips@vger.kernel.org>; Wed, 19 Nov 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.19.155.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542920; cv=none; b=tc61qO1gAMFscVQMaw5juoCOS/FMD1kN+4XfM3gCmLgJ236lyolJpAo2fueb5RLIg2D9pbw64OEMj1m95IbrclJgh1qb0gu0KvKw+aiQJmNT1oDMC/X+hMuA7sr4HNlW4CQ6oHdqkJhUQAPn8k3E6qbtV7m41HpDMQkM/Orx0PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542920; c=relaxed/simple;
	bh=fIh67CnJs35z4uTVN1yEzBZIG1sWJSjOc8Phu/rB5ug=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=NtV1UrLm6eKoTPpQPhrWJtbCT+DxhoggCYj2lMvB49Qj18YvlILaBFNnO4V9rwAerAsSY7TiEjQ669ex0kyl5fx1JH7NWsWPOSA4xIzBr86HQJ4asyfzzgBu5Wshi5ywlQiOtYf4FpdhUuFEW+IJ7RqHs3qKcAo+rTrvYF3/Wo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=novencio.pl; spf=pass smtp.mailfrom=novencio.pl; dkim=pass (2048-bit key) header.d=novencio.pl header.i=@novencio.pl header.b=t0yva/Rb; arc=none smtp.client-ip=162.19.155.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=novencio.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=novencio.pl
Received: by mail.novencio.pl (Postfix, from userid 1002)
	id D853123C5D; Wed, 19 Nov 2025 09:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novencio.pl; s=mail;
	t=1763542917; bh=fIh67CnJs35z4uTVN1yEzBZIG1sWJSjOc8Phu/rB5ug=;
	h=Date:From:To:Subject:From;
	b=t0yva/RbsLs0kobbXRYZonpPD2+uCLKwy267xoDuI1Tzidac3HjmUihfDwZtrHqf2
	 V1n3+GPX4mEZBJHbowhxyIoVqze48mxafOR8919W810fFiKHLzrXAbbOgHElnn35Sw
	 d4j4psq8CeiskKZFglIfwDmOxxo+edESiu2YUe6h1xYYGkeSJBHXC216Jm7Pu6yks4
	 EtLly9QtfQIhi5689HY8Qn9djszRLPErBgzylB+f0CR2NFOwes9d40MN3jJ7ZlyB+A
	 vpzGX44ijHGRQXG1H07hMtnh605kbbinQqA6Xjx7VYvTXvMKT/kSKkezBiY/IL2MjQ
	 OBagaR1KGp3Qw==
Received: by mail.novencio.pl for <linux-mips@vger.kernel.org>; Wed, 19 Nov 2025 09:01:03 GMT
Message-ID: <20251119074742-0.1.5y.z4ds.0.85eeyqxfje@novencio.pl>
Date: Wed, 19 Nov 2025 09:01:03 GMT
From: "Marek Poradecki" <marek.poradecki@novencio.pl>
To: <linux-mips@vger.kernel.org>
Subject: =?UTF-8?Q?Wiadomo=C5=9B=C4=87_z_ksi=C4=99gowo=C5=9Bci?=
X-Mailer: mail.novencio.pl
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dzie=C5=84 dobry,

pomagamy przedsi=C4=99biorcom wprowadzi=C4=87 model wymiany walut, kt=C3=B3=
ry minimalizuje wahania koszt=C3=B3w przy rozliczeniach mi=C4=99dzynarodo=
wych.

Kiedyv mo=C5=BCemy um=C3=B3wi=C4=87 si=C4=99 na 15-minutow=C4=85 rozmow=C4=
=99, aby zaprezentowa=C4=87, jak taki model m=C3=B3g=C5=82by dzia=C5=82a=C4=
=87 w Pa=C5=84stwa firmie - z gwarancj=C4=85 indywidualnych kurs=C3=B3w i=
 pe=C5=82nym uproszczeniem p=C5=82atno=C5=9Bci? Prosz=C4=99 o propozycj=C4=
=99 dogodnego terminu.


Pozdrawiam
Marek Poradecki

