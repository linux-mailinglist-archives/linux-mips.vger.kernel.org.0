Return-Path: <linux-mips+bounces-13286-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBP1EQqioWnEvAQAu9opvQ
	(envelope-from <linux-mips+bounces-13286-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 14:54:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EB1B7F4E
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 14:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D90FF3020851
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 13:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3693F0776;
	Fri, 27 Feb 2026 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="usTixHt5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FCF239E7E;
	Fri, 27 Feb 2026 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200453; cv=none; b=X9KVv72jvyjEZPKnXNpM0sy9dOsaWsdHhTvxs1piKt5HC+/2SZ9GWvnRk7jIC1j3YSbfnjMbVkzhtnUUKZGTNQycLoU6NY2FzhlBgzDMB289b2DMfOFKg+4mqA9taX6Jmvn6GLWN9pP2891GAuxQ3Ijdiv4DZXOmGwz9OwupRSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200453; c=relaxed/simple;
	bh=HsjLgo8nupcZsn81ESLUwM7KBpJUSJar+k7ZGZ1dnoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=msBuWaPy4vQ7t5QPiXemF+8OIDrkCISSBl0OGtTjjJ2jVF27rXJqpJJ6OeNjXXm19dpLgE42A7WUb48t6wQ+hVwXnm26jmb+gMc6EVSGBFwz83qYjb2pA6NFdTS+NSy3xuoHzaFu7TwZ+17i0nvwnsdlhK1KsT5NGHAIFMFRHos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=usTixHt5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5B851A1830;
	Fri, 27 Feb 2026 13:54:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A9AC5FE46;
	Fri, 27 Feb 2026 13:54:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1896A1036945B;
	Fri, 27 Feb 2026 14:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772200448; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=678J9mnuEHgouwiIbacSQJNgyLiVuCk4U+ok8i9vyDw=;
	b=usTixHt596HcttfoqUxtD1TpRqMCOhEObhRjOotEMCvFQC4458MhyCKKV/U33bO0QSsDYX
	4qtwDmQ7mk6WaJS6fTo0fTXmaT2sO/Jmyu83avYqKxbe3GZg56nWAsD7NhE36g1Oq7QMOI
	PzsKyHkJUOAioDteoszuHoEqayj9JgHqWFuKWHetbTVJk17q9VyYadXdkWGPg1we3+yf9Q
	oS5N5YY6rjpcD+sPIzva5tWEzRizelfbO5iSvFYmccxxpPMhs6+cNvHfEsIvBqke5+3y6s
	b9WWqsGYQzu0l1Ob1CzPBfbkLy5NlIBaoki5IIr9LptONk3mRsX/JyqVKpegLg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 00/13] Introducing the Mobileye EyeQ6Lplus SoC
Date: Fri, 27 Feb 2026 14:54:04 +0100
Message-ID: <5262868.Qq0lBPeGtt@benoit.monin>
In-Reply-To:
 <CAD++jLmEU=PkmsPOksF9dtV5UpH3S9X=VJey8ZEf5wdsPbsNvg@mail.gmail.com>
References:
 <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
 <CAD++jLmEU=PkmsPOksF9dtV5UpH3S9X=VJey8ZEf5wdsPbsNvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13286-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC3EB1B7F4E
X-Rspamd-Action: no action

Hi Linus,

On Friday, 27 February 2026 at 01:14:32 CET, Linus Walleij wrote:
> Hi Benoit,
>=20
> On Thu, Feb 26, 2026 at 2:34=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin@b=
ootlin.com> wrote:
>=20
> >       pinctrl: eyeq5: Use match data
> >       pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
>=20
> Can I just apply these two to the pinctrl tree?
>=20
> Yours,
> Linus Walleij
>=20
Yes you can, they apply and build cleanly on their own.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




