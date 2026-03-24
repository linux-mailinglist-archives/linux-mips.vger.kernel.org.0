Return-Path: <linux-mips+bounces-13897-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBrrAbLbwWmJXQQAu9opvQ
	(envelope-from <linux-mips+bounces-13897-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:32:50 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC1A2FFB87
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15CE3302B77F
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 00:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC634239E9A;
	Tue, 24 Mar 2026 00:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lk+6FlEZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84CACA6F;
	Tue, 24 Mar 2026 00:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311983; cv=none; b=q/IvMwxt8PhnotIVXUi7QKDwFwxfTHiJEmjh6nwbNXzeahi0sZIzqYvKkuKwrzI4rKYkM9BXTC0vJQ+5kjNcYNCIpzF4gcGOpcnoJbA0EXWdbHwTqu8pZ5/BCaYOPFNXVIshcsKpSSfs9HEgGvdld4hU63aCGROagm3Mlwt8++M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311983; c=relaxed/simple;
	bh=QvSQpGlImrHRe/QedR3fBw9Miuf6k2U8PGJBR6kzD/8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fqcwgbIvLW6Pk5mBX+wSq2eh+QPXIBL8Nuj3njBZKZV4UEf9CJRkMuSB46RB9F4DtIGncKD1y1khkKit18IGwlIlRJLQJAb+eTMjFtMjRby98XeJ7sNseZV65Cy2bVToq87rpmcRUywEUbEkWqn+DdfEWnta4mPebIJK3Hke1Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lk+6FlEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3722AC4CEF7;
	Tue, 24 Mar 2026 00:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311983;
	bh=QvSQpGlImrHRe/QedR3fBw9Miuf6k2U8PGJBR6kzD/8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Lk+6FlEZyhwCXm2JbV05bAolIExy8WyHHpGiR0x30rWlugYKinnIqRQoDT1+owSFU
	 re9zlCMTs+dN7hibW/d+GNDCt/jIG8iMJkvXyNQOA5KbQTohl8ueM7b9UiZwu+ja4y
	 U+wpFsDNZnhepR3fM9jpSQDniy1Tzx8Ixndh5LzcCPbqgdI+rN0wKkCyAdjA68PseZ
	 43aLJP9Coa6lGTJfmAvT7rxpIzcAEru2Tl700yKlahx9/sG475Zn3RtVq/XHrxI7FA
	 cNm2MhW4ZK0rXzC6yb0N4hGHVMfaEnUpsioa5zS30yM5r62bTefHh46Lu3PDq/kbY2
	 5cgkIMnI7YasA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260226-eyeq6lplus-v3-7-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com> <20260226-eyeq6lplus-v3-7-9cbeb59268b0@bootlin.com>
Subject: Re: [PATCH v3 07/13] clk: eyeq: Skip post-divisor when computing PLL frequency
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:26:21 -0700
Message-ID: <177431198100.5403.717221121672959530@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13897-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DC1A2FFB87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Beno=C3=AEt Monin (2026-02-26 05:33:51)
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

