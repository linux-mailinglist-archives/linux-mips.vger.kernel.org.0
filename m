Return-Path: <linux-mips+bounces-12971-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D389D3B57F
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jan 2026 19:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7FEC307514D
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jan 2026 18:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3715735BDDD;
	Mon, 19 Jan 2026 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OF2+i5Ak"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6EA32D0DC;
	Mon, 19 Jan 2026 18:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846901; cv=none; b=jDfRD0U8YBOLGBMy3B2NbsDHvfiCU1tpnq6i5Qw4UCxdcXwAlxE7RsxTZDFlzFCDA8bhCM1pdgMd2rcw+H7BZEJtN54IUe7dHzqx4UbdipMyaF+D3kxBpVPbvlR59z9oL7zcPu2+PLUNbzM0Sf/IiAqob/0ohPifydXYYQhOOi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846901; c=relaxed/simple;
	bh=X7wTU9qUYX88IrTzo/aBEN6J2tlC7SxaQembYdHLdJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyKIcjbu9cmTdeV1zawIFVOhTVHoVkZeIWIEhOGoJeM98tnUExtGrxedPLEga6PpDhNq63pjfjaIOIPFO737alGAIgrjC3TzBIP5mo517jiSOAVKSfLm5gnTnxhOVkS6deLu61F4D5KIWM0ag7g0YzFTKgPCH7MUEaSyUpot8Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OF2+i5Ak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6CDC116C6;
	Mon, 19 Jan 2026 18:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768846900;
	bh=X7wTU9qUYX88IrTzo/aBEN6J2tlC7SxaQembYdHLdJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OF2+i5AkQwErkla6OReI7YlVenUrB4ZCykDVqlbUteUSMCdT5PG8I/RqL2poasvIx
	 hOcHd6TMAwqMsOT3sxCW+BBZ1vWK0XZevvismQWUKpHri5AvcQz5lFX1/3Ls5sljve
	 FFKVy3QQQPdaPAWGOnwZ/dAS4/kElxmg4GKE8JTzd6iGFAX/fvLlhg4cZ1zQxwBeS6
	 AxNXDawGiohTIP6eV2sK0InpUkovzKsVsmHEyOd22wwLL1hcN1smBb2VDlubIyQ2xN
	 2WnmR+08i0UGH54ipRlNMsPT0nF8CAmvRC+yVwklS/VYQODzaXML4er96xPXrKffe+
	 F8eAxual3kWSQ==
Date: Mon, 19 Jan 2026 18:21:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: rtc: loongson: Document
 Loongson-2K0300 compatible
Message-ID: <20260119-dragonish-captivity-10b4c27c5bc1@spud>
References: <cover.1768616276.git.zhoubinbin@loongson.cn>
 <0c6a4fd221b5bf05f06cae9bb543a5bf7ea59f57.1768616276.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qbD8GbKWVIFFyAXR"
Content-Disposition: inline
In-Reply-To: <0c6a4fd221b5bf05f06cae9bb543a5bf7ea59f57.1768616276.git.zhoubinbin@loongson.cn>


--qbD8GbKWVIFFyAXR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--qbD8GbKWVIFFyAXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW52LwAKCRB4tDGHoIJi
0oG+AQDTOiQppr6sRMbNDOqpEbPTbwxSAiRagXRPo194fxfTdgEAq9V6tXFcyUPv
8bL7qikJ5S+AlhcM939KeMDtKhNvPAQ=
=zxHu
-----END PGP SIGNATURE-----

--qbD8GbKWVIFFyAXR--

