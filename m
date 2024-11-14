Return-Path: <linux-mips+bounces-6746-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF19C9586
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 23:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D788128339C
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 22:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D065D1B0F30;
	Thu, 14 Nov 2024 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taRybMmX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CD61CABA;
	Thu, 14 Nov 2024 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625186; cv=none; b=dcIdaRJeScc0xikeAz1VI4AT3/VR4sTsAeEZSS7BuQWMwXi3fR8JrMI7bRSJ4EhUN5OKZGvacu/DCuITwzgMVVgSUhscOZO0JW1GYY5CB6+xTmHzYdIExLdTTeDowVjQD7nC3oAWqN3SB33sdYSf+l/MjtkmxZT1PUw30kDWRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625186; c=relaxed/simple;
	bh=hYMXACo3NombTX8QZpq+8UYKgAnX++PaZ97Dz7eNMXQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=AEkLKbgBloV6WC7nR+ii8dExLnrzIRjNMnjbetmsmqpb5joeDpSUSbpUfbSupRqa0q8uB41pFniBfIAI4TTvHJS6b8hFJ5uaCsUOWNfv60C2u2Sn6lSaRbPw4NiqQWKUEA3NvSA9SkwPGOKZ7I6wxSAOW+7AFthBUaeTrK+ymws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taRybMmX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B7DC4CECD;
	Thu, 14 Nov 2024 22:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731625186;
	bh=hYMXACo3NombTX8QZpq+8UYKgAnX++PaZ97Dz7eNMXQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=taRybMmXAdWoUYgE5bCrgK0kFJyjvFbwzHIgz3SSyBS0RFDjyNZcZeCZM0N7zG144
	 dji7Q+wC2um1q3fvscs19MApdFGIbvJrOPCux63rd6aOcY9SjhXXxaDsq4E6Wg9/AG
	 pZF1M7pgqC+PYcYIVP4OVtLmmHPaxY5vD3rKiJs1MNgC+3O2wCxktScyFSmFThyx7L
	 EUSn/tNzMdzx4oaLVMQRUWenimgsBGd8I54RKrfSWgbBCcaNqLJ8dHcS4TtNNrpSNm
	 JqoVc+OK8XGoqyQNvk0KIGBc4idtjxWtpmlGuxinSLEFxgMTWOUW0Ji19PulgAkqiW
	 FwT/Tj5SBlWsA==
Message-ID: <83eb05cb3efc2598434e65b817cf2f57.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-mbly-clk-v2-3-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com> <20241106-mbly-clk-v2-3-84cfefb3f485@bootlin.com>
Subject: Re: [PATCH v2 03/10] clk: fixed-factor: add clk_hw_register_fixed_factor_index() function
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 14 Nov 2024 14:59:44 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Th=C3=A9o Lebrun (2024-11-06 08:03:54)
> Add non-devres version of clk_hw_register_fixed_factor(), with parent
> targeted using its index.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

Please start using devm in the driver though.

