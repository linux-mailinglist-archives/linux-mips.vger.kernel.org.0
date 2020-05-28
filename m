Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916511E6C1A
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 22:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406975AbgE1UOJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 16:14:09 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36542 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406973AbgE1UOG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 16:14:06 -0400
Received: by mail-io1-f67.google.com with SMTP id y18so11137569iow.3;
        Thu, 28 May 2020 13:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ordAPfbXh0vTNSOfZvda6IBNsIk8jcPKfQPA59PO4to=;
        b=rNOJyA3UV9c8t5pVI3h0GYZ+nFv8Ug+cM91taFhqyuZSxgHfQfDRRIy0wjCrWWCmC3
         65TqCwK2qDg3sRTVI+WTIrtnqpjqMemGxQQnETYHu1aP6sKr4xUPUbZ7GEdi9jG8Xd4g
         GmY1r3s89pp8LWVusysSVpA2TlNi01kqYPEWRdSRpYwQCuMh9VNNSUjhzJsO363ssG0H
         DB5cKf4fK036sjFip2vLFmG7+MqxnDao7tc5DHyJprclxfIURysxXx/MaW8mfA0FJEs4
         CbRqZ1U1aNvZIKVsg3dg8s4vNRZbJF0fUTYhmSqi5NznNJB5UcJ0HAhSoCFZEapSfw7c
         KenQ==
X-Gm-Message-State: AOAM531C7Fa+TvE2B/lC0Bv/2ig3N6cbj+WphU8ATjOn+z91XMjc43Fm
        0Q0wPUwMphXiC6udWX6/yxMm/B8=
X-Google-Smtp-Source: ABdhPJxh7MERH4GHV2KajE30fu7LTfYiwUY/qTaDCstjWq7UDy4hWBP06+bJtHaPjrz4TakTgO7OaQ==
X-Received: by 2002:a6b:e215:: with SMTP id z21mr3836350ioc.115.1590696844953;
        Thu, 28 May 2020 13:14:04 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y23sm956109ior.38.2020.05.28.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 13:14:04 -0700 (PDT)
Received: (nullmailer pid 603972 invoked by uid 1000);
        Thu, 28 May 2020 20:14:03 -0000
Date:   Thu, 28 May 2020 14:14:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        maz@kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: interrupt-controller: Add Loongson
 HTVEC
Message-ID: <20200528201403.GA603926@bogus>
References: <20200427060551.1372591-1-jiaxun.yang@flygoat.com>
 <20200516082912.3673033-1-jiaxun.yang@flygoat.com>
 <20200516082912.3673033-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200516082912.3673033-2-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 16 May 2020 16:29:02 +0800, Jiaxun Yang wrote:
> Add binding for Loongson-3 HyperTransport Interrupt Vector Controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> --
> v4: Drop ref, '|', add additionalProperties, fix example
> ---
>  .../interrupt-controller/loongson,htvec.yaml  | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
