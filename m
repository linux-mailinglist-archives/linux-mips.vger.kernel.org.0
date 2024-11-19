Return-Path: <linux-mips+bounces-6774-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 392BD9D2B09
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2024 17:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43032B27057
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2024 16:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81AB1CF7AE;
	Tue, 19 Nov 2024 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgHcIVZa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA713C83D;
	Tue, 19 Nov 2024 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033618; cv=none; b=cFVi+RIIxw3E4zO0MWtBhXPcZ1zDg9EW24EmOLu9cD1lrb0thF1vS/3MndLVBnXfSgGLH2l+6ZOrRkHnmZlcA+FeO/3BCDmDfZ2RlKUHBViz/fcYZbs3LQZ+51boc13nnycQNadNUhY79SGM/56zCy6TP1PeCpkfYQpIlR+lQdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033618; c=relaxed/simple;
	bh=BJFb++Wv4jpkxzjz5gOnPMkEVkdQlWAy/S3Oj4+CTJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq/dik+7pqfmwp1DPYKhty8LMs/HqHwakL//eCMAwz5pPc1GPwVEiDw+PvbJ13EU3WuYKFcgv1mmZg3+SY2sht8ymviaorbRONhpnMzzaXg4P2srpAfeQ8XWv/Q+1UAXYuaEX6j20dzmUDEK+Q9bufbWdXikO0eYOhx8g6IJBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgHcIVZa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12740C4CECF;
	Tue, 19 Nov 2024 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732033618;
	bh=BJFb++Wv4jpkxzjz5gOnPMkEVkdQlWAy/S3Oj4+CTJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lgHcIVZaK4+5dia4R+xTqMgRfsAHWPMm2Ehe0N1hgtlD6fcCakENZ6IPlgg4IMwmp
	 1WuDxTVFr+/TFSueTt3bbhdKNVHKxcKgELHXD4nZVaR5dQgrHxbRDMHpjZoIywyKO2
	 3c+51VtBpmKr50RDJfgl3rt1yIjhTN5XbNoHvkdfWQIi4eck0Ur4W0oZe59fKvWv7y
	 HdKA8XJitk78VrfPF+TedVfW6QE5fn+zIJE4fm/Fc6ClRjCgNeaoVzYRPVCsjkUk80
	 6AyF1ugXv6gx8GUavFCr0W5FOu9Bk4kpXaOHP8T7/K0yBCXhmWHecU8XF1AvXX1hr8
	 cPuiJIy4+4MLw==
Date: Tue, 19 Nov 2024 10:26:56 -0600
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: mips: Document mti,mips-cm
Message-ID: <20241119162656.GA1764849-robh@kernel.org>
References: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
 <20241115-cluster-hci-broken-v1-1-00636800611d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-cluster-hci-broken-v1-1-00636800611d@bootlin.com>

On Fri, Nov 15, 2024 at 04:29:54PM +0100, Gregory CLEMENT wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Add devicetree binding documentation for MIPS Coherence Manager.
> 
> gc: reg is no more mandatory

The h/w either has registers or it doesn't. Can't be both ways.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..03a5ba5624a429c428ee2afca73b3e29127e02f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPS Coherence Manager
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  Defines a location of the MIPS Coherence Manager registers.
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +properties:
> +  compatible:
> +    const: mti,mips-cm
> +
> +  reg:
> +    description:
> +      Base address and size of an unoccupied region in system's MMIO address
> +      space, which will be used to map the MIPS CM global control registers
> +      block. It is conventionally decided by the system integrator.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    coherency-manager@1fbf8000 {
> +      compatible = "mti,mips-cm";
> +      reg = <0x1bde8000 0x8000>;
> +    };
> +...
> 
> -- 
> 2.45.2
> 

