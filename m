Return-Path: <linux-mips+bounces-11532-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58884B8BF9E
	for <lists+linux-mips@lfdr.de>; Sat, 20 Sep 2025 07:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1E38A04B35
	for <lists+linux-mips@lfdr.de>; Sat, 20 Sep 2025 05:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5F1226D1F;
	Sat, 20 Sep 2025 05:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOZLyia6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D583FBF6;
	Sat, 20 Sep 2025 05:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758345347; cv=none; b=jQwgadiQlW+VW1tZ5BM7oRCDbKPuzs8dP3E0uL/Ry94C3Dhv/EYHWeMKz9hQyJTWRvYTySGv7sv/qL3KpCDfi+9qFhUrR/HcSu2MNCMGqFNUd7yku3lIFhOw99MeKeCfl1250isYMKhDva8NEZ6ZdEJktjhYjfqWmvSoLqUrisQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758345347; c=relaxed/simple;
	bh=ssCoRZQzb68Vy+g2U300lCveFies27nOwHolkwpa4lc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=IPXSpzKSLWmTe48a4bHNYJSzN2LMoCcSxx8FG6grYFidE/AM6w3Z1r1uYPYs869HkfOx7IknL4OVeumpCQbow+cnjgpCGWMVkeqv5OrhVQa0LeZICXIPoVhtaS8lyXmGdxYzshDacl5eKNlAHjSaSSt12KQvnKfWJhpGc+eSAsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOZLyia6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD50FC4CEEB;
	Sat, 20 Sep 2025 05:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758345346;
	bh=ssCoRZQzb68Vy+g2U300lCveFies27nOwHolkwpa4lc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BOZLyia6v/gMb9tex5qm9tgpjkCBnEvXyYkaJnpzgXxmqPiwyZ2DNRs6IoDYyPZMx
	 jkWBf+cSr/0FPoa+rkE0ljDKngHHHT6wrNPN55OiVqB4HhORcnneUvLYdX+a1cQG3J
	 MfaoivOsoEzXslO31cDYGgjTJKxWIuqz3J/UJ/5dO/lkqZx9o2jewrT2Nc1BUkH0Ig
	 fJHb/hj5FAHHXPYJsVTA6tOVQoqeR92MBehwBIdkKCSUA7AOp2v8Ue6fKeY3WzjIj4
	 UrUEzb2DYUzwItKHeNmo076SidmgvXn5m2jZ9Q0G5972zTL7pGxxbn3iZtvQDQrm0g
	 wo3qofExPKgeA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250903-clk-eyeq7-v1-8-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com> <20250903-clk-eyeq7-v1-8-3f5024b5d6e2@bootlin.com>
Subject: Re: [PATCH 08/19] clk: divider: check divider validity for CLK_DIVIDER_EVEN_INTEGERS
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Sari Khoury <sari.khoury@mobileye.com>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Fri, 19 Sep 2025 22:15:45 -0700
Message-ID: <175834534592.4354.10788427255141071676@lazor>
User-Agent: alot/0.11

Quoting Beno=C3=AEt Monin (2025-09-03 05:47:15)
> Ensure that the divider is even when the flag CLK_DIVIDER_EVEN_INTEGERS
> is set, similar to the power of two check for CLK_DIVIDER_POWER_OF_TWO.
>=20

Is this a fix?

