Return-Path: <linux-mips+bounces-7566-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A8A1862A
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2025 21:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A4F3A645F
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2025 20:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176AC1F7572;
	Tue, 21 Jan 2025 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDZsgkPs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A401B808;
	Tue, 21 Jan 2025 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737491720; cv=none; b=eDzUVcBYUt32uRsLDSM1rAifPKTDSQSLkACMgg4WPiWsdF8eIEr+xSdxjAu4IMpEQ1YshBOTrGR1yUvWqbFniSkgiOj3rFqyvfHYqNvTN2rUzQtjlbf+d2hif6/GkZe6gmOFQQ9RnMEsX6WET3+iq/M90Gi+knmdtXnNgmyuhlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737491720; c=relaxed/simple;
	bh=7/UytUuGtUZKYteXb89ZjPeGJKVYtLCpstsXSmv7EFU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=cIrUgzhGz4EAwse3lXPecFeMcxT9GBcniyx2k9dKX4/Yubo1/dX1wR2xacgsU+AtKGFp1pbK/M+o5ZENF8TYfJcN4cYBWvnu1MUupYGNMCyL2CrfMImAwiM+cAgzPfE7Y8oebgAVKvyP9qKslz5jymrvdACy0u8kGhrmtFJHK/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDZsgkPs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318C4C4CEDF;
	Tue, 21 Jan 2025 20:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737491719;
	bh=7/UytUuGtUZKYteXb89ZjPeGJKVYtLCpstsXSmv7EFU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BDZsgkPsLOuxNNAFSE1uM9wGaKCenfCl6ebbgGs/usj0/UFBgG6GYmGstZjFAOqOJ
	 wvfcoGj3c8wW4zNaD4zXwlU9kduHwbNcu+4LvX4Nuk/nxGBfU/ILlaaU/gWBxqwffI
	 vQXj9m504KjhP/j6evqIf9ZBYvanAHvv6fB2qRceNxMJBFW0d+CDccXXHrwiYnXWPG
	 j9GMpfZv7Vc2N+jBcPEZt3UCFpc3THiqbL+RlkJw+0hAkfmH4KOHtLfbkVls2Y0/2I
	 ipDBBsR6kOgZR9cukhHh6MkJ4kO1qoj1+ZIEjAb5JU1orl6bbRcIlyAOxQRSfPNVVg
	 ODBmKDAEfxjVg==
Message-ID: <19c20bd871203605708a24ad7f0551c3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250120092146.471951-2-sergio.paracuellos@gmail.com>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com> <20250120092146.471951-2-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: add clock definitions for Ralink SoCs
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, yangshiji66@outlook.com, linux-kernel@vger.kernel.org
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-clk@vger.kernel.org
Date: Tue, 21 Jan 2025 12:35:16 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Sergio Paracuellos (2025-01-20 01:21:41)
> Add clock missing definitions for RT2880, RT305X, RT3352, RT3383, RT5350,
> MT7620 and MT76X8 Ralink SoCs. Update bindings to clarify clock depending
> on these new introduced constants so consumer nodes can easily use the
> correct one in DTS files matching properly what is being used in driver
> code (clock IDs are implicitly used there).
>=20
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

