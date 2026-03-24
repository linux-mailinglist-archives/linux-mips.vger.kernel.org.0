Return-Path: <linux-mips+bounces-13900-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFR6EzDbwWmJXQQAu9opvQ
	(envelope-from <linux-mips+bounces-13900-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:30:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 117232FFADB
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 01:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 075FD30311AD
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 00:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9F22F3C3D;
	Tue, 24 Mar 2026 00:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkHRugh6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31526ED45;
	Tue, 24 Mar 2026 00:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312232; cv=none; b=nnsQk0Ftwz9vKTQWALB3mZpD1rZXhGA0ws2EKfAYZH0GMX094p5ce5Iti//u4ky5PMEpfTCcPLi8HVd3PdPoaFoZCY27x8i4L/xCN3bRQNMm/lxNZp4TXes/mf3VUbNBOoqjXGEKXV16rZ2p6WFFzooIaTGKqSfxpxf/IbIF+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312232; c=relaxed/simple;
	bh=xyq7M5WH+tUvUH9Nfp5zstwN2Q2LJRghZaYduv/xBI0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fNCGGEBiPwop+rc4AVaPbhJz4FrrP+mJbL6GNXNMGBQRxyZdKviZdHAW9SU8xNTQanobP3U9jZbJGLF1c/x407gMuzud992o5Mb5jVMhHS1yFWGAMMh106DggVdR4SVsL/zIjg3l2NkMtziNp1iLfVvLbVhqI3KXP6RWNuno288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkHRugh6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEBEC4CEF7;
	Tue, 24 Mar 2026 00:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774312232;
	bh=xyq7M5WH+tUvUH9Nfp5zstwN2Q2LJRghZaYduv/xBI0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GkHRugh6RNVLyiGOQxMpXtCDaMm96ebWsshbJVeMGbiGdbV4V32BG2s/s+sefW73L
	 +gy/w20hPl7Djdoa5uZ+ilc71d9O8JJ7NTQ1dumtcRkmiU0KMn91fkgOoLQxF8wla3
	 a4f54qg6hMhVR3TooqGd6wLJqDC69ijxqz9bqv6469gVY6Vi+OKCRKG6sBnNzqB0wd
	 0SsS0ihFYCJ0iA8a52DkgrF+1IPja2xECB37hFPKNFL06rrphgAWNy7WxYwQ7bIEq+
	 SSx08Z4aLpVu+jM+OH8K612tcM7qKX9q+nscqPGCQlCfjOZIsZc2pIQ3EGQwyTz5p2
	 LtNVNIN/5boxg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260316-eyeq6lplus-v4-8-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com> <20260316-eyeq6lplus-v4-8-bf44dfc7a261@bootlin.com>
Subject: Re: [PATCH v4 08/13] clk: eyeq: Adjust PLL accuracy computation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:30:30 -0700
Message-ID: <177431223029.5403.13883616523797608645@lazor>
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
	TAGGED_FROM(0.00)[bounces-13900-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 117232FFADB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Beno=C3=AEt Monin (2026-03-16 08:25:45)
> The spread spectrum of the PLL found in eyeQ OLB is in 1/1024 parts of the
> frequency, not in 1/1000, so adjust the computation of the accuracy. Also
> correct the downspreading to match.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

