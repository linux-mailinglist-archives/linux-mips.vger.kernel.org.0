Return-Path: <linux-mips+bounces-5622-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837B9840B8
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 10:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01A561F2191E
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 08:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3C414EC55;
	Tue, 24 Sep 2024 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnKrNF4R"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9221FB4;
	Tue, 24 Sep 2024 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167240; cv=none; b=cHW2ARysd/p4MUu0IG0e9Dc6KtRkiF2L1ERrjIJXouXtSfNpFuKn0OBZ2uISsYloWbrcKzD0VQYieudi8Z+3JU1fI3bXc3lrFkfoSbyPEtrGNDohPWbkjWja0hLHqapXs57ZpzlteREKiIEi4b6rXrVzf4paDvOl8x1FPqkv9oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167240; c=relaxed/simple;
	bh=4l80XbdPwL70GNm2bQrOG40KWwvXQMIskZki/1+np8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSED+fn2iFdDtODy0zbydXmNSBz6zTMOXUFtt1J0PcxXeqpVu/pMexgsrKxuFU9Vp2TZiDb8QyrGNMORiQposz2KD72YNht/6lg9/RJrFF33MlMI6SU1iyVu8wLZ2tsX0Do5B26cHuqF7fXfSeneSh0BxS9WoAQ8gNpDlPPi0GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnKrNF4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4680EC4CEC4;
	Tue, 24 Sep 2024 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727167239;
	bh=4l80XbdPwL70GNm2bQrOG40KWwvXQMIskZki/1+np8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FnKrNF4RcFBhtiu21VV948lzLRidF98sVKeU20RDn7xtDhRrQKwFcXqfXppC6AZJo
	 GrnwcrZRieLy+1tSbaBTidd1T/R3Dl47Yo8v9sen3rs/RHPGNRu8c/ISC+AKsH1GCA
	 niL+6IjbxHoW4iKyBRYxeEY8Fo1UJolkU/cCJeugEvQXhdYguxk6PSei6dN8D921rY
	 hIKmhdEaOlzJjIicwhpMUbfo0p4/+ujLOrSvCoRlDhh0PRP7wglSs67u7/l+Q+PtJs
	 M8LondxfyENXhc1cBe+5jmS+jAHfhTnjlep+/C5z/MCuiOM+cN3lDYHlYbriQtJtE6
	 NNfKgiL8bTOHQ==
Date: Tue, 24 Sep 2024 10:40:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: mfd: Add more RTL9300 variants
Message-ID: <zir7rpbrq3c6kyn2guanmfnkbw6e36qb5r4onzwv7qgytt64if@jurnymcbgx2k>
References: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
 <20240923225719.2999821-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923225719.2999821-4-chris.packham@alliedtelesis.co.nz>

On Tue, Sep 24, 2024 at 10:57:19AM +1200, Chris Packham wrote:
> Add the RTL9301, RTL9300B and RTL9303. These have the same SoC as the
> RTL9302C but differ in the Ethernet switch/SERDES arrangement.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v4:
>     - New
> 
>  .../devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
> index 2d20dd07a7e9..a3ba6d9bacaa 100644
> --- a/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
> @@ -18,7 +18,10 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - realtek,rtl9301-switch
> +          - realtek,rtl9302b-switch
>            - realtek,rtl9302c-switch
> +          - realtek,rtl9303-switch

This should be squashed. One logical change is to add a new binding for
entire family, not device-by-device.

Best regards,
Krzysztof


