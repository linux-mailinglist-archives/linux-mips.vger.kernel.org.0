Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE563333C29
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 13:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhCJMFZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 07:05:25 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36431 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232673AbhCJMFS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 07:05:18 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id E0DB51793;
        Wed, 10 Mar 2021 07:05:16 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Wed, 10 Mar 2021 07:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=lcbgpdvAyk1ewK+Y4PqnLqcmVSI1dth
        kZ4XNg78LRiU=; b=U7YxLFH3D2v+jp+29mTKghCSdK4C8ZXDZCwUAkazy5uepKz
        BBfimGYY3bcC6cqbKLt+LEmn2To5cG8zIFqw67j+vhh5u60WWtrilYvuAgcQ1yzA
        lKlYPsw0aBJwTKw9GFvxFMO0v+ZxHpum82pquxfNUQ9jozvaE2UdhiXeFouKo4zu
        v0qScCbGbYqutM5TP3E8oewXr7GmTVZPQGbo13yQLJ9EZGNWpoFRzF+jaf4iTUDI
        S5PlXgoLnXLnfDdKo9hVy0KUTyoTFBdvKHqB5feCDn4gQLWeCRa/+Z52pubk0QnP
        RP7mB020AWuHvQOtt/q0rJCseER5O5G/vFyMobw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lcbgpd
        vAyk1ewK+Y4PqnLqcmVSI1dthkZ4XNg78LRiU=; b=sRgN4MuMr7fCRXKM0LkSxq
        W9UmnkOg7KGA9xmyIM2rAYPdTpq4CG7LH3m/koWlrkPMFXSo8+YeXbATWbgA/gBu
        9aslTcfwf1n7LdTMO+u4RDuEfXDZwI1iwPV2HwCcKQGYbvxUsz4NwdP/OoCwbRzJ
        lhXtITduc2bbYusdWvav6DVYmiudEOIeGjDEIWBOjQ1Ly74IbiMdZZPxmC5x6Qg2
        cqiTMQSfRC0FULVfRFEcZtjw+cesCggINBZ5EC6CM7SvohCa0wwmCL9XJx2NR1DY
        4w0+aKTyiDWV5Z78Sp097zn7x3JBTwjAEzlcBz7aHrOCeCLcZ1Y5vgVi0VyinStw
        ==
X-ME-Sender: <xms:-rVIYBxP47tlYaGkLidxbM9n5Z3BsihH_nQOUASk9A12aQQykZPuZQ>
    <xme:-rVIYBTzobbq-KIMDjj1QsvAeS4-UjfmVNRzUvC0d4W89V7gfcedk3wLEAbf20wSh
    hfAdgC66z3bIq87Nbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeevtdehveetkedvvdehhfeuueeffeduffduveevudeiveeu
    tedvheekteeujeegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:-rVIYLXPKKm8YC00xer5n36-Y5opyRRvnnd-3Dht2CoB18hvRVNUWw>
    <xmx:-rVIYDh6vGbKQxs7mHkdlZDSOWD2J8Q7AsTAsSlfoz9ugJmmwCUExQ>
    <xmx:-rVIYDAe8os2IPhPcC1DjwSlJwgwlKPXg-b8Z56yHfWHBVp64KBPtQ>
    <xmx:_LVIYF2zcn-obIJ1P0-ZZie-Bu6VJYLR5Rb2I7DYGD8--egmPicqKg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B7591130005F; Wed, 10 Mar 2021 07:05:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <da399bdd-9454-4d63-a549-546c049c1a29@www.fastmail.com>
In-Reply-To: <20210310075639.20372-7-zhangqing@loongson.cn>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
 <20210310075639.20372-7-zhangqing@loongson.cn>
Date:   Wed, 10 Mar 2021 20:04:53 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Qing Zhang" <zhangqing@loongson.cn>,
        "Huacai Chen" <chenhuacai@kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Marc Zyngier" <maz@kernel.org>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        "Ming Wang" <wangming01@loongson.cn>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_6/7]_dt-bindings:_interrupt-controller:_Add_Loon?=
 =?UTF-8?Q?gson-2K1000_LIOINTC?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, Mar 10, 2021, at 3:56 PM, Qing Zhang wrote:
> Add liointc-2.0 properties support, so update the maxItems and description.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
^ I have nothing todo with this patch so please drop me for this one :-)

> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Tested-by: Ming Wang <wangming01@loongson.cn>
> ---
> 
> v3-v4: Standard submission of information
^ It's called commit message.

> 
>  .../bindings/interrupt-controller/loongson,liointc.yaml    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git 
> a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> index f38e0113f360..5280cf60a9a7 100644
> --- 
> a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> +++ 
> b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
> @@ -10,9 +10,9 @@ maintainers:
>    - Jiaxun Yang <jiaxun.yang@flygoat.com>
>  
>  description: |
> -  This interrupt controller is found in the Loongson-3 family of chips 
> as the primary
> -  package interrupt controller which can route local I/O interrupt to 
> interrupt lines
> -  of cores.
> +  This interrupt controller is found in the Loongson-3 family of chips 
> and
> +  Loongson-2K1000 chip, as the primary package interrupt controller 
> which
> +  can route local I/O interrupt to interrupt lines of cores.
>  
>  allOf:
>    - $ref: /schemas/interrupt-controller.yaml#
> @@ -22,6 +22,7 @@ properties:
>      oneOf:
>        - const: loongson,liointc-1.0
>        - const: loongson,liointc-1.0a
> +      - const: loongson,liointc-2.0
>  
>    reg:
>      maxItems: 1
^ Please document multiple reg prop change as well.

Thanks.

- Jiaxun

> -- 
> 2.20.1
> 
>

-- 
- Jiaxun
