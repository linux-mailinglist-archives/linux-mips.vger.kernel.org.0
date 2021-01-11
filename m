Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7412F229C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 23:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388713AbhAKWVX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 17:21:23 -0500
Received: from mail-oo1-f51.google.com ([209.85.161.51]:46322 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728040AbhAKWVX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 17:21:23 -0500
Received: by mail-oo1-f51.google.com with SMTP id n127so119118ooa.13;
        Mon, 11 Jan 2021 14:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bHT2GndF6urGRcw0TXxPqVOzZ2j2R9MxCgX11NwVoxE=;
        b=rBxq0g47b/PfI6ZEx4bj5+eJFikRm/TK/ezZ6JDf2R8WjUDjzLDijfswIzd9GVYnCC
         L2fcQsg4xM1pzq2Cg3kwCbYXn8RgbGNeToVSoU6IFKc6OcqR3rXrKxlQTRmHJxtx9IrO
         xxxRd50eIg0oZ/kCMuk4xM1HIc7LQSLv2mfrknWG5Vjze7GpLsJTnFsjaKLpm5FZvrgo
         z/oVCACQHtzVT7qqvnJOOoXo6RPbAaVdjuf21AKbD42SVcCmr4KXCwclaMzO/niv1ciH
         OUNhTv9JqsnN7KwewHxo/1sXsEnh1aVezgX8fu01UiydTcyBWNURZOMoViriinAemZnB
         bwcQ==
X-Gm-Message-State: AOAM530ynsY/+Wy9If3DATbshWIh+3HrkA/hoS0ERqyOuY3tAWdmlYqt
        Rsf2HTYy0ePtKo91hJvkNszu8k448A==
X-Google-Smtp-Source: ABdhPJzJws28Cr0G657g4+VWo5Rnlmi6XMjPUxVc9XMNPuwZrLaC7zBLoW9JNXDuxDIBNr/eDBQJQg==
X-Received: by 2002:a05:6820:22c:: with SMTP id j12mr902080oob.65.1610403641005;
        Mon, 11 Jan 2021 14:20:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a26sm179491oos.46.2021.01.11.14.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:20:40 -0800 (PST)
Received: (nullmailer pid 3161297 invoked by uid 1000);
        Mon, 11 Jan 2021 22:20:39 -0000
Date:   Mon, 11 Jan 2021 16:20:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, john@phrozen.org,
        linux-mips@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway PMU
 bindings
Message-ID: <20210111222039.GA3161126@robh.at.kernel.org>
References: <20201231163153.4512-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231163153.4512-1-olek2@wp.pl>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 31 Dec 2020 17:31:53 +0100, Aleksander Jan Bajkowski wrote:
> Document the Lantiq Xway SoC series Power Management Unit (PMU) bindings.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../bindings/mips/lantiq/lantiq,pmu.yaml      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,pmu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
