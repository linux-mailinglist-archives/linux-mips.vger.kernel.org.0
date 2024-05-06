Return-Path: <linux-mips+bounces-3108-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BAE8BC835
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 09:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84E9C1C21131
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 07:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734186D1A3;
	Mon,  6 May 2024 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lzRZVz0G"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156E3E462;
	Mon,  6 May 2024 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714979874; cv=none; b=CBn2tVLy5kjZt61LTj6nKTQAQWsEybdNbUm733XjSnMXHE0caU2vUzc0Ck1uIogfD0euV3z/1JcR3//koOSRvtOYa2qJLsF844D5Lcet2GJL2ScQd2z4DbLIxzQ+sl2rda72nMpqLYnMg+TV/WuZhGffgreY/Ynw2DRKP19kVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714979874; c=relaxed/simple;
	bh=R6TiNw7b/eFI6QFHmACKnQ+Lmgs4hhHYmLO5oH7iZKc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxrCcyeJH+cutwSrhm7MzQF6DAYTifCQCKPpKJe0vwreMfZupoSzGUT7bYDY/T1tB1HVcFP0RMYOzyv+wrJJ7XbeeK9IIfNsQlWfiScmIhSZgal5vrVCt3Epymha5s+emBHnguqzC6Cz0LhX2a2MS/NJIKtb6VUhE+ShgUo4q0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lzRZVz0G; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49146E0006;
	Mon,  6 May 2024 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714979870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6TiNw7b/eFI6QFHmACKnQ+Lmgs4hhHYmLO5oH7iZKc=;
	b=lzRZVz0GLJ74p8N/yXNAbwpykF1XLxu8H/V9Js14qzM39RB9kJCAuDpmQlhEenmwFS7TjV
	JSj8VWp1/vVwl0OkoaO2gRSYGxPP0ojRNPo7HEfbT3psARgLBOtqS509Pi44nuJP6lRvLf
	3w2FpUyTrs7F8ANoNczAOSHuMdy/Bt+rfBfWa6Jpqv+/n87JGnvfRwBaewZxoyOl7RP4is
	WPeJi+13YO7K6tYgOAao8N6766fP2KYxj/VfQp5lWvN3hj9hVOyX72E7Wqjnoquy2B7cJu
	FUrWhxcS4fHDgYrTran1/Q9etQUgavYLi8sV5xmMFcrlsWHY+smJTGdZI5KKAQ==
Date: Mon, 6 May 2024 09:17:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: keguang.zhang@gmail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when
 reading subpages
Message-ID: <20240506091748.18c120d5@xps-13>
In-Reply-To: <20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi,

devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
19:11:11 +0800:

> From: Keguang Zhang <keguang.zhang@gmail.com>
>=20
> nand_read_subpage() reads data and ECC data by two separate
> operations.
> This patch allows the NAND controllers who support
> monolithic page read to do subpage read by a single operation,
> which is more effective than nand_read_subpage().

I am a bit puzzled by this change. Usually nand_read_subpage is used
for optimizations (when less data than a full page must be retrieved).
I know it may be used in other cases (because it's easier for the core
in order to support a wide range of controllers). Can you please show a
speed test showing the results before I consider merging this patch?

The monolithic thing was not supposed to improve throughput but to help
with very limited controllers.

Thanks,
Miqu=C3=A8l

