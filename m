Return-Path: <linux-mips+bounces-13873-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDHKL2wCwWlUPgQAu9opvQ
	(envelope-from <linux-mips+bounces-13873-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 10:05:48 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF112EEA71
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 10:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1746A30067BA
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 09:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F01E3859E4;
	Mon, 23 Mar 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAWP0Jd5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8DD385527
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256724; cv=none; b=jVnrGL8a5XVrIxGCH4ancMVv7pWJewZBws8nnvmJzjGqlqe6CqoImFV1PhL21gM7qOLq53QSw9Qup31HtBntmwvWl6tLf2JQrOqlFydmnb+iIccYmRINxnT0KldMq5AnlvYzvfwXOlGJ7sCwJLG4YYHTnSThgsWaK2CudNQLTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256724; c=relaxed/simple;
	bh=2T6c3S72ahQY8xybcAngPOvZa9iNFlrMEfZwRXlS7Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWyOmiaTY8oRpj68XmIpww/TekcDhUrCZhTwmPWoHfl5adje5OYsBh1AD5jc5vgB+snn5ksVMNCwBQjoh51uDFr7F8iOJ7YNk8RPJ5LXdGs7TDSMdrnMBIcZjPy4g+sX1mFBh7xJUtyZu/nWwJJWSl4U8zgiX2NYnc/NqFZeVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAWP0Jd5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E56C2BCC4
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 09:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256724;
	bh=2T6c3S72ahQY8xybcAngPOvZa9iNFlrMEfZwRXlS7Ys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TAWP0Jd50+wA4bct6nWl0Eo/e9MYBgqRB/moFc29zFNGTSNiftQQtD+bQgdXDpkQg
	 Bihy5MvZR4R1pvm3iDZIW7tH7CffFizgyMfTHR2za4yZmw2R2I/hwODK622Sy+t/A4
	 6hJ0NcGEFgKbDHI8s1xE9ejKvjIZD7meu9BvpQuP49AQZSl9AtBG/b5Rqp2WNfh6N8
	 W28tB8Hd92jEYsAjTmw38EbXcTzalNcMTm4/uin07leljwQXBZ9JpR/NMuUwRw9Uj2
	 0uc937HF8DGvWvNdalJhPaGzUn5CvaWLV9lWFlJud4wZ+0z6PD/N1J3BVg73SFA8xY
	 B+BO4s56wTqEA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a46ebe2beso33307187b3.2
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 02:05:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHA8/i1pvH4WXGbaAY8/l3/XucBK9diNL2O0PBQemyKWmUUeJO5aYHGItaIRs2uwVgiI7VhBPAiP9u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/X6yYWhRZCTSVjxYYyPfPAELZFC2nCsdMA/n0FLFoIMHA8qoY
	cYMblvySoQA/EEH+HnZjalN1o+HusEW+a//E7NPNH1+a32Wd8vSkqbolADop0oryNWMwGmcEP30
	I027RPtWWA/kt0/+bc9H4qOvWdqXEGQY=
X-Received: by 2002:a05:690c:2612:b0:798:1637:fee0 with SMTP id
 00721157ae682-79a90c05e2dmr136862067b3.52.1774256723603; Mon, 23 Mar 2026
 02:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com> <20260316-eyeq6lplus-v4-6-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-6-bf44dfc7a261@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:05:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLmT+4xb3sfa3f1z0vD4qikeB+v0kC6yo6=hSU+==fZOkg@mail.gmail.com>
X-Gm-Features: AQROBzCPE1B6frTZvvI1ONusEll1hYYlE5t57wp0l2RUDUVexg_OieOxm5rH708
Message-ID: <CAD++jLmT+4xb3sfa3f1z0vD4qikeB+v0kC6yo6=hSU+==fZOkg@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13873-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,bootlin.com:email]
X-Rspamd-Queue-Id: 5EF112EEA71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 4:26=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:

> Add the match data for the pinctrl found in the EyeQ6Lplus OLB. The pin
> control is identical in function to the one present in the EyeQ5 but
> has a single bank of 32 pins.
>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

I don't know your merge strategy for this patch series, if you want part
of it applied to the pinctrl tree then tell me which patches and how.

Yours,
Linus Walleij

