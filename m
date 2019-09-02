Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8031BA5803
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 15:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731158AbfIBNjE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 09:39:04 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34264 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731121AbfIBNjD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 09:39:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id s18so14117211wrn.1;
        Mon, 02 Sep 2019 06:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=OQ6Dfi/Qr6lIQFBaHa/Prz9is9N5AJrXXKIThd5iKms=;
        b=tKaZ8idTV87ekx33I5xwqxqasAW59W8qqZN3LhWRhUTviJ7swfK9SrV/VvgRvStBvT
         2lpI8cQu6VyNw8a3KbQAcyK3nf/cl/ikdNRAoX89u8XuuAfws0bsf29PhF7PDLhTmL7L
         JIpkyrV5jyGVC8GcZc3JwxAoC4KQ+cpO3W2zV29ucxaqirS1jReqZ5IAI9u4KCx77CgY
         RBVAv7vvCXmQZWxMVGeO13PMvfgCKu/UKhePamcmYIN9xHnvszDZhvhgn9IytrmohxPY
         wq8j/Ol8uiRpSAsFOvEhmr0wSVoZEViQlY4f3hUkhf5aFq3DQ/Wu17YZlsWKvNd8LY2C
         rAzQ==
X-Gm-Message-State: APjAAAXq07YkHvL3fueH9tjKf6vg+7HX4HrVGVdDNxaeElTFoyC7kpPe
        9AqkRVhWAbo3m4OjXfkhwmOUvFPEYg==
X-Google-Smtp-Source: APXvYqw2DiDJ+w1ebULyhODe4j+GTxATN3tGC0MMDX6/z8sFYsQz3kRcqnuum6hqSQEZ748nLe1u6w==
X-Received: by 2002:adf:f543:: with SMTP id j3mr2578327wrp.243.1567431541322;
        Mon, 02 Sep 2019 06:39:01 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id f23sm12797441wmf.1.2019.09.02.06.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:39:00 -0700 (PDT)
Message-ID: <5d6d1b74.1c69fb81.ed670.4fe4@mx.google.com>
Date:   Mon, 02 Sep 2019 14:39:00 +0100
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 08/18] dt-bindings: interrupt-controller: Add Loongson-3 HTINTC
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com> <20190830043232.20191-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20190830043232.20191-3-jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 30 Aug 2019 12:32:22 +0800, Jiaxun Yang wrote:
> Document Loongson-3 HyperTransport Interrupt controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,ls3-htintc.yaml                  | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

