Return-Path: <linux-mips+bounces-13253-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM5sGB3ioGk4nwQAu9opvQ
	(envelope-from <linux-mips+bounces-13253-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 01:15:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B23401B12E6
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 01:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62E94303A266
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 00:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1FC20B212;
	Fri, 27 Feb 2026 00:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgGw/Drp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883541F4C8E
	for <linux-mips@vger.kernel.org>; Fri, 27 Feb 2026 00:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772151284; cv=none; b=f0spD/syQUzsConl95FgZzncHgqXKUYkHSbDQ89nfG0hqz/mSVyYlMjhkqbyfs6DjdWRXXr5vYbaOHFjR7FUyCuCd7Eb+D6IILHR722lDmbUjVUff4vUE20ub4lUXX5QOZmSLXnV8oM2I45WzBy3AhrLx9M7tmdxSvGK2YlR8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772151284; c=relaxed/simple;
	bh=rQ5BXVxUVHiinx/9etXdjLyj8TBe6JBCnlqh0HwlpdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMO0vcB/5u6x036r2+F/rxxbvoNbnMtePO02ICRW7yEyozbrGiiCRXRdvq6pg5iOpg2gNstZNEcwDGaYleF9hGrvdgwlBT3xme5JqBI1cugbXfWZQIkguJbV0nSSEFwf7WTuAYVE+yJwuzFQNSjIQ4SUYbURmDrhYBSwWKW49Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgGw/Drp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C43C2BCB9
	for <linux-mips@vger.kernel.org>; Fri, 27 Feb 2026 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772151284;
	bh=rQ5BXVxUVHiinx/9etXdjLyj8TBe6JBCnlqh0HwlpdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GgGw/Drp/yzeK9KJqNiuHu8XTgilYOaWwtYCtjoIqBFmTzi5uqABr5T2RqeUsuF5o
	 ppPYfHELv7ZxT3xibfq0swgSCEApScUmTnkLUC4EwuYPANpxVFV1XWvw7vUBfJvOXS
	 ABUFreoVuhW14L6SiGaXrh7yrXAl6AmAZiiq2hgva1ANaCdQAy6dXChkUWT1tLFHg3
	 7tOZAtOZdV5F4CcrI1BGeD79W+l/7P6bDGJ4akPBkl9l+j6JN07cEPLsgB8Ghv1u60
	 LYYTTT50kCO3I3L+ieW++pDik8doQhJw62467T5jwpp7bF2Om+mNYiZcKuwBpBBJbG
	 Vj6JdjQSV2khg==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-798578e2918so13879027b3.2
        for <linux-mips@vger.kernel.org>; Thu, 26 Feb 2026 16:14:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSG1YeJg4qJJ7pIHBwfRSzSLNoEvbYDuT9v/YkC0KCgcpULbrF5nxxAHxKMeHxpi2/lh88J8V62uZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPtCP0J/FDuufU5VihnPQBLoe9HbqMDvCxWuTfrS4YdM6Ir+O
	Y5eWPZNI/Ya9u6tj5pz1jOqop7q3E0RbyajEvNzT72gEfZlPcH8QEld5DlK8b3LCorIJaJOugXS
	2QweLbigt+Q2lpjRa09gRDR+wLXQHPNc=
X-Received: by 2002:a05:690c:6610:b0:798:6d23:17d3 with SMTP id
 00721157ae682-7988564c5e3mr10555717b3.61.1772151283680; Thu, 26 Feb 2026
 16:14:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
In-Reply-To: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 01:14:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLmEU=PkmsPOksF9dtV5UpH3S9X=VJey8ZEf5wdsPbsNvg@mail.gmail.com>
X-Gm-Features: AaiRm51UQuRyWgPHPv_4d3kto0BL8UVCMzhYwuXDM3xAvEcO-lHxkGc_S7Y28qc
Message-ID: <CAD++jLmEU=PkmsPOksF9dtV5UpH3S9X=VJey8ZEf5wdsPbsNvg@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Introducing the Mobileye EyeQ6Lplus SoC
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13253-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B23401B12E6
X-Rspamd-Action: no action

Hi Benoit,

On Thu, Feb 26, 2026 at 2:34=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:

>       pinctrl: eyeq5: Use match data
>       pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB

Can I just apply these two to the pinctrl tree?

Yours,
Linus Walleij

