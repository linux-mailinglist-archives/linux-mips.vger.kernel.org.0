Return-Path: <linux-mips+bounces-13899-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJeROiTbwWmJXQQAu9opvQ
	(envelope-from <linux-mips+bounces-13899-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:30:28 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A762FFACA
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07FD43020A55
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 00:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BCB14884C;
	Tue, 24 Mar 2026 00:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDkjz+KZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1829993D;
	Tue, 24 Mar 2026 00:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312222; cv=none; b=aEA/p0Br6DIZTnRgst8AoyIvCjZGWwva71G2YLDJgoUid0vzixgmSen9GIrqNzOp8v60GtbidM+RM8H/xQLixxVWaAiYdNN4D7eZOMJb5ev/2dTirMger7Y+u0A00QWr4n2l0y1PEaQLp/DfAJ0aQb2EmXaZIavsLmw4LfJDl1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312222; c=relaxed/simple;
	bh=i+x+iXG+wEEu3zvrejzFElGaKrduUuekQotCwMhDdAg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=R/TXp+Kot6ouG6ysshEAVnGHcdRxYizaVa0KQu5oJc7p7TWQQG8khRii8rMnoa56LZs/tWxfUxSE+Zocp21w2kA2Kbqz5NsOagWCDxvCEXVq0V0o2VhoAS8dIpy9XuVqlwuiErLVz+25nu0P24TiMxADui74+tZQikb3gLH3GWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDkjz+KZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C690C4CEF7;
	Tue, 24 Mar 2026 00:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774312222;
	bh=i+x+iXG+wEEu3zvrejzFElGaKrduUuekQotCwMhDdAg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GDkjz+KZsnOa2mgpIgnguRY+fx7kHJqIjY+TVvZOlFqaq5XAVk0sDsqYf3jhCsFW3
	 gh7YwAJDTA+C9aUpdFtInzp45uc91qisgLS37xunAQZ7u0BNz/7u8rR3Xc7wFm7IcN
	 CUglH0k2fI0Khav2pBbe12oSdtZMYM+j90xlNVUnqk0BNdkxR/vZH6wZiusU5kIH0e
	 jRr86ra4hy57f1wQRpXqicb8zgAGMPTVw1YX82IFGkcPr/qrOlDIfVpfILEmT5JvvR
	 p9Qob9Y+DmpCG9b0ESK6dZjxYvbYVyLsH2OdWAdqUzkYAqEIs+ecg0XiLZPykgITDj
	 4/Uo53Urbipeg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260316-eyeq6lplus-v4-7-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com> <20260316-eyeq6lplus-v4-7-bf44dfc7a261@bootlin.com>
Subject: Re: [PATCH v4 07/13] clk: eyeq: Skip post-divisor when computing PLL frequency
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:30:20 -0700
Message-ID: <177431222047.5403.14073967938713816863@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13899-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91A762FFACA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Beno=C3=AEt Monin (2026-03-16 08:25:44)
> The output of the PLL is routed before the post-divisor so it should be
> ignored when computing the frequency of the PLL, functional change is
> implemented to reflect how the clock signal is wired internally.
>=20
> For the PLL of the EyeQ5, EyeQ6L, and EyeQ6H, this change has no impact
> as the post-divisor is either reported as disabled or set to 1. The PLL
> frequency is the same before and after the post-divisor.
>=20
> For the PLL in EyeQ6Lplus, however, the post-divisor is not 1, so it must
> be ignored to compute the correct frequency.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

