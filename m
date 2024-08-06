Return-Path: <linux-mips+bounces-4770-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F17899498B0
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 21:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC659283221
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 19:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9B2156F5D;
	Tue,  6 Aug 2024 19:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzyNQVb9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419D155351;
	Tue,  6 Aug 2024 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722974175; cv=none; b=nb7S5xKGAzhpeiB41Tl4PYbkraPH9oYd5AiI56BqwGPGtt2+2R12fD8p9EOD3j21Lysnm0NMy1DLNqihZQLEVCrZHjUOhVkEmfmA0UhH9gJdTIY9F4etC9MJV+YDw2tDe6dV6BAc4KJLoFXSqpfXsSwc8OqxSGagfyoRqjsN7Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722974175; c=relaxed/simple;
	bh=1cb0R2KeOB4slldNjw57NpRZHh2ObyAzyGPArx+3mS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2rjpOUHvb4P6ljl43KJ1qXLojmq9HvNgEfJrUCm4HPPGJeo3U+pqGgTTeKGKFBcZk5gTFjVUyZwA4imqINb7zwEm/zOh29VNBZlNWJW0VGQpf2H8AmhrDKXvFNnI9B7c1xELVKKMTEcLGCaXKU3llTs/l27R5zCVFPIzqpuSrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzyNQVb9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efd8807aaso1637000e87.3;
        Tue, 06 Aug 2024 12:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722974172; x=1723578972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0lyz4ipeJgMy3VfY+GLdQlwpvsGVHWth9zowEA3zHrk=;
        b=LzyNQVb9uToraRTK0d35HpGaj+8u51xGiMT5DBQ6UA6cS1VzDZAU8K4/cCrk3LAJO6
         2skWxzfvYZw3Dtqod9aqgoWlfH1qhvGBpSUztMSaLdtEdHMN77qOfNhHxFJ2qKxIS7WT
         cayHGiUtGQM56tkwgsqsfiD8l0h/9FKzc2awmXZgOesdwUH9yYSmyM5Snx5NzQ1aqcQ2
         Cgxu3Zvjsz/Bv17e/cXpNqmRQVMla/NnJAgTkamrsP7M5ltDRxgdOTePdJhJTocI1tuq
         E4ZiNhMjYLg9ujWxnSA3c3WZviTGWa2O7qtxfdcnpunQSJrNdGZs3Ga8F2sHvMgj5V4Y
         vqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722974172; x=1723578972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lyz4ipeJgMy3VfY+GLdQlwpvsGVHWth9zowEA3zHrk=;
        b=LPOni5+TreB4lTMk1YIualezaWZcldxnuk5vP+h26S7LuYB4Fy7P7nhP8g1P+gvDun
         L7If1CiKgiV6l9R1Sy9Ehh1yF5Yt/vuBwhE442OMEg02GwffMFqlJbXv8OiXGOXp9kT0
         VQKAoCS/yxydenYeGA0pvuHA3zpdbt22RMWATqqOTtfN1hPOE0Le4boAyZd08szVeAZ0
         4R0BkG8CnB9sEDckYU12cSTXLDpnJsAK/Lit7QTvnxf9QBwtifVvfeRZ6xaSqsrlh+dq
         CROWoyVDERQuOGrSmU9gGz4vRLQ7A3bCHtmkD+Wr2tkeyCWcmKeWebi2O2dk+66ACPR/
         qCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPGiitVs7i/Hj4orWNNkGwVOxtdrgYHsyso8Chi7IfYBKJIDRBiPWJ5GeqOvBdkeY2Tw6PFzQLubN1oubrKYzk6nrDYyQWjzT3Hu4ghDIUNzGc+X3rVepERQ2k5CkRebdjeDvJ9QOyj1jSWhrtXx6I6gyx4wvoAPFEYGtJ9m0UuNvIt1s=
X-Gm-Message-State: AOJu0YyojqPDblVz4HrNVkUy0s4XzV5vZzml8X7/lwx/BmAQWbE+X9Ec
	BzvOXkC1nFWUUyR+4yRoNP25pO+QP6VK/qpGEPUvsahh3cJLQoIdoWIIKxa6
X-Google-Smtp-Source: AGHT+IFDhVY770CCDtO0PGQv9l9zjATLUFHFY4HFugzwfVUkuc8BWi2VxQ7ANxWoMU6NZBltp5gq7w==
X-Received: by 2002:a05:6512:234c:b0:52f:c24b:1767 with SMTP id 2adb3069b0e04-530bb391c54mr11399878e87.19.1722974171469;
        Tue, 06 Aug 2024 12:56:11 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba1102bsm1584039e87.97.2024.08.06.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 12:56:11 -0700 (PDT)
Date: Tue, 6 Aug 2024 22:56:08 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paulburton@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: mips: Document mti,mips-cm
Message-ID: <hupbp2e5phpfvlnbqwbqxhssidyda5p247map437h4mcnbeynw@akf2fuq3jpy3>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <20240612-cm_probe-v2-5-a5b55440563c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-cm_probe-v2-5-a5b55440563c@flygoat.com>

On Wed, Jun 12, 2024 at 11:08:57AM +0100, Jiaxun Yang wrote:
> Add devicetree binding documentation for MIPS Coherence Manager.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2:
>  - Better wording for register desc
>  - cm -> coherency-manager
>  - schema matches compatible
> ---
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> new file mode 100644
> index 000000000000..9f500804737d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPS Coherence Manager
> +
> +description: |
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

Could you please extend the reg array to containing two values: gcr and
l2sync? The later is the L2-cache-only sync region which can be
customized by the CM means.

It's better to define the reg-names property too, so the node would
look like this:

        cm2: cm2@1fbf8000 {
                compatible = "mti,mips-cm";
                reg = <0 0x1fbf8000 0 0x8000>,
                      <0 0x1fbf0000 0 0x1000>;
                reg-names = "gcr", "l2sync";
        };

-Serge(y)

> +
> +required:
> +  - compatible
> +  - reg
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
> 2.43.0
> 

