Return-Path: <linux-mips+bounces-3907-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EBC915850
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 22:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61660287459
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 20:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C95F1A072D;
	Mon, 24 Jun 2024 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4q+D7+k"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA0419D88C;
	Mon, 24 Jun 2024 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719262564; cv=none; b=DerU/wKYPpsMVnGVbctIgfiZyflIfaZdj1/7U2R/p3sDy7oKqz62ulf/5oxx+CzW2oQB/acSDbW1M/rp5TNUrwr2vSa0fZPHRikX4D/voNtIPWPf/tTVi26+TojaDr9ypQuTKxJmu557AKakxsjtAsmPdxo3QV1/fj1FJXLNZZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719262564; c=relaxed/simple;
	bh=B1fcKBvXfF4dOzoqexsC2eXYwZLz8wv7W9c+wzjSgtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPx+81DHyc2xG/HNN7y4hYIhEJgX5oCG3tzHGJT7LCHgC+2XPHqWa7Motl9EA+3dZNv4sYngf6NqhU8Vy77NDfnq+9N9QWxVdqIGZJWIe8V5W464PmY7neWMbP4rhIrQ1GlPDbDCjo53E0dNcqyPRMj27/gwvoilU1KM8UPWq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4q+D7+k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FECC2BBFC;
	Mon, 24 Jun 2024 20:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719262564;
	bh=B1fcKBvXfF4dOzoqexsC2eXYwZLz8wv7W9c+wzjSgtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4q+D7+ktuTw6fL35LpJTLMdcs+7XoigTplCLXVJxhxw7CzZV5k9XZwhK1K9blPum
	 /pNsJ50eDjRLwBrE8TqtuPSvFVZ2BoedxrxEln1qi43XtruiaSWmPrO6TH6oVZ9IbY
	 d0R0znkPnInLOw5dkd+d83tuhMrgsTtkP7nDgQ+7JaUMsI68iPt6VXDL08PXO525yt
	 X3ic2Ros+ISJDIMUNPLSItIbi8F5cXQZGVOmOVjgaYujEuEd3IL2aDEv6kZulXeJfb
	 mRMNTRKQ3qu3G1JdbUQO/0hJmWKbgdEldie2VVdWYr/i6eW+0HSS+1GVm4FVlFYEIC
	 XjyclP7JEmKkA==
Date: Mon, 24 Jun 2024 14:56:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/9] Revert "dt-bindings: reset: mobileye,eyeq5-reset:
 add bindings"
Message-ID: <171926256085.403565.1611948703766357163.robh@kernel.org>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
 <20240620-mbly-olb-v3-2-5f29f8ca289c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620-mbly-olb-v3-2-5f29f8ca289c@bootlin.com>


On Thu, 20 Jun 2024 19:30:54 +0200, Théo Lebrun wrote:
> Switch from one sub-node per functionality in the system-controller to a
> single node representing the entire OLB instance. This is the
> recommended approach for controllers handling many different
> functionalities; it is a single controller and should be represented by
> a single devicetree node.
> 
> The reset bindings is removed and all properties will be described by:
> soc/mobileye/mobileye,eyeq5-olb.yaml
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/reset/mobileye,eyeq5-reset.yaml       | 43 ----------------------
>  1 file changed, 43 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


