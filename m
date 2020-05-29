Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D9F1E787E
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 10:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE2IhH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 04:37:07 -0400
Received: from [115.28.160.31] ([115.28.160.31]:49902 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbgE2IhF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 04:37:05 -0400
Received: from hanazono.local (unknown [116.236.177.50])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D26B1600B5;
        Fri, 29 May 2020 16:37:01 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590741422; bh=vcez4Uof2phLwxNSzZXqwMGVMxaC1zLW1pHsq0myX3c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SG6YwROhbzgsHoBEWiufLmgZAk77BQRpFVYx9WLBgSkMfq3syoQzKNTr/H+QPGG7D
         yatqWt2/TfmdSFwOcAaupd/jqSDZt4xnnyc5VIa9ZG1WQnktn75OFHSMGNM0gY1+1i
         2yOTP21DNPcWKVc80eOBKS32jEi65rdObG+YmrL0=
Subject: Re: [PATCH 1/3] dt-bindings: mips: Document two Loongson generic
 boards
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, maz@kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
 <20200529034338.1137776-2-jiaxun.yang@flygoat.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <8ecd4bdd-ad3a-7cd5-65b0-f8a637facc98@xen0n.name>
Date:   Fri, 29 May 2020 16:37:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <20200529034338.1137776-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,


On 2020/5/29 11:43, Jiaxun Yang wrote:
> Document loongson3-8core-ls7a and loongson3-r4-ls7a, with
> two boards LS7A PCH.

"with two boards LS7A PCH" -- maybe you mean "two boards with LS7A PCH"?

>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   .../devicetree/bindings/mips/loongson/devices.yaml        | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> index 74ed4e397a78..6164b0fcb493 100644
> --- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -24,4 +24,12 @@ properties:
>         - description: Generic Loongson3 Octa Core + RS780E
>           items:
>             - const: loongson,loongson3-8core-rs780e
> +
> +      - description: Generic Loongson3 Quad Core + LS7A
> +        items:
> +          - const: loongson,loongson3-8core-ls7a
> +
> +      - description: Generic Loongson3 Release 4 + LS7A
"R4" instead of "Release 4", as in /proc/cpuinfo output?
> +        items:
> +          - const: loongson,loongson3-r4-ls7a
>   ...
