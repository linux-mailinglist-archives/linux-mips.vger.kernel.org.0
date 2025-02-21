Return-Path: <linux-mips+bounces-7902-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4CCA401BB
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 22:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA4627ABF75
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 21:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3DF253F2D;
	Fri, 21 Feb 2025 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHtzlPiN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD6C253B64;
	Fri, 21 Feb 2025 21:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171943; cv=none; b=fsr3OZ623OIF/Hgtw8yTGkTZ0l+sOGD3DLobtVpGTUa2EIp1fFRg79CHZHKWOSm/lDH08sTw0w+vTbggymzEEDe4GVER7nbtt8uUC0XNBKBjfoFO0cMr56aFnoLvvnQNGgf6qzjODqAVfqbseZy3W9mTRYDuoB1Tep2OxCz82gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171943; c=relaxed/simple;
	bh=0bZ69u0J8mKNwNBMFzORl5doQm4ibw8K9+y0rI9OSeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnY1KVZVYXTXGUy1Mpq2MlxyKOq6CNKZ+r3R1hEq/hN5s7SeymBGq1g7cqNSelPTZn5tyi7qj3UObI55SdzyRUDu0QYjN2v1VZ6kmjvKXEyA55COcJk0jX2IGuKaXH3mrcmf99ej3lcNBd1j5EAx20C0fej2e1iDTPwd3QdX1Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHtzlPiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18900C4CED6;
	Fri, 21 Feb 2025 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740171942;
	bh=0bZ69u0J8mKNwNBMFzORl5doQm4ibw8K9+y0rI9OSeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHtzlPiNaCNGbBeHlrnCyBYkMLL0fhqY4i89dvWzyIWRrGpmeSOvhEAby294S14fO
	 uReXEouIfA7fqHf3k8CZQDe3xBPlDQ2lth1PGpyvj4DkI/lTuyRBibdd4gfKtw38pX
	 4PY89AI/o7yVuu0VDLKtpsrePslJsTApVCEt81FAHz8UZmAvUVr27bYr8jp2YGO/kf
	 S4nk0AkWbdHJiSHB9BWe3OKVA/D4pPJUw0xyePGwbW5ifIgNS88T4PnEsl3pdipQy5
	 MsMo7SYOSVRY3hQiyoDWBaJzkDXOqHOx0aXEJsePYUixoVDYiTDQ0OUKBgX1zXutU3
	 ibH94VL7esm+Q==
Date: Fri, 21 Feb 2025 15:05:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andrew+netdev@lunn.ch, linux-mips@vger.kernel.org,
	tsbogend@alpha.franken.de, edumazet@google.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org, pabeni@redhat.com,
	kuba@kernel.org, lee@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, davem@davemloft.net
Subject: Re: [RESEND PATCH net-next 1/5] dt-bindings: net: Move
 realtek,rtl9301-switch to net
Message-ID: <174017193985.80495.3415505860680168485.robh@kernel.org>
References: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
 <20250218195216.1034220-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218195216.1034220-2-chris.packham@alliedtelesis.co.nz>


On Wed, 19 Feb 2025 08:52:12 +1300, Chris Packham wrote:
> Initially realtek,rtl9301-switch was placed under mfd/ because it had
> some non-switch related blocks (specifically i2c and reset) but with a
> bit more review it has become apparent that this was wrong and the
> binding should live under net/.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     It would probably be simplest for this to come in via net-next with an
>     ack from Lee.
> 
>  .../bindings/{mfd => net}/realtek,rtl9301-switch.yaml           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{mfd => net}/realtek,rtl9301-switch.yaml (97%)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


