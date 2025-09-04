Return-Path: <linux-mips+bounces-11017-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F3B436EA
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 11:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7772E5E5A27
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 09:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35092EE601;
	Thu,  4 Sep 2025 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqN8whEd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C6428153C;
	Thu,  4 Sep 2025 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977634; cv=none; b=ivPO0UC28j16XKKQXsmQRtPV3B/sFmvqJtvpYFhV/joGJ4teaAWZsKSv/JZq7eHjefO/aZNew7BE6TYkpNSweQ+lbjjncTj+todzKC3vY4/DisqNzsnmZ0dDNYcsD8TPvC8puHQRPYiY8bJvJG+mdgKpYiOb34sFvwJ4u4APF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977634; c=relaxed/simple;
	bh=pIaTpK25gjhy0I3MoReopJjl9vx8OfRgqgs85pzEqf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMSbfUd5oQ4nDaeIDdpVuK/skbqYHRyTX0zCeXJAv0fRKxCekZNPxPqMnKSLf8R/UCqowmcHLanctdhBmae/aR9m6UsdXngKuv4IHMshKATE/nhIAJsPD5ICRw35GjHKGHURU56FAp+8CLsLDqDZc//t+elNw95twmEMNInlCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqN8whEd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1E4C4CEF1;
	Thu,  4 Sep 2025 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756977634;
	bh=pIaTpK25gjhy0I3MoReopJjl9vx8OfRgqgs85pzEqf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqN8whEdCM58Vl2+xGqlQHW1Fx7byfe9PhOSrVQW4639OhPE2YdOW25P4eWoE7U4j
	 sJgtwieKE8FH+L6wjE4zxr4zUjCemWzaG74vFtelwOJgmCFLcUmVGPCnJyE13fv76o
	 dgcBp9+pyowRe/c4RdMRqWNMHlKvLANMB+GYyW5fph6BJPkFyl9+yOlhYlaql1VtZ5
	 6QJAfuq+mhUd8lOe0FERlV2G6NzETJTa5/7QX+Lq/WIoJdyXdrinvComXegiUsKlHk
	 +PU5D5SVloU6p7JMl13FDHIw4FL+3KQgWEiPObnDd3bXfNc6mbR1Bap8OEu4SsQq1f
	 0J5eBeRm7yZDQ==
Date: Thu, 4 Sep 2025 11:20:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Sari Khoury <sari.khoury@mobileye.com>
Subject: Re: [PATCH 01/19] dt-bindings: soc: mobileye: rename to eyeq-olb.yaml
Message-ID: <20250904-vivid-seal-from-nibiru-8c50b5@kuoka>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
 <20250903-clk-eyeq7-v1-1-3f5024b5d6e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250903-clk-eyeq7-v1-1-3f5024b5d6e2@bootlin.com>

On Wed, Sep 03, 2025 at 02:47:08PM +0200, Beno=C3=AEt Monin wrote:
> Drop the 5 from the binding name as the OLB described in it are found
> in multiple Mobileye eyeQ SoCs.
>=20
> The binding already contains entries for eyeQ6L and eyeQ6H OLBs
> alongside the one for the eyeQ5.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  .../soc/mobileye/{mobileye,eyeq5-olb.yaml =3D> mobileye,eyeq-olb.yaml}  =
  | 2 +-

No, we don't do that. That's unneeded churn.

If you wanted to rename, you could try when adding new compatibles. And
maybe you even tried and received comment for that.

NAK

Best regards,
Krzysztof


