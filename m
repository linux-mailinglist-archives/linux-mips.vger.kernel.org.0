Return-Path: <linux-mips+bounces-3984-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46491A473
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 13:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9B971F2327D
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9097013DDDF;
	Thu, 27 Jun 2024 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqUpoyPq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388C1F94A;
	Thu, 27 Jun 2024 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486086; cv=none; b=e4VuyDE61rog+oQzK74+0x8y4zNVxEA3NiMSo55G1vQG56drEQujbAroRfHPl2v7vnbeGaZ8nGbq6c0TAyAqX+qzpwBpty4tRxWel3W9FsT2ybd9prgQpCoQH3z/7puMvzDzvVG24aTZ5QZ5tdDWrC18Yc5cJsQXNyHU43jg77Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486086; c=relaxed/simple;
	bh=XpS4P703igk3O8Ga/2LoeenBi8suYKyiHNWEM3es3+c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/uvlonhu8NUDU/IoCbZCB+M/9HV/MPqY/SQO1RKhz2loIUU8D1/75ezCYZC3ZAnxendmXMdXRYivyrXKcF6xGbe9+Fzi0R1jrOjzyC42hifkfp12TCzMUsbcT30zNKRIcY8+DRoRN/YZnEDqpJjYrsFRT/nnCmwQGlh6EwElSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqUpoyPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615DFC32786;
	Thu, 27 Jun 2024 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719486086;
	bh=XpS4P703igk3O8Ga/2LoeenBi8suYKyiHNWEM3es3+c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KqUpoyPq+xyYY2f+baWNtrli5lqiNIU1jE9MLO2/EYg2hwkjdOY0Vm+VoSE5my5tL
	 F1/E310fx5Ahvt1rJ56LHh1Wa6AURwatAhW+Q+3ytNuAFUu/8jDPThX81GWZtOXqFY
	 sfOSCHiPkDzSwmOHDq/klnNGov4CuJy2swayUOcsh4R9gRm11Cde5rxR2HENO9F/GO
	 ImGStPW3UFurh6NF7eYDLOubZU4ysWzCNkLeUcCKr0SUZB0MW1IN8beuu6Y8S+Czjz
	 PYRELH/sZxd1DZhy3ZH6bLgbqomWFepL9EBfm9r6n7idmUeUoj4Eemhym1IMHrdh+J
	 4rxOZ4yMGNuLw==
Date: Thu, 27 Jun 2024 13:01:19 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 paulburton@kernel.org, peterz@infradead.org, mail@birger-koblitz.de,
 bert@biot.com, john@phrozen.org, sander@svanheule.net,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, ericwouds@gmail.com
Subject: Re: [PATCH v3 2/9] mips: dts: realtek: add device_type property to
 cpu node
Message-ID: <20240627130119.5673aa68@dellmb>
In-Reply-To: <20240627043317.3751996-3-chris.packham@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
	<20240627043317.3751996-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Jun 2024 16:33:10 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Add device_type =3D "cpu" to the cpu node for the rtl838x SoC. This
> resolves the following dtbs_check complaint:
>=20
>  cpus: cpu@0: 'cache-level' is a required property
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

