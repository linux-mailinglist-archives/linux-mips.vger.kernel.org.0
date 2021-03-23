Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAF0346D6B
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 23:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhCWWlf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 18:41:35 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:38414 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234187AbhCWWlN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 18:41:13 -0400
Received: by mail-il1-f170.google.com with SMTP id d10so12890308ils.5;
        Tue, 23 Mar 2021 15:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7df4nauXHTGTZT/QJ+gJGVtaRr9NLAYHJhOGISyVl1w=;
        b=aa8ZlRoS7ht48bJzmnrEhJh2Ge+MMxhkQDzY+k9rSUFDMEHkywpyM6WXt5acogcmP7
         cMlTOE/bDryDd+9NwhBQFkX+dQ9i6u9ONmZRMaHZXNHgLBOonkXbweTfI3Dw2medUgpQ
         sExZVsBytgcsdAcQIULU3FjQVAQfk1jSz4/jHcDtvXTLM3mSZgF49S8YHW3AXqp3pKvn
         k7YvynDIF5fEuAW6zB6V8+BQx2/C0fpFX7FSEt+xjFa4U5aok2ZLMZ8mZr+IwXWV/vdo
         yBYS2FfLFln7+YKHIdKB5VKliRkztuDThrWWaJGoI57h5wm7sjLZT/bikqxqGsgXH6GA
         KvSA==
X-Gm-Message-State: AOAM533RWZdoCX1ZzrgswXACvQEg3aJOBt6CvRmp60vLyl3zbQ49QVrt
        tp9c0gbUiDtZ+4JZ/wIaVQ==
X-Google-Smtp-Source: ABdhPJwap2AFfRW5hUk2I99RYL7djHzmVl5STHZK1Eo20/kBMDeZkP8kTbIGN47BIKF3M1LeFkLlOg==
X-Received: by 2002:a92:d58e:: with SMTP id a14mr344563iln.61.1616539272551;
        Tue, 23 Mar 2021 15:41:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l14sm131647ilc.33.2021.03.23.15.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:41:11 -0700 (PDT)
Received: (nullmailer pid 1480679 invoked by uid 1000);
        Tue, 23 Mar 2021 22:41:09 -0000
Date:   Tue, 23 Mar 2021 16:41:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v5 6/7] dt-bindings: interrupt-controller: Add
 Loongson-2K1000 LIOINTC
Message-ID: <20210323224109.GA1480622@robh.at.kernel.org>
References: <20210315075004.15465-1-zhangqing@loongson.cn>
 <20210315075004.15465-7-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315075004.15465-7-zhangqing@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 15 Mar 2021 15:50:03 +0800, Qing Zhang wrote:
> Add liointc-2.0 properties support, so update the maxItems and
> condition description.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Tested-by: Ming Wang <wangming01@loongson.cn>
> ---
> 
> v4-v5:
> - Add reg condition description
> 
>  .../loongson,liointc.yaml                     | 36 ++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
