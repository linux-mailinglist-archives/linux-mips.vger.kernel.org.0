Return-Path: <linux-mips+bounces-8365-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80FA71204
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 09:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE563BBE47
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 08:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462DE18CC1C;
	Wed, 26 Mar 2025 08:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVcLxaHx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17884157A48;
	Wed, 26 Mar 2025 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742976298; cv=none; b=qiQ0Y3x5LUha7vrG55gsW8iUvCAYTAiwwshlHf5+ujBLznV2lmOKOTJ4yxCnVMHoXBtbtn3A/MkQy5HcSP81hSst2oN8n2OPGMpL0lPFpeesD54mWc4U3yVvam8Z6KoqKpDxaDeRpNhjpiZtiu6OQh0K8Sm6a73CdDm370UDqws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742976298; c=relaxed/simple;
	bh=MtqkJBxxri2Ybg08dqBppEn0TPIs5TXQGc5QKdVF1VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5dX/veIiNAq8+O4pLfxKk0YIePpZb/uyhO2MZQ6dfgEbb4dccc7EFeU3O/o7vnyXIm3vDzopEcSXJwhgKd0OogkiNo+Ah83XM252e6d3KEcjls2tafYfDKl75q6tOmz4Hlt1WCcd2OA8fdu/Q8MBmw/UTk7qhl34AHF1GUP6rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVcLxaHx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4052C4CEE9;
	Wed, 26 Mar 2025 08:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742976297;
	bh=MtqkJBxxri2Ybg08dqBppEn0TPIs5TXQGc5QKdVF1VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVcLxaHxgaFjM6OTC8rDYS5iR8qpdiv/odw5DzXTDcQ32Mikw+6myhD968S+3+x4A
	 +W1Q4UDyjHld7Uc4SYqJk44ByvfoAfia0pxI/n4NrgyqsDz5R6j0H1OJ5sF7hIpzAN
	 /z1XO/WaIaeGzZ4ayG3zymU7becsIJwhWdQ79Gny0b5Qi4SoHEAUOR0ZzOnzjU1Epb
	 6sTDjTQ61JS55pQfcjku6Fg4nN/yaMYoJFY5ncyYlMil5cVsY3GSo6Sl/m56ICOmzL
	 7AQzBZQ+s9JeiYZnMUqrwzXaVWVpyGJV7sNnqyMptbCan7M/AaR5pmeXKMberQhaSi
	 3Y7bpyG4/BkEg==
Date: Wed, 26 Mar 2025 09:04:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.larsson@genexis.eu
Subject: Re: [PATCH v2 04/10] dt-bindings: timer: Add EcoNet EN751221 "HPT"
 CPU Timer
Message-ID: <20250326-gigantic-mauve-capuchin-e667ed@krzk-bin>
References: <20250325134349.2476458-1-cjd@cjdns.fr>
 <20250325134349.2476458-5-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325134349.2476458-5-cjd@cjdns.fr>

On Tue, Mar 25, 2025 at 01:43:43PM +0000, Caleb James DeLisle wrote:
> +title: EcoNet EN751221 High Precision Timer (HPT)
> +
> +maintainers:
> +  - Caleb James DeLisle <cjd@cjdns.fr>
> +
> +description:
> +  The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
> +  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
> +  count/compare registers and a per-CPU control register, with a single interrupt
> +  line using a percpu-devid interrupt mechanism.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Drop items, that's const directly.

> +          - const: econet,en751221-timer
> +      - items:
> +          - const: econet,en751627-timer
> +          - const: econet,en751221-timer
> +
> +  reg: true

Widest constraints are always here.

> +
> +  interrupts:
> +    maxItems: 1
> +    description: A percpu-devid timer interrupt shared across CPUs.
> +
> +  clocks:
> +    maxItems: 1
> +
> +if:

This goes under allOf:, to save re-indent later, and then after
required: block (see example-schema).

> +  properties:
> +    compatible:
> +      contains:
> +        const: econet,en751627-timer
> +then:
> +  properties:
> +    reg:
> +      items:
> +        - description: Base address for VPE timers 0 and 1

s/Base address for//
because it is redundant. Bus/parent addressing already defines this as
base address, cannot be anything else.

> +        - description: Base address for VPE timers 2 and 3
> +else:
> +  properties:
> +    reg:
> +      items:
> +        - description: Base address for VPE timers 0 and 1

Best regards,
Krzysztof


