Return-Path: <linux-mips+bounces-3908-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40299915855
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 22:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8801C23B4C
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 20:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5FA1A073B;
	Mon, 24 Jun 2024 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ra1nNqeZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A33519D88C;
	Mon, 24 Jun 2024 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719262576; cv=none; b=PFZp7SqEdY2rUTMyxuR7+dsJm3zX1Gqnk5w+fXBM20tv0mZbAAhBc6hSVXexC0asl5iNEb+HXybcSPdY10ZiC1oeW8ybb81UX2XtZUKgRd+nr+YNb152Kozl+9sK43UgoRuxj2G/wxpkLwNpyN+5iu1jgHf9MlBTIBpgogd9lag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719262576; c=relaxed/simple;
	bh=IeJz0UBdP+2QzDPRnme0b8vIA/R3U+bYC5a0598W/bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVToP3GJrd57z/xbNl4uWQOkXJQH7OI34oLk4XH7cAnciIN7cC1JMSxfPkLvnXX6ei0viIHjwtRyqNw4/py64mlqdhEDnhjG70L3YFfT9eDNUe4/8YRLy3SBnBpB6wslq28I4Pr5dymzALMExSX0HKE9I46uDeD1xK9AnFWp1Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ra1nNqeZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1013C2BBFC;
	Mon, 24 Jun 2024 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719262576;
	bh=IeJz0UBdP+2QzDPRnme0b8vIA/R3U+bYC5a0598W/bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ra1nNqeZ5zvCxmZS06fK/NlrXZ/vE1wbYyMwMq5BziA9DP6e0C04zHsFWC60P1TiK
	 g+8lNKuhmANl7N3eb/CCUTrJQs6QoGEGaa5AFTIaYQxQ5Z/6fijKPnbT+gqEveMsmW
	 ZQ2YPa5cvw530B5u2LkYTUEes1aVi0MKjNPb17i8KGd2AtYXqMCFnNPS0zcnmdf8wJ
	 xLI24Knxo0aygv3BR2k3vVcXFy83xiWKMdLwzKOJNdrs1vozuXQ7jTqFwS4H3C/nYU
	 soF2TEplxJd4qCvHeqZkw24exPPmVKxsj3+lAvw1iaKWe22fBVr45oqGTfR2vcqLAD
	 eS6toban/Zu4g==
Date: Mon, 24 Jun 2024 14:56:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-clk@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 3/9] Revert "dt-bindings: pinctrl:
 mobileye,eyeq5-pinctrl: add bindings"
Message-ID: <171926257278.403941.14219584614929519183.robh@kernel.org>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
 <20240620-mbly-olb-v3-3-5f29f8ca289c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620-mbly-olb-v3-3-5f29f8ca289c@bootlin.com>


On Thu, 20 Jun 2024 19:30:55 +0200, Théo Lebrun wrote:
> Switch from one sub-node per functionality in the system-controller to a
> single node representing the entire OLB instance. This is the
> recommended approach for controllers handling many different
> functionalities; it is a single controller and should be represented by
> a single devicetree node.
> 
> The pinctrl bindings is removed and all properties will be described by:
> soc/mobileye/mobileye,eyeq5-olb.yaml
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml   | 242 ---------------------
>  1 file changed, 242 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


